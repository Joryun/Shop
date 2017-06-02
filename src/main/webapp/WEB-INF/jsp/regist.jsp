<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>会员注册</title>
    <link href="${pageContext.request.contextPath}/css/common.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/register.css"
          rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>

    <style>
        .error {
            color: red
        }
    </style>

    <script>
        function checkForm() {
            // 校验用户名:
            // 获得用户名文本框的值:
            var username = $("#username").val();
            if (username == null || username == '') {
                alert("用户名不能为空!");
                return false;
            }
            //首子符为大写
            if ((username.charAt(0).charCodeAt(0) < 65) || (username.charAt(0).charCodeAt(0) > 90)) {
                alert("输入的首字符必须是大写字母");
                return false;
            }
            // 校验密码:
            // 获得密码框的值:
            var password = $("#password").val();
            if (password == null || password == '') {
                alert("密码不能为空!");
                return false;
            }
            // 校验确认密码:
            var repassword = $("#repassword").val();
            if (repassword != password) {
                alert("两次密码输入不一致!");
                return false;
            }
            //校验收货地址
            //获的地址框的值:
            var address = $("#address").val();
            if (address == null || address == '') {
                alert("地址不能为空!");
                return false;
            }
        }

        function checkUsername() {
            $.post(
                "checkUser/" + $("#username").val(),
                {},
                function (data) {
                    if (data == 1) {
                        document.getElementById("span1").innerHTML = "<font color='red'>用户名已经存在</font>";
                        $("#username").val("");
                        $("#username").focus();
                        $(".submit").unbind("click",
                            function (event) {

                            });
                    } else {
                        document.getElementById("span1").innerHTML = "<font color='green'>用户名不存在</font>";
                    }
                });
        }
    </script>

</head>

<body>
<div class="container header">
    <div class="span5">

    </div>

    <div class="span9">
        <div class="headerAd">

        </div>
    </div>
    <%@ include file="menu.jsp" %>
</div>

<div class="container register">
    <div class="span24">
        <div class="wrap">
            <div class="main clearfix">
                <div class="title">
                    <strong>会员注册</strong>USER REGISTER
                </div>

                <form:form commandName="user"
                           action="${ pageContext.request.contextPath }/register"
                           method="post" modelAttribute="user"
                           onsubmit="return checkForm();">
                    <table>
                        <tbody>
                        <tr>
                            <th><span class="requiredField">*</span>用户名:</th>
                            <td><form:input path="username" id="username"
                                            class="text" maxlength="20" onblur="checkUsername()"/> <span
                                    id="span1" style="padding-left: 10px;"></span></td>
                        </tr>
                        <tr>
                            <th><span class="requiredField">*</span>密&nbsp;&nbsp;码:</th>
                            <td><form:password path="password" id="password" name="password"
                                               class="text" maxlength="20"/></td>
                        </tr>
                        <tr>
                            <th><span class="requiredField">*</span>确认密码:</th>
                            <td><input id="repassword" type="password"
                                       name="repassword" class="text" maxlength="20"/></td>
                        </tr>
                        <tr>
                            <th><span class="requiredField">*</span>E-mail:</th>
                            <td><form:input path="email" id="email"
                                            class="text" maxlength="20"/>
                                <form:errors path="email" cssClass="error"/>
                            </td>
                        </tr>
                        <tr>
                            <th>姓名:</th>
                            <td><form:input path="name" class="text"
                                            maxlength="200"/></td>
                        </tr>
                        <tr>
                            <th><span class="requiredField">*</span>年龄:</th>
                            <td><form:input path="age" id="age" class="text" type="number" min="1"
                                            maxlength="3"/></td>
                        </tr>
                        <tr>
                            <th>电话:</th>
                            <td><form:input path="phone" class="text"/></td>
                        </tr>
                        <tr>
                            <th><span class="requiredField">*</span>地址:</th>
                            <td><form:input path="addr" class="text" id="address"
                                            maxlength="200"/></td>
                        </tr>
                        <tr>
                            <th><span class="requiredField">*</span>验证码:</th>
                            <td><span class="fieldSet"> <input type="text"
                                                               id="checkcode" name="checkcode" class="text captcha"
                                                               maxlength="4"/> <img id="checkImg" class="captchaImage"
                                                                                    src="${pageContext.request.contextPath}/getCheckCodeImage"
                                                                                    onclick="changeImg()"
                                                                                    title="点击更换验证码"/></span>
                                <c:if test="${errorCheckCode !=null}">
                                    <font color="red">验证码出错</font>
                                </c:if>
                            </td>
                        </tr>

                        <tr>
                            <th>&nbsp;</th>
                            <td><input type="submit" class="submit" value="确认注册"/></td>
                        </tr>

                        </tbody>
                    </table>

                </form:form>
            </div>
        </div>
    </div>
</div>

<div class="container footer">

    <%--<div class="span24">
        <div class="copyright">Copyright © 2016-2016  版权所有</div>
    </div>--%>
</div>
<div id="_my97DP"
     style="position: absolute; top: -1970px; left: -1970px;">
</div>

<script type="text/javascript">
    function changeImg() {
        var img1 = document.getElementById("checkImg");
        img1.src = "${pageContext.request.contextPath}/getCheckCodeImage"
            + "?date=" + new Date();
    }
</script>

</body>
</html>
