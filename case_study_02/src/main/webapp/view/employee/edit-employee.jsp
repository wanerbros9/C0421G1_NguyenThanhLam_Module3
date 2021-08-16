<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <form method="post">
                <legend align="center">Edit Employee</legend>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="employeeId" value="${employeeObj.getEmployeeId()}">
                <div class="mb-3">
                    <label for="employeeName" class="form-label">Employee Name</label>
                    <input type="text" name="employeeName" class="form-control" id="employeeName"
                           value="${employeeObj.getEmployeeName()}">
                </div>
                <div class="mb-3">
                    <label for="positionId" class="form-label">Position Id</label>
                    <input type="text" name="positionId" class="form-control" id="positionId"
                           value="${employeeObj.getPositionId()}">
                </div>
                <div class="mb-3">
                    <label for="educationDegreeId" class="form-label">Education Degree Id Name</label>
                    <input type="text" name="educationDegreeId" class="form-control" id="educationDegreeId"
                           value="${employeeObj.getEducationDegreeId()}">
                </div>
                <div class="mb-3">
                    <label for="divisionId" class="form-label">Division Id</label>
                    <input type="text" name="divisionId" class="form-control" id="divisionId"
                           value="${employeeObj.getDivisionId()}">
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
                <button type="submit" class="btn btn-primary">Update Employee</button>
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
