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
  							$("#recetab").datagrid({  //-查看入库信息----入库明细
  								url:"receipt.do?findRecePage",
  								 pagination:true, //页码
							     fit:true,
							     fitColumns:true,
							     loadMsg:'请等待....',
							     striped:true,
							     columns:[[{
							     				field:'reid',
										        title:'编号',
										        checkbox:true,
										        width:100
								        },{
										        field:'rename',
										        title:'产品名称',
										        width:100
								        },{
										        field:'restandard',
										        title:'产品规格',
										        width:100
								        },{
										        field:'resupplier',
										        title:'供应商',
										        width:100 
								        },{
										        field:'renum',
										        title:'数量(件)',
										        width:100
								        },{
										        field:'retotal',
										        title:'总金额',
										        width:100
								        },{
										        field:'redate',
										        title:'生成时间',
										        width:100
								        },{
										        field:'XX',
										        title:'操作',
										        width:100
										   /*       formatter:function(value,row, index){
													return "<a href='javascript:update("+row.reid+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_acti.gif'>订单处理</a>";
												  }		*/			        	
		  						} ]]		  						
  							});
  							//搜索按钮
  							$("#sreach").click(function(){
  								var rename = $("#rename").val();
  								var redateFrom = $("#redateFrom").datebox("getValue");
  								var redateTo = $("#redateTo").datebox("getValue");
  								$("#recetab").datagrid('load',{
				  						rename : rename,
				  						redateFrom : redateFrom,
				  						redateTo :redateTo
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
				});		
				//订单处理--确认
 				/*	$("#saveBtn").click(function(){
		 						var reid = $("#win #rid").val();
 								var rdata = {
 									"rid" : rid,
 									"rstatus" : 2
 								};	
			 				var mes = confirm("确认处理？");
			 					if(mes==true){
									$.ajax({
										url : 'requ.do?updateRequ',
										data : rdata,
										type : 'POST',
										success:function(result){
											if(result=='ok'){
													$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"订单处理成功",
														timeout:3000,
														showType:'slide'
													});
												$("#requtab").datagrid('reload');
											}
										}
									});
								}
  						});
  						
  						//订单废除
  						
  							$("#saveBtn2").click(function(){
		 						var rid = $("#win #rid").val();
		 						var pname = $("#win #rname").val();
		 						var rnum = $("#win #rnum").val();
 								var rdata = {
 									"rid" : rid,
 									"rstatus" : 3,
 								};		
 								var mdata = {
 									"pname" : pname,
 									"rnum" : rnum 
 								};
			 				var mes = confirm("确认废除？");
			 					if(mes==true){
									$.ajax({
										url : 'requ.do?updateRequ',
										data : rdata,
										type : 'POST',
										success:function(result){
											if(result=='ok'){
												$.ajax({
													url: 'puduct.do?backNum',
													data : mdata,
													type : 'POST',
													success:function(result){
														if(result=='ok'){
															$("#myform").form('clear');
															$("#win").window('close');
															$.messager.show({
																title : '消息',
																msg:"订单删除成功",
																timeout:3000,
																showType:'slide'
															});
															$("#requtab").datagrid('reload');
														}
													}
												});
											}
										}
									});				
								}
  						});
  				});

  				
  				
  				function update(rid){
  							$("#win").window('open');
							$("#win").window({
								title : '订单处理',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#recetab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
							
	  						$("#myform").form('load',{
	  								reid : row.reid,
	  								rename : row.rename,
	  								resupplier : row.resupplier,
	  								redate : row.redate,
	  								renum : row.renum,
	  								retotal : row.retotal,	
	  								retotal : row.retotal,		
  									remark : row.rmark
  								});	
  							//添加或者修改成功重写加载数据
							$("#recetab").datagrid('reload');
  				
  				};		
  				*/
  		/*		function checkInt(outnum){
  			 	    var price = $("#price").val();
  					var outnum = $("#outnum").val();			
  					var total = $("#total").val();
						total =price*outnum; 
						$("#myform").form('load',{
	  								total : total,
  							});		
  							//添加或者修改成功重写加载数据
							$("#puducttab").datagrid('reload');	
							$("#myform").datagrid('reload');	
  					}
  					
  					
  			*/		
  </script>
  </head>
  
  <body class="easyui-layout">  
	
    <div data-options="region:'center',title:'领料订单处理' "  style="padding:5px;background:#eee;">

						<label>订单名称:</label>
						<input id="rename" name="rename">
				 		<label>开始时间:</label>
						<input id="redateFrom" type="text" class="easyui-datebox"  name="redateFrom"></input>
						<label>结束时间:</label>
						<input id="redateTo" type="text" class="easyui-datebox"  name="redateTo"></input>
						 
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
    						<table id="recetab"></table>	
						
						<!-- 弹出窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>订单名称:</label></td>	
									 <td>
										 <input type="hidden" id="rid" name="rid">
										 <input type="text" id="rename" name="rename" disabled="disabled">
									</td>
										<td><label>供应商:</label></td>
										<td>
 											<input type="text" id="resupplier" name="resupplier" disabled="disabled">
 											</td>
								</tr>
								
								<tr>
										<td><label>订单生成时间:</label></td>
										<td>
										<input id="redate" type="text" class="easyui-datebox" name="redate"></input>  							
										</td>
										<td><label>订单数量:</label></td>
										<td>
												<input type="text" id="renum" name="renum" disabled="disabled">
										</td>
								</tr>
									
								<tr>
										<td><label>总金额:</label></td>
										<td>
												<input type="text" id="retotal" name="retotal" value="0" readonly="readonly">
										</td>
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn" class="easyui-linkbutton">确认发货</a>
											<a href="javascript:void()" id="saveBtn2" class="easyui-linkbutton">订单废除</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
    			</div>  
  </body>
</html>
