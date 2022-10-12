//销售总数排名前十的商品编号
(function(){
  //实例化对象
    var mychart = echarts.init(document.querySelector(".bar .chart"));
  //指定配置项和数据
  var xdata1 = [];
  var ydata1 = [];
  $.ajax({
    type : "get",
    contenType : "application/json",
    async: false,
    url : "order/getProductId",
    success : function(res){
      console.log(res)
      $.each(res,function (i,c){
    	  if(i < 5){
    		  xdata1.push(c.productOrderItem_product.product_name);
    		  ydata1.push(c.productOrderItem_number);
    	  }
      })
    }
  })
  var option = {
    color:['#00f2f1', '#ed3f35'],
    tooltip: {
      trigger: 'axis'
    },
    legend: {
      data: ['销售总额'],
      textStyle:{
        color:'#4c9bfd'
      },
      right:'10%'
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      top:'20%',
      show:true,
      borderColor:'#012f4a',
      containLabel: true
    },
    toolbox: {
      feature: {
        saveAsImage: {}
      }
    },
    xAxis: {
      name: '商品编号',
      type: 'category',
      boundaryGap: false,
      data: xdata1,
      // axisLabel:{
      //   color:'#4c9bfd'
      // },
      //标签颜色
      axisLabel:{
        color:'rgba(255,255,255,0.6)',
        fontSize:"12",
        interval: 0,//横轴信息全部显示
        rotate: 15,// 倾斜角度
        formatter: function(value){ 
        	return value.length > 10 ? value.substring(0, 4) + '...' : value;
        }
      },
      axisLine:{
        show:false
      }
    },
    yAxis: {
      type: 'value',
      axisLabel:{
        color:'#4c9bfd'
      },
      axisLine:{
              lineStyle:{
                color:"rgba(255,255,255,0.1)",
                width:1
              }
            },
            splitLine:{
              lineStyle:{
                color:"rgba(255,255,255,0.1)",
                width:1
              }
            }
    },
    series: [
        {
          name: '销售总额',
          data: ydata1,
          type: 'bar',
          barWidth:'35%',
          itemStyle:{
            //圆角
            barBorderRadius:3
          }
        }
      ]
  };
  //把配置项给实例对象
    mychart.setOption(option);
    //自适应
    window.addEventListener("resize",function(){
      mychart.resize()
    })
})();

//折线图
(function(){
  //1 实例化对象
    var mychart = echarts.init(document.querySelector(".line2 .chart"));
    //var mychart = echarts.init(document.getElementById("saleLine"));

  var ydata3 = [];
  $.ajax({
    type : "get",
    contenType : "application/json",
    async: false,
    url : "order/getSaleMoney",
    success : function(res){ 
      $.each(res,function (i,c){
        ydata3.push(c.productOrder_post);
      })
    }
  })
  //2 指定配置项和数据
  var option = {
    color:['#00f2f1', '#ed3f35'],
    tooltip: {
      trigger: 'axis'
    },
    legend: {
      data: ['Email', 'Union Ads'],
      textStyle:{
        color:'#4c9bfd'
      },
      right:'10%'
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      top:'5%',
      show:true,
      borderColor:'#012f4a',
      containLabel: true
    },
    toolbox: {
      feature: {
        saveAsImage: {}
      }
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
      axisLabel:{
        color:'#4c9bfd'
      },
      axisLine:{
        show:false
      }
    },
    yAxis: {
      type: 'value',
      axisLabel:{
        color:'#4c9bfd'
      },
      axisLine:{
        show:false
      },
      splitLine:{
        lineStyle:{
          color:'#012f4a'
        }
      }
    },
    series: [
      {
        name: '销售额',
        type: 'line',
        stack: 'Total',
        smooth:true,
        //data: [120, 132, 101, 134, 90, 230, 210]
        data:  ydata3
       
      }
    ]
  };

  //3 把配置项给实例对象
    mychart.setOption(option);
    //4 自适应
    window.addEventListener("resize",function(){
      mychart.resize()
    })

})();

