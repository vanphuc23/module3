<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/8/2023
  Time: 7:43 PM
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
<h1>Edit a product</h1>
<form action="/products?action=editProduct" method="post">
    <table>
        <tr>
            <input type="hidden" value="${product.getId_product()}" name="id_product">
        </tr>
        <tr>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${product.getName()}"
                       placeholder="Nhập name">
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="${product.getPrice()}"
                       placeholder="Nhập price">
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <label for="number">Quantity</label>
                <input type="number" class="form-control" id="number" name="number" value="${product.getNumber()}"
                       placeholder="Nhập quantity">
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <label for="color">Color</label>
                <input type="text" class="form-control" id="color" name="color" value="${product.getColor()}"
                       placeholder="Nhập color">
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <label for="mota">Description</label>
                <input type="text" class="form-control" id="mota" name="mota" value="${product.getMota()}"
                       placeholder="Nhập description">
            </div>
        </tr>
        <tr>
            <label for="exampleFormControlSelect1">Category</label>
            <select class="form-control" id="exampleFormControlSelect1" name="category_id">
                <option value="${category.getId()}">${category.getType()}</option>
                <c:forEach items="${categoryList}" var="categoryList">
                    <option value="${categoryList.getId()}">${categoryList.getType()}</option>
                </c:forEach>
            </select>
        </tr>
        <tr>
            <div style="margin-top: 15px">
                <button type="submit" class="btn btn-outline-primary">Create</button>
                |
                <a href="/products" class="btn btn-outline-primary" role="button">Back</a>
            </div>
        </tr>
    </table>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
