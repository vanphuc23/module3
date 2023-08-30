<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/16/2023
  Time: 6:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table,tr,td,th {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>
<body>
<h1>Danh sách khách hàng</h1>
    <a href="/customers?action=showFormCreate">Create new Customer</a>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
    </tr>
    <c:forEach items="${list}" var="customer">
        <tr>
            <td><c:out value="${customer.getId()}"/></td>
            <td><c:out value="${customer.getName()}"/></td>
            <td><c:out value="${customer.getEmail()}"/></td>
            <td><c:out value="${customer.getAddress()}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
