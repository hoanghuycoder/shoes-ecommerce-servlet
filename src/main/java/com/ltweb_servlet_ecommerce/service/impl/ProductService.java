package com.ltweb_servlet_ecommerce.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ltweb_servlet_ecommerce.dao.IProductDAO;
import com.ltweb_servlet_ecommerce.dao.IProductSizeDAO;
import com.ltweb_servlet_ecommerce.model.ProductImageModel;
import com.ltweb_servlet_ecommerce.model.ProductModel;
import com.ltweb_servlet_ecommerce.model.ProductSizeModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IProductImageService;
import com.ltweb_servlet_ecommerce.service.IProductService;
import com.ltweb_servlet_ecommerce.service.IProductSizeService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;
import com.ltweb_servlet_ecommerce.utils.CloudinarySingleton;

import javax.inject.Inject;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class ProductService implements IProductService {
    @Inject
    IProductDAO productDAO;
    @Inject
    IProductSizeDAO sizeDAO;
    @Inject
    IProductSizeService productSizeService;
    @Inject
    IProductImageService imageService;

    @Override
    public List<ProductModel> findAllWithFilter(ProductModel model, Pageble pageble) throws SQLException {
        List<ProductModel> values = productDAO.findAllWithFilter(model, pageble);
        values.forEach(this::setPrice);
        return values;
    }

    @Override
    public ProductModel findWithFilter(ProductModel model) throws SQLException {
        ProductModel values = productDAO.findWithFilter(model);
        setPrice(values);
        return values;
    }

    @Override
    public List<ProductModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        List<ProductModel> values = productDAO.findByColumnValues(subQueryList, pageble);
        values.forEach(this::setPrice);
        return values;
    }

    private void setPrice(ProductModel value) {
        try {
            Map<String, Object> withCustomSQL = sizeDAO.findWithCustomSQL("SELECT price FROM product_sizes WHERE productId = ? ORDER BY createAt DESC", List.of(value.getId()));
            value.setPrice(((BigDecimal) withCustomSQL.get("price")).doubleValue());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Map<String, Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return productDAO.findWithCustomSQL(sql, params);
    }

    @Override
    public ProductModel update(ProductModel model) throws SQLException {
        ProductModel oldModel = productDAO.findById(model.getId());
        if (oldModel == null) {
            return null;
        }
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        productDAO.update(model);
        return productDAO.findById(model.getId());
    }

    @Override
    public ProductModel delete(Long id) throws SQLException {
        ProductModel oldModel = productDAO.findById(id);
        productDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble) throws SQLException {
        List<ProductModel> values = productDAO.findAll(pageble);
        values.forEach(this::setPrice);
        return values;
    }

    @Override
    public ProductModel softDelete(Long id) throws SQLException {
        ProductModel model = productDAO.findById(id);
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        model.setIsDeleted(true);
        productDAO.update(model);
        return productDAO.findById(model.getId());
    }

    @Override
    public ProductModel findById(Long id) throws SQLException {
        ProductModel productModel = productDAO.findById(id);
        setPrice(productModel);
        return productModel;
    }

    @Override
    public ProductModel save(ProductModel model) throws SQLException {
        Long productId = productDAO.save(model);
        return productDAO.findById(productId);
    }

    @Override
    public ProductModel updateProductTotalView(Long id) throws SQLException {
        productDAO.updateProductTotalView(id);
        return productDAO.findById(id);
    }

    private void updateThumbnailAsync(ProductModel productModel, Cloudinary cloudinary, Part thumbnailPart) {
    // Run the task asynchronously
    CompletableFuture.supplyAsync(() -> {
        try {
            // Upload the thumbnail image to Cloudinary and get the URL
            String thumbnailProductUrl = uploadToCloudinary(cloudinary, thumbnailPart);
            // Set the thumbnail URL in the product model
            productModel.setThumbnail(thumbnailProductUrl);
            // Update the product model in the database
            update(productModel);
        } catch (IOException | SQLException e) {
            throw new RuntimeException(e);
        }
        // Return null as the CompletableFuture result
        return null;
    });
}

    @Override
    public boolean updateProduct(ProductModel productModel, Part thumbnailPart, String[] sizesId,
                             String[] listSizePrice, List<Part> imageProductParts, long[] removeImgs) {
    // Get the Cloudinary instance for image uploading
    Cloudinary cloudinary = CloudinarySingleton.getInstance().getCloudinary();
    try {
        // Update the product model, return false if the update fails
        if (update(productModel) == null) {
            return false;
        }

        // Update the product sizes
        updateProductSizes(productModel, sizesId, listSizePrice);

        // If a new thumbnail image is provided, update the thumbnail asynchronously
        if (thumbnailPart != null && !thumbnailPart.getSubmittedFileName().isEmpty()) {
            updateThumbnailAsync(productModel, cloudinary, thumbnailPart);
        }

        // Update the product images, return false if the update fails
        if (!updateProductImages(productModel, cloudinary, imageProductParts, removeImgs)) {
            return false;
        }

        // If all updates are successful, return true
        return true;
    } catch (Exception e) {
        // Print the stack trace if an exception occurs and return false
        e.printStackTrace();
        return false;
    }
}


    private void updateProductSizes(ProductModel productModel, String[] sizesId, String[] listSizePrice) {
    // Run the task asynchronously
    CompletableFuture.supplyAsync(() -> {
        try {
            // Delete all existing sizes for the given product
            productSizeService.deleteByProductId(productModel.getId());
            // Iterate over the sizesId array
            for (int i = 0; i < sizesId.length; i++) {
                // Create a new ProductSizeModel object for each size
                ProductSizeModel productSizeModel = new ProductSizeModel();
                // Set the product ID, size ID, and price
                productSizeModel.setProductId(productModel.getId());
                productSizeModel.setSizeId(Long.parseLong(sizesId[i]));
                productSizeModel.setPrice(Double.parseDouble(listSizePrice[i]));
                // Save the new ProductSizeModel object
                productSizeService.save(productSizeModel);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // Return null as the CompletableFuture result
        return null;
    });
}

    private String uploadToCloudinary(Cloudinary cloudinary, Part part) throws IOException {
        InputStream inputStream = part.getInputStream();
        byte[] fileBytes = inputStream.readAllBytes();
        inputStream.close();
        Map<String, Object> uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.emptyMap());
        return (String) uploadResult.get("url");
    }

    private boolean updateProductImages(ProductModel productModel, Cloudinary cloudinary, List<Part> imageProductParts, long[] removeImgs) throws IOException, SQLException {
        if (removeImgs != null && removeImgs.length > 0) {
            for (long removeImg : removeImgs) {
                imageService.softDelete(removeImg);
            }
        }

        ExecutorService executor = Executors.newFixedThreadPool(5);
        List<Future<ProductImageModel>> futures = new ArrayList<>();
        for (Part part : imageProductParts) {
            futures.add(executor.submit(() -> {
                String imageProductUrl = uploadToCloudinary(cloudinary, part);
                // Build a new ProductImageModel with the product ID and image URL, and return it
                return ProductImageModel.builder().productId(productModel.getId()).imageUrl(imageProductUrl).build();
            }));
        }
        // Create a list to store the ProductImageModels
        List<ProductImageModel> imageModels = new ArrayList<>();

        // For each future in the futures list
        for (Future<ProductImageModel> future : futures) {
            try {
                // Add the result of the future to the imageModels list
                imageModels.add(future.get());
            } catch (Exception e) {
                // If an exception occurs, print the stack trace
                e.printStackTrace();
                return false;
            }
        }

        // Submit a task to the executor service to save all image models
        executor.submit(() -> {
            try {
                imageService.saveAll(imageModels);
            } catch (Exception e) {
                // If an exception occurs during image saving, print the stack trace
                e.printStackTrace();
            }
        });

        // Shut down the executor service
        executor.shutdown();
        return true;
    }

}
