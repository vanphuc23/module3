<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 7:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách User</title>
</head>
<style>
    table, tr, td, th {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
<link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />
<link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />
<body>
<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"/>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a class="btn btn-outline-light me-2" role="button" href="/users?action=showCreate" style="margin-right: 10px">Create new User</a></li>
                <li><a class="btn btn-outline-light me-2" role="button" href="/users?action=showArrange">Arrange Table</a></li>
<%--                <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>--%>
<%--                <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>--%>
<%--                <li><a href="#" class="nav-link px-2 text-white">About</a></li>--%>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" method="post" action="/users?action=searchList">
                <table style="border: none">
                    <tr>
                        <td><input type="search" class="form-control form-control-dark" placeholder="Search country"
                                   aria-label="Search"
                                   name="countrySearch">
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><button type="submit" class="btn btn-outline-light me-2">Search</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</header>
<h1 style="text-align: center">Danh sách User</h1>
<%--<div style="margin-bottom: 10px; display: flex; justify-content: center">--%>
<%--    <a class="border border-5, btn" role="button" href="/users?action=showCreate" style="margin-right: 10px">Create new User</a>--%>
<%--    <a class="btn btn-primary" role="button" href="/users?action=showArrange">Arrange Table</a>--%>
<%--</div>--%>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
<table class="table table-striped table-hover" id="tableStudent" style="width:100%">
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th></th>
        <th></th>
    </thead>
    <tbody>
    </tr>
    <c:forEach items="${list}" var="user" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${user.getName()}"/></td>
            <td><c:out value="${user.getEmail()}"/></td>
            <td><c:out value="${user.getCountry()}"/></td>
            <td><a class="btn btn-primary" role="button" href="/users?action=showUpdate&id=${user.getId()}">Sửa</a></td>
            <td>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="deleteUser('${user.getId()}','${user.getName()}')">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/users?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id_delete" id="id_delete">
                    Bạn muốn xóa người có tên là: <span class="text-danger" id="name_delete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableStudent').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 30
        } );
    } );
</script>
</body>
<script>
    function deleteUser(id, name) {
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerText = name;
    }
</script>
</html>
