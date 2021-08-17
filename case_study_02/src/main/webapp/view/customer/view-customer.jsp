<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <table class="table table-striped">
                <h2>List of customer</h2>
                <thead>
                <tr style="text-align: center">
                    <th scope="col">Customer id</th>
                    <th scope="col">Customer type id</th>
                    <th scope="col">Customer name</th>
                    <th scope="col">Customer birthday</th>
                    <th scope="col">Customer gender</th>
                    <th scope="col">Customer id card</th>
                    <th scope="col">Customer phone</th>
                    <th scope="col">Customer email</th>
                    <th scope="col">Customer address</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerListServlet}">
                    <tr>
                        <th scope="row" style="text-align: center"><c:out value="${customer.getCustomerId()}"/></th>
                        <td style="text-align: center"><c:out value="${customer.getCustomerTypeId()}"/></td>
                        <td style="text-align: center"><c:out value="${customer.getCustomerName()}"/></td>
                        <td style="text-align: center"><c:out value="${customer.getCustomerBirthday()}"/></td>
                        <td style="text-align: center;">
                            <c:if test="${customer.getCustomerGender() == 'true' }">
                                Male
                            </c:if>
                            <c:if test="${customer.getCustomerGender() == 'false' }">
                                Female
                            </c:if>
                        </td>
                        <td style="text-align: center"><c:out value="${customer.getCustomerIdCard()}"/></td>
                        <td style="text-align: center"><c:out value="${customer.getCustomerPhone()}"/></td>
                        <td style="text-align: center"><c:out value="${customer.getCustomerEmail()}"/></td>
                        <td style="text-align: center"><c:out value="${customer.getCustomerAddress()}"/></td>
                        <td>
                            <a class="btn btn-warning" href="/customer?action=edit&id=${customer.getCustomerId()}"
                               role="button">Edit</a>
                            <!-- Vertically centered modal -->
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" onclick="deleteById(${customer.getCustomerId()})">
                                Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Do you want to delete ?
                                        </div>
                                        <form method="post">
                                            <div class="modal-footer">
                                                <input type="hidden" name="id" id="customerId">
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
        <a class="btn btn-success" href="/customer?action=create" role="button">Add New Customer</a>
    </center>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script>
    function deleteById(id) {
        document.getElementById("customerId").value = id;
    }
</script>
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
