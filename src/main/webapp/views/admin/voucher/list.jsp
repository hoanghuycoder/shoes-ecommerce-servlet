<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Nai - Mã giảm giá</title>
</head>
<body>
    <div class="col-12 mt-4">
        <div class="mb-5 ps-3">
            <a class="btn bg-gradient-dark mb-0" id="toggleAddProduct" data-bs-toggle="collapse" href="#formNewProduct"><i class="material-icons text-sm">add</i>&nbsp;&nbsp;Thêm sản phẩm mới</a>
          <div class="collapse multi-collapse my-3" id="formNewProduct">
            <div class="card py-2 px-4" >
              <form method="POST" enctype="multipart/form-data">
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Tên mã giảm giá</label>
                  <input type="text" class="form-control" name="name" required>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Mã giảm giá</label>
                  <input type="text" class="form-control" name="name" required>
                </div>
                <div class="my-3">
                  <label>Nội dung</label>
                  <textarea type="text" class="" rows="10" style="height: 200px" name="content" id="content"></textarea>
                  <p class="text-sm">Nội dung không được chứa kí tự <code>'</code></p>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Mô tả ngắn</label>
                  <input type="text" class="form-control" name="shortDescription" required/>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Ngày bắt đầu áp dụng</label>
                  <input type="date" id="startDate"  class="form-control" name="startDate" required>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Ngày kết thúc áp dụng</label>
                  <input type="date" id="endDate"  class="form-control" name="endDate" required>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Giới hạn (số lần sử dụng)</label>
                  <input type="text" class="form-control" name="shortDescription" required/>
                </div>
                <div class="input-group input-group-static mb-4">
                  <label for="size" class="ms-0">Điều kiện áp dụng</label>
                  <input type="checkbox" class="form-control" name="haveCondition"/>
                </div>
               <div class="row">
                 <div class="col-12 col-md-4">
                   <div class="input-group input-group-static mb-4">
                     <label for="size" class="ms-0">Áp dụng với</label>
                     <select class="form-control" id="applyFor" name="tableName" required>
                       <option value="user">Người dùng</option>
                       <option value="product">Sản phẩm</option>
                       <option value="category">Thể loại sản phẩm</option>
                     </select>
                   </div>
                 </div>
                 <div class="col-12 col-md-4">
                   <div class="input-group input-group-static mb-4">
                     <label for="size" class="ms-0">Thông tin áp dụng điều kiện</label>
                     <select class="form-control" id="size" name="columnName" required>
                       <option value="userName">ID người dùng</option>
                       <option value="fullName">Tên người dùng</option>
                       <option value="birthDay">Sinh nhật</option>
                       <option value="association">Liên kết</option>
                       <option value="createAt">Ngày tạo tài khoản</option>
                     </select>
                   </div>
                 </div>
                 <div class="col-12 col-md-4">
                   <div class="input-group input-group-static mb-4">
                     <label for="size" class="ms-0">Điều kiện cụ thể</label>
                     <select class="form-control" id="condition" name="condition" required>
                       <option value="userName">Google</option>
                       <option value="fullName">Facebook</option>
                     </select>
                   </div>
                 </div>

               </div>
                <button class="btn btn-primary" type="submit">Tạo mã giảm giá</button>

              </form>
            </div>
          </div>
        </div>
      <div class="card my-4">
        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
          <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
            <h6 class="text-white text-capitalize ps-3">Danh sách mã giảm giá</h6>
          </div>
        </div>

        <div class="card-body px-0 pb-2">
          <div class="table-responsive p-0">
            <table class="table align-items-center mb-0" id="dataTable">
              <thead>
              <tr>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">ID</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tên mã giảm giá</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Mã giảm giá</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Ngày bắt đầu áp dụng</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Ngày kết thúc áp dụng</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Giới hạn sử dụng</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Mô tả ngắn</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Nội dung</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tình trạng</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Cập nhật lúc</th>
                <th class="text-secondary opacity-7"></th>
              </tr>
              </thead>
              <tbody>
              <c:if test="${not empty LIST_MODEL}">
                <c:forEach var="item" items="${LIST_MODEL}">
                  <tr>
                    <!-- Id -->
                    <td>
                      <div class="d-flex">
                        <p class="text-xs font-weight-bold mx-auto mb-0">${item.id}</p>
                      </div>
                    </td>
                    <!-- End Id -->
                    <!-- Size Name -->
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.name}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.code}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.startDate}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.endDate}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.usageLimit}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.shortDescription}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.content}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.active}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.updatedAt}</p>
                        </div>
                      </div>
                    </td>
                    <!-- End Size Name -->
                    <!-- Action -->
                    <td class="align-middle">
                      <a class="btn btn-link text-dark px-1 mb-0" data-bs-toggle="modal" href="#updateModal" onclick="setIdUpdate(${item.id},'${item.name}')"><i class="material-icons text-sm me-1">edit</i>Sửa</a>
                      <a class="btn btn-link text-danger text-gradient px-1 mb-0"  data-bs-toggle="modal" href="#deleteModal" onclick="setIdDelete(${item.id},'${item.name}')"><i class="material-icons text-sm me-1">delete</i>Xóa</a>
                    </td>
                    <!-- End action -->
                  </tr>
                </c:forEach>
              </c:if>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <%--    Modal update--%>
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title font-weight-normal" id="updateModalLabel"></h5>
            <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form method="POST">
            <div class="modal-body">
              <div class="input-group input-group-outline my-3">
                <label class="form-label">Tên mã giảm giá</label>
                <input type="text" class="form-control" name="name" id="sizeNameUpdate">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-block btn-light" data-bs-dismiss="modal">Đóng</button>
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="id" id="idUpdate">
              <button type="submit" class="btn bg-gradient-danger">Lưu</button>
            </div>
          </form>

        </div>
      </div>
    </div>
    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title font-weight-normal" id="deleteModalLabel"></h5>
            <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Bạn có chắc chắn muốn xóa?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-block btn-light" data-bs-dismiss="modal">Close</button>
            <form method="POST">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="id" id="idDelete">
              <button type="submit" class="btn bg-gradient-danger">Xóa</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script>
      const setIdDelete = (id,name) => {
        $("#deleteModalLabel").text("Xóa mã giảm giá "+name+"?");
        $("#idDelete").val(id);
      }
      const setIdUpdate = (id,name) => {
        $("#updateModalLabel").text("Cập nhật mã giảm giá "+name);
        $("#idUpdate").val(id);
        $("#sizeNameUpdate").val(name);
      }
    </script>
    <script>
      window.addEventListener("DOMContentLoaded", function () {
        ClassicEditor
                .create( document.querySelector( '#content' ))
                .catch( error => {
                  console.error( error );
                } );
      })

    </script>
</body>
</html>