<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/jquery-color-2.1.2.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_home.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_home.css" rel="stylesheet"/>
    <title></title>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <h2 style="float: left; height: 130px; color: red;line-height: 130px;font-family: cursive;
    font-weight: 700;">社区提供生鲜平台</h2>
        <div class="mallSearch">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="mallSearch-input">
                    <input class="header_search_input" type="text" name="product_name" placeholder="搜索商品关键字"
                           maxlength="50">
                    <input class="header_search_button" type="submit" value="搜索">
                </div>
            </form>
            <ul>
                <c:forEach items="${requestScope.categoryList}" var="category" varStatus="i">
                    <c:if test="${i.index<9}">
                        <li><a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}"
                                <c:if
                                test="${i.index % 2 != 0}"> style="color: #FF0036"</c:if>>${fn:substring(category.category_name,0,fn:indexOf(category.category_name,' /'))}</a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="home_nav">
        <div class="home_nav_title">
            <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/header_nav_title.png">
            <span>商品分类</span>
        </div>
    </div>
</nav>
<div class="banner">
    <c:forEach var="product" items="${requestScope.specialProductList}" varStatus="i">
        <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/banner/${product.product_id}.jpg"
             name="${product.product_id}" id="banner${i.count}" style='width:100%;height:500px;'
             <c:if test="${i.count == 1}">style="display: block;"</c:if> />
    </c:forEach>
</div>
<div class="banner_main">
    <ul class="banner_nav">
        <c:forEach items="${requestScope.categoryList}" var="category">
            <li data-toggle="${category.category_id}" data-status="">
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/small/${category.category_id}.png">
                <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}">${category.category_name}</a>
                <div class="banner_div" name="${category.category_name}">

                </div>
            </li>
        </c:forEach>
    </ul>
    <ul class="banner_slider">
        <li id="slider_1" style="background: rgba(255,255,255,0.4)"></li>
        <li id="slider_2"></li>
        <li id="slider_3"></li>
        <li id="slider_4"></li>
        <li id="slider_5"></li>
        <li id="slider_6"></li>
    </ul>
    <a href="#"></a>
</div>
<div class="banner_do">
    <div class="banner_goods">
        <c:forEach items="${requestScope.categoryList}" var="category">
            <c:if test="${fn:length(category.productList)>0}">
                <div class="banner_goods_type">
                    <div class="banner_goods_title">
                        <span></span>
                        <p>${category.category_name}</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}"><img
                            class="banner_goods_show"
                            src="res/images/fore/WebsiteImage/show/${category.category_id}.jpeg"></a>
                    <div class="banner_goods_items">
                        <c:forEach items="${category.productList}" var="product" varStatus="i">
                            <c:if test="${i.index<8}">
                                <div class="banner_goods_item">
                                    <a href="product/${product.product_id}" class="goods_link"></a>
                                    <img src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${product.singleProductImageList[0].productImage_src}">
                                    <a href="product/${product.product_id}"
                                       class="goods_name">${product.product_name}</a>
                                    <span class="goods_price">￥${product.product_sale_price}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <div class="endDiv"></div>
</div>
</body>