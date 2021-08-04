<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h2>Customer List</h2>
<table border="2">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customerObj" items="${customerListServlet}">
        <tr>
            <td><c:out value="${customerObj.name}"/></td>
            <td><c:out value="${customerObj.dateOfBirth}"/></td>
            <td><c:out value="${customerObj.address}"/></td>
            <td><img src="${customerObj.image}" style="width: 50%" alt="car"></td>
        </tr>
    </c:forEach>
    <c:if test="">

    </c:if>
</table>
</body>
</html>
