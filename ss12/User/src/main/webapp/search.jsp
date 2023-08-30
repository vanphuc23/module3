<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/22/2023
  Time: 6:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách tìm kiếm</title>
</head>
<body>
<h1>Danh sách tìm kiếm</h1>
<a href="/users">Quay lại menu</a>
<fieldset>
    <legend>Search</legend>
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach items="${listSearch}" var="search">
            <tr>
                <td><c:out value="${search.getId()}"/></td>
                <td><c:out value="${search.getName()}"/></td>
                <td><c:out value="${search.getEmail()}"/></td>
                <td><c:out value="${search.getCountry()}"/></td>
            </tr>
        </c:forEach>
    </table>
</fieldset>
</body>
</html>
