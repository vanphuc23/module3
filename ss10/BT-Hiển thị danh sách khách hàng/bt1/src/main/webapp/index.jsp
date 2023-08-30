<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hiển thị danh sách khách hàng</title>
</head>
<style>

    table,tr,td,th {
        border: 1px solid black;
        border-collapse: collapse;
    }

    img {
        height: 100px;
        width: 100px;
    }

    tr,th,td {
        text-align: center;
        width: 100px;
        height: 100px;
    }
</style>
<body>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${list}" var="client" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${client.name}"/></td>
            <td><c:out value="${client.birth}"/></td>
            <td><c:out value="${client.address}"/></td>
            <td><img src="${client.picture}" alt=""></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>