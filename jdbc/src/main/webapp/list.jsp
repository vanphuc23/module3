<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/18/2023
  Time: 6:19 PM
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
<link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
<link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
<body>
<h1>Danh sách học sinh</h1>
<a class="btn btn-primary" role="button" href="/students?action=showCreate">Create Students</a>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table border="1pxx" class="table table-striped table-bordered" id="tableStudent" style="width:100%">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Point</th>
                    <th>Xếp loại</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="student" varStatus="loop">
                    <tr>
                        <td><c:out value="${loop.count}"/></td>
                        <td><c:out value="${student.getName()}"/></td>
                        <c:if test="${student.isGender()==true}">
                            <td>Nam</td>
                        </c:if>
                        <c:if test="${student.isGender()==false}">
                            <td>Nữ</td>
                        </c:if>
                        <td><c:out value="${student.getPoint()}"/></td>
                        <c:choose>
                            <c:when test="${student.getPoint() >= 8}">
                                <td>Giỏi</td>
                            </c:when>
                            <c:when test="${student.getPoint() >= 6}">
                                <td>Khá</td>
                            </c:when>
                            <c:otherwise>
                                <td>Trung bình</td>
                            </c:otherwise>
                        </c:choose>
                        <td>
                            <a href="/students?action=showUpdate&id=${student.getId()}">
                                <button type="submit" class="btn btn-primary">
                                    Sửa
                                </button>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"
                                    onclick="deleteById('${student.getId()}', '${student.getName()}')"
                            >
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
            <form action="/students?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa học viên</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id_delete" name="id_delete">
                    Bạn có muốn xóa học sinh tên <span class="text-danger" id="name_delete"></span> không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
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
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        });
    });
</script>
</body>
<script>
    function deleteById(id, name) {
        document.getElementById("name_delete").innerText = name;
        document.getElementById("id_delete").value = id;
    }

</script>
</html>
