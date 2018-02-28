<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<link href="login/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />  
<link href="login/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="login/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<title>ERP/ v1.0</title>
<script type="text/javascript">
	$(function(){
		$("#kanbuq").click(function(event){
			$("#validateCode").attr("src","Number.jsp?ran"+Math.random());
			event.preventDefault();
			return false;	
		});
		  $("#login").click(function(){
		  	$(".form form-horizontal").form('clear');
		  	alert("q");
		  });
		
	});
	
</script>
</head>
<body class="easyui-layout">
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header" ><span>ERP管理系统</span></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="user.do?op=login" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont"></i></label>
        <div class="formControls col-xs-8">
          <input  name="uname" type="text" placeholder="账户" class="input-text size-L"/>
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont"></i></label>
        <div class="formControls col-xs-8">
          <input name="upwd" type="password" placeholder="密码" class="input-text size-L"/>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="verCode" class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:';}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img id="validateCode" src="Number.jsp" > <a id="kanbuq" href="javascript:void(0);">看不清，换一张</a> </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="login" name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input id="cancel" name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 上海侨平信息科技有限公司 by admin.v1.0</div>
<input id="msg" type="hidden" value="${msg}"/>
<c:if test="${msg!=null}">
	<script>
		$(function(){
			alert($("#msg").val());
		});
		   
	</script>
</c:if>
</body>
</html>