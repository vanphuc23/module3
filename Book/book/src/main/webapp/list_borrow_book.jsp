<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/7/2023
  Time: 2:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thống kê sách đang mượn</title>
</head>
<link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />
<link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
<style>
    span {
        color: red;
    }
</style>
<body>
<h1 style="text-align: center">Thống kê sách đang cho mượn</h1>
<div style="text-align: center">
    <a href="/books" class="btn btn-outline-primary" role="button">Quay lại menu</a>
</div>
<form action="/books?action=searchBookorStudent" method="post">
    <div class="container" style="display: flex; justify-content: center">
        <div style="flex: 3">
            <br>
            <label for="book_name">Tên sách:</label>
            <input type="text" id="book_name" name="search_book_name" value="${search_book_name}">
        </div>
        <div style="flex: 3">
            <br>
            <label for="student_name">Tên học sinh:</label>
            <input type="text" id="student_name" name="search_student_name" value="${search_student_name}">
        </div>
        <div style="flex: 3">
            <br>
            <button type="submit" class="btn btn-outline-primary" style="margin-right: 20px">Tìm kiếm</button>
            <a href="/books?action=showListBorrowBook" class="btn btn-outline-primary" role="button">Hủy</a>
        </div>
    </div>
</form>
<table id="tableStudent" class="table table-striped table-hover" style="width:100%">
    <thead>
    <tr>
        <th>Mã mượn sách</th>
        <th>Tên sách</th>
        <th>Tác giả</th>
        <th>Tên học sinh</th>
        <th>Lớp</th>
        <th>Ngày mượn</th>
        <th>Ngày trả</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="listBookCard">
        <tr>
            <td><c:out value="${listBookCard.getBook_card_id()}"/></td>
            <td><c:out value="${listBookCard.getBook().getBook_name()}"/></td>
            <td><c:out value="${listBookCard.getBook().getAuthor()}"/></td>
            <td><c:out value="${listBookCard.getStudent().getStudent_name()}"/></td>
            <td><c:out value="${listBookCard.getStudent().getStudent_class()}"/></td>
            <td><c:out value="${listBookCard.getStart()}"/></td>
            <td><c:out value="${listBookCard.getEnd()}"/></td>
            <c:if test="${listBookCard.isStatus() == true}">
                <td>
                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="Click('${listBookCard.getStudent().getStudent_name()}', '${listBookCard.getBook().getBook_name()}', '${listBookCard.getBook().getQuantity_book()}','${listBookCard.getId()}', '${listBookCard.getBook().getBook_id()}')">
                        Trả sách
                    </button>
                </td>
            </c:if>
            <c:if test="${listBookCard.isStatus() == false}">
                <td>Đã trả</td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/books?action=giveBookBack" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Trả sách</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id" name="id">
                    <input type="hidden" id="book_id" name="book_id">
                    <input type="hidden" id="quantity_book" name="quantity_book">
                    <div style="text-align: center">
                        <p>Học sinh <span id="student"></span> thực hiện trả sách <span id="book"></span></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Trả sách</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableStudent').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 15
        } );
    } );
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>
    function Click(student_name, book_name, quantity_book, id, book_id) {
        document.getElementById("student").innerText = student_name;
        document.getElementById("book").innerText = book_name;
        document.getElementById("quantity_book").value = quantity_book;
        document.getElementById("id").value = id;
        document.getElementById("book_id").value = book_id;
    }
</script>
</html>
