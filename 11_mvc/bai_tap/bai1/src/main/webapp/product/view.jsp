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
        <tr>
            <td>Name: </td>
            <td>${product.getName()}</td>
        </tr>
        <tr>
            <td>Product Name: </td>
            <td>${product.getProductName()}</td>
        </tr>
        <tr>
            <td>Price: </td>
            <td>${product.getPrice()}</td>
        </tr>
</table>
</body>
</html>
