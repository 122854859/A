<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="../res/echartsFile/js/flexible.js"></script>
    <link rel="stylesheet" href="../res/echartsFile/css/style.css">
    <title>Document</title>
    <script src="../res/js/jquery-1.11.3.min.js"></script>
    <script src="../res/echartsFile/js/echarts.min.js"></script>
    <script src="../res/echartsFile/js/china.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>

<!--页面主体-->
<div class="mainbox">
    <div class="column">
        <div class="panel bar">
            <h2>销售总数排名前十的商品编号</h2>
            <div class="chart" style="height: 170px"></div>
            <div class="panel_footer"></div>
        </div>
<%--        <div class="panel line">--%>
<%--            <h2>折线图-增长变化</h2>--%>
<%--            <div class="chart"></div>--%>
<%--            <div class="panel_footer"></div>--%>
<%--        </div>--%>
        <div class="panel pie">
            <h2>热销商品占比</h2>
            <div class="chart"></div>
            <div class="panel_footer"></div>
        </div>
    </div>
    <div class="column">
        <!--地图-->
        <h2 style="text-align: center;color: #ffff;">用户全国分布</h2>
        <div class="map">
            <div class="map1"></div>
            <div class="map2"></div>
            <div class="map3"></div>
            <div class="chart"></div>
        </div>

    </div>
    <div class="column">
        <div class="panel bar1">
            <h2>地区用户总量</h2>
            <div class="chart" style="height: 160px;"></div>
            <div class="panel_footer"></div>
        </div>
        <div class="panel line1">
            <h2>库存分析</h2>
            <div class="chart10" style="width: 30%;height: 60%;display: inline-block;"></div>
            <div class="chart11" style="width: 30%;height: 60%;display: inline-block;"></div>
            <div class="chart12" style="width: 30%;height: 60%;display: inline-block;"></div>
            <div class="panel_footer"></div>
        </div>
    </div>
</div>
<!--2021每月销售额-->
<div class="no" style="margin-top: -45px;">
    <div class="panel line2">
        <h2>每月销售额</h2>
        <div class="chart"></div>
        <div class="panel_footer"></div>
    </div>
</div>
<script src="../res/echartsFile/js/index2.js"></script>
</body>
</html>
s