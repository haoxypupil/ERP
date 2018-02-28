<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
  <link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
  <link rel="stylesheet" href="js/themes/default/easyui.css" type="text/css"></link>
  <script type="text/javascript">
  						$(function(){
  								$("#divbag").mouseover(function(){
  										$("#divbag").css("background-color", "#CCC"); 
  								});
  								$("#divbag").mouseout(function(){
  										$("#divbag").css("background-color", "#FFF"); 
  								});
  						});
  </script>
  <style type="text/css">
	*{margin: 0 auto;padding: 0;}
	li{list-style: none;}
	a{text-decoration: none;display: block;}
	a:hover{cursor: pointer;}
	#north{height:50px;line-height: 50px;} 
	#south{text-align: center;line-height: 30px;height: 30px;overflow:hidden;}
	#west{width: 180px;}
	#west #sysFun .sysDiv{text-align: center;}
	#west #sysFun .sysDiv ul{margin-top: 20px;}
	#west #sysFun .sysDiv ul li{width:150px;height:30px; font-size: 14px;text-align: center;line-height: 30px;}
	#west #sysFun .sysDiv ul li a{color: green;" href="javascript:void();}
	#west #sysFun .sysDiv ul li a:hover{background-color:#A6EBFF;display:block; width: 100%;height: 100%}
	#center{background-color: #eee;}
	
   
		/* css---首页图片轮播  */
		*{margin:0; padding:0; list-style:none; }
	/*	body{ background:#fff; font:normal 12px/22px 宋体;  }*/
		img{ border:0;  }
	a{ text-decoration:none; color:#333;  }  

		/* 本例子css */
		.slideBox{ width:100%; height:100%; overflow:hidden; position:relative; border:1px solid #ddd;  }
		.slideBox .hd{ height:15px; overflow:hidden; position:absolute; right:5px; bottom:5px; z-index:1; }
		.slideBox .hd ul{ overflow:hidden; zoom:1; float:left;  }
		.slideBox .hd ul li{ float:left; margin-right:2px;  width:15px; height:15px; line-height:14px; text-align:center; background:#fff; cursor:pointer; }
		.slideBox .hd ul li.on{ background:#f00; color:#fff; }
		.slideBox .bd{ position:relative; height:100%; z-index:0;   }
		.slideBox .bd li{ zoom:1; vertical-align:middle; }
		.slideBox .bd img{ width:100%; height:100%; display:block;  }

		/* 下面是前/后按钮代码 */
		.slideBox .prev,
		.slideBox .next{ position:absolute; left:3%; top:50%; margin-top:-25px; display:block; width:32px; height:40px; background:url(image/slider-arrow.png) -110px 5px no-repeat; filter:alpha(opacity=50);opacity:0.5;   }
		.slideBox .next{ left:auto; right:3%; background-position:8px 5px; }
		.slideBox .prev:hover,
		.slideBox .next:hover{ filter:alpha(opacity=100);opacity:1;  }
		.slideBox .prevStop{ display:none;  }
		.slideBox .nextStop{ display:none;  } 
		
		#divbag{
				height: 35px;
				width: 135px;
				padding-top: 15px;
				padding-left: 40px;
				overflow: hidden;
		}
</style>
  <style type="text/css">
	.alink{ margin: 20 0 0 50} <!-- 20 0 0 50-->
</style>
<script type="text/javascript">
	$(function(){
		$(".alink a").click(function(){
			var text = $(this).text();
			var url = $(this).attr("title");
			add(text,url);
		});
		function add(text, url){
			if($("#show").tabs("exists",text)){
				$("#show").tabs("select",text);
			}else{
				$("#show").tabs("add",{
					title:text,
					closable:true,
					content:"<iframe src='"+url+"' frameborder='0' scrolling='yes' height='100%' width='100%'></iframe>"
				});
			}
		}
	});
</script>
  </head>
  
<body class="easyui-layout">
		<c:if test="${sys_user==null}">
		<script>
			location.href="login.jsp";
		</script>
		</c:if>
	<div data-options="region:'north'"
		style="height:30px;">
		<iframe name="topFrame" src="top.jsp" frameborder="0" scrolling="no" height="100%" width="100%" ></iframe>
		</div>		
	<div data-options="region:'south',split:true"
		style="height:40px;text-align: center;line-height: 30px;">
		Copyright @ 2017 - 2018  侨平版权所有
	</div>
	<div data-options="region:'west',title:'系统功能',split:true"
		style="width:200px;">
		<div id="sysFun" data-options="fit:true" class="easyui-accordion" >
			<c:forEach var="parentR" items="${sys_user.role.rights }">
				<c:if test="${parentR.parentid==0 }">
					<div title="${parentR.rightsname}">
						<c:forEach var="parentC" items="${sys_user.role.rights}">
							<c:if test="${parentC.parentid==parentR.id}">
								<div class="alink">
							<a href="javascript:void();" title="${parentC.url}"><h3>${parentC.rightsname}</h3></a>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div data-options="region:'center',title:'展示区域'"
		style="background:#eee;">
		<div id="show" class="easyui-tabs" data-options="fit:true" >
			<div title="首页">
			</div>
		</div>
	</div>
</body>
</html>
