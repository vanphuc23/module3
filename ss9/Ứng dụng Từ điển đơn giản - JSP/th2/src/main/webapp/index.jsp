<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/14/2023
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/dictionary" method="post">
    <h1>Vietnamese Dictionary</h1>
    <input type="text" name="search" placeholder="Enter your word:">
    <input type="submit" value="Search">
</form>
Result: ${list};
</body>
</html>
