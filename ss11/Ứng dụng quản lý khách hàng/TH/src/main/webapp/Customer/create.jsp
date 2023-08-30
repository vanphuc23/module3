<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/18/2023
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới khách hàng</h1>
<a href="/customers">Quay lại</a>
<form method="post" action="?action=create">
<fieldset>
    <legend>Customer information</legend>
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Create"></td>
        </tr>
    </table>
</fieldset>
</form>
</body>
</html>
