<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script>
		$(document).ready(function(){
		var minventory=$("#minventory").val();
		var inventory=$("#inventory").val();
		if(eval(inventory)<eval(minventory)){
		alert("库存量小于"+minventory);
		}
		});
		
		</script>　
	</HEAD>
	<body >
		<!--  -->
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/updateProduct" method="post" enctype="multipart/form-data">
			&nbsp;
			<input type="hidden" name="pid" value="${product.pid}" />
			<input type="hidden" name="image" value="${product.image}" />
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑商品</STRONG>
						</strong>	
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="pname" value="<c:out value="${product.pname }"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						是否热门：
					</td>
					<td class="ta_01" bgColor="#ffffff">					
						<select name="is_hot">
							<option value="1" <c:if test="${product.is_hot ==1}">selected</c:if>>是</option>
							<option value="0" <c:if test="${product.is_hot ==0}">selected</c:if>>否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						市场价格：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="market_price" value="<c:out value="${product.market_price }"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商城价格：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="shop_price" value="<c:out value="${product.shop_price }"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="1">
						<c:if test="${product.image!=null&&product.image!=''}">
          					<img src="${ pageContext.request.contextPath }/${product.image}" width="60" height="60"/>
        				</c:if>
						<input type="file" name="upload"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						库存量：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="inventory" id="inventory" value="<c:out value="${product.inventory }"/>" id="userAction_save_do_logonName" class="bg"/>
					<input type="hidden" name="minventory" id="minventory" value="<c:out value="${admin.minventory}"/>"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						所属的二级分类：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<select name="csid">
							<c:forEach var="cs" items="${categorySeconds }">
								<option value="<c:out value="${cs.csid }"/>"  
								 	<c:if test="${product.categorySecond.csid ==  cs.csid}">selected</c:if>/>
								 	<c:out value="${cs.csname }"/>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="pdesc" rows="5" cols="30"><c:out value="${product.pdesc }"/></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>