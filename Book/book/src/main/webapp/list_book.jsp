<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/30/2023
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách Book</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
<body>
<h1>Danh sách Book</h1>
<table class="table table-hover">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Tác giả</th>
        <th>Mô tả</th>
        <th>Số lượng</th>
        <th></th>
    </tr>
    <c:forEach items="${list_Book}" var="book" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${book.getBook_name()}"/></td>
            <td><c:out value="${book.getAuthor()}"/></td>
            <td><c:out value="${book.getDescribe_book()}"/></td>
            <td><c:out value="${book.getQuantity_book()}"/></td>
            <td><a href="/books?action=showListBorrow&id=${book.getBook_id()}" class="btn btn-outline-primary"
                   role="button">Mượn</a></td>
        </tr>
    </c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    const params = new URLSearchParams(window.location.search);
    const ms = params.get('ms');
    if (ms == 1) {
        swal({
            title: "Mượn sách thành công",
            icon: "success",
            button: "Aww yiss!",
        });
    } else if (ms == 0) {
        swal({
            title: "Lỗi!!!",
            text: "Cuốn sách này tạm thời đã cho mượn hết, vui lòng chọn sách khác",
            icon: "warning",
            button: "Aww yiss!",
        });
    }
</script>
</html>
