<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="${pageContext.request.contextPath}/res/js/admin/home1.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<head>
<style rel="stylesheet">
    .echarts1{margin: 0.2%;border:1px solid #00ffe7;color: #fff;height: 70%;border-radius: 7px;
    background:#1d1771; }
    .top-line{height:100%}
</style>
</head>
<body style="background: #171261;">
<div class="row" style="height: 80%;">
    <div id="echarts2" style="width: 100%;height:100%"></div>
<%--    <div class="col-xs-3 col-sm-3 top-line" >--%>
<%--        <div class="echarts1">--%>

<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="col-xs-6 col-sm-6 top-line" >--%>
<%--        <div class="echarts1">--%>
<%--            --%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="col-xs-3 col-sm-3 top-line" >--%>
<%--        <div class="echarts1">--%>

<%--        </div>--%>
<%--    </div>--%>
<div class="loader"></div>
<script>
    var myChart;
    $(function () {
        return;
        $.getJSON('/tmall/res/js/basicTheme.json', function (themeJSON) {
            echarts.registerTheme('basicTheme', themeJSON);
            // 基于准备好的dom，初始化eCharts实例
            myChart = echarts.init($("#chartDiv")[0], "basicTheme");
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '商城订单交易额'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        label: {
                            backgroundColor: '#6a7985'
                        }
                    }
                },
                legend: {
                    data: ['总交易额', '交易完成', '等待买家确认', '等待卖家发货', '等待买家付款']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: []
                },
                yAxis: {
                    type: "value"
                },
                series: [
                    {
                        name: '总交易额',
                        type: 'line',
                        label: {
                            normal: {
                                show: true,
                                position: 'top'
                            }
                        },
                        data: []
                    },
                    {
                        name: '交易完成',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '等待买家确认',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '等待卖家发货',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '等待买家付款',
                        type: 'line',
                        data: []
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            //异步加载数据
            getChartData(null, null, JSON.parse('${requestScope.jsonObject}'));
        });
        //设置日期控件约束
        var date = new Date();
        date.setDate(date.getDate() - 1);
        var formatDate = FormatDate(date);
        $("#input_endDate").attr("max", formatDate).attr("min", "2018-01-07").val(formatDate);
        date.setDate(date.getDate() - 6);
        formatDate = FormatDate(date);
        $("#input_beginDate").val(formatDate).attr("min", formatDate).attr("max", formatDate);
        /******
         * event
         ******/
        //点击查询按钮时
        $("#btn_chart_search").click(function () {
            getChartData($("#input_beginDate").val(), $("#input_endDate").val(), null);
        });
        //更改日期时
        $(".chartDateInput").change(function () {
            var date = new Date($("#input_endDate").val());
            date.setDate(date.getDate() - 6);
            var formatDate = FormatDate(date);
            $("#input_beginDate").val(formatDate).attr("min", formatDate).attr("max", formatDate);
        });
        //点击查询近一周数据按钮时
        $("span.chartDateBtn").click(function () {
            if ($(this).hasClass("select")) {
                return;
            }
            //异步加载数据
            getChartData(null, null, JSON.parse('${requestScope.jsonObject}'));
            $(this).addClass("select");
        });
        //点击统计数据时
        $("#productTotal").click(function () {
            $(".menu_li[data-toggle=product]").click();
        });
        $("#userTotal").click(function () {
            $(".menu_li[data-toggle=user]").click();
        });
        $("#orderTotal").click(function () {
            $(".menu_li[data-toggle=order]").click();
        });
    });

    //获取图表数据
    function getChartData(beginDate, endDate, jsonObject) {
        if (jsonObject == null) {
            $.ajax({
                url: "/tmall/admin/home/charts",
                type: "get",
                data: {"beginDate": beginDate, "endDate": endDate},
                dataType: "json",
                success: function (data) {
                    $(".loader").css("display", "none");
                    $("#btn_chart_search").attr("disabled", false);
                    //异步加载数据
                    myChart.setOption({
                        xAxis: {
                            data: data.dateStr
                        },
                        series: [{
                            name: "总交易额",
                            data: data.orderTotalArray
                        }, {
                            name: "交易完成",
                            data: data.orderSuccessArray
                        }, {
                            name: "等待买家确认",
                            data: data.orderUnconfirmedArray
                        }, {
                            name: "等待卖家发货",
                            data: data.orderNotShippedArray
                        }, {
                            name: "等待买家付款",
                            data: data.orderUnpaidArray
                        }]
                    });
                }, beforeSend: function () {
                    $(".loader").css("display", "block");
                    $("#btn_chart_search").attr("disabled", true);
                    $("span.select").removeClass("select");
                }
            });
        } else {
            //异步加载数据
            myChart.setOption({
                xAxis: {
                    data: jsonObject.dateStr
                },
                series: [{
                    name: "总交易额",
                    data: jsonObject.orderTotalArray
                }, {
                    name: "交易完成",
                    data: jsonObject.orderSuccessArray
                }, {
                    name: "等待买家确认",
                    data: jsonObject.orderUnconfirmedArray
                }, {
                    name: "等待卖家发货",
                    data: jsonObject.orderNotShippedArray
                }, {
                    name: "等待买家付款",
                    data: jsonObject.orderUnpaidArray
                }]
            });
        }
    }

    /**
     * @return {string}
     * */
    //格式化日期
    function FormatDate(strTime) {
        var date = new Date(strTime);
        var formatedMonth = ("0" + (date.getMonth() + 1)).slice(-2);
        var formatedDate = ("0" + (date.getDate())).slice(-2);
        return date.getFullYear() + "-" + formatedMonth + "-" + formatedDate;
    }
</script>
</body>
</html>
