<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <table class="table table-striped">
                <h2>List of service</h2>
                <thead>
                <tr style="text-align: center">
                    <th scope="col">Service id</th>
                    <th scope="col">Service name</th>
                    <th scope="col">Service area</th>
                    <th scope="col">Service cost</th>
                    <th scope="col">Service max people</th>
                    <th scope="col">Rent type id</th>
                    <th scope="col">Service type id</th>
                    <th scope="col">Standard room</th>
                    <th scope="col">Description other convenience</th>
                    <th scope="col">Pool area</th>
                    <th scope="col">Number of floors</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="service" items="${serviceListServlet}">
                    <tr>
                        <th scope="row" style="text-align: center"><c:out value="${service.getServiceId()}"/></th>
                        <td style="text-align: center"><c:out value="${service.getServiceName()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getServiceArea()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getServiceCost()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getServiceMaxPeople()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getRentTypeId()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getServiceTypeId()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getStandardRoom()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getDescriptionOtherConvenience()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getPoolArea()}"/></td>
                        <td style="text-align: center"><c:out value="${service.getNumberOfFloors()}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="container-fluid">
    <center>
        <a class="btn btn-success" href="/service?action=create" role="button">Add New Service</a>
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
</body>
</html>
