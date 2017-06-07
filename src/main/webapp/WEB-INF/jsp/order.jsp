<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>订单页面</title>
    <link href="${pageContext.request.contextPath}/css/common.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/cart.css"
          rel="stylesheet" type="text/css"/>

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
<div class="container cart">
    <div class="span24">
        <div class="step step1">
            <ul>
                <li class="current"></li>
                <li>生成订单成功</li>
            </ul>
        </div>
        <table>
            <tbody>
            <tr>
                <th colspan="5">订单编号:<c:out value="${order.oid}"/>&nbsp;&nbsp;&nbsp;&nbsp;
                </th>
            </tr>
            <tr>
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            <c:forEach var="orderItem" items="${order.orderItems}">
                <tr>
                    <td width="60"><img
                            src="${ pageContext.request.contextPath }/<c:out value="${ orderItem.product.image}"/>"/>
                    </td>
                    <td><c:out value="${orderItem.product.pname}"/></td>
                    <td><fmt:formatNumber type="number" minFractionDigits="1" value="${orderItem.product.shop_price }"
                                          maxFractionDigits="1"/></td>
                    <td class="quantity" width="60">
                        <c:out value="${orderItem.count}"/></td>
                    <td width="140"><span class="subtotal">￥
							<c:out value="${orderItem.subtotal}"/></span></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em> 优惠后的商品金额: <strong id="effectivePrice">￥<c:out
                value="${order.total}"/>元
        </strong>
        </div>
        <form id="orderForm"
              action="${ pageContext.request.contextPath }/payOrder"
              method="post">
            <input type="hidden" name="oid"
                   value="<c:out value="${order.oid}"/>"/>
            <div class="span24">
                <p>
                    收货地址：<input name="addr" type="text" value="<c:out value="${sessionScope.user.addr}"/>"
                                style="width: 350px"/> <br/>
                    收货人&nbsp;&nbsp;&nbsp;：<input name="name" type="text"
                                                 value="<c:out value="${sessionScope.user.username}"/>"
                                                 style="width: 150px"/> <br/>
                    联系方式：<input name="phone" type="text" value="<c:out value="${sessionScope.user.phone}"/>"
                                style="width: 150px"/>

                    <%-- 隐藏域，订单总金额 --%>
                    <input name="total" type="hidden" value="${order.total}"/>
                </p>
                <hr/>

                <hr/>
                <p style="text-align: right">
                    <a href="javascript:document.getElementById('orderForm').submit();">
                        <img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0"/>
                    </a>
                </p>
            </div>
        </form>
    </div>

</div>
<div class="container footer">

    <%--<div class="span24">
            <div class="copyright">Copyright © 2016-2016  版权所有</div>
    </div>--%>
</div>
</body>
</html>