//热销商品占比
(function(){
  //1 实例化对象
    var mychart = echarts.init(document.querySelector(".pie .chart"));
  var dataVal = [];
  $.ajax({
    type : "get",
    contenType : "application/json",
    async: false,
    url : "order/getProductId",
    success : function(res){
      $.each(res,function (i,c){
        if(i < 6){
          var text = c.productOrderItem_product.product_name
          dataVal.push({value: 1000 - c.productOrderItem_product.count,name:text})
        }
      })
      console.log(dataVal,"dataVal")
    }
  })
  //2 指定配置项和数据
  var option = option = {
    title: {
      left: 'center'
    },
    tooltip: {
      trigger: 'item',
      formatter: "{a} <br/>{b} : {c} ({d}%)"/*鼠标经过显示*/
    },
    legend: {
      orient: 'vertical',
      left: 'left',
      selectedMode: false,
      textStyle:{
        color:'rgba(101,132,266,0.1)'
      },
      // formatter: function(name){
      //   console.log(name,"name------------------")
      //   return name.substr(0,5)+"...";
      // }
    },
    series: [
      {
        name: 'Access From',
        type: 'pie',
        radius: '50%',
        data: dataVal,
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        },
        itemStyle:{
	         normal:{
	           color:function(params) {//生成随机颜色
	                 var colorList = ['#19c4e0','#E63234','#090fcb','#DD6B25','#38e918','#009944','#6A8DF1','#C535A8','#6D54E9','#67E682','#E954CF','#CAF161'];
	                 return params.dataIndex >= colorList.length-1 ? "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16):colorList[params.dataIndex];
	             },
	             show:true,
                 position:'inner', //标签的位置
                 textStyle : {
                     fontWeight : 300 ,
                     fontSize : 13    //文字的字体大小
                 },
	             formatter(d){
	            	 return '{d}%'
	             }
	         }
         },
      }
    ]
  };

  //3 把配置项给实例对象
    mychart.setOption(option);
    //4 自适应
    window.addEventListener("resize",function(){
      mychart.resize()
    })
    
})();

//库存分析
(function(){
  var dataval2 = [],dataval3 = [],dataval4 = [];
  $.ajax({
    type : "get",
    contenType : "application/json",
    async: false,
    url : "order/getProductId",
    success : function(res){
      dataval2.push(
          { value: 1000 - res[3].productOrderItem_product.count, name: res[3].productOrderItem_product.product_name },
          { value: 1000, name: '' })
      dataval3.push(
          { value: 1000 - res[1].productOrderItem_product.count, name: res[1].productOrderItem_product.product_name },
          { value: 1000, name: '' })
      dataval4.push(
          { value: 1000 - res[2].productOrderItem_product.count, name: res[2].productOrderItem_product.product_name },
          { value: 1000, name: '' })
      console.log(dataval2,"dataVal")
      getOption(".line1 .chart10",dataval2)
      getOption(".line1 .chart11",dataval3)
      getOption(".line1 .chart12",dataval4)
    }
  })
  function getOption(ele,val){
    //实例化对象
    var mychart = echarts.init(document.querySelector(ele));
    //指定配置项和数据
    var option = option = {
      tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c}"+ '人' +" ({d}%)"  //饼图、仪表盘、漏斗图: {a}（系列名称），{b}（数据项名称），{c}（数值）, {d}（百分比）
      },

      legend: {
        top: '5%',
        left: 'center',
        selectedMode: false,
        textStyle:{
          color:'rgba(101,132,266,0.1)'
        },
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: 'center'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: '15',
              fontWeight: 'bold',
              color: "#fff"
            }
          },
          labelLine: {
            show: false
          },
          data: val
        }
      ]
    };
    //把配置项给实例对象
    mychart.setOption(option);
    //自适应
    window.addEventListener("resize",function(){
      mychart.resize()
    })
  }

})();

