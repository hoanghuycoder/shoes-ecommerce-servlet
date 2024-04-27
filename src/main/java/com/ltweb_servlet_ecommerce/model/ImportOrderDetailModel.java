package com.ltweb_servlet_ecommerce.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ImportOrderDetailModel extends AbstractModel<ImportOrderDetailModel>{
    private long importOrderId;
    private long productSizeId;
    private long quantityImport;
    private long productId;
    private double priceImport;
    private String productName;
    private String size;
}
