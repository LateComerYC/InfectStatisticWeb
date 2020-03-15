<%@page import="java.util.Vector"%>
<%@page import="DataTest.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="0">
<meta charset="UTF-8">
<title>全国疫情统计信息</title>
<script type="text/javascript" src="echarts.js"></script>
<script type="text/javascript" src="china.js"></script>
	<style type="text/css"> 
		#top{padding-left: 300px;}
		#top-1{color: #beafad;font-size: small;margin-left: 135px;}
		#top-1 >label{margin-left: 50px;}
		.top-label{list-style-type: none} .top-label li{display: inline;margin: 0px 50px; width: 100px;padding: 0px 50px;}
		.top-data{list-style-type: none} .top-data li{display: inline;margin: 0px 50px;padding: 0px 45px;font-size: larger;  font-weight: bold;  width: 200px; min-width: 100px;  text-align: left;}
		.top-update{list-style-type: none;font-size: x-small;margin-top: -20px;} .top-update li{display: inline;margin: 0px 45px;  width: 100px;padding: 0px 50px;}
		.top-data textarea{border-style: none;resize: none;margin: 0px; width: 70px;background-color: white; text-align: center;font-size: larger;height: 25px; font-weight: 900;}
		.top-update textarea{    border-style: none;   resize: none; margin: 0px;  width: 45px;  background-color: white;  height: 18px; text-align: center;font-size: x-small;height: 15px}
		.yest{margin-right: 0px;padding-right: 0px;} .yest textarea {padding-right: 0px;margin-right: 0px; width: 25px;}
		.Yest{    margin-left: 0px;  padding-left: 0px;}	#left{ padding: 0px 150px; margin: 0px; font-size: large;
    letter-spacing: 5px;   background-color: #efefef;   border-radius: 15px;    padding: 13px 150px;   display: inline;
    margin-top: px;  padding-top: 10px;}
		#right{ padding: 0px 150px;  padding: 0px 150px;  margin: 0px;  font-size: large;  letter-spacing: 5px;  border-radius: 15px;  padding: 13px 150px;  padding: 0px 150px;   margin: 0px;   font-size: large;   letter-spacing: 5px;   background-color: #d6d1d0;   border-radius: 15px;  padding: 13px 150px;   display: inline;  margin-top: px;   padding-top: 10px;}
	</style>
</head>
<body>
        <div id="top" style="width=1200px;height:250px;min-width: 1200px;">
		<div id="top-1">更新至  <input id="date" type="text" placeholder="yyyy-mm-dd" value="2020-01-25" style="   border-style: none;    padding-left: 10px;"/> <label title="dahidha">数据说明</label></div>
	<div id="top-2">
		<ul class="top-label"><li>现有确诊</li><li>现有疑似</li><li>现有重症</li></ul>
		<ul class="top-data"></ul>
		<ul class="top-update"></ul>
		
		<ul class="top-label"><li>累计确诊</li><li>累计治愈</li><li>累计死亡</li></ul>
		<ul class="top-data"></ul>
		<ul class="top-update"></ul>
	</div>
		<script type="text/javascript">
			<% 
				String dates=(String)request.getAttribute("date");
	
				String[] command = { "list", "-log", "E:\\echarts\\log\\", "-out", "F:\\holiday\\output1.txt", "-date",
				"2020-01-25" };
				if(dates!=null){
					command[6]=dates;
				}			
				Data data = new Data(command); 
				
			%>
			
			var ss=<%=data.getDate()%>;
			var res=ss.join("-");
			var newStr = res.slice(0,5)+'0'+res.slice(5);
		
			var nodee=document.getElementById("date");
			nodee.setAttribute("value",newStr);
			
			var mydate=<%=data.getTotal()%>;
			var mydata=<%=data.getUpdate()%>;
			var color=["crimson","dimgrey","green","blue","orange","grew"];
			var topdata=document.getElementsByClassName("top-data");
			for(var j=0;j<topdata.length;j++){
				for(var i=0;i<3;i++){
					var li1=document.createElement('li');
					var num=i+ j*3;
					
					var text=document.createElement('textarea');
					text.setAttribute("disabled","disabled");
					text.setAttribute("rows","1");
					text.setAttribute("cols","10");
					text.textContent=mydate[num];
					text.setAttribute("style","color:"+color[num] );
					li1.appendChild(text);
					
					topdata[j].appendChild(li1);
				}
				
			}
			var topdate=document.getElementsByClassName("top-update");
			for(var j=0;j<topdate.length;j++){
				for(var i=0;i<3;i++){
					var li1=document.createElement('li');
					var li2=document.createElement('li');
					li1.setAttribute("class","Yest");
					li1.setAttribute("style","margin-left: 0px;   padding-left: 0px");
					li2.setAttribute("style","margin-right: 0px;   padding-right: 0px");
					var num=i+ j*3;
					var text=document.createElement('textarea');
					text.setAttribute("disabled","disabled");
					text.setAttribute("rows","1");
					text.setAttribute("cols","10");
					text.textContent=mydata[num];
					text.setAttribute("style","color:"+color[num]+"overflow-x:hidden"+"overflow-y:hidden" );
					li1.appendChild(text);
					li2.setAttribute("class","yest");
					var text1=document.createElement('textarea');
					text1.setAttribute("disabled","disabled");
					text1.setAttribute("rows","1");
					text1.setAttribute("cols","4");
					text1.textContent="昨日";
					li2.appendChild(text1);
					topdate[j].appendChild(li2);
					topdate[j].appendChild(li1);
				}
				
			}
		</script>
