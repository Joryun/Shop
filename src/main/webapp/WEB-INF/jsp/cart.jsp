<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>购物车</title>
    <link href="${pageContext.request.contextPath}/css/common.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/cart.css"
          rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>

    <script language="JavaScript">
        $(document).ready(function () {
            //checkbox框被单击的事件处理
            $("#checkbox").on("click", function () {
                if ($("input[type='checkbox']").is(':checked')) {
                    var privilege = $("#privilege").val();
                    var total = $("#total").val();
                    var total1 = total - privilege;
                    $("#effectivePoint").text(parseFloat(total1).toFixed(1));
                    $("#discountTotal").text("￥" + parseFloat(total1).toFixed(1) + "元");
                } else {
                    var total = $("#total").val();
                    $("#effectivePoint").text(total);
                    $("#discountTotal").text("￥" + total + "元");
                }
            });
            //单击提交按钮时触发的事件
            $("#submit").on("click", function () {
                $.post(
                    "ChangeTotal/" + parseFloat($("#effectivePoint").text()),
                    {},
                    function (data) {
                        /* if (data == 1) {
                         document.getElementById("span1").innerHTML = "&lt;font color='red'>用户名已经存在&lt;/font>";
                         $("#username").val("");
                         $("#username").focus();
                         $(".submit").unbind("click",
                         function(event){

                         });
                         } else {
                         document.getElementById("span1").innerHTML = "&lt;font color='green'>用户名不存在&lt;/font>";
                         } */
                    });
            });
        });
    </script>

</head>
<body>
<div class="container header">
    <div class="span5">

    </div>
    <div class="span9">

    </div>
    <%@ include file="menu.jsp" %>
</div>

