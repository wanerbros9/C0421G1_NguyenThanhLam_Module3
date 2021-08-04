<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Result:</h3>

<c:out value="${firstOperandServlet}"/>
<c:out value="${operatorServlet}"/>
<c:out value="${secondOperandServlet}"/>
<c:out value="="/>
<c:out value="${resultServlet}"/>
</body>
</html>