</div>
	<div style="   margin: 0xp auto;   margin: 20px 330px;   padding: 15px 25px;    background-color: white;">
<div style="    margin: 0px;   background-color: #d6d1d0;   height: 42px;   padding-top: 13px;  padding-bottom: -15px;
    min-width: 800px;">
<span id="left" >现有确诊</span><span id="right" >累计确诊</span></div></div>
    <div id="main" style="width: 1200px;height:800px; left: 150px;"></div>
  
    <script type="text/javascript">
    var daupdate = document.getElementById("date");
   	daupdate.onchange=function(){
   		var da = document.getElementById("date").value;
  		window.location.href="http://localhost:8080/InfectStaticTest1/temp.jsp?date="+da;
	}
function randomData() {  
     return Math.round(Math.random()*10000);  
} 
var myChart = echarts.init(document.getElementById('main'));
function showEcharts( click){ 
	var mydata;
	if(click=="1"){
	 mydata= [  
        {name: '北京',value: <%=data.getMap2("北京")%> },{name: '天津',value: <%=data.getMap2("天津")%> },  
        {name: '上海',value: <%=data.getMap2("上海")%> },{name: '重庆',value: <%=data.getMap2("重庆")%> },  
        {name: '河北',value: <%=data.getMap2("河北")%> },{name: '河南',value: <%=data.getMap2("河南")%> },  
        {name: '云南',value: <%=data.getMap2("云南")%> },{name: '辽宁',value: <%=data.getMap2("辽宁")%> },  
        {name: '黑龙江',value: <%=data.getMap2("黑龙江")%> },{name: '湖南',value: <%=data.getMap2("湖南")%> },  
        {name: '安徽',value: <%=data.getMap2("安徽")%> },{name: '山东',value: <%=data.getMap2("山东")%> },  
        {name: '新疆',value: <%=data.getMap2("新疆")%> },{name: '江苏',value: <%=data.getMap2("江苏")%> },  
        {name: '浙江',value: <%=data.getMap2("浙江")%> },{name: '江西',value: <%=data.getMap2("江西")%> },  
        {name: '湖北',value: <%=data.getMap2("湖北")%> },{name: '广西',value: <%=data.getMap2("广西")%> },  
        {name: '甘肃',value: <%=data.getMap2("甘肃")%> },{name: '山西',value: <%=data.getMap2("山西")%> },  
        {name: '内蒙古',value: <%=data.getMap2("内蒙古")%> },{name: '陕西',value: <%=data.getMap2("陕西")%> },  
        {name: '吉林',value: <%=data.getMap2("吉林")%> },{name: '福建',value: <%=data.getMap2("福建")%> },  
        {name: '贵州',value: <%=data.getMap2("贵州")%> },{name: '广东',value: <%=data.getMap2("广东")%> },  
        {name: '青海',value: <%=data.getMap2("青海")%> },{name: '西藏',value: <%=data.getMap2("西藏")%> },  
        {name: '四川',value: <%=data.getMap2("四川")%> },{name: '宁夏',value: <%=data.getMap2("宁夏")%> },  
        {name: '海南',value: <%=data.getMap2("海南")%> },{name: '台湾',value: <%=data.getMap2("台湾")%> },  
        {name: '香港',value: <%=data.getMap2("香港")%> },{name: '澳门',value: <%=data.getMap2("澳门")%> }  
    ];}
	else{
	 mydata = [  
                {name: '北京',value: <%=data.getMap("北京")%> },{name: '天津',value: <%=data.getMap("天津")%> },  
                {name: '上海',value: <%=data.getMap("上海")%> },{name: '重庆',value: <%=data.getMap("重庆")%> },  
                {name: '河北',value: <%=data.getMap("河北")%> },{name: '河南',value: <%=data.getMap("河南")%> },  
                {name: '云南',value: <%=data.getMap("云南")%> },{name: '辽宁',value: <%=data.getMap("辽宁")%> },  
                {name: '黑龙江',value: <%=data.getMap("黑龙江")%> },{name: '湖南',value: <%=data.getMap("湖南")%> },  
                {name: '安徽',value: <%=data.getMap("安徽")%> },{name: '山东',value: <%=data.getMap("山东")%> },  
                {name: '新疆',value: <%=data.getMap("新疆")%> },{name: '江苏',value: <%=data.getMap("江苏")%> },  
                {name: '浙江',value: <%=data.getMap("浙江")%> },{name: '江西',value: <%=data.getMap("江西")%> },  
                {name: '湖北',value: <%=data.getMap("湖北")%> },{name: '广西',value: <%=data.getMap("广西")%> },  
                {name: '甘肃',value: <%=data.getMap("甘肃")%> },{name: '山西',value: <%=data.getMap("山西")%> },  
                {name: '内蒙古',value: <%=data.getMap("内蒙古")%> },{name: '陕西',value: <%=data.getMap("陕西")%> },  
                {name: '吉林',value: <%=data.getMap("吉林")%> },{name: '福建',value: <%=data.getMap("福建")%> },  
                {name: '贵州',value: <%=data.getMap("贵州")%> },{name: '广东',value: <%=data.getMap("广东")%> },  
                {name: '青海',value: <%=data.getMap("青海")%> },{name: '西藏',value: <%=data.getMap("西藏")%> },  
                {name: '四川',value: <%=data.getMap("四川")%> },{name: '宁夏',value: <%=data.getMap("宁夏")%> },  
                {name: '海南',value: <%=data.getMap("海南")%> },{name: '台湾',value: <%=data.getMap("台湾")%> },  
                {name: '香港',value: <%=data.getMap("香港")%> },{name: '澳门',value: <%=data.getMap("澳门")%> }  
            ];
	}
       var optionMap = {  
                backgroundColor: '#FFFFFF',  
                title: {  
                   text: '',  
                    subtext: '',
                    x:'center'  
                },  
                tooltip : {  
                    trigger: 'item'  
                },  
                
                //左侧小导航图标
                visualMap: {  
                    show : true,  
                    x: 'left',  
                    y: 'center',  
                    splitList: [   
                        {start: 10000},{start: 1000, end: 9999},  
                        {start: 100, end: 999},{start: 10, end: 99},  
                        {start: 1, end: 9},{start: 0, end: 0},  
                    ],  
                    color: ['#690902', '#b61004', '#eb2517','#ef6056', '#ed9791', '#ffffff']  
                },  
               
                //配置属性
                series: [{  
                    name: '确诊',  
                    type: 'map',  
                    mapType: 'china',   
                    roam: true,  
                    label: {  
                        normal: {  
                            show: true  //省份名称  
                        },  
                        emphasis: {  
                            show: false  
                        }  
                    },  
                    data:mydata  //数据
                } 
                   ]  
            };  
        //初始化echarts实例
	myChart.clear();
        //使用制定的配置项和数据显示图表
     myChart.setOption(optionMap);
	 myChart.on('click', function (params) {
            	var name = params.name;
            	document.write(name);
            	showEcharts(1);
	window.location.href="http://localhost:8080/InfectStaticTest1/varytrend.html";

        });
					  }
		showEcharts(0);
		var btn1 =document.getElementById("left");
		var btn2 =document.getElementById("right");
		btn1.onclick=function(){
			btn1.setAttribute("style","background-color:#efefef");
			btn2.setAttribute("style","background-color:#d6d1d0");
			showEcharts(0);
		}
		btn2.onclick=function(){
			btn1.setAttribute("style","background-color:#d6d1d0");
			btn2.setAttribute("style","background-color:#efefef");
			showEcharts("1");
		}
    </script>
</body>
</html>