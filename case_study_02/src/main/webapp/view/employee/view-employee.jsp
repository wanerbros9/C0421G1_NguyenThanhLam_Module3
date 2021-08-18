<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css">
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
            <table class="table table-striped table-bordered" id="tableStudent"
                   style="width: 100%; overflow-x: scroll; display: inline-block">
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
                        <td scope="row" style="text-align: center"><c:out value="${employee.getEmployeeId()}"/></td>
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
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" onclick="deleteById('${employee.getEmployeeId()}','${employee.getEmployeeName()}')">
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
        <a class="btn btn-success" href="/employee?action=create" role="button">Add New Employee</a>
    </center>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
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
                Do you want to delete <input type="text" value="" id="employeeName" readonly style="border: solid white">
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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
<script>
    function deleteById(id, name) {
        document.getElementById("employeeId").value = id;
        document.getElementById("employeeName").value = name;
    }
</script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        })
    });
</script>
</body>
</html>
