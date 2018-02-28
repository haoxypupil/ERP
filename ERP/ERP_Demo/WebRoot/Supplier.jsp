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
  				$(function(){
  							$("#suppliertab").datagrid({
  								url:"supp.do?findSuppPage",
  								 pagination:true, //页码
							     fit:true,
							     fitColumns:true,
							     loadMsg:'请等待....',
							     striped:true,
							     columns:[[{
							     				field:'suid',
										        title:'编号',
										        checkbox:true,
										        width:100
								        },{
										        field:'suname',
										        title:'名称',
										        width:100
								        },{
										        field:'sucity',
										        title:'地址',
										        width:100
								        },{
										        field:'lname',
										        title:'等级',
										        width:100,
										        formatter:function(value,row,index){
													return row.sulevel.lname;
												}
								        },{
										        field:'suphone',
										        title:'联系电话',
										        width:100
								        },{
										        field:'XX',
										        title:'操作',
										        width:100,
											        formatter:function(value,row, index){
														return "<a href='javascript:update("+row.suid+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_edit.gif'>修改</a>"+
																	"&nbsp"+
																	"<a href='javascript:delSupplier("+row.suid+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_del.gif'>删除</a>";
									        		}
		  						} ]], 	
		  						 toolbar : [ {
										iconCls : 'icon-add',
										handler : function() {
										    $("#myform").form('clear');
											$("#myform").form('clear');
											$("#win").window('open');
											$("#win").window({
												title : '添加',
												iconCls : 'icon-add'
											});		
										}	
								}]
  							
  							});
  							//搜索按钮
  							$("#sreach").click(function(){
  								var suname = $("#suname").val();
  								$("#suppliertab").datagrid('load',{
				  						suname : suname,
  								});			
  							});	
  							//弹出窗口设置
  							$("#win").window({
								width : 600,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : false,
								inline : true
							});	
			     			$("#win").window('close');
			     			
			     		
			     		$("#saveBtn").click(function(){
		 						var suid = $("#win #suid").val();
		 						var suname = $("#win #suname").val();	
		 						var sulevel = $("#sulevel").combobox("getValue");
		 						var sucity = $("#win #sucity").val();	
		 						var suphone = $("#win #suphone").val();
		 						var sumark = $("#win #sumark").val();	
		 						var mdata = {
		 							"suid" : suid,
		 							"suname" : suname,
		 							"lid" : sulevel,
		 							"sucity" : sucity,
		 							"sumark" : sumark,
		 							"suphone" : suphone
 								};
			 					var mess = "";
			 					if(suid==null || suid==""){
			 						mess = "添加";
			 					}else{
			 						mess = "修改";
			 					}
						$.messager.confirm('提示','确认'+mess,function(r){
							if(r){
								$.ajax({
									url : 'supp.do?addOrUpdate',
									data : mdata,
									type : 'POST',
									success:function(result){
										if(result=='ok'){
											$("#myform").form('clear');
											$("#win").window('close');
											$.messager.show({
												title : '消息',
												msg:mess+"成功",
												timeout:3000,
												showType:'slide'
											});
										}
										$("#suppliertab").datagrid('reload');
										}
								});	
							}
						});
							
 					});		
  				});
  				
  				function update(suid){
  		
  							$("#win").window('open');
							$("#win").window({
								title : '修改',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#suppliertab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						
	  						$("#myform").form('load',{
	  								suid : row.suid,
	  								suname : row.suname,
	  								sulevel : row.sulevel.lid,
	  								sucity : row.sucity,
	  								suphone : row.suphone,
	  								sumark : row.sumark
  							});		
  							
  							//添加或者修改成功重写加载数据
							$("#suppliertab").datagrid('reload');
  			
  				};	
  				function delSupplier(suid){
  						var row = $("#suppliertab").datagrid('getSelected');
  						var mdata = {
		 							"suid" : row.suid,
 						};
  							$.messager.confirm('提示', '不可删除！');//---无条件限制，供应商暂时不可删除
  						if(mm==true){
							$.ajax({
									url : 'supp.do?delSupplier&suid='+suid,
									type : 'POST',
									success:function (result){
										if(result=="ok"){
			  								$("#myform").form('clear');
											$("#win").window("close");
												$.messager.show({
													title:'消息',
													msg:"删除成功",
													timeout:3000,
													showType:'slide'
												});
												//添加或者修改成功重写加载数据
											$("#suppliertab").datagrid('reload');
										}
									} 
							});
						}
  				}
  				
 
  </script>
 </head>
  
  <body class="easyui-layout">  
	
    <div data-options="region:'center',title:'查询供应商信息' "  style="padding:5px;background:#eee;">
				<label>供应商名称:</label> 
				
						<input id="suname" name="suname" type="text" style="width: 128">
						
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>

    						<table id="suppliertab"></table>	
						
						<!-- 弹出窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>供应商名称:</label></td>	
									 <td>
										 <input type="hidden" id="suid" name="suid">
										 <input type="text" id="suname" name="suname">
									</td>
									<td><label>供应商等级:</label></td>
									<td>
											<input id="sulevel" class="easyui-combobox"
												name="sulevel"
												data-options="
								    				url:'level.do?findLevellist',   
										    		valueField:'lid',   
										    		textField:'lname',
										    		panelHeight:'auto'">
										    		
									</td>
								</tr>
								
								<tr>
										<td><label>地址	:</label></td>	
										 <td>
												 <input type="text" id="sucity" name="sucity">
										</td>
										<td>
												<label>联系电话:</label>
										</td>
										<td>
												<input type="text" id="suphone" name="suphone">
										</td>
								</tr>
								
								<tr>
										<td><label>备注	:</label></td>	
										 <td>
												 <input type="text" id="sumark" name="sumark">
										</td>
								</tr>	
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn" class="easyui-linkbutton">提交</a>
										</td>
									</tr>
									</table>
								</form>
						</div>	
    </div>  
</body>  
</html>
