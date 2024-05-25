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
            <a class="btn bg-gradient-dark mb-0" id="toggleAddProduct" data-bs-toggle="collapse" href="#formNewProduct"><i class="material-icons text-sm">add</i>&nbsp;&nbsp;Thêm mã giảm giá mới</a>
          <div class="collapse multi-collapse my-3" id="formNewProduct">
            <div class="card py-2 px-4" >
              <form method="POST" id ="formAddVoucher">
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Tên mã giảm giá</label>
                  <input type="text" class="form-control" id="nameVoucher" name="name" required>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Mã giảm giá</label>
                  <input type="text" id="codeVoucher" class="form-control" name="code" required>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Phần trăm giảm giá</label>
                  <input type="number" id="discountVoucher" class="form-control" name="code" required>
                </div>
                <p class="text-danger" id="validateCodeVoucher"></p>
                <div class="my-3">
                  <label>Nội dung</label>
                  <textarea id="contentVoucher" type="text" class="" rows="10" style="height: 200px" name="content"></textarea>
                  <p class="text-sm">Nội dung không được chứa kí tự <code>'</code></p>
                </div>
                <div class="input-group input-group-outline my-3">
                  <label class="form-label">Mô tả ngắn</label>
                  <input id="shortDescriptionVoucher" type="text" class="form-control" name="shortDescription" required/>
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
                  <input type="number" class="form-control" name="usageLimit" required/>
                </div>
                <div class="input-group input-group-static mb-4">
                  <label for="haveCondition" class="ms-0">Điều kiện áp dụng</label>
                  <input type="checkbox" class="form-control" id="haveCondition" name="haveCondition"/>
                </div>
                <div id="conditionVoucher">

                </div>
                <button class="btn btn-primary" id="submitFormAddVoucher" type="submit">Tạo mã giảm giá</button>

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
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" style="width: 10%">Mô tả ngắn</th>
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
                    <td style="width: 100px" class="overflow-hidden" data-bs-toggle="tooltip" data-bs-placement="top" title="${item.shortDescription}">
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0" style="line-clamp: 1; width: 100px; overflow: hidden; text-overflow: ellipsis;">${item.shortDescription}</p>
                        </div>
                      </div>
                    </td>

                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <p class="text-xs font-weight-bold mx-auto mb-0">${item.updateAt}</p>
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
    <script src="http://localhost:8080/views/admin/voucher/voucher.js"></script>
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
        let editorInstance;
        ClassicEditor
                .create( document.querySelector( '#contentVoucher' ))
                .then(editor => {
                  editorInstance = editor;
                })
                .catch( error => {
                  console.error( error );
                } );
        $("#formAddVoucher").submit((e)=> {
          e.preventDefault()
          const name = $("#nameVoucher").val();
          const code = $("#codeVoucher").val();
          const content = editorInstance.getData();
          const shortDescription = $("#shortDescriptionVoucher").val()
          const startDate = $("#startDate").val();
          const endDate = $("#endDate").val();
          const usageLimit = $("#usageLimit").val();
          const discount = $("#discountVoucher").val();
          $.ajax({
            url : "/ajax/voucher/add",
            method : "POST",
            headers: {
              'Content-Type': 'application/json'
            },
            data : JSON.stringify({
              name,
              code,
              content,
              shortDescription,
              startDate,
              endDate,
              usageLimit,
              conditions,
              discount
            }),
            success : function (data) {
              window.location.href += '/admin/voucher/list?toast=success&message=add_success'
            },
            error : function (error) {
              window.location.href += '/admin/voucher/list?toast=danger&message=error'
            }
          })
        })

        let deboundValidateCodeVoucher =  null;
        $("input[name='code']").keyup(function () {
          const code = $(this).val();
          clearTimeout(deboundValidateCodeVoucher);
          deboundValidateCodeVoucher = setTimeout(function () {
            $.ajax({
              url : "/ajax/voucher",
              data : {
                code
              },
              type : "GET",
              success : function (data) {
                if (data && data.code===code)  {
                  $("#validateCodeVoucher").text("Mã giảm giá đã tồn tại")
                  $("#formAddVoucher button[type='submit']").attr("disabled","")
                } else {
                  $("#validateCodeVoucher").text("")
                  $("#formAddVoucher button[type='submit']").attr("disabled",false)
                }
              },
              error : function (error) {
                $("#validateCodeVoucher").text("")
                $("#formAddVoucher button[type='submit']").attr("disabled",false)
              }
            })
          },500)
        })
      //   Set condition voucher
        let conditions = [];
        $("#haveCondition").change( function () {
          if($(this).prop("checked")) {
            $("#conditionVoucher").append(`
                  <div class="conditionList"></div>
                  <div class="d-flex justify-content-end me-4 gap-4">
                    <div class="btn btn-outline-primary rounded-circle d-flex p-0" id="addCondition" style="width: 40px;height: 40px">
                      <i class="fa-solid fa-plus m-auto"></i>
                    </div>
                    <div class="btn btn-outline-danger rounded-circle d-flex p-0" id="removeCondition" style="width: 40px;height: 40px">
                      <i class="fa-solid fa-minus m-auto"></i>
                    </div>
                  </div>
            `)
           conditions.push({
             tableName : 'user',
             columnName : 'id',
             conditionValue :''
           })
            updateDOMActionConditionVoucher();
            updateDOMCondition();
          } else {
            conditions = [];
            $("#conditionVoucher").empty();
          }
        })
        function updateDOMCondition() {
          $('.conditionList').empty();
          for (let i = 0; i < conditions.length; i++) {
            const condition = conditions[i];
            const conditionItem = $(`
            <div class="row conditionItem" id="conditionItem`+i+`" >
              <div class="col-12 col-md-4 condition-table" data-index-condition="`+i+`"></div>
              <div class="col-12 col-md-4 condition-column" data-index-condition="`+i+`"></div>
              <div class="col-12 col-md-4 condition-value" data-index-condition="`+i+`"></div>
            </div>
            `);
            $('.conditionList').append(conditionItem);
            const strDOMTable = conditionTables(condition.tableName);
            const strDOMCol = conditionColumns[condition.tableName](condition.columnName);
            const strDOMVal = conditionValue[condition.tableName][condition.columnName](condition.conditionValue);
            conditionItem.find('.condition-table').append(strDOMTable);
            conditionItem.find('.condition-column').append(strDOMCol);
            conditionItem.find('.condition-value').append(strDOMVal);
            updateDOMActionConditionVoucher();
          }
        }

        function updateDOMActionConditionVoucher() {
          $('.conditionList').off('change', '.condition-table');
          $('.conditionList').off('change', '.condition-column');
          $("#addCondition").off('click');
          $("#removeCondition").off('click');
          $(".conditionItem > .condition-table").change(function () {
            const index = $(this).attr("data-index-condition");
            const tableName = $("#conditionItem"+index+" > .condition-table select").val();
            conditions[index].tableName = tableName
            const strDOMCol = conditionColumns[tableName](defaultColumnCondition);
            const strDOMVal = conditionValue[tableName][defaultColumnCondition]("");
            $(`#conditionItem`+index+` > .condition-column`).empty();
            $(`#conditionItem`+index+` > .condition-column`).append(strDOMCol)
            $(`#conditionItem`+index+` > .condition-value`).empty();
            $(`#conditionItem`+index+` > .condition-value`).append(strDOMVal);
            console.table(conditions)
          })
          $(".conditionItem > .condition-column").change(function () {
            const index = $(this).attr("data-index-condition");
            const tableName = $("#conditionItem"+index+" > .condition-table select").val();
            const columnName = $("#conditionItem"+index+" > .condition-column select").val();
            const strDOMVal = conditionValue[tableName][columnName]("");
            conditions[index].columnName = columnName
            $(`#conditionItem`+index+` > .condition-value`).empty();
            $(`#conditionItem`+index+` > .condition-value`).append(strDOMVal);
            console.table(conditions)

          })
          $(".conditionItem > .condition-value").change(function () {
            let valueCondition = "";
            const index = $(this).attr("data-index-condition");
            if ($("#conditionItem"+index+" > .condition-value select")) {
              valueCondition = $("#conditionItem"+index+" > .condition-value select").val()
            }
            else if ($("#conditionItem"+index+" > .condition-value input")) {
              valueCondition = $("#conditionItem"+index+" > .condition-value input").val();
            }
            conditions[index].conditionValue = valueCondition
            console.table(conditions)
          })
          $("#addCondition").click(function () {
            conditions.push({
              tableName : 'user',
              columnName : 'id',
              conditionValue :''
            })
            updateDOMCondition();
          })
          $("#removeCondition").click(function () {
            conditions.pop();
            updateDOMCondition();
          })
        }
      })

    </script>
</body>
</html>