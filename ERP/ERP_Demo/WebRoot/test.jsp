<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  	<link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
  	<link rel="stylesheet" href="js/themes/default/easyui.css" type="text/css"></link>
  	<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
  	
  	<script type="text/javascript">
function checkInt(o){ 
theV=isNaN(parseInt(o.value))?0:parseInt(o.value); 
if(theV!=o.value){o.value=theV;} 
txtTotal.value=txtAmount.value*txtPrice.value; 
} 

txtTotal.value=txtAmount.value*txtPrice.value; 

  </script>
 </head>
 <body>
数量: 
<input id=txtAmount value=0 onkeyup="checkInt(this);" onchange="checkInt(this);"> 
单价: 
<input id=txtPrice value=200 readonly="readonly"> 
总价: 
<input id=txtTotal value=0 style="border-right-width:0px;margin-right:0px;" readonly> 
</body>
</html>
