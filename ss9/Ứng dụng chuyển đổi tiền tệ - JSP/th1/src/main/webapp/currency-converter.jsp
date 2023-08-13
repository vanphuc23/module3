<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/11/2023
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ứng dụng chuyển đổi tiền tệ - JSP</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="index.jsp" method="post">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type="submit" id="submit" value="Converter"/>
</form>
</body>
</html>
