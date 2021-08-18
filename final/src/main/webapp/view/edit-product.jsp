<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 18/08/2021
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>


<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <legend align="center">Edit Product</legend>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="list-group; col-lg-2" style="text-align: center">
            <a href="/product" class="list-group-item list-group-item-action">Product</a>
        </div>
        <div class="col-lg-10">
            <form method="post" style="width: 80%;">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="productId" value="${productObj.getProductId()}">
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name</label>
                    <input type="text" name="productName" class="form-control" id="productName"
                           value="${productObj.getProductName()}">
                </div>
                <div class="mb-3">
                    <label for="productPrice" class="form-label">Product Price</label>
                    <input type="text" name="productPrice" class="form-control" id="productPrice"
                           value="${productObj.getProductPrice()}">
                </div>
                <div class="mb-3">
                    <label for="productQuantity" class="form-label">Product Quantity</label>
                    <input type="text" name="productQuantity" class="form-control" id="productQuantity"
                           value="${productObj.getProductQuantity()}">
                </div>
                <div class="mb-3">
                    <label for="productColor" class="form-label">Product Color</label>
                    <input type="text" name="productColor" class="form-control" id="productColor"
                           value="${productObj.getProductColor()}">
                </div>
                <div class="mb-3">
                    <label for="categoryId" class="form-label">Category Id</label>
                    <input type="text" name="categoryId" class="form-control" id="categoryId"
                           value="${productObj.getCategoryId()}">
                </div>
                <a href="/product">
                    <button type="submit" class="btn btn-primary">Update Product</button>
                </a>
            </form>
        </div>
    </div>
</div>

<jsp:include page="layout/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
