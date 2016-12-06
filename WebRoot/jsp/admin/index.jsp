<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>网上商城管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${pageContext.request.contextPath }/css/general.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/main.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
body {
	color: white;
}
</style>
</head>
<body style="background: #278296">
	<form method="post"
		action="${pageContext.request.contextPath }/adminLogin"
		target="_parent" >
		<table cellspacing="0" cellpadding="0" style="margin-top: 100px"
			align="center">
			<tr>
				<td style="padding-left: 50px">
					<table>
						<tr>
							<td>管理员姓名：</td>
							<td><input type="text" name="username" /></td>
						</tr>
						<tr>
							<td>管理员密码：</td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" value="进入管理中心" class="button" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<input type="hidden" name="act" value="signin" />
	</form>
</body>