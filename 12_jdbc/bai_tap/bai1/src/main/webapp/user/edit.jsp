<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/user">Back to user list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Edit User</legend>
        <input type="hidden" name="actionClient" value="update">
        <input type="hidden" name="id" value="${userObj.id}">
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${userObj.getName()}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email" value="${userObj.getEmail()}"></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td><input type="text" name="country" id="country" value="${userObj.getCountry()}"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Update User"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
