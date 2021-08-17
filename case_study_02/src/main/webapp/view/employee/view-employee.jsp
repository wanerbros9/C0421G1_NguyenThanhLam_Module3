<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12"><h2 style="text-align: center">List of employee</h2></div>
    </div>
</div>
<div class="container-fluid">
    <div class="row" style="margin-top: 5px">
        <div class="list-group col-lg-1" style="text-align: center">
            <a href="/employee" class="list-group-item list-group-item-action">Employee</a>
            <a href="/customer" class="list-group-item list-group-item-action">Customer</a>
            <a href="/service" class="list-group-item list-group-item-action">Service</a>
            <a href="/contract" class="list-group-item list-group-item-action">Contract</a>
        </div>
        <div class="col-lg-11">
            <table class="table table-striped table-bordered">
                <thead>
                <tr style="text-align: center">
                    <th scope="col">Employee id</th>
                    <th scope="col">Employee Name</th>
                    <th scope="col">Position id</th>
                    <th scope="col">Education degree id</th>
                    <th scope="col">Division id</th>
                    <th scope="col">Employee birthday</th>
                    <th scope="col">Employee id card</th>
                    <th scope="col">Employee salary</th>
                    <th scope="col">Employee phone</th>
                    <th scope="col">Employee email</th>
                    <th scope="col">Employee address</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employeeListServlet}">
                    <tr>
                        <th scope="row" style="text-align: center"><c:out value="${employee.getEmployeeId()}"/></th>
                        <td style="text-align: center"><c:out value="${employee.getEmployeeName()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getPositionId()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getEducationDegreeId()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getDivisionId()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getEmployeeBirthday()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getEmployeeIdCard()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getEmployeeSalary()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getEmployeePhone()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getEmployeeEmail()}"/></td>
                        <td style="text-align: center"><c:out value="${employee.getEmployeeAddress()}"/></td>
                        <td>
                            <a class="btn btn-warning" href="/employee?action=edit&id=${employee.getEmployeeId()}"
                               role="button">Edit</a>
                            <!-- Vertically centered modal -->
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" onclick="deleteById(${employee.getEmployeeId()})">
                                Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Do you want to delete ?
                                        </div>
                                        <form method="post">
                                            <div class="modal-footer">
                                                <input type="hidden" name="id" id="employeeId">
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
        <a class="btn btn-success" href="/employee?action=create" role="button">Add New Employee</a>
    </center>
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
<script>
    function deleteById(id) {
        document.getElementById("employeeId").value = id;
    }
</script>
</body>
</html>
