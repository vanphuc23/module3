<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/28/2023
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        small{
            color: red;
        }
    </style>
</head>
<body>
<h1>Create new Customer</h1>
<fieldset>
    <legend>Create</legend>
    <form action="/customer?action=CreateCustomer" method="post">
        <table>
            <tr>
                <td>
                    <lable>Ma khach hang:</lable>
                </td>
                <td><input id="codeCustomer"></td>
                <td><small id="codeCustomerError"></small></td>
            </tr>
            <tr>
                <td>
                    <lable>Loại Khách:</lable>
                </td>
                <td><input type="number" name="customer_type_id"></td>
            </tr>
            <tr>
                <td>
                    <lable>Họ tên Customer:</lable>
                </td>
                <td><input type="text" name="customer_name" value="${cus.customer_name}"></td>
            </tr>
            <tr>
                <td>
                    <lable>Ngày sinh:</lable>
                </td>
                <td><input type="date" name="customer_birthday"></td>
            </tr>
            <tr>
                <td>
                    <lable>Giới tính:</lable>
                </td>
                <td><input type="radio" name="customer_gender" value="male">Nam
                    <input type="radio" name="customer_gender" value="female">Nữ
                </td>
            </tr>
            <tr>
                <td>
                    <lable>Số CMND:</lable>
                </td>
                <td><input type="text" name="customer_id_card"></td>
            </tr>
            <tr>
                <td>
                    <lable>Số điện thoại:</lable>
                </td>
                <td><input type="text" name="customer_phone" id="phoneCustomer"></td>
                <c:if test="${phoneExist}">
                    <td><small>phone exist</small></td>
                </c:if>
            </tr>
            <tr>
                <td>
                    <lable>Email:</lable>
                </td>
                <td><input type="text" name="customer_email"></td>
            </tr>
            <tr>
                <td>
                    <lable>Địa chỉ:</lable>
                </td>
                <td><input type="text" name="customer_address"></td>
            </tr>
            <tr>
                <td></td>
                <td><input onclick="return validCustomer()" type="submit" value="Create"></td>
            </tr>
        </table>
    </form>
</fieldset>


<script>
    function validCustomer() {
        if (!/KH-\d{4}/.test(codeCustomer.value)) {
            codeCustomerError.textContent = "invaild code";
            return false;
        }


        if (!/090\d{7}/.test(phoneCustomer.value)) {
            alert("invaild format phone");
            return false;
        }



        return true;
    }
</script>
</body>
</html>
