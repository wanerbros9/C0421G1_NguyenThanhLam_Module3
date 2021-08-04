<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h3>Simple Calculator</h3>
<form action="/calculator" method="post">
    <p>First operand</p>
    <input type="text" name="first_operand" value="0">
    <p>Operator</p>
    <select name="operator">
        <option>+</option>
        <option>-</option>
        <option>x</option>
        <option>/</option>
    </select>
    <p>Second operand</p>
    <input type="text" name="second_operand" value="0">
    <input type="submit" id="submit" value="Calculator">
</form>
</body>
</html>