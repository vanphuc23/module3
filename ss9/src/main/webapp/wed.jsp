<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/11/2023
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
  .login1 {
    height:200px; width:230px;
    margin: 0;
    padding: 10px;
    border: 1px solid black;
  }
  input {
    margin-top: 5px;
    padding: 5px;
  }
</style>
<body>
<form action="/login" method="post">
  <div class="login1">
    <h1>Login</h1>
    <input type="text" name="username" placeholder="username">
    <input type="password" name="password" placeholder="password">
    <button>Sign in</button>
  </div>
</form>
</body>
</html>
