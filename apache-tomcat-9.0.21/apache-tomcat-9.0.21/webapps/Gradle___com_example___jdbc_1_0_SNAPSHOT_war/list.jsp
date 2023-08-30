<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/18/2023
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách học sinh</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Point</th>
    </tr>
    <c:forEach items="${list}" var="student">
        <tr>
            <td><c:out value="${student.getId()}"/></td>
            <td><c:out value="${student.getName()}"/></td>
            <c:if test="${student.getGender()==true}">
                <td>Name</td>
            </c:if>
            <c:if test="${student.getGender()==false}">
                <td>Nữ</td>
            </c:if>
            <td><c:out value="${student.getPoint()}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
