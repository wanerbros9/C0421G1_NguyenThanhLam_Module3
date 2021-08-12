<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row" style="padding-bottom: 20px; padding-top: 12px">
        <div class="col-lg-6">
            <img src="data:image/png;base64,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"
                 alt="" width="40px">
        </div>
        <div class="col-lg-6" style="text-align: right; padding-top: 12px">
            Nguyen Van A
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="padding-left: 100px">
        <%--        <a class="navbar-brand" href="#">Navbar</a>--%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item" style="margin-right: 30px">
                    <a class="nav-link active" aria-current="page" href="/home">Home</a>
                </li>
                <li class="nav-item" style="margin-right: 30px">
                    <a class="nav-link" href="/employee">Employee</a>
                </li>
                <li class="nav-item" style="margin-right: 30px">
                    <a class="nav-link" href="/customer">Customer</a>
                </li>
                <li class="nav-item" style="margin-right: 30px">
                    <a class="nav-link" href="/service">Service</a>
                </li>
                <li class="nav-item" style="margin-right: 30px">
                    <a class="nav-link" href="/contract">Contract</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <form method="post">
                <legend align="center">Create Employee</legend>
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="employeeId" value="${employeeObj.getEmployeeId()}">
                <div class="mb-3">
                    <label for="employeeName" class="form-label">Employee Name</label>
                    <input type="text" name="employeeName" class="form-control" id="employeeName"
                           value="${employeeObj.getEmployeeName()}">
                </div>
                <div class="mb-3">
                    <label for="positionId">Position</label>
                    <select name="positionId" class="form-select" id="positionId">
                        <option value="">Select Position</option>
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.getPositionId()}">
                                    ${position.getPositionName()}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="educationDegreeId">Education Degree</label>
                    <select name="educationDegreeId" class="form-select" id="educationDegreeId">
                        <option value="">Select Education Degree</option>
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.getEducationDegreeId()}">
                                    ${educationDegree.getEducationDegreeName()}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="divisionId">Division</label>
                    <select name="divisionId" class="form-select" id="divisionId">
                        <option value="">Select Division</option>
                        <c:forEach var="division" items="${divisionList}">
                            <option value="${division.getDivisionId()}">
                                    ${division.getDivisionName()}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="employeeBirthday" class="form-label">Employee Birthday</label>
                    <input type="text" name="employeeBirthday" class="form-control" id="employeeBirthday"
                           value="${employeeObj.getEmployeeBirthday()}">
                </div>
                <div class="mb-3">
                    <label for="employeeIdCard" class="form-label">Employee Id Card</label>
                    <input type="text" name="employeeIdCard" class="form-control" id="employeeIdCard"
                           value="${employeeObj.getEmployeeIdCard()}">
                </div>
                <div class="mb-3">
                    <label for="employeeSalary" class="form-label">Employee Salary</label>
                    <input type="text" name="employeeSalary" class="form-control" id="employeeSalary"
                           value="${employeeObj.getEmployeeSalary()}">
                </div>
                <div class="mb-3">
                    <label for="employeePhone" class="form-label">Employee Phone</label>
                    <input type="text" name="employeePhone" class="form-control" id="employeePhone"
                           value="${employeeObj.getEmployeePhone()}">
                </div>
                <div class="mb-3">
                    <label for="employeeEmail" class="form-label">Employee Email</label>
                    <input type="email" name="employeeEmail" class="form-control" id="employeeEmail"
                           value="${employeeObj.getEmployeeEmail()}">
                </div>
                <div class="mb-3">
                    <label for="employeeAddress" class="form-label">Employee Address</label>
                    <input type="text" name="employeeAddress" class="form-control" id="employeeAddress"
                           value="${employeeObj.getEmployeeAddress()}">
                </div>
                <button type="submit" class="btn btn-primary">Create Employee</button>
            </form>
            <span>
                <c:if test="msg != null">
                    ${msg}
                </c:if>
            </span>
        </div>
    </div>
</div>
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
