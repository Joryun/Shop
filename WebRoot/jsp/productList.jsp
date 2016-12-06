<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>网上商城</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="http://localhost:8080/mango/"> <img
					src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.jpg"
					alt="理央silence" />
				</a>
			</div>
		</div>
		<div class="span9">
			<div class="headerAd">
				<img src="${pageContext.request.contextPath}/image/header.jpg"
					width="320" height="50" alt="正品保障" title="正品保障" />
			</div>
		</div>
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container productList">
		<div class="span6">
			<div class="hotProductCategory">
				<c:forEach var="c" items="${sessionScope.cList }">
					<dl>
						<dt>
							<a
								href="${pageContext.request.contextPath }/findByCid/<c:out value="${c.cid}"/>/1"><c:out
									value="${c.cname}" /></a>
						</dt>
						<c:forEach var="cs" items="${c.categorySeconds}">
							<dd>
								<a
									href="${ pageContext.request.contextPath }/findByCsid/<c:out value="${cs.csid}/1"/>"><c:out
										value="${cs.csname}" /></a>
							</dd>
						</c:forEach>
					</dl>
				</c:forEach>
			</div>
		</div>
		<div class="span18 last">
			<form id="productForm"
				action="${pageContext.request.contextPath}/image/蔬菜 - Powered By Mango Team.htm"
				method="get">
				<div id="result" class="result table clearfix">
					<ul>
						<c:forEach var="p" items="${products}">
							<li><a
								href="${ pageContext.request.contextPath }/findByPid/<c:out value="${p.pid}"/>">
									<img
									src="${pageContext.request.contextPath}/<c:out value="${p.image}"/>"
									width="170" height="170" style="display: inline-block;" /> <span
									style='color: green'> <c:out value="${p.pname}" />
								</span> <span class="price"> 商城价： ￥<c:out
											value="${p.shop_price}" />
								</span>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="pagination">
				    <!-- 根据一级分类的cid是不是为空来显示上一页下一页的状况 -->
					<c:if test="${cid != null }">
						<span>第 <c:out value="${page}" />/<c:out value="${count}" />页
						</span>
						<!-- 首页 -->
						<span><a class="firstPage"
							href="${pageContext.request.contextPath}/findByCid/${cid}/1"></a></span>
						<c:if test="${page != 1}">
							<span><a class="previousPage"
								href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${page-1}"/>"></a></span>
						</c:if>
						<c:forEach var="i" begin="1" end="${count }">
							<span>
							   <!-- 如果是当前页则不能够点击 -->
							   <c:if test="${i == page }">
							    	<span class="currentPage">${page }</span>
							   </c:if>
							   <c:if test="${i != page }">
								 <a href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${i}"/>">
									<c:out value="${i}" /></a>
								</c:if>
							</span>
						</c:forEach>
						<!-- 下一页 -->
						<c:if test="${page !=count }">
							<span><a class="nextPage"
								href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${page+1}"/>"></a></span>
						</c:if>
						<!-- 尾页 -->
						<a class="lastPage"
							href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${count}"/>"></a>
					</c:if>
					<!-- 二级分类的上一页和下一页 -->
					<c:if test="${csid != null }">
						<span>第 <c:out value="${page}" />/<c:out value="${count}" />页
						</span>
						<!-- 首页 -->
						<span><a class="firstPage"
							href="${pageContext.request.contextPath}/findByCsid/${csid}/1"></a></span>
						<c:if test="${page != 1}">
							<span><a class="previousPage"
								href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${page-1}"/>"></a></span>
						</c:if>
						<c:forEach var="i" begin="1" end="${count }">
							<span>
							   <!-- 如果是当前页则不能够点击 -->
							   <c:if test="${i == page }">
							    	<span class="currentPage">${page }</span>
							   </c:if>
							   <c:if test="${i != page }">
								 <a href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${i}"/>">
									<c:out value="${i}" /></a>
								</c:if>
							</span>
						</c:forEach>
						<!-- 下一页 -->
						<c:if test="${page !=count }">
							<span><a class="nextPage"
								href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${page+1}"/>"></a></span>
						</c:if>
						<!-- 尾页 -->
						<a class="lastPage"
							href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${count}"/>"></a>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<%--<div class="container footer">
		<div class="span24">
			<div class="footerAd">
				<img src="${pageContext.request.contextPath}/image/footer.jpg"
					width="950" height="52" alt="我们的优势" title="我们的优势" />
			</div>
		</div>
		<div class="span24">
			<ul class="bottomNav">
				<li><a>关于我们</a> |</li>
				<li><a>联系我们</a> |</li>
				<li><a>诚聘英才</a> |</li>
				<li><a>法律声明</a> |</li>
				<li><a>友情链接</a> |</li>
				<li><a target="_blank">支付方式</a> |</li>
				<li><a target="_blank">配送方式</a> |</li>
				<li><a>官网</a> |</li>
				<li><a>论坛</a></li>
			</ul>
		</div>
		<div class="span24">
				<div class="copyright">Copyright © 2016-2016 wl 版权所有</div>
		</div>
	</div>--%>
</body>
</html>