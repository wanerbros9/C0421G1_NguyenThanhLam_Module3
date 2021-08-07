<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/user?actionClient=create">Add New User</a>
    </h2>
</center>
<fieldset>
    <legend>Search User</legend>
    <form action="/user?actionClient=findByCountry" method="post">
        <input type="text" name="country">
        <input type="submit" value="Search">
    </form>
</fieldset>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="user" items="${userListServlet}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/user?actionClient=edit&id=${user.id}">Edit</a>
                    <a href="/user?actionClient=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div align="center">
    <a href="/user?actionClient=orderBy">Order by Name</a>
</div>
</body>
</html>