<div class="container cart">
    <c:if test="${fn:length(sessionScope.cart.cartItems)!=0}">
        <div class="span24">
            <table>
                <tbody>
                <tr>
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>

                    <%-- 获取系统时间 --%>
                <%
                    String datetime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
                    request.setAttribute("currentTime", datetime);
                %>

                <c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
                    <tr>
                        <td width="60">
                            <a href="${pageContext.request.contextPath }/findByPid/<c:out value="${cartItem.product.pid}"/>">
                                <img src="${pageContext.request.contextPath}/<c:out value="${cartItem.product.image}"/>"/>
                            </a>
                        </td>

                        <td>
                            <a target="_blank"
                               href="${ pageContext.request.contextPath }/findByPid/<c:out value="${cartItem.product.pid}"/>">
                                <c:out value="${cartItem.product.pname}"/>
                            </a>
                        </td>

                        <c:if test="${currentTime !=  privilegeTime}">
                            <td>￥<fmt:formatNumber type="number" minFractionDigits="1"
                                                   value="${cartItem.product.shop_price }" maxFractionDigits="1"/>
                            </td>
                            <%--<td class="quantity" width="60"><c:out value="${cartItem.count}" /></td>--%>
                            <%--<td width="140"><span class="subtotal">￥<c:out--%>
                            <%--value="${cartItem.product.shop_price*cartItem.count}" /></span></td>--%>
                        </c:if>

                        <c:if test="${currentTime ==  privilegeTime}">
                            <td>￥<fmt:formatNumber type="number" minFractionDigits="1"
                                                   value="${cartItem.product.shop_price * cartItem.product.categorySecond.category.discount }"
                                                   maxFractionDigits="1"/>
                            </td>
                            <%--<td class="quantity" width="60"><c:out value="${cartItem.count}" /></td>--%>
                            <%--<td width="140"><span class="subtotal">￥<c:out--%>
                            <%--value="${cartItem.product.shop_price*cartItem.product.categorySecond.category.discount*cartItem.count}" /></span></td>--%>
                        </c:if>

                            <%--<td>￥<fmt:formatNumber type="number" minFractionDigits="1" value="${cartItem.product.shop_price*cartItem.product.categorySecond.category.discount }" maxFractionDigits="1"/>--%>
                            <%--</td>--%>

                        <td class="quantity" width="60"><c:out value="${cartItem.count}"/></td>
                        <td width="140"><span class="subtotal">￥<c:out
                                value="${cartItem.subtotal}"/></span></td>
                        <td><a
                                href="${ pageContext.request.contextPath }/removeCart/<c:out value="${cartItem.product.pid}"/>"
                                class="delete">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <dl id="giftItems" class="hidden" style="display: none;">
            </dl>

            <div class="total">
                <em id="promotion"></em>

                    <%-- 若用户未登录 --%>
                <c:if test="${sessionScope.user == null}">
                    <em> 登录后确认是否享有优惠 </em>
                </c:if>

                    <%-- 若用户已登录 --%>
                <c:if test="${sessionScope.user != null}">

                    <%-- 判断是否为活动日 --%>
                    <c:if test="${currentTime !=  privilegeTime}">
                        <em> 暂无可用优惠券 </em>
                    </c:if>

                    <c:if test="${currentTime ==  privilegeTime}">

                        <%-- 判断购买商品是否满足优惠条件 --%>
                        <%--<c:if test="${cartItem.product.shop_price*cartItem.product.categorySecond.category.discount*count >= ticket.consume}">
                            <em> 满${ticket.consume}减${ticket.privilege} </em>

                        </c:if>

                        <c:if test="${cartItem.product.shop_price*cartItem.product.categorySecond.category.discount*count < ticket.consume}">
                            <em> 暂无可用优惠券 </em>

                        </c:if>--%>

                        <%--<c:out value="总金额：${sessionScope.cart.total}" />
                        <c:out value="满${ticket.consume}减${ticket.privilege}" />--%>

                        <c:if test="${sessionScope.cart.total >= ticket.consume}">
                            <%--<em> 满${ticket.consume}减${ticket.privilege} </em>--%>
                            <em><input id="checkbox" type="checkbox" value="privilege">满<c:out
                                    value="${ticket.consume}"/>减<c:out value="${ticket.privilege}"/></em>

                            <%-- 隐藏域，优惠金额 --%>
                            <input type="hidden" id="privilege" value="<c:out value="${ticket.privilege}"/>"/>
                            <%-- 隐藏域，购物总计 --%>
                            <input type="hidden" id="total" value="<c:out value="${sessionScope.cart.total}"/>"/>
                        </c:if>

                        <c:if test="${sessionScope.cart.total < ticket.consume}">
                            <em> 暂无可用优惠券 </em>
                            <%--<em> 满${ticket.consume}减${ticket.privilege} </em>--%>
                        </c:if>
                    </c:if>
                    </strong>
                </c:if>
                赠送积分: <em id="effectivePoint"><c:out value="${sessionScope.cart.total}"/></em>
                商品金额:
                <strong id="effectivePrice"><p id="discountTotal">￥<c:out value="${sessionScope.cart.total}"/>元</p>
                </strong>
            </div>
            <div class="bottom">
                <a href="${ pageContext.request.contextPath }/clearCart" id="clear" class="clear">清空购物车</a>
                <a href="${pageContext.request.contextPath}/saveOrder" id="submit" class="submit">提交订单</a>
            </div>
        </div>
    </c:if>

    <c:if test="${fn:length(sessionScope.cart.cartItems) == 0}">
        <div class="span24">
            <div class="step step1">
                <center style="color: red">
						<span><h2>
                            您还没有
						<a href="${ pageContext.request.contextPath }/index" style="color: #843d11">
                            购物
						</a>
                            或未
                        <a href="${ pageContext.request.contextPath }/userLogin" style="color: #843d11">
                            登录
                        </a>
                            ！！！
						</h2></span>
                </center>
            </div>
        </div>
    </c:if>
</div>

<div class="container footer">

    <%--<div class="span24">
            <div class="copyright">Copyright © 2016-2016 版权所有</div>
    </div>--%>
</div>
</body>
</html>