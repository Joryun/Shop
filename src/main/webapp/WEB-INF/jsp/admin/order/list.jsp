<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript">
			function showDetail(oid){
				var but = document.getElementById("but"+oid);
				var div1 = document.getElementById("div"+oid);
				if(but.value == "订单详情"){
					// 1.创建异步对象
					var xhr = createXmlHttp();
					// 2.设置监听
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4){
							if(xhr.status == 200){
								div1.innerHTML = xhr.responseText;
							}
						}
					}
					// 3.打开连接
					xhr.open("GET","${pageContext.request.contextPath}/findOrderItem/"+oid+"/"+new Date().getTime(),true);
					// 4.发送
					xhr.send(null);
					but.value = "关闭";
				}else{
					div1.innerHTML = "";
					but.value="订单详情";
				}
				
			}
			function createXmlHttp(){
				   var xmlHttp;
				   try{ // Firefox, Opera 8.0+, Safari
				        xmlHttp=new XMLHttpRequest();
				    }
				    catch (e){
					   try{// Internet Explorer
					         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
					      }
					    catch (e){
					      try{
					         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
					      }
					      catch (e){}
					      }
				    }

					return xmlHttp;
				 }
		</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>订单列表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">订单编号</td>
								<td align="center" width="10%">订单时间</td>
								<td align="center" width="10%">订单金额</td>
								<td align="center" width="10%">收货人</td>
								<td align="center" width="10%">订单状态</td>
								<td align="center" width="10%">订单详情</td>
								<td align="center" width="40%">删除</td>"
							</tr>
							<c:forEach var="o" items="${orders}">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:out value="${o.oid }" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:out value="${o.ordertime }" /></td>										
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:out value="${o.total }" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:out value="${o.name }" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><c:if test="${o.state==1}">
													未付款
												</c:if> <c:if test="${o.state==2}">
											<a
												href="${ pageContext.request.contextPath }/updateStateOrder/<c:out value="${o.oid }"/>/<c:out value="${page}"/>">
												<font color="blue">发货</font>
											</a>
										</c:if> <c:if test="${o.state==3}">
													等待确认收货
												</c:if> <c:if test="${o.state==4}">
													订单完成
												</c:if>
									<td align="center" style="HEIGHT: 22px">
									<input type="button" value="订单详情" id="but<c:out value="${o.oid }"/>"
										onclick="showDetail(<c:out value="${o.oid }"/>)" />
										<div id="div<c:out value="${o.oid }"/>"></div></td>
										
									<td align="center" style="HEIGHT: 22px"><a id="delete"
										href="${ pageContext.request.contextPath }/deleteOrder/<c:out value="${o.oid}"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td colspan="7">第<c:out value="${page }" />/<c:out
							value="${count }" />页 <c:if test="${page != 1 }">
							<a href="${ pageContext.request.contextPath }/listOrder/1">首页</a>|
								<a
								href="${ pageContext.request.contextPath }/listOrder/<c:out value="${page - 1 }"/>">上一页</a>|
							</c:if> <c:if test="${page != count }">
							<a
								href="${ pageContext.request.contextPath }/listOrder/<c:out value="${page + 1 }"/>">下一页</a>|
								<a
								href="${ pageContext.request.contextPath }/listOrder/<c:out value="${count }"/>">尾页</a>|
							</c:if>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

