<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer</title>
</head>
<body>
<h1>Customer details</h1>
<p>
    <a href="/products">Back to customer list</a>
</p>
<table>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>Name:</td>
            <td>${requestScope["product"].getName()}</td>
        </tr>
        <tr>
            <td>Product Name:</td>
            <td>${requestScope["product"].getProductName}</td>
        </tr>
        <tr>
            <td>Price:</td>
            <td>${requestScope["product"].getPrice}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
