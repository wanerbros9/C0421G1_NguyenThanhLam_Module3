<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 03/08/2021
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/displayDiscount" method="post">
    <p>Product Description: </p>
    <input type="text" name="product"/>
    <p>List Price: </p>
    <input type="text" name="price">
    <p>Discount Percent: </p>
    <input type="text" name="discount">
    <button>Calculate Discount</button>
</form>
</body>
</html>