//地图
(function(){
  //1 实例化对象
    var mychart = echarts.init(document.querySelector(".map .chart"));
  $.ajax({
    type : "get",
    contenType : "application/json",
    async: false,
    url : "user/getUserCount",
    success : function(res){
      console.log(res,113)
      var datalist = []
      $.each(res,function(i,c){
        var name = c.user_name.indexOf("省") > -1
              ? c.user_name.split("省")[0] : c.user_name;
        datalist.push({name:name,value:c.count});
      })

      //2 指定配置项和数据
      var option = {
        tooltip: {
          triggerOn: "click",
          formatter: function(e, t, n) {
            console.log(e)
            var val = isNaN(e.value) ? 0 : e.value;
            return .5 == e.value ? e.name + "：人数" : e.seriesName + "<br />" + e.name + "：" + val
          }
        },
        visualMap: {
          min: 0,
          max: 1000,
          left: 26,
          bottom: 10,
          top: 10,
          showLabel: !0,
          
          show: !0
        },
        geo: {
          map: "china",
          roam: true,
          scaleLimit: {
            min: 1,
            max: 2
          },
          zoom: 1.23,
          top: 120,
          label: {
            normal: {
              show: !0,
              fontSize: "14",
              color: "rgba(0,0,0,0.7)"
            }
          },
          itemStyle: {
            normal: {
              //shadowBlur: 50,
              //shadowColor: 'rgba(0, 0, 0, 0.2)',
              borderColor: "rgba(0, 0, 0, 0.2)"
            },
            emphasis: {
              areaColor: "#f2d5ad",
              shadowOffsetX: 0,
              shadowOffsetY: 0,
              borderWidth: 0
            }
          }
        },
        series: [{
          name: "注册人数",
          type: "map",
          geoIndex: 0,
          data: datalist
        }]
      };
      //3 把配置项给实例对象
      mychart.setOption(option);
      //4 自适应
      window.addEventListener("resize",function(){
        mychart.resize()
      })
    },
  });


    
})();

//柱形图-连接后端
(function(){
	var xData = [];
	var yData = [];
	$.ajax({
		type : "get",
		contenType : "application/json",
		async: false,
		url : "user/getUserCount",
		success : function(res){
		  console.log(res)
		  $.each(res,function(i,c){
			  if(i < 6){
				yData.push(c.user_name);
				xData.push(c.count);
			  }
		  })
		},
	});
  //1 实例化对象
    var mychart = echarts.init(document.querySelector(".bar1 .chart"));
  //2 指定配置项和数据
  var option = {

    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'shadow'
      }
    },
    /*legend: {
      data: ['2021', '2022'],
      textStyle:{
        color:'rgba(255,255,255,0.6)'
      },
      right:'10%'
    },*/
    grid: {
      left: '3%',
      right: '5%',
      bottom: '3%',
      top: '1%',
      containLabel: true
    },
    xAxis: {
      type: 'value',
      boundaryGap: [0, 0.01],
      //标签颜色
      axisLabel:{
        color:'rgba(255,255,255,0.6)',
        fontSize:"12"
      }
    
    },
    yAxis: {
      type: 'category',
      data: yData,
      //标签颜色
      axisLabel:{
        color:'rgba(255,255,255,0.6)',
        fontSize:"12"
      }
    },
    series: [
      {
        name: '2022',
        color:'#4c9bfd',
        type: 'bar',
        data: xData
      }
    ]
  };
  $.ajax({
    //请求方式
    type : "get",
    //请求的媒体类型
    contenType : "application/json",
    //请求地址
    url : "http://localhost:5000/api/Values",
    //数据，json字符串
    //请求成功
    success : function(result){
      console.log("成功");
      console.log(result);
    },
    //请求失败，包含具体的错误信息
    error : function(e){
      console.log("错误");
      console.log(e.status);
      console.log(e.responseText);
    }
  });
  
  //3 把配置项给实例对象
    mychart.setOption(option);
    //4 自适应
    window.addEventListener("resize",function(){
      mychart.resize()
    })
    
})();