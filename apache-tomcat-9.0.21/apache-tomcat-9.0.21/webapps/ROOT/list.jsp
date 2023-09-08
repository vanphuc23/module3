<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/8/2023
  Time: 6:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
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
                <li><a href="/products?action=showCreate" class="nav-link px-2 text-white">Add new product</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="/products?action=searchList" method="post"
                  style="display: flex">
                <input type="search" class="form-control form-control-dark" placeholder="Search..."
                       aria-label="Search" style="margin-right: 15px" name="nameSearch">
                <button type="submit" class="btn btn-outline-primary" style="margin-right: 5px">Search</button>
                <a href="/products" class="btn btn-outline-primary" role="button">Cancel</a>
            </form>

        </div>
    </div>
</header>

<table class="table table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="product" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${product.getName()}"/></td>
            <td><c:out value="${product.getPrice()}"/></td>
            <td><c:out value="${product.getNumber()}"/></td>
            <td><c:out value="${product.getColor()}"/></td>
            <td><c:out value="${product.getCategory().getType()}"/></td>
            <td>
                <a href="/products?action=showEdit&id=${product.getId_product()}&category_id=${product.getCategory().getId()}"
                   class="btn btn-outline-primary"
                   role="button">EDIT</a> |
                <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal"
                        data-bs-target="#exampleModal"
                        onclick="Click('${product.getId_product()}', '${product.getName()}')">
                    DELETE
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/products?action=deleteProduct" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Model title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id_product" id="id_product">
                    Bạn muốn xóa sản phẩm <span id="name_product" style="color: red"></span> không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>
    function Click(id, name) {
        document.getElementById("id_product").value = id;
        document.getElementById("name_product").innerText = name;
    }
</script>
</html>
