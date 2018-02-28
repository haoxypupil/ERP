	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>权限管理--角色管理</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="js/themes/default/easyui.css"type="text/css"></link>
<link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
<style type="text/css">
	*{margin: 0 auto;padding: 0;}
	a{text-decoration: none;}
	a:hover{text-decoration: underline;}
	li{list-style: none;}		
	
	#west{width:180px;text-align: center; }
	#west div{margin-top: 100px;text-align: center;}
	#west input{width: 120px;height: 28px;}
	#west p{line-height: 50px;}
	
	#center{background-color: #eee;}
	.tab{margin-top: 30px;}
	.tab td{height: 28px;text-align: center;}
	.pro{ background-color: #DBE7FD; width: 80px;}
	.td{font-size: 10px;text-align: left;}
	#roleName{height: 28px;}
	.parent,.son{vertical-align:middle;}
	
	.err_msg{color: red;font-size: 12px;}
	.ok_msg{color: green;font-size: 12px;}
</style>
<script type="text/javascript">
	$(function(){
		$("#roletab").datagrid({
			url:'role.do?findRolePage',
			pagination : true,
			fit : true,
			fitColumns : true,
			loadMsg : '请等待....',
			striped : true,
			nowrap:true,
			rownumbers:true,
			 columns:[[   
		        {field:'rid',title:'编号',width:100,align:'center'},   
		        {field:'rolename',title:'角色名',width:100,align:'center'},
		        {field:'xx',title:'编辑',width:100,
			        formatter: function(value,row,index){
			        		if(row.rid!=1){
				        		return "<a class='loan_ct_view_button easyui-linkbutton' href='javascript:updateRole("+row.rid+")' data-options=\"plain:true,iconCls:'icon-edit'\">编辑</a>"+
				        		"<a class='loan_ct_view_button easyui-linkbutton' href='javascript:delRole("+row.rid+")'  data-options=\"plain:true,iconCls:'icon-remove'\">删除</a>";
							}else{
								return "无操作";
							}
						}
				},
		    ]],
		   onLoadSuccess:function(data){  
       			 $('.loan_ct_view_button').linkbutton();
   			}  
		});
				$("#win").window({
						title:'新增角色',
						iconCls:'icon-save',
						width:350,
						height:500,
						minimizable:false,
						draggable:false,
						inline:true,
						resizable:false,
						model:true
				});
				$("#win").window("close");
				
				//查找
				$("#search").click(function(){
					var role_name=$("#west #rolename_").val();
					$("#roletab").datagrid('load',{
						rolename:role_name
					});
				});
				//取消--
				$("#cancel").click(function(){
					$("#west #rolename_").val("");
					$("#roletab").datagrid('load',{
						rname:null
					});
				});
				//新增
				$("#add").click(function(){
				$(".nameMsg").html("");
				var rid = $("#rid").val("");
				var rolename = $("#win  #rolename").val("");
					$("#win").window({title:'新增角色'});
					showWin();
				});
				
				$(".parent").live("click",function(){
					var is=$(this).get(0).checked;
					var $next=$(this).parent().parent().next().children().children();
					if(!is){
						for(;;){
							if($next.attr("class")=="son"){
								$next.get(0).checked=is;
								$next=$next.parent().parent().next().children().children();
							}
							if($next.attr("class")=="parent"){
								return;
							}
						}
					}
				});
		
				$(".son").live("click",function(){
					var is=$(this).get(0).checked;
					var flag=false;
					var $prev=$(this).parent().parent().prev().children().children();
					var $next=$(this).parent().parent().next().children().children();
					var $parent;
					for(;;){
						if($prev.attr("class")=="son"){
							var $prev=$prev.parent().parent().prev().children().children();
						}
						if($prev.attr("class")=="parent"){
							$parent=$prev;
							break;
						}
					}
					var $now=$parent.parent().parent().next().children().children();
					for(;;){
						/* if($now.attr("class")=="parent"){
							break;
						} */
						if($now.attr("class")=="son" ){
							if($now.get(0).checked==true){
								flag=true;
							}
						}else{
							break;
						}
						$now=$now.parent().parent().next().children().children();
					}
						$parent.get(0).checked=flag;
				});
				
				//新增角色的方法。。。。
				$("#saveBtn").click(function(){
					$.messager.confirm('提示', '确认提交?',function(r){
						if(r){
							submitForm();
						}
					});
				});		
				//焦点离开验证--添加窗口
				$("#rolename").blur(function(){
		     		nameChecked();
		     	});			
		});		
				function showWin(){
					$("#win").window('open');	
					$.ajax({
						url:'rights.do?findRights',
						type:'post',
						success:function(result){
							var tr="";
							for(var i=0;i<result.length;i++){
								var r=result[i];
								if(r.parentid==0){
									tr+="<tr><td class='td' style='text-align: left;'>"+
									r.rightsname+
									"<input type='checkbox' class='parent' name='rightsid' value='"+r.id+"'></td></tr>";
								}
								for(var j=0;j<result.length;j++){
									var r2=result[j];
									if(r.id==r2.parentid){
										tr+="<tr><td class='td retract' style='text-align: left;'>&nbsp;&nbsp;"+
										r2.rightsname+
										"<input type='checkbox' class='son' name='rightsid'  value='"+r2.id+"'></td></tr>";
									}
								}
							}
							$("#rightstab").html(tr);
						}
					});
				}
				
				
				//点击确定按钮事件方法--------------提交
				function submitForm(){	
					$('#myForm').form('submit', { 
						    url:'role.do?saveOrUpdateRole',  
						    onSubmit: function(){   
						    },   
						    success:function(data){ 
						        if(data=="true"){
						        	$("#myForm").form('clear');
						        	$("#win").window("close");
									$.messager.show({
										title:'消息',
										msg:'提交成功！',
										iconCls:'icon-save',
										timeout:3000,
										showType:'slide'
									});
						        	$("#roletab").datagrid('reload');    
						        }else{
						        	$.messager.show({
										title:'消息',
										msg:'提交失败！',
										iconCls:'icon-save',
										timeout:3000,
										showType:'slide'
									}); 
						        }
						    }   
						});  
			}
			
			//修改角色
				function updateRole(rid){
				$(".nameMsg").html("");
				$("#win").window({title:'编辑角色'});
					showWin();   //显示权限
					
					$.ajax({
						url:'role.do?findRoleById',
						type:'post',
						data:'rid='+rid,
						success:function(result){
							$("#rid").val(result.rid);
							$("#rolename").val(result.rolename);
							$("#rolename2").val(result.rolename);      //隐藏域，用来比较输入的和原数据库内数据
							var rights=result.rights;
							var $box=$("input[type='checkbox']");
							for(var i=0;i<rights.length;i++){
								$box.each(function(){								
									if($(this).val()==rights[i].id){
										$(this).attr("checked",true);
									}
								});
							}
						}
					});	
	}
			//删除角色的方法
			function delRole(rid){
				var row =$("#roletab").datagrid('getSelected');
				var rdata = {
					rid : row.rid 
				};
				$.messager.confirm('提示', '确认删除?',function(r){
						if(r){
							$.ajax({
								url : "role.do?delRole",
								data : rdata,
								type:'post',
								success:function(result){
									if(result==true){
										$("#myForm").form('clear');
							        	$("#win").window("close");
										$.messager.show({
											title:'消息',
											msg:'删除成功！',
											iconCls:'icon-delete',
											timeout:3000,
											showType:'slide'
											});
										$("#roletab").datagrid('reload'); 
									}else{
							        	$.messager.show({
											title:'消息',
											msg:'删除失败！',
											iconCls:'icon-delete',
											timeout:3000,
											showType:'slide'
										}); 
									}
								}
							});
						}
					});
			}
			
			//验证信息------------权限名
	 function nameChecked(){
     	var rolename=$("#win #rolename").val();
     	var rolename2 = $("#win #rolename2").val();
     	if(rolename==""){
     		$(".nameMsg").html("用户名不能为空！").addClass("err_msg").removeClass("ok_msg");
     		return false;
     	}
     	if(rolename !=rolename2){
     	$.ajax({
     		url:'role.do?nameCheck',
     		type:'post',
     		data:'rolename='+rolename,
     		success:function(result){
     			if(result=="no"){
     				$(".nameMsg").html("用户名已存在，请更换用户名！").removeClass("ok_msg").addClass("err_msg");
     				return false;
     			}else if(result=="ok"){
     				$(".nameMsg").html("验证通过。").addClass("ok_msg").removeClass("err_msg");
     				return true;
     			}
     		}
     	});
     	}
     }

</script>

  </head>
  
  <body>
	<div id="cc" class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west'" id="west">
			<div>
				<p>
					<label>角色名：</label>
					<input type="text" id="rolename_" />
				</p>
				
				<p>
					<a href="javascript:void()" id="search" class="easyui-linkbutton">查询</a>
					<a href="javascript:void()" id="cancel" class="easyui-linkbutton">取消</a>
				</p>
				<p>
					<br/>
					<a href="javascript:void()" id="about" class="easyui-linkbutton">关于</a>&nbsp;&nbsp;
					<a href="javascript:void()" id="add" class="easyui-linkbutton">新建</a>
				</p>
			</div>
		</div>
		<div data-options="region:'center'" id="center">
			<table id="roletab"></table>
			<div id="win">
				<form method="post" id="myForm">
					<table class="tab">
						<tr>
							<td class="pro">&nbsp;角色名</td>
							<td>
								<input type="hidden" id="rid" name="rid"/>
								<input type="text" id="rolename" name="rolename"/>
								<input type="hidden" id="rolename2" name="rolename2"/>
							</td>
						</tr>
							<tr><td class="td"></td><td class="nameMsg"></td></tr>
							<tr>
							<tr>
							<td class="pro">指定权限</td>
							<td>
								<table id="rightstab"></table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="javascript:void()" id="saveBtn" class="easyui-linkbutton">提交</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>



	</div>
</body>
</html>
