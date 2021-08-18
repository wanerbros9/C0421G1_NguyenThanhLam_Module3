<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css">
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <table class="table table-striped" id="tableProduct">
                <h2>List of Product</h2>
                <thead>
                <tr style="text-align: center">
                    <th scope="col">Product id</th>
                    <th scope="col">Product name</th>
                    <th scope="col">Product price</th>
                    <th scope="col">Product quantity</th>
                    <th scope="col">Product color</th>
                    <th scope="col">Category</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productListServlet}">
                    <tr>
                        <td style="text-align: center"><c:out value="${product.getProductId()}"/></td>
                        <td style="text-align: center"><c:out value="${product.getProductName()}"/></td>
                        <td style="text-align: center"><c:out value="${product.getProductPrice()}"/></td>
                        <td style="text-align: center"><c:out value="${product.getProductQuantity()}"/></td>
                        <td style="text-align: center"><c:out value="${product.getProductColor()}"/></td>
<%--                        <td style="text-align: center"><c:out value="${product.getCategoryId()}"/></td>--%>
                        <td style="text-align: center">
                            <c:if test="${product.getCategoryId() == '1'}">
                                Phone
                            </c:if>
                            <c:if test="${product.getCategoryId() == '2'}">
                                Tivi
                            </c:if>
                            <c:if test="${product.getCategoryId() == '3'}">
                                Tủ Lạnh
                            </c:if>
                            <c:if test="${product.getCategoryId() == '4'}">
                                Máy giặt
                            </c:if>
                        </td>
                        <td>
                            <a class="btn btn-warning" href="/product?action=edit&id=${product.getProductId()}">Edit</a>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" onclick="deleteById('${product.getProductId()}','${product.getProductName()}')">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="container-fluid">
    <center>
        <a class="btn btn-success" href="/product?action=create" role="button">Add New Product</a>
    </center>
</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Do you want to delete <input type="text" value="" id="productName" readonly style="border: solid white">
            </div>
            <form method="post">
                <div class="modal-footer">
                    <input type="hidden" name="id" id="productId">
                    <input type="hidden" name="action" value="delete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="submit" class="btn btn-danger">Yes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function deleteById(id,name){
        document.getElementById("productId").value = id;
        document.getElementById("productName").value = name;
    }
</script>
<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        })
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
