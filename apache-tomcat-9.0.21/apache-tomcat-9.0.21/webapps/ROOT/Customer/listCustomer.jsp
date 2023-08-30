<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    .nav-name {
        position: absolute;
        right: 30px;
    }

    .nav-name p {
        padding: 30px;
    }

    .menu-item {
        float: left;
        width: 15%;
        height: 457px;
        border-right: 1px solid black;
    }

    .list-item {
        list-style: none;
        padding-top: 10px;
        padding-left: 20px;
    }

    .list-item li {
        margin-bottom: 10px;
    }

    .list-item li a {
        text-decoration: none;
        color: black;
    }

    .menu-table {
        float: left;
        width: 85%;
        height: 457px;
    }

    footer {
        border-bottom: 1px solid black;
        border-top: 1px solid black ;
    }

    footer p {
        text-align: center;
        padding: 20px 0;
        margin: 0;
    }
</style>
<body>
<nav class="navbar navbar-light bg-light">
    <div class="container">
        <!--        <a class="navbar-brand" href="#">-->
        <table>
            <tr>
                <td>
                    <a class="navbar-brand" href="#">
                        <img src="https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg"
                             alt="" width="15%" height="15%">
                    </a>
                </td>
                <td class="nav-name">
                    <a class="navbar-brand" href="#">
                        <p>Nguyễn Văn A</p>
                    </a>
                </td>
            </tr>
        </table>
        <!--        </a>-->
    </div>
</nav>

<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"/>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/customer" class="nav-link px-2 text-secondary">Home</a></li>
                <li><a href="#" class="nav-link px-2 text-white">Employee</a></li>
                <li><a href="/customer?action=CustomerList" class="nav-link px-2 text-white">Customer</a></li>
                <li><a href="#" class="nav-link px-2 text-white">Service</a></li>
                <li><a href="#" class="nav-link px-2 text-white">Contract</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
            </form>

            <div class="text-end">
                <button type="button" class="btn btn-outline-light me-2">Search</button>
            </div>
        </div>
    </div>
</header>
<div>
    <section class="menu-item">
        <ul class="list-item">
            <li><a href="">Item One</a></li>
            <li><a href="">Item Two</a></li>
            <li><a href="">Item Three</a></li>
        </ul>
    </section>
    <aside class="menu-table">
        <h1 style="text-align: center">Danh sách Customer</h1>
        <a href="/customer?action=CreateListCustomer" class="btn btn-primary" role="button">Create new Customer</a>
        <table class="table table-striped table-bordered">
            <tr>
                <th>STT</th>
                <th>Loại khách</th>
                <th>Họ tên Customer</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Số CMND</th>
                <th>Số Điện Thoại</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach items="${customerList}" var="customer" varStatus="loop">
                <tr>
                    <td><c:out value="${loop.count}"/></td>
                    <td><c:out value="${customer.getCustomer_type_id()}" /></td>
                    <td><c:out value="${customer.getCustomer_name()}" /></td>
                    <td><c:out value="${customer.getCustomer_birthday()}" /></td>
                    <td><c:out value="${customer.isCustomer_gender()}" /></td>
                    <td><c:out value="${customer.getCustomer_id_card()}" /></td>
                    <td><c:out value="${customer.getCustomer_phone()}" /></td>
                    <td><c:out value="${customer.getCustomer_email()}" /></td>
                    <td><c:out value="${customer.getCustomer_address()}" /></td>
                    <td><a href="">Sửa</a></td>
                    <td><a href="">Xóa</a></td>
                </tr>
            </c:forEach>
        </table>
    </aside>
</div>
<footer style="clear: both">
    <p>Footer...</p>
</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>