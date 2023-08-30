<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update a User</title>
</head>
<body>
<h1>Update a User</h1>
<a href="/users">Quay lại menu</a>
<form action="/users?action=update" method="post">
    <fieldset>
        <legend>Update</legend>
        <table>
            <tr>
                <td><input type="hidden" name="id" value="${user.getId()}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" value="<c:out value="${user.getName()}" />"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="email" name="email" value="<c:out value="${user.getEmail()}" />"></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td><input type="text" name="country" value="<c:out value="${user.getCountry()}" />"></td>
            </tr>
            <tr>
                <td></td>
                <td><button>Update</button></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
