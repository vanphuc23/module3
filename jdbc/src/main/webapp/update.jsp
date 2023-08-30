<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/19/2023
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<a href="/students">Quay lại</a>
<form action="/students?action=update" method="post">
    <fieldset>
        <legend>Update a student</legend>
        <table>
            <c:if test="${student != null}">
                <input type="hidden" name="id" value="<c:out value="${student.getId()}" />">
            </c:if>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" value="<c:out value="${student.getName()}"/>"></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <c:if test="${student.isGender() == true}">
                        <td><input type="radio" name="gender" value="male" checked="checked">Nam
                            <input type="radio" name="gender" value="female">Nữ</td>
                    </c:if>
                    <c:if test="${student.isGender() == false}">
                        <td><input type="radio" name="gender" value="male">Nam
                            <input type="radio" name="gender" value="female" checked="checked">Nữ</td>
                    </c:if>
                </tr>
                <tr>
                    <td>Point:</td>
                    <td><input type="number" name="point" value="<c:out value="${student.getPoint()}" />"></td>
                </tr>
            <tr>
                <td></td>
                <td><button>Edit</button></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
