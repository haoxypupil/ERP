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
  							$("#puducttab").datagrid({
  								url:"puduct.do?pagePuduct",
  								 pagination:true, //页码
							    // fit:true,
							     fitColumns:true,
							     loadMsg:'请等待....',
							     striped:true,
							     columns:[[{
							     				field:'pid',
										        title:'编号',
										        checkbox:true,
										        width:100
								        },{
										        field:'pname',
										        title:'名称',
										        width:100
								        },{
										        field:'pstandard',
										        title:'规格',
										        width:100
								        },{
										        field:'suname',
										        title:'供应商',
										        width:100,
										        formatter:function(value,row, index){
													return row.supplier.suname ;
												}
								        },{
										        field:'price',
										        title:'单价(元)',
										        width:100
								        },{
										        field:'pnum',
										        title:'数量(件)',
										        width:100
								        },{
										        field:'XX',
										        title:'操作',
										        width:100,
											        formatter:function(value,row, index){
														return "<a href='javascript:update("+row.pid+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_edit.gif'>修改</a>"+
																		"&nbsp"+
																	"<a href='javascript:update2("+row.pid+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_detail.gif'>入库</a>"+
																		"&nbsp&nbsp"+
																	"<a href='javascript:delPuduct("+row.pid+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_del.gif'>删除</a>";
									        		}
		  						} ]], 	
		  						 toolbar : [ {
										iconCls : 'icon-add',
										handler : function() {
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
  								var pname = $("#pname").val();
  								var suname = $("#suname").val();
  								$("#puducttab").datagrid('load',{
				  						pname : pname,
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
		 						var pid = $("#win #pid").val();
		 						var pname = $("#win #pname").val();	
		 						var supplier = $("#win #supplier").combobox("getValue");
		 						var pstandard = $("#win #pstandard").val();	
		 						var price = $("#win #price").val();
		 						var pnum = $("#win #pnum").val();
		 						var pmark = $("#win #pmark").val();	
		 						var mdata = {
		 							"pid" : pid,
		 							"pname" : pname,
		 							"suid" : supplier,
		 							"pstandard" : pstandard,
		 							"price" : price,
		 							"pnum" : pnum,
		 							"pmark" : pmark
 								};
			 					var mess = "";
			 					if(pid==null || pid==""){
			 						mess = "添加";
			 					}else{
			 						mess = "修改";
			 					}
						alert(mess);
						$.ajax({
							url : 'puduct.do?addOrUpdate',
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
									$("#puducttab").datagrid('reload');
								}
							}
						});		
 					});	
 					
 					//win2窗口设置
 						$("#win2").window({
								width : 600,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : false,
								inline : true
							});	
			     			$("#win2").window('close');
			     	
			     	//win2 入库窗口按钮
			     	$("#saveBtn2").click(function(){
		 						var pid = $("#win2 #pid").val();
		 						var pname = $("#win2 #pname").val();	
		 						var innum = $("#win2 #innum").val();	
		 						var supplier = $("#win2 #supplier").combobox("getValue");
		 						var pstandard = $("#win2 #pstandard").val();	
		 						var price = $("#win2 #price").val();
		 						var pnum = $("#win2 #pnum").val();
		 						var total = $("#win2 #total").val();
		 						var pmark = $("#win2 #pmark").val();	
		 						var mdata = {
		 							"pid" : pid,
		 							"innum" : innum,							
 								};	
 								var redata = {
 									"rename" : pname,
 									"resupplier" : supplier,
		 							"renum" : innum,
		 							"restandard" :pstandard,
		 							"reprice" : price,
		 							"retotal" : total,
		 							"remark" : pmark	
 								};
			 					var mess = "";
			 					if(innum==null || innum==""){
			 						mess = "请填写数量";
			 					}else{
			 						mess = "请确认需要入库的数量";
			 					};
							var mes = confirm(mess);
							if(mes==true){
								$.ajax({
									url : 'puduct.do?updateNum',
									data : mdata,
									type : 'POST',
									success:function(result){
										if(result=='ok'){
										$.ajax({
											url : 'receipt.do?addReceipt',
											data : redata,
											type : 'POST',
											success:function(result){
												if(result=='ok'){
													$("#myform2").form('clear');
													$("#win2").window('close');
													$.messager.show({
														title : '消息',
														msg:"入库成功",
														timeout:3000,
														showType:'slide'
													});
												}
											}
										});
											$("#puducttab").datagrid('reload');
										}
									}
								});	
								
						};	
 					});		
				
  				});
  				
  				function update(pid){
  		
  							$("#win").window('open');
							$("#win").window({
								title : '修改',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#puducttab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						
	  						$("#myform").form('load',{
	  								pid : row.pid,
	  								pname : row.pname,
	  								pstandard : row.pstandard,
	  								supplier : row.supplier.suname,
	  								price : row.price,
	  								pnum : row.pnum,
	  								pmark : row.pmark
  							});		
  							
  							//添加或者修改成功重写加载数据
							$("#puducttab").datagrid('reload');
  			
  				};	
  				//入库
  				function update2(pid){
							
  							$("#win2").window('open');
							$("#win2").window({
								title : '入库',
							});
							//获取当前选中的datagrid的整行对象
						var row2 = $("#puducttab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
	  						$("#myform2").form('load',{
	  								pid : row2.pid,
	  								pname : row2.pname,
	  								pstandard : row2.pstandard,
	  								supplier : row2.supplier.suname,
	  								price : row2.price,
	  								pnum : row2.pnum,
	  								pmark : row2.pmark
  							});		
  							//添加或者修改成功重写加载数据
							$("#puducttab").datagrid('reload');
  				
  				};			
  				
  				function delPuduct(pid){
  						var row3 = $("#puducttab").datagrid('getSelected');
  						var mdata = {
		 							"pid" : row3.pid,
		 							"pnum" : row3.pnum
 						};
 						var mes = "";
 						
  						if(row3.pnum>0){
  							 confirm("因有余量，不可删除");							 
  						}else{
  							mes = "确认删除此条信息？";
  							var m = confirm(mes);
  						}
  						if(m==true){
							$.ajax({
									url : 'puduct.do?delPuduct&pid='+pid,
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
											$("#puducttab").datagrid('reload');
										}
									} 
							});
						}
  					}
  					
  						//自动计算总金额
  				function checkInt(innum){
  			 	    var price = $("#win2 #price").val();
  					var innum = $("#win2 #innum").val();			
  					var total = $("#win2 #total").val();
						total = price * innum; 
						$("#myform2").form('load',{
	  								total : total,
  							});		
  							//添加或者修改成功重写加载数据
							$("#puducttab").datagrid('reload');	
  				}
  				
 
  </script>
 </head>
  
  <body class="easyui-layout">  
	
    <div data-options="region:'center',title:'查询产品信息' "  style="padding:5px;background:#eee;">
				<label>名称:</label> 
						<input id="pname" name="pname">
				 		供应商:
						<input id="suname" name="suname" type="text" style="width: 128">
						
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>

    						<table id="puducttab"></table>	
						
						<!-- 弹出窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>产品名称:</label></td>	
									 <td>
										 <input type="hidden" id="pid" name="pid">
										 <input type="text" id="pname" name="pname">
									</td>
									<td><label>供应商:</label></td>
									<td>
											<input id="supplier" class="easyui-combobox"
												name="supplier"
												data-options="
								    				url:'supp.do?findsupplist',   
										    		valueField:'suid',   
										    		textField:'suname',
										    		panelHeight:'auto'">
									</td>
								</tr>
								
								<tr>
										<td><label>产品规格:</label></td>	
										 <td>
												 <input type="text" id="pstandard" name="pstandard">
										</td>
										<td>
												<label>产品数量:</label>
										</td>
										<td>
												<input type="text" id="pnum" name="pnum">
										</td>
								</tr>
									
								<tr>
										<td>
												<label>产品单价:</label>
										</td>
										<td>
												<input type="text" id="price" name="price">
										</td>
										<td><label>备注:</label></td>	
										<td>
											 <input type="text" id="pmark" name="pmark">
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
						
						<!-- 进货窗口 -->
						
						<div id="win2" style="padding: 10px;">
								<form id="myform2" name="myform2" method="post">
								<table>
								<tr>
									<td><label>产品名称:</label></td>	
									 <td>
										 <input type="hidden" id="pid" name="pid">
										 <input type="text" id="pname" name="pname" readonly="readonly">
									</td>
									<td><label>供应商:</label></td>
									<td>
											<input id="supplier" class="easyui-combobox"
												name="supplier"
												data-options="
								    				url:'supp.do?findsupplist',   
										    		valueField:'suid',   
										    		textField:'suname',
										    		panelHeight:'auto'">
									</td>
								</tr>
								
								<tr>
										<td><label>产品规格:</label></td>	
										 <td>
												 <input type="text" id="pstandard" name="pstandard" readonly="readonly">
										</td>
										<td>
												<label>产品数量:</label>
										</td>
										<td>
												<input type="text" id="pnum" name="pnum" readonly="readonly">
										</td>
								</tr>
									
								<tr>
										<td>
												<label>产品单价:</label>
										</td>
										<td>
												<input type="text" id="price" name="price">
										</td>
										<td><label>进货:</label></td>	
										<td>
											 <input type="text" id="innum" name="innum" blur ="checkInt(innum);" onchange="checkInt(innum)">
										</td>	
								</tr>
								
								<tr>
										<td>
												<label>产品总价:</label>
										</td>
										<td>
												<input type="text" id="total" name="total" value="0" readonly="readonly">
										</td>
										<td><label>备注:</label></td>	
										<td>
											 <input type="text" id="pmark" name="pmark">
										</td>	
								</tr>
								
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn2" class="easyui-linkbutton">提交</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
    </div>  
</body>  
</html>
