<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>网上商城</title>
    <link href="${pageContext.request.contextPath}/css/common.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/product.css"
          rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>

    <script>
        function saveCart() {
            //验证购买数量是否非法
            var count = $("#count").val();
            var inventory = $("#inventory").val();

            if (eval(count) > eval(inventory)) {
                alert("库存量不足");
                return fasle;
            }
            //保存商品到购物车
            document.getElementById("cartForm").submit();
        }
    </script>

</head>

<body>
<% float discount = 0; %>

<div class="container header">
    <div class="span5">

    </div>
    <div class="span9">
        <div class="headerAd">

        </div>
    </div>

    <%@ include file="menu.jsp" %>
</div>

<div class="container productContent">
    <div class="span6">
        <div class="hotProductCategory">
            <c:forEach var="c" items="${sessionScope.cList }">
                <dl>
                    <dt>
                        <a href="${pageContext.request.contextPath }/findByCid/<c:out value="${c.cid}"/>/1"><c:out
                                value="${c.cname}"/></a>
                    </dt>
                    <c:forEach var="cs" items="${c.categorySeconds}">
                        <dd>
                            <a href="${ pageContext.request.contextPath }/findByCsid/<c:out value="${cs.csid}/1"/>"><c:out
                                    value="${cs.csname}"/></a>
                        </dd>
                    </c:forEach>
                </dl>
            </c:forEach>
        </div>
    </div>

    <div class="span18 last">
        <div class="productImage">
            <a title="" style="outline-style: none; text-decoration: none;"
               id="zoom" rel="gallery">
                <div class="zoomPad">
                    <img style="opacity: 1;" title="商品图片" class="medium"
                         src="${ pageContext.request.contextPath }/<c:out value="${product.image }"/>"/>
                    <div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div>
                    <div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow">
                        <div style="width: 368px;" class="zoomWrapper">
                            <div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div>
                            <div style="width: 0%; height: 0px;" class="zoomWrapperImage">
                                <img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg"
                                        style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"/>
                            </div>
                        </div>
                    </div>

                    <div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;"
                            class="zoomPreload">Loading zoom
                    </div>
                </div>
            </a>
        </div>

        <!-- 商品的具体信息 -->
        <div class="name">
            <c:out value="${product.pname }"/>
        </div>
        <div class="sn">
            <div>
                编号：
                <c:out value="${product.pid }"/>
            </div>
        </div>
        <div class="info">
            <dl>
                <dt>活动价:</dt>
                <dd>

                    <%-- 获取当前时间 --%>
                    <%
                        String datetime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
                        request.setAttribute("currentTime", datetime);
                    %>


                    <c:if test="${currentTime ==  privilegeTime}">
                        <strong>￥：<fmt:formatNumber type="number" minFractionDigits="1"
                                                    value="${product.shop_price * product.categorySecond.category.discount } "
                                                    maxFractionDigits="1"/>元
                        </strong>

                        <%-- 传price变量到CartController，并给CartItem price赋值 --%>
                        <%--<c:set var="price" value="${product.shop_price * product.categorySecond.category.discount }" />--%>
                        <fmt:formatNumber var="price" type="number"
                                          value="${product.shop_price * product.categorySecond.category.discount }"
                                          maxFractionDigits="1" scope="application"/>
                        <%
                            session.setAttribute("price", application.getAttribute("price"));
                        %>

                    </c:if>

                    <c:if test="${currentTime !=  privilegeTime}">
                        <strong>￥：<fmt:formatNumber type="number" minFractionDigits="1" value="${product.shop_price }"
                                                    maxFractionDigits="1"/>元
                        </strong>

                        <%-- 传price变量到CartController，并给CartItem price赋值 --%>
                        <fmt:formatNumber var="price" type="number" value="${product.shop_price }" maxFractionDigits="1"
                                          scope="application"/>
                        <%
                            session.setAttribute("price", application.getAttribute("price"));
                        %>

                    </c:if>
                    参 考 价：
                    <del>
                        ￥
                        <c:out value="${product.market_price }"/>
                        元
                    </del>


                </dd>
            </dl>
            <dl>
                <dt>促销:</dt>
                <dd>
                    <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
                </dd>
            </dl>

        </div>

        <form id="cartForm"
              action="${ pageContext.request.contextPath }/addCart" method="post">

            <!-- 隐藏域传商品id -->
            <input type="hidden" name="pid"
                   value="<c:out value="${product.pid }"/>"/>

            <%--<input type="hidden" name="finalPrice"--%>
            <%--value="${price}" />--%>


            <div class="action">
                <dl class="quantity">
                    <dt>购买数量:</dt>
                    <dd>
                        <input id="count" name="count" value="1" maxlength="5" type="number" min="0"
                               onpaste="return false;"/>
                    </dd>
                    <dd>件</dd>
                    <dd><input id="inventory" type="hidden" value="${product.inventory}"/></dd>
                    <dd>&nbsp&nbsp库存<c:out value="${product.inventory}"/>件</dd>
                </dl>

                <div class="buy">
                    <input id="addCart" class="addCart" value="加入购物车" type="button"
                           onclick="saveCart()"/>
                </div>
            </div>
        </form>

        <div id="bar" class="bar">
            <ul>
                <li id="introductionTab"><a href="#introduction">商品介绍</a></li>
            </ul>
        </div>

        <div id="introduction" name="introduction" class="introduction">
            <div class="title">
                <!-- 商品的描述 -->
                <strong><c:out value="${product.pdesc }"/></strong>
            </div>
            <div>
                <!-- 商品图片 -->
                <img
                        src="${pageContext.request.contextPath }/<c:out value="${product.image }"/>"/>
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