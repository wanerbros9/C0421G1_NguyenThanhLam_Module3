<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User</title>
</head>
<body>
<h1>Delete User</h1>
<p>
    <a href="/user">Back to user list</a>
</p>
<form method="post">
    <h3>Are you sure</h3>
    <fieldset>
        <input type="hidden" name="actionClient" value="update">
        <input type="hidden" name="id" value="${userObj.id}">
        <tr>
            <td>Id: </td>
            <td>${user.getId()}</td>
        </tr>
        <tr>
            <td>Name: </td>
            <td>${user.getName()}</td>
        </tr>
        <tr>
            <td>Email: </td>
            <td>${product.getEmail()}</td>
        </tr>
        <tr>
            <td>Country: </td>
            <td>${product.getCountry()}</td>
        </tr>
        <tr>
            <td><input type="submit" value="Delete User"></td>
            <td><a href="/user">Back to user list</a></td>
        </tr>
    </fieldset>
</form>
</body>
</html>
