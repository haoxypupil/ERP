<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>My JSP 'UsersManagement.jsp' starting page</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" href="js/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>

<style type="text/css">
	*{margin: 0 auto;padding: 0}
	a{text-decoration: none;}
	a:hover{text-decoration: underline;}
	li{list-style: none;}
	
	#east{width:180px;text-align: center; }
	#east div{margin-top: 100px;text-align: center;}
	input{width: 120px;height: 28px;}
	#east p{line-height: 50px;}
	
	#center{background-color: #eee;}
	.tab{margin-top: 30px;}
	.tab td{width: 100px;height: 28px;text-align: center;border: 10px;}
	.tab input {width: 200px;}
	.pro{ background-color: #DBE7FD;}
	.td{height: 8px;}
	.err_msg{color: red;font-size: 12px;}
	.ok_msg{color: green;font-size: 12px;}
	
	#updateWin input{text-align: center;}
</style>
<script type="text/javascript">
	$(function(){
		//焦点离开验证--添加窗口
		$("#uname").blur(function(){
     		nameChecked();
     	});
     	//添加窗口姓名验证
     	$("#username").blur(function(){
     		usernameChecked();
     	});
     	//添加窗口角色验证
     	$("#rid").click(function(){
     		roleChecked();
     	});
     	//添加窗口密码验证
     	$("#upwd").blur(function(){
     		pwdChecked();
     	});
     	//添加窗口确认密码验证
     	$("#repwd").blur(function(){
     		rePwdChecked();
     	});
///////////////////////////////////////
     	//离开焦点验证---修改窗口
     		//修改窗口用户名验证
     	$("#updateWin #uname").blur(function(){
     		nameChecked2();
     	});
     	//修改窗口密码验证
     	$("#updateWin #upwd").blur(function(){
     		pwdChecked2();
     	});
     	//修改窗口确认密码验证
     	$("#updateWin #rePassword").blur(function(){
     		rePwdChecked2();
     	});
     	//修改窗口姓名验证
     	$("#updateWin #username").blur(function(){
     		usernameChecked2();
     	});
     	//修改窗口角色验证
     /*	$("#updateWin #role").blur(function(){
     		roleChecked2();
     		alert("");
     	});
     */
		//////////////////////////////////////////////////////////
		
		$("#addWin").window({
			title:'新增用户',
			iconCls:'icon-save',
			width:350,
			height:400,
			minimizable:false,
			draggable:true,
			inline:true,
			resizable:false,
			modal:true,
			closable:true,
			shadow:true
		});	
		
		$("#addWin").window("close");
		
		$("#updateWin").window({
			title:'修改用户',
			iconCls:'icon-save',
			width:350,
			height:500,
			minimizable:false,
			draggable:true,
			inline:true,
			resizable:false,
			modal:true,
			closable:true,
			shadow:true
		});
		
		$("#updateWin").window("close");
		
		$("#add").click(function(){
				$(".nameMsg").html("");
		     	$(".usernameMsg").html("");
		     	$(".passwordMsg").html("");
		     	$(".repasswordMsg").html("");
				$("#saveForm").form('clear');
				$("#addWin").window('open');			
		});
		
		$("#usertab").datagrid({
			url:'user.do?pageUser',
			pagination : true,
			fit : true,
			fitColumns : true,
			loadMsg : '请等待....',
			striped : true,
			nowrap:true,
			rownumbers:true,
			 columns:[[   
		        {field:'uid',title:'编号',width:100,align:'center'},   
		        {field:'uname',title:'用户名',width:100,align:'center'},
		        {field:'username',title:'姓名',width:100,align:'center'},
		        {field:'role',title:'角色',width:100,align:'center', 
		        		formatter:function(value,row, index){
							return row.role.rolename;
				}},
		        {field:'XX',title:'编辑',width:100,
		        	formatter: function(value,row,index){
			        		return "<a class='loan_ct_view_button easyui-linkbutton' href='javascript:updateUser("+row.uid+");' data-options=\"plain:true,iconCls:'icon-edit'\">编辑</a>"+
			        		"<a class='loan_ct_view_button easyui-linkbutton' href='javascript:deleteUser("+row.uid+");'  data-options=\"plain:true,iconCls:'icon-remove'\">删除</a>";
					}
				},
		    ]],
		    onLoadSuccess:function(data){  
       			 $('.loan_ct_view_button').linkbutton();
   			}  
		});
		
		$("#search").click(function(){
			var uname=$("#suname").val();
			var username=$("#susername").val();
			$("#usertab").datagrid('load',{
				uname:uname,
				username : username
			});
		});
	
		$("#cancel").click(function(){
			$("#suname").val("");
			$("#susername").val("");
			$("#usertab").datagrid('load',{
				uname:null,
				uname:null
			});
		});
		
		//新增用户表单提交
		$("#saveBtn").click(function(){
			$.messager.confirm('提示', '确认新增?',function(r){
				if(r){
					$('#saveForm').form('submit',{   
					    url:'user.do?addUser', 
					    onSubmit: function(){   
					      /* if(nameChecked() && roleChecked() && pwdChecked() && rePwdChecked()&&usernameChecked){
					        	return true;
					        }
					      	 //   return false; */
					    },   
					    success:function(data){ 
					        if(data=="true"){
					        	$("#saveForm").form('clear');
					        	$("#addWin").window("close");
								$.messager.show({
									title:'消息',
									msg:'新增成功！',
									iconCls:'icon-save',
									timeout:3000,
									showType:'slide'
								});
					        	$("#usertab").datagrid('reload');    
					        }else{
					        	$.messager.show({
									title:'消息',
									msg:'新增失败！',
									iconCls:'icon-save',
									timeout:3000,
									showType:'slide'
								});
					        }
					    }   
					});  
				}
			});
		});
		
		//修改提交
		$("#updateBtn").click(function(){
			var uid = $("#updateWin #uid").val();
			var uname = $("#updateWin #uname").val();
			var upwd = $("#updateWin #upwd").val();
			var username = $("#updateWin #username").val();
	        var role = $("#updateWin #role").combobox("getValue");
			var udata ={
				"uid" : uid,
				"uname" : uname,
				"upwd" : upwd,
				"username" : username,
				"rid" : role
			};
			$.messager.confirm('提示', '确认修改?',function(r){
				if(r){
					$.ajax({
					    url:'user.do?updateUser', 
					    data : udata,
					    type: 'post',
					    success:function(data){ 
					        if(data=="ok"){
					        	$("#updateForm").form('clear');
					        	$("#updateWin").window("close");
								$.messager.show({
									title:'消息',
									msg:'修改成功！',
									iconCls:'icon-save',
									timeout:3000,
									showType:'slide'
								});	
					        	$("#usertab").datagrid('reload');    
					        }else{
					        	$.messager.show({
									title:'消息',
									msg:'修改失败！',
									iconCls:'icon-save',
									timeout:3000,
									showType:'slide'
								});
								$("#usertab").datagrid('reload');    
					        }
					    }   
					});  
				}
			});	
		});
		//关于按钮
		$("#about").click(function(){
			$.messager.alert('关于','版本号：1.0.3');
		});
	});

		//修改用户
		 function updateUser(uid){
		 		$(".nameMsg2").html("");
		     	$(".usernameMsg2").html("");
		     	$(".passwordMsg2").html("");
		     	$(".repasswordMsg2").html("");
				$("#updateForm").form('clear');
				$("#updateWin").window('open');
			//获取被选中行信息
			var row = $("#usertab").datagrid('getSelected');
				$("#updateForm").form('load',{
		  								uid : row.uid,
		  								uname : row.uname,
		  								rolename : row.role.rolename,
		  								uname2 : row.uname,
		  								username : row.username
	  							});		
					$("#usertab").datagrid('reload');
	     }
     
     //删除用户
     function deleteUser(uid){
		     	var row = $("#usertab").datagrid('getSelected');
  						var udata = {
		 				"uid" : row.uid
 						};
     	$.messager.confirm('提示', '确定要删除么?',function(r){
			if (r){
				$.ajax({
					url:'user.do?delUsers&uid='+uid,
					type:'post',
					data:'udata',
					success:function(result){
						if(result=="ok"){
							$.messager.show({
								title:'消息',
								msg:'删除成功！',
								iconCls:'icon-remove',
								timeout:3000,
								showType:'slide'
							});
				        	$("#usertab").datagrid('reload');    
				        }else{
				        	$.messager.show({
								title:'消息',
								msg:'删除失败！',
								iconCls:'icon-remove',
								timeout:3000,
								showType:'slide'
							});
				        }
					}
				});
			}
		});
     }
     

     
     //验证--------开始------------
     //验证用户名
     function nameChecked(){
     	var uname=$("#uname").val();
     	if(uname==""){
     		$(".nameMsg").html("用户名不能为空！").addClass("err_msg").removeClass("ok_msg");
     		return false;
     	}
     	$.ajax({
     		url:'user.do?userNameChecked',
     		type:'post',
     		data:'uname='+uname,
     		success:function(result){
     			if(result=="no"){
     				$(".nameMsg").html("用户名已存在，请更换用户名！").removeClass("ok_msg").addClass("err_msg");
     				return false;
     			}else if(result=="ok"){
     				$(".nameMsg").html("通过。").addClass("ok_msg").removeClass("err_msg");
     				return true;
     			}
     		}
     	});
     }
     //验证姓名
     function usernameChecked(){
     		var username=$("#username").val();
	     	if(username==""){
	     		$(".usernameMsg").html("用户名不能为空！").addClass("err_msg").removeClass("ok_msg");
	     		return false;
     		}else{
     			$(".usernameMsg").html("通过！").addClass("ok_msg").removeClass("err_msg");
     			return true;
     		}
     }
     //验证角色
     function roleChecked(){
     	//var role=$("").combobox("getValue");
     	return true;
     }
     //验证密码
     function pwdChecked(){
     	var upwd=$("#upwd").val();
     	var reg=/^\w{6,15}$/;
     	if(upwd==""){
     		$(".passwordMsg").html("密码不能为空！").removeClass("ok_msg").addClass("err_msg");
     		return false;
     	}
     	if(reg.test(upwd)==false){
     		$(".passwordMsg").html("密码6-15位，由数字、字母或下划线组成！").removeClass("ok_msg").addClass("err_msg");
     		return false;
     	}
     	$(".passwordMsg").html("通过。").removeClass("err_msg").addClass("ok_msg");
     	return true;
     }
     //再次输入密码验证
     function rePwdChecked(){
     	var rePwd=$("#repwd").val();
     	var upwd=$("#upwd").val();
     	if(rePwd!=upwd){
     		$(".rePasswordMsg").html("两次输入密码不匹配！").removeClass("ok_msg").addClass("err_msg");
     		return false;
     	}
     	$(".rePasswordMsg").html("通过。").removeClass("err_msg").addClass("ok_msg");
     		return true;
     }
     
     
     
     
     
     
     //修改验证
     //修改时用户名验证
	      function nameChecked2(){
					var uname=$("#updateWin #uname").val();
					var uname2=$("#updateWin #uname2").val();
						if(uname==""){
			     		$(".nameMsg2").html("用户名不能为空！").addClass("err_msg").removeClass("ok_msg");
			     		return false;
			     		}
			     		if(uname!=uname2){
				     		$.ajax({
					     		url:'user.do?userNameChecked',
					     		type:'post',
					     		data:'uname='+uname,
					     		success:function(result){
					     			if(result=="no"){
					     				$(".nameMsg2").html("用户名已存在，请更换用户名！").removeClass("ok_msg").addClass("err_msg");
					     				return false;
					     			}else if(result=="ok"){
					     				$(".nameMsg2").html("通过。").addClass("ok_msg").removeClass("err_msg");
					     				return true;
					     			}
					     		}
					     	});
						}    
    			 } 
    			   //验证密码
     function pwdChecked2(){
			     	var upwd=$("#updateWin #upwd").val();
			     	var reg=/^\w{6,15}$/;
			     	if(upwd==""){
			     		$(".passwordMsg2").html("密码不能为空！").removeClass("ok_msg").addClass("err_msg");
			     		return false;
			     	}
			     	if(reg.test(upwd)==false){
			     		$(".passwordMsg2").html("密码6-15位，由数字、字母或下划线组成！").removeClass("ok_msg").addClass("err_msg");
			     		return false;
			     	}
			     	$(".passwordMsg2").html("通过。").removeClass("err_msg").addClass("ok_msg");
			     		return true;
     }
     //再次输入密码验证
     function rePwdChecked2(){
			     	var rePwd=$("#updateWin #rePassword").val();
			     	var upwd=$("#updateWin #upwd").val();
			     	if(rePwd!=upwd){
			     		$(".rePasswordMsg2").html("两次输入密码不匹配！").removeClass("ok_msg").addClass("err_msg");
			     		return false;
			     	}
			     	$(".rePasswordMsg2").html("通过。").removeClass("err_msg").addClass("ok_msg");
			     		return true; 		
     }
     	//验证姓名
      function usernameChecked2(){
		     		var username=$("#updateWin #username").val();
			     	if(username==""){
			     		$(".usernameMsg2").html("姓名不能为空！").addClass("err_msg").removeClass("ok_msg");
			     		return false;
		     		}else{
		     			$(".usernameMsg2").html("通过！").addClass("ok_msg").removeClass("err_msg");
		     			return true;
		     		}
     }
     //验证角色
     /*
     function roleChecked2(){
     	var role=$("#updateWin #role").combobox("getValue");
     	alert(role);
     		if(role==""){
	     		$(".roleIdMsg2").html("角色不能为空！").addClass("err_msg").removeClass("ok_msg");
	     		return false;
     		}else{
     			$(".roleIdMsg2").html("通过！").addClass("ok_msg").removeClass("err_msg");
     			return true;
     		}
     	return true;
     }
     */
  
     
     //验证--------结束------------
</script>
</head>

<body>
	<div id="cc" class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west'" id="east">
			<div>
				<p>
					<label>用户名：</label>
					<input type="text" id="suname" name="uname"/>
				</p>
				<p>
					<label>姓&nbsp名：</label>
					<input type="text" id="susername" name="username"/>
				</p>
				<p>
					<a href="javascript:void()" id="search" class="easyui-linkbutton">查询</a>
					<a href="javascript:void()" id="cancel" class="easyui-linkbutton">取消</a>
				</p>
				<p/>
				<p>
					<br/>
					<a href="javascript:void()" id="about" class="easyui-linkbutton">关于</a>&nbsp;&nbsp;
					<a href="javascript:void()" id="add" class="easyui-linkbutton">新建</a>
				</p>
			</div>
		</div>
		<div data-options="region:'center'" id="center">
			<table id="usertab"></table>
			<div id="addWin" >
				<form  method="post" id="saveForm">
					<table class="tab">
						<tr>
							<td class="pro">用户名</td>
							<td><input type="text" class="input" name="uname" id="uname" /></td>					
						</tr>
						<tr><td class="td"></td><td class="nameMsg"></td></tr>
						<tr>
							<td class="pro">姓名</td>
							<td><input type="text" class="input" name="username" id="username" /></td>
						</tr>
						<tr><td class="td"></td><td class="usernameMsg"></td></tr>
						<tr>
							<td class="pro">角色</td>
							<td>
								<input id="rid" class="easyui-combobox" name="rid"  style="height: 28px;width: 200px"
								data-options="
								url:'role.do?roleList',
								valueField:'rid',
								textField:'rolename',
								panelHeight:'auto'"/>	
							</td>
						</tr>
						<tr><td class="td"></td><td class="roleIdMsg"></td></tr>
						<tr>
							<td class="pro">密码</td>
							<td><input type="text" class="input" name="upwd" id="upwd"/></td>	
						</tr>
						<tr><td class="td"></td><td class="passwordMsg"></td></tr>
						<tr>
							<td class="pro">确认密码</td>
							<td><input type="text" class="input" id="repwd"/></td>
						</tr>
						<tr><td class="td"></td><td class="rePasswordMsg"></td></tr>
						<tr>
							<td colspan="4">
								<a href="javascript:void()" id="saveBtn" class="easyui-linkbutton">提交</a>
							</td>			
						</tr>
					</table>
				</form>
			</div>
			
			<!-- 修改窗口 -->
			<div id="updateWin" >
				<form  method="post" id="updateForm">
					<table class="tab">
						<tr>
							<td class="pro">用户名</td>
							<td>
								<input type="hidden" class="input"  name="uid" id="uid"/>
								<input type="text" class="input" name="uname" id="uname"/>
								<input type="hidden" class="input" name="uname2" id="uname2" />
							</td>
							</tr>
							<tr><td class="td"></td><td class="nameMsg2"></td></tr>
							<tr>
							<td  class="pro">现任角色</td>
								<td>
										<input type="text" id="rolename" name="rolename" readonly="readonly">
								</td>
						</tr>
							<tr><td class="td"></td><td class="rrMsg"></td></tr>
						<tr>
							<td class="pro">角色</td>
							<td>
								<input id="role" class="easyui-combobox" name="role"  style="height: 28px;width: 200px"
								data-options="
								url:'role.do?roleList',
								valueField:'rid',
								textField:'rolename',
								panelHeight:'auto'"/>	
							</td>
						</tr>
						<tr><td class="td"></td><td class="roleIdMsg2"></td></tr>
						<tr>
							<td class="pro">密码</td>
							<td><input type="text" class="input" name="upwd" id="upwd"/></td>
							
						</tr>
						<tr><td class="td"></td><td class="passwordMsg2"></td></tr>
						<tr>
							<td class="pro">确认密码</td>
							<td><input type="text" class="input" id="rePassword"/></td>
						</tr>
						<tr><td class="td"></td><td class="rePasswordMsg2"></td></tr>
						<tr>
							<td class="pro">姓名</td>
							<td><input type="text" class="input" id="username" name="username"/></td>
						</tr>
						<tr><td class="td"></td><td class="usernameMsg2"></td></tr>
						<tr>
							<td colspan="4">
								<a href="javascript:void()" id="updateBtn" class="easyui-linkbutton">提交</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>	
	</div>
</body>
</html>
