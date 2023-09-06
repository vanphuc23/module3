<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/1/2023
  Time: 2:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách sổ hộ khẩu</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
<link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
<link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
<body class="container">
<h1>Danh sách hộ khẩu</h1>
<table id="tableStudent" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <th>STT</th>
    <th>Mã hộ khẩu</th>
    <th>Tên chủ hộ</th>
    <th>Số lượng thành viên</th>
    <th>Ngày lập hộ khẩu</th>
    <th>Địa chỉ nhà</th>
    <th>Chức năng</th>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="household" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${household.getHousehold_code()}"/></td>
            <td><c:out value="${household.getHousehold_name()}"/></td>
            <td><c:out value="${household.getNumber()}"/></td>
            <td><c:out value="${household.getHousehold_date()}"/></td>
            <td><c:out value="${household.getAddress()}"/></td>
            <td><a class="btn btn-primary" role="button"
                   href="/households?action=showEdit&id=${household.getHousehold_id()}">Sửa</a>
                <a href="/households?action=showMember&id=${household.getHousehold_id()}&ms=2" class="btn btn-primary"
                   role="button">Xem thành viên</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script src=" https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 1
        });
    });
</script>
<script>
    const params = new URLSearchParams(window.location.search);
    const ms = params.get('ms');
    if (ms == 1) {
        swal({
            title: "Good job!",
            text: "You clicked the button!",
            icon: "success",
            button: "Aww yiss!",
        });
    }
    let member = 'Danh sách thành viên:\n\n' +
        '<c:forEach items="${memberList}" var="memberList">' +
        '${memberList.getName()}\n' +
        '</c:forEach>';

    if (ms == 2) {
        swal(member);
    }
</script>
</html>
