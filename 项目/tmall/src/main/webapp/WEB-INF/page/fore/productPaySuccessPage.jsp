<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderPaySuccess.css" rel="stylesheet"/>
    <title>支付</title>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <h2 style="float: left ;height: 45px; color: red;line-height: 45px;font-family: cursive;
font-weight: 700;">社区提供生鲜平台</h2>
        </div>
        <div class="shopSearchHeader">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="shopSearchInput">
                    <input type="text" class="searchInput" name="product_name" placeholder="搜索商品关键字"
                           value="${requestScope.searchValue}" maxlength="50">
                    <input type="submit" value="搜 索" class="searchBtn">
                </div>
            </form>
            <ul>
                <c:forEach items="${requestScope.categoryList}" var="category" varStatus="i">
                    <li>
                        <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}">${category.category_name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<div class="content">
    <div class="content_main">
        <div id="J_AmountList">
            <h2>您已成功付款</h2>
            <div class="summary_pay_done">
                <ul>
                    <li>
                        收货地址：<span>${requestScope.productOrder.productOrder_detail_address} ${requestScope.productOrder.productOrder_receiver} ${requestScope.productOrder.productOrder_mobile}</span>
                    </li>
                    <li>实付款：<span><em>￥${requestScope.orderTotalPrice}</em></span></li>
                </ul>
            </div>
        </div>
        <div id="J_ButtonList">
            <span class="info">您可以 </span>
            <a class="J_MakePoint" href="${pageContext.request.contextPath}/order/0/10">查看订单</a>
        </div>

    </div>
</div>
</body>