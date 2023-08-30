<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/18/2023
  Time: 7:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new Student</h1>
<a href="/students">Quay lại</a>
<form action="/students?action=create" method="post">
    <fieldset>
        <legend>Create</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td><input type="radio" name="gender" value="male">Nam
                    <input type="radio" name="gender" value="female">Nữ</td>
            </tr>
            <tr>
                <td>Point:</td>
                <td><input type="number" name="point"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
