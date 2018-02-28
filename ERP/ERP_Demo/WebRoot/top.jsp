<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>ERP仓库管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
	*{margin: 0 auto;padding: 0;}
	a{text-decoration: none;margin-right: 20px;}
		
		#head { 
		width:100%;
		height:100%;
		background-size: 100% auto;
		overflow: hidden;
	}
	#user{
		position : absolute;
		right:20px;
		top:10px;
	}
	#clock{	
		position : absolute;
		right:300px;
		top:10px;
		font-size: 12px;
	}
	p{
		font-size: 14px;
		margin-top:5px;
		margin-left: 10px;
		font-weight: bold;
		font-style: italic;
	}
</style>

<script type="text/javascript">
	function exit(){
		if(confirm("确定要退出么？")){
			window.open('login.jsp','_top');
		}
	};
	function realSysTime(clock){ 
		var now=new Date(); //创建Date对象 
		var year=now.getFullYear(); //获取年份 
		var month=now.getMonth(); //获取月份 
		var date=now.getDate(); //获取日期 
		var day=now.getDay(); //获取星期 
		var hour=now.getHours(); //获取小时 
		if(hour<10){hour = "0"+hour;}///////////格式美化-
		var minu=now.getMinutes(); //获取分钟 
		if(minu<10){minu = "0"+minu;}///////////格式美化
		var sec=now.getSeconds(); //获取秒钟 
		if(sec<10){sec = "0"+sec;}///////////格式美化
		month=month+1; 
		var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); 
		var week=arr_week[day]; //获取中文的星期 
		var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间 
		clock.innerHTML=time; //显示系统时间 
	} 
		window.onload=function(){ 
		window.setInterval("realSysTime(clock)",1000); //实时获取并显示系统时间 
	};
</script>
</head>

<body>


<table id="head">
			<p>上海侨平信息科技有限公司ERP管理系统</p>
<tr id="tr">
		<td id="clock"/>
		<td  id="user" width="25%" align="right" style="font-size:12px;" >当前用户：<span style="color: blue;font-weight: bold;font-size: 14px;">${sys_user.username }</span>（${sys_user.role.rolename} ）&nbsp;&nbsp;
		<a href="javascript:void(0)" onclick="exit()">退出系统</a> 
	</td>
</tr>
</table>

</body>
</html>

