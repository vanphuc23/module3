<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/1/2023
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>EDIT</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
<style>
    small {
        color: red;
    }
</style>
<body>
<div class="container">
    <h1>Sửa thông tin hộ khẩu</h1>
    <a href="/households" class="btn btn-primary" role="button">Quay lại menu</a>
    <form action="/households?action=editHousehold" method="post">
        <table class="table table-hover">
            <tr>
                <input type="hidden" value="<c:out value="${household.getHousehold_id()}"/>" name="household_id">
                <div class="form-group">
                    <label for="household_code1">Mã hộ khẩu:</label>
                    <input type="text" class="form-control is-valid" id="household_code1" name="household_code"
                           value="<c:out value="${household.getHousehold_code()}"/>" readonly>
                </div>

            </tr>
            <tr>
                <div class="form-group">
                    <label for="household_name1">Tên chủ hộ:</label>
                    <input type="text" class="form-control" id="household_name1" placeholder="Nhập tên chủ hộ"
                           value="<c:out value="${household.getHousehold_name()}"/>" name="household_name"
                           required>
                </div>
                <c:if test="${map.get('name') != null}">
                    <small><c:out value="${map.get('name')}"/></small>
                </c:if>
            </tr>
            <tr>
                <div class="form-group">
                    <label for="number1">Số lượng thành viên:</label>
                    <input type="number" class="form-control is-valid" id="number1"
                           value="<c:out value="${household.getNumber()}"/>" name="number" readonly>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <label for="date1">Ngày lập hộ khẩu:</label>
                    <input type="date" class="form-control" id="date1" placeholder="Nhập ngày lập hộ khẩu"
                           value="<c:out value="${household.getDate()}"/>" name="date" required>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <label for="address1">Địa chỉ nhà:</label>
                    <input type="text" class="form-control" id="address1" placeholder="Nhập địa chỉ nhà"
                              value="<c:out value="${household.getAddress()}"/>" name="address" required rows="3">
                </div>
            </tr>
            <tr>
                <button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Edit
                </button>
            </tr>
        </table>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
