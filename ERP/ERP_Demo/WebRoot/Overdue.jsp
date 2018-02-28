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
  							$("#overtab").datagrid({
  								url:"overdue.do?findOverdueList",
  								 pagination:true, //页码
							     fit:false,
							     fitColumns:true,
							     loadMsg:'请等待....',
							     striped:true,
							      autoRowHeight:false,
							     columns:[[{
							     				field:'ovId',
										        title:'序号',
										       // checkbox:true,
										        width:100
								        },{
										        field:'ovCode',
										        title:'合同编号',
										        width:100
								        },{
										        field:'ovName',
										        title:'合同名称',
										        width:100
								        },{
										        field:'ovLocalecode',
										        title:'安装场所编码',
										        width:100 
								        },{
										        field:'ovUnit',
										        title:'签约单位',
										        width:120	       
								        },{
										        field:'ovInvoiceunit',
										        title:'开票单位',
										        width:120	       
								        },{
										        field:'ovPayunit',
										        title:'付款单位',
										        width:120	       
								        },{
										        field:'ovCycle',
										        title:'支付周期',
										        width:70,
										     formatter:function(value,row, index){
										        	if(row.ovCycle==1){
										        	return "季度付" ;
										        	}else if(row.ovCycle==2){
										        	return "半年付";
										        	}else if(row.ovCycle==3){
										        	return "年度付";
										        	}
												}
								       },{
										        field:'ovPaymoney',
										        title:'支付金额',
										        width:80
								        },{
										        field:'ovInvoicetype',
										        title:'开票类型',
										        width:60,
										        formatter:function(value,row,index){
										        	if(row.ovInvoicetype=='1'){
										        	return "普票" ;
										        	}else if(row.ovInvoicetype=='2'){
										        	return "专票";
										        	}
										        }
								        },{
										        field:'ovTime',
										        title:'逾期时间',
										        width:48   
								        },{
										        field:'XX',
										        title:'操作',
										         width:48,  
  												 formatter:function(value,row, index){
  												 		if(row.ovInvoicestatus=='0'){
																return "<a href='javascript:updateStatus("+row.ovId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_edit.gif'>开票</a>";
														}else{
																return "<a href='Collection.jsp;' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_detail.gif'>去收款</a>";
														}
									        	} 
								  }]]		  						
  							});
  							//搜索按钮
  							$("#sreach").click(function(){
  								var ovCode = $("#ovCode").val();
  								var ovName = $("#ovName").val();
  								var ovUnit = $("#ovUnit").val();
  								var ovInvoiceunit = $("#ovInvoiceunit").val();
  								var ovPayunit = $("#ovPayunit").val();
  								$("#overtab").datagrid('load',{
				  						ovCode : ovCode,
				  						ovName : ovName,
				  						ovUnit :ovUnit,
				  						ovInvoiceunit : ovInvoiceunit,
				  						ovPayunit :ovPayunit,
  								});		
  							});	
  							//重置
  							$("#reset").click(function(){
  							
  								$("#ovCode").val("");
  								$("#ovName").val("");
  								$("#ovUnit").val("");
  								$("#ovInvoiceunit").val("");
  								$("#ovPayunit").val("");
  								var ovCode =null;
  								var ovUnit = null;
  								var ovInvoiceunit = null;
  								var ovName = null;
								var ovPayunit = null;	
  							$("#overtab").datagrid('load',{
				  						ovCode : ovCode,
				  						ovName : ovName,				  						
				  						ovUnit : ovUnit,
				  						ovInvoiceunit : ovInvoiceunit,	
				  						ovPayunit : ovPayunit		  						
  								});						
  							});
  							//弹出窗口设置
  							$("#win").window({
								width : 700,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : false,
								inline : true
							});	
			     			$("#win").window('close');
					
  						
  						//开票提交
  						$("#saveBtn").click(function(){
  								var ovId = $("#win #ovId").val();
		 						var ovCode = $("#win #ovCode").val();
		 						var ovName = $("#win #ovName").val();
		 						var ovLocalecode = $("#win #ovLocalecode").val();
		 						var ovCycle = $("#win #ovCycle").combobox("getValue");
		 						var ovPaymethod = $("#win #ovPaymethod").combobox("getValue");		
		 						var ovUnit = $("#win #ovUnit").val();
		 						var ovInvoiceunit = $("#win #ovInvoiceunit").val();
		 						var ovPayunit = $("#win #ovPayunit").val();
		 						var ovPaymoney = $("#win #ovPaymoney").val();
		 						var ovInvoicetype = $("#win #ovInvoicetype").combobox("getValue");
 								var rdata = {
 									"ovId" : ovId,
 									"ovCode" : ovCode,
 									"ovName" : ovName,
 									"ovLocalecode" : ovLocalecode,
 									"ovPaymethod" : ovPaymethod,
 									"ovCycle" : ovCycle,
 									"ovUnit" : ovUnit,
 									"ovInvoiceunit" : ovInvoiceunit,
 									"ovPayunit" : ovPayunit,
 									"ovPaymoney" : ovPaymoney,
 									"ovInvoicetype" : ovInvoicetype,
 								};		
			 			$.messager.confirm('提示','请检查开票信息是否正确,确认开票?', function(r){
			 					if(r){
									$.ajax({
										url : 'overdue.do?updateInvoiceStatus',
										data : rdata,
										type : 'POST',
										success:function(result){
											if(result=='ok'){
													$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"开票成功，去收款",
														timeout:3000,
														showType:'slide'
													});
												$("#overtab").datagrid('reload');
											}else{
												$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"开票失败，请检查信息重试！",
														timeout:3000,
														showType:'slide'
													});
													$("#overtab").datagrid('reload');
											}
										}
									});
								}
						});				
  					});
  				});
  				
  				function updateStatus(ovId){
  							$("#win").window('open');
							$("#win").window({
								title : '发票信息',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#overtab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
							var data = {"localeCode" : row.ovLocalecode};
	  						$.ajax({
				     						url:'localeBI.do?findByCode',
				     						data :data,
				     						type:'POST',
				     						async:false,
				     						success:function(result){
				     							return localeName = result, ovLocalecode =row.ovLocalecode;
				     						},
				     						error:function(){
				     							return localeName = "无",ovLocalecode ="无";
				     						}
				     				});
	  						$("#myform").form('load',{
	  								ovId : row.ovId,
	  								ovCode : row.ovCode,
	  								ovName : row.ovName,
	  								ovLocalecode : row.ovLocalecode,
	  								ovCycle : row.ovCycle,
	  								ovPaymethod : row.ovPaymethod,
	  								ovUnit : row.ovUnit,	
	  								ovInvoiceunit : row.ovInvoiceunit,		
	  								ovPayunit : row.ovPayunit,
  									ovPaymoney : row.ovPaymoney,
  									ovInvoicetype : row.ovInvoicetype,		
	  								ovTime : row.ovTime,
	  								localeName :localeName
  								});	
  							//添加或者修改成功重写加载数据
							$("#overtab").datagrid('reload');
  				}	
  				
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
	
    <div data-options="region:'center',title:'收款情况统计'"  style="padding:5px;background:#eee;">

						<label>合同编码:</label>
						<input id="ovCode" name="ovCode">
						<label>合同名称:</label>
						<input id="ovName" name="ovName">
						<label>签约单位:</label>
						<input id="ovUnit" name="ovUnit">
						<label>开票单位:</label>
						<input id="ovInvoiceunit" name="ovInvoiceunit">
						<label>付款单位:</label>
						<input id="ovPayunit" name="ovPayunit">
						

						 
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
						<a href="javascript:void()"  id="reset" class="easyui-linkbutton">重置</a>
    						<table id="overtab"></table>	
						
						<!-- 弹出开票操作窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>合同编号:</label></td>	
									 <td>
										 <input type="hidden" id=ovId name="ovId">
										 <input type="text" id="ovCode" name="ovCode" readonly="readonly">
									</td>
										<td><label>合同名称:</label></td>
										<td>
 											<input type="text" id="ovName" name="ovName" readonly="readonly">
 											</td>
								</tr>
									<tr>
										<td><label>签约场所编码:</label></td>
										<td>
										<input id="ovLocalecode" type="text"  name="ovLocalecode" readonly="readonly"></input>  							
										</td>
										<td><label>付款周期:</label></td>
										<td>
												<select id="ovCycle"  name="ovCycle"  disabled="disabled" class="easyui-combobox" style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">季度付</option> 
												    <option value ="2">半年付</option> 
												    <option value ="3">年度付</option> 
												</select>   
										</td>
								</tr>
								
								<tr>
										<td><label>签约场所名称:</label></td>
										<td><input id="localeName" name="localeName"  readonly="readonly"  style="width:200px;"> </td>
										
										<td><label>支付方式:</label></td>
										<td>
												<select id="ovPaymethod"  name="ovPaymethod"  disabled="disabled" class="easyui-combobox" style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">转账</option> 
												    <option value ="2">现金</option> 
												    <option value ="3">其他</option> 
												</select>   
										</td>
								</tr>
								<tr>
										<td><label>签约单位:</label></td>
										<td>
												<input id="ovUnit" name="ovUnit"  readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>开票单位:</label></td>
										<td>
												<input id="ovInvoiceunit" name="ovInvoiceunit" readonly="readonly"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>付款单位:</label></td>
										<td>
												<input id="ovPayunit" name="ovPayunit"  readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>付款金额:</label></td>
										<td>
										<input id="ovPaymoney" name="ovPaymoney"  readonly="readonly" style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>开票类型:</label></td>
										<td>
												<select id="ovInvoicetype"  name="ovInvoicetype" disabled="disabled"  class="easyui-combobox" style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">普票</option> 
												    <option value ="2">专票</option> 
												</select>   
										</td>
										<td><label>逾期时间:</label></td>
										<td>
        										<input  id="ovTime"  name="ovTime"  type= "text"  disabled="disabled" class= "easyui-datebox" /> 
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
