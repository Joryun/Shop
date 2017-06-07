<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>

<script type="text/javascript">
  $(function(){
	  //点击更换验证码
	   $("#captchaImage").click(function(){		   
	   		$("#captchaImage").attr("src","${pageContext.request.contextPath}/getCheckCodeImage?date="+new Date().getTime());		   
	   });
   });
  $(function(){
	  $("#username").focus(function(){
		  $("#username").val("");
	  });
  });
</script>

<title>会员登录</title>

<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="container header">
		<div class="span5">

		</div>
		<div class="span9">
			<div class="headerAd">

			</div>
		</div>

		<%@ include file="menu.jsp"%>

	</div>

	<div class="container login">
		<div class="span12">
			<div class="ad">

			</div>
		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN
					</div>

					<form:form id="loginForm" modelAttribute="user" commandName="user"
						action="${ pageContext.request.contextPath }/login"
						method="post">
						<table>
							<tbody>
								<tr>
									<th>用户名:</th>
									<td><form:input path="username" name="username" id="username"
										class="text" maxlength="20" />
										<%--
										<c:if test="${notUser != null }">
										    <font color="red">没有此用户</font>
										</c:if>
										--%>
										<c:if test="${notActive != null }">
										    <font color="red">此用户还没有激活</font>
										</c:if>
									</td>
								</tr>

								<tr>
									<th>密&nbsp;&nbsp;码:</th>
									<td><form:password id="password" path="password"
										class="text" maxlength="20"/>
										<c:if test="${notPassword != null}">
										    <font color="red">密码错误</font>
										</c:if>
									</td>
								</tr>

								<tr>
									<th>
										验证码:
									</th>
									<td>
										<span class="fieldSet">
											<input type="text" id="captcha" name="checkcode" class="text captcha" maxlength="4"/>
											<img id="captchaImage" class="captchaImage" 
											src="${pageContext.request.contextPath}/getCheckCodeImage" title="点击更换验证码"/>
										</span>
										<c:if test="${errorCheckCode != null}">
										    <font color="red">验证码出错</font>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td>
                                        <label> <input type="checkbox"
											id="isRememberUsername" name="isRememberUsername"
											value="true"/>记住用户名 </label>
                                        <label> &nbsp;&nbsp;<a>找回密码</a>
									    </label>
                                    </td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="登 录"/></td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>
                                                <a href="${pageContext.request.contextPath }/userRegister">还没有注册账号？立即注册</a>
                                            </dt>
										</dl>
									</td>
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
</body>
</html>