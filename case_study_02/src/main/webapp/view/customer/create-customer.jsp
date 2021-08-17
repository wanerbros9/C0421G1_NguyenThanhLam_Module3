<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3" style="border: 1px solid black">
            Item One </br>
            Item Two </br>
            Item Three
        </div>
        <div class="col-lg-9">
            <form method="post" style="width: 80%">
                <legend align="center">Create Customer</legend>
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="customerId" value="${customerObj.getCustomerId()}">
                <div class="mb-3">
                    <label for="customerTypeId" class="form-label">Customer Type Id</label>
                    <select name="customerTypeId" class="form-select" id="customerTypeId">
                        <option value="">Select Customer Type</option>
                        <c:forEach var="customerType" items="${customerTypeList}">
                            <option value="${customerType.getCustomerTypeId()}">
                                    ${customerType.getCustomerTypeName()}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" name="customerName" class="form-control" id="customerName"
                           value="${customerObj.getCustomerName()}">
                    <small style="color: red">
                        ${nameValidate}
                    </small>
                </div>
                <div class="mb-3">
                    <label for="customerBirthday" class="form-label">Customer Birthday</label>
                    <input type="date" name="customerBirthday" class="form-control" id="customerBirthday"
                           value="${customerObj.getCustomerBirthday()}">
                </div>
                <div class="mb-3">
                    <label for="customerGender" class="form-label">Customer Gender</label>
                    <select name="customerGender" class="form-select" id="customerGender">
                        <option selected>Select Gender</option>
                        <option value="true">Male</option>
                        <option value="false">Female</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="customerIdCard" class="form-label">Customer Id Card</label>
                    <input type="text" name="customerIdCard" class="form-control" id="customerIdCard"
                           value="${customerObj.getCustomerIdCard()}">
                </div>
                <div class="mb-3">
                    <label for="customerPhone" class="form-label">Customer Phone</label>
                    <input type="text" name="customerPhone" class="form-control" id="customerPhone"
                           value="${customerObj.getCustomerPhone()}">
                    <small style="color: red">
                        ${customerPhone}
                    </small>
                </div>
                <div class="mb-3">
                    <label for="customerEmail" class="form-label">Customer Email</label>
                    <input type="email" name="customerEmail" class="form-control" id="customerEmail"
                           value="${customerObj.getCustomerEmail()}">
                    <small style="color: red">
                        ${customerEmail}
                    </small>
                </div>
                <div class="mb-3">
                    <label for="customerAddress" class="form-label">Customer Address</label>
                    <input type="text" name="customerAddress" class="form-control" id="customerAddress"
                           value="${customerObj.getCustomerAddress()}">
                </div>
                <button type="submit" class="btn btn-primary">Create Customer</button>
                <p>
                    <c:if test="${msg != null}">
                        ${msg}
                    </c:if>
                </p>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
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
