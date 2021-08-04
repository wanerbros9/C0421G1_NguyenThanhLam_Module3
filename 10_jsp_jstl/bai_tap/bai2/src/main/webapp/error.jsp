<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:catch var="catchException">
    <c:out value="${errorServlet}"/>
</c:catch>
<c:if test="${catchException != null}">
    <p>The type of exception is : ${catchException} <br />
        There is an exception: ${catchException.message}</p>
</c:if>
</body>
</html>