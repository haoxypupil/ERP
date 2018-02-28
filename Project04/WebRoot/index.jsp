<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	<script type="text/javascript" src="js/jquery-1.8.3.js"></script> 
	<script type="text/javascript">
		$(function(){
			console.log("ok");
			$.ajax({
				url:"web.do?findMap",
				type:'POST',
				success:function(result){
					webList = result;
					console.log(webList);
					
					var tab = "<table>";
					tab += "<tr><td>序号</td><td>名称</td><td>url地址</td><td>排名</td><td>国家</td></tr>";
					for(var i = 0;i<webList.length;i++){
						opt = webList[i];
						tab += "<tr><td>"+(i+1)+"</td><td>"+opt.w_name+"</td><td>"+opt.w_url+"</td><td>"+opt.w_alexa+"</td><td>"+opt.w_country+"</td></tr>";
					}
					tab += "</table>";
					$("#showWin").html(tab);
					
				}
			
			});
			
			
			$.ajax({
				url:"web.do?findMap22",
				type:'POST',
				success:function(result){
					webList2 = result;
					console.log(webList2);
					
					var tab2 = "<table>";
					tab2 += "<tr><td>序号</td><td>名称</td><td>url地址</td><td>排名</td><td>国家</td></tr>";
					for(var i = 0;i<webList2.length;i++){
						opt = webList2[i];
						tab2 += "<tr><td>"+(i+1)+"</td><td>"+opt.name+"</td><td>"+opt.url+"</td><td>"+opt.alexa+"</td><td>"+opt.country+"</td></tr>";
					}
					tab2 += "</table>";
					$("#showWin2").html(tab2);
					
				}
			
			});
		
		
//		alert("12312");
	//	$("#showWin").html("<tr><td>序号</td><td>名称</td><td>url地址</td><td>排名</td><td>国家</td></tr>");
		
		$("#inputVal").val("");
		});
	
	
	
		console.log("javascript");
		
		
		function clickBtn(){
			
			var inpVal = $("#inputVal").val();
			var dat = {"wid":inpVal};
			console.log(dat);
			console.log(typeof dat );
			
			//转换为json字符串
			var jsonstr = JSON.stringify(dat);
			console.log(jsonstr);
			console.log(typeof jsonstr);
			$.ajax({
				url:'web.do?findById2',
				type:'POST',
				data:dat,
				success:function(result){
					wl = result;
					console.log(result);
					var tab3 = "<table>";
					tab3 += "<tr><td>序号</td><td>名称</td><td>url地址</td><td>排名</td><td>国家</td></tr>";
					for (var i = 0;i<wl.length; i++){
						opt = wl[i];
						tab3 += "<tr><td>"+(i+1)+"</td><td>"+opt.name+"</td><td>"+opt.url+"</td><td>"+opt.alexa+"</td><td>"+opt.country+"</td></tr>";
					}
					tab3 += "</table>";
					$("#showWin3").html(tab3);
					
				}
			
			});
		
		};
		
		
		
		/*
		$(document).ready(function(){
				if(window.XMLHttpRequest){
				xmlhttp = new XMLHttpRequest();
					
				}else{
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");	
				}
				
				xmlhttp.onreadystatechange = function(){
					
					if(xmlhttp.readyState==4 && xmlhttp.status==200){	
						//alert(xmlhttp.responseText)	
						//location.reload();
						webList = result;
						console.log("show datatable");
						
						var tab = "<table>";
						tab += "<tr><td>序号</td><td>名称</td><td>url地址</td><td>排名</td><td>国家</td></tr>";
						for(var i = 0;i<webList.length;i++){
							opt = webList[i];
							tab += "<tr><td>"+(i+1)+"</td><td>"+opt.wname+"</td><td>"+opt.wurl+"</td><td>"+opt.walexa+"</td><td>"+opt.wcountry+"</td></tr>";
						}
						tab += "</table>";
						//$("#showWin").html(tab);
						document.getElementById("showWin").html(tab);
					}	
				}
			xmlhttp.open("POST","web.do?findMap",true);
			xmlhttp.send();	
			
			
			console.log("yes");
		})
*/

		
	
	</script>
	
	
  </head>
  
  <body>
    <div id="showWin">
    </div>
    <br>
	<hr>
    <div id="showWin2">
    
    </div>
     <br>
	<hr>
    <div>
    	<br>
    	<input type="text" id="inputVal" name ="inputVal" >
    	<input type="button" id="subBtn" value="search" onclick="clickBtn()">
    	<div id="showWin3">
    	
    	</div>
    </div>
  </body>
</html>
