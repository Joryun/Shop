<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table width="100%">
	<c:forEach items="${orderItem}" var="i">
		<tr>
			<td><img width="40" height="45"
				src="${ pageContext.request.contextPath }/<c:out value="${ orderItem.product.image}"/>"></td>
			<td><c:out value="${orderItem.product.pname}" /></td>
			<td><c:out value="${orderItem.count}" /></td>
			<td><c:out value="${orderItem.subtotal}" /></td>
		</tr>
	</c:forEach>
</table>