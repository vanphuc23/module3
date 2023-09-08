<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/5/2023
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Mượn sách</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
<style>
    small {
        color: red;
    }

    .btnForm {
        display: flex;
    }

    .a {
        flex: 5;
        display: flex;
        justify-content: flex-end;
        margin: 10px;
    }

    .b {
        flex: 5;
        display: flex;
        margin: 10px;
    }
</style>
<body>
<div class="container">
    <nav class="navbar navbar-dark bg-dark" style="margin-bottom: 10px">
        <div class="container-fluid">
            <a class="navbar-brand" href="/books">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>
    <h1 style="margin-bottom: 15px; text-align: center">Mượn sách</h1>
    <form action="/books?action=borrowBook" method="post">
        <table class="table table-hover">
            <tr>
                <input type="hidden" name="book_id" value="${book.getBook_id()}">
                <input type="hidden" name="quantity_book" value="${book.getQuantity_book()}">
                <div class="form-group">
                    <label for="book_card_id">Mã mượn sách:</label>
                    <input type="text" class="form-control" id="book_card_id" name="book_card_id"
                           placeholder="Nhập mã mượn sách" value="${bookCard.getBook_card_id()}" required>
                </div>
                <div>
                    <c:if test="${map.get('book_card_id') != null}">
                        <small>${map.get('book_card_id')}</small>
                    </c:if>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <label for="book_name">Tên sách:</label>
                    <input type="text" class="form-control" id="book_name" name="book_name" placeholder="Nhập tên sách"
                           value="${book.book_name}" readonly>
                </div>
            </tr>
            <tr>
                <label for="exampleFormControlSelect1">Tên học sinh:</label>
                <select class="form-control" id="exampleFormControlSelect1" name="student_name">
                        <c:forEach items="${studentList}" var="studentList">
                            <option value="${studentList.getStudent_id()}">${studentList.getStudent_name()}</option>
                        </c:forEach>
                </select>
            </tr>
            <tr>
                <div class="form-group">
                    <label for="startday">Ngày mượn sách:</label>
                    <input type="date" class="form-control" id="startday" placeholder="Nhập ngày mượn sách"
                           value="${localDate}" name="startday" readonly>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <label for="endday">Ngày trả sách:</label>
                    <input type="date" class="form-control" id="endday" placeholder="Nhập ngày trả sách" name="endday"
                           value="${bookCard.getEndDate()}" required>
                </div>
                <div>
                    <c:if test="${map.get('date') != null}">
                        <small>${map.get('date')}</small>
                    </c:if>
                </div>
            </tr>
            <tr>
                <div class="btnForm">
                    <div class="a">
                        <button type="submit" class="btn btn-outline-primary">Mượn</button>
                    </div>

                    <div class="b">
                        <a href="/books" class="btn btn-outline-primary" role="button">Hủy</a>
                    </div>
                </div>
            </tr>
        </table>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
