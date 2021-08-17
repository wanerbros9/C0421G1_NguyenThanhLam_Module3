<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
            <form method="post">
                <legend align="center">Create Service</legend>
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="ServiceId" value="${serviceObj.getServiceId()}">
                <div class="mb-3">
                    <label for="serviceName" class="form-label">Service Name</label>
                    <input type="text" name="serviceName" class="form-control" id="serviceName"
                           value="${serviceObj.getServiceArea()}">
                </div>
                <div class="mb-3">
                    <label for="serviceArea" class="form-label">Service Area</label>
                    <input type="text" name="serviceArea" class="form-control" id="serviceArea"
                           value="${serviceObj.getServiceArea()}">
                </div>
                <div class="mb-3">
                    <label for="serviceCost" class="form-label">Service Cost</label>
                    <input type="text" name="serviceCost" class="form-control" id="serviceCost"
                           value="${serviceObj.getServiceCost()}">
                </div>
                <div class="mb-3">
                    <label for="serviceMaxPeople" class="form-label">Service Max People</label>
                    <input type="text" name="serviceMaxPeople" class="form-control" id="serviceMaxPeople"
                           value="${serviceObj.getServiceMaxPeople}">
                </div>
                <div class="mb-3">
                    <label for="rentTypeId" class="form-label">Rent Type Name</label>
                    <select name="rentTypeId" class="form-select" id="rentTypeId">
                        <option value="">Select Rent Type</option>
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <option value="${rentType.getRentTypeId()}">
                                    ${rentType.getRentTypeName()}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="serviceTypeId" class="form-label">Rent Type Name</label>
                    <select name="serviceTypeId" class="form-select" id="serviceTypeId">
                        <option value="">Select Service Type</option>
                        <c:forEach var="serviceType" items="${serviceTypeList}">
                            <option value="${serviceType.getServiceTypeId()}">
                                    ${serviceType.getServiceTypeName()}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="standardRoom" class="form-label">Standard Room</label>
                    <input type="text" name="standardRoom" class="form-control" id="standardRoom"
                           value="${serviceObj.getStandardRoom()}">
                </div>
                <div class="mb-3">
                    <label for="descriptionOtherConvenience" class="form-label">Description Other Convenience</label>
                    <input type="text" name="descriptionOtherConvenience" class="form-control"
                           id="descriptionOtherConvenience"
                           value="${serviceObj.getDescriptionOtherConvenience()}">
                </div>
                <div class="mb-3">
                    <label for="poolArea" class="form-label">Pool Area</label>
                    <input type="text" name="poolArea" class="form-control" id="poolArea"
                           value="${serviceObj.getPoolArea()}">
                </div>
                <div class="mb-3">
                    <label for="numberOfFloors" class="form-label">Number Of Floors</label>
                    <input type="text" name="numberOfFloors" class="form-control" id="numberOfFloors"
                           value="${serviceObj.getNumberOfFloors()}">
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">Create Service</button>
                    <c:if test="${msg != null}">
                        ${msg}
                    </c:if>
                </div>
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

</body>
</html>
