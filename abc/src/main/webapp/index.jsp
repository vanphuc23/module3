<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/14/2023
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table,tr,td,th{
        border: 1px solid black;
        border-collapse: collapse;
    }
    img {
        width: 100px;
        height: 100px;
    }
</style>
<body>
<h1>Danh sách sinh viên</h1>
<table>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Điểm</th>
        <th>Địa chỉ</th>
    </tr>
    <c:forEach items="${list}" var="student" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${student.name}"/></td>
            <td><c:out value="${student.score}"/></td>
<%--            <td><c:out value="${student.address}"></td>--%>
            <td><img src="${student.address}" alt=""></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
