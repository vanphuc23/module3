<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new User</title>
</head>
<body>
<h1>Create new User</h1>
<a href="/users">Quay lại menu</a>
<form action="/users?action=create" method="post">
<fieldset>
    <legend>Create</legend>
    <table>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input type="email" name="email"></td>
        </tr>
        <tr>
            <td>Country: </td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td></td>
            <td><button>Create</button></td>
        </tr>
    </table>
</fieldset>
</form>
</body>
</html>
