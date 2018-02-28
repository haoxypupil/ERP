<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <head>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  	<link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
  	<link rel="stylesheet" href="js/themes/default/easyui.css" type="text/css"></link>
  	<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
  	
  	<script type="text/javascript">
		$(function(){
  							$("#recordtab").datagrid({
  								url:"contract.do?findInvoiceStatusto1List",
  								 pagination:true, //页码
							     fit:false,
							     fitColumns:true,
							     loadMsg:'请等待....',
							     striped:true,
							      autoRowHeight:false,
							     columns:[[{
							     				field:'inId',
										        title:'序号',
										        //checkbox:true,
										        width:100,
										         formatter:function(value,row, index){
												return "<a href='javascript:updateStatus("+row.inId+");' style='text-decoration:none;color:#000000;'><img  src='js/themes/icons/search.png'>详细</a>";
									        	} 
								        },{
										        field:'inConcode',
										        title:'合同编号',
										        width:100
								        },{
										        field:'inConname',
										        title:'合同名称',
										        width:100
								        },{
										        field:'inLocalecode',
										        title:'安装场所编码',
										        width:100 
								        },{
										        field:'inConunit',
										        title:'签约单位',
										        width:120	       
								        },{
										        field:'inInvoiceunit',
										        title:'开票单位',
										        width:120	       
								        },{
										        field:'inPayunit',
										        title:'付款单位',
										        width:120	       
								        },{
										        field:'inCycle',
										        title:'支付周期',
										        width:70,
										     formatter:function(value,row, index){
										        	if(row.inCycle==1){
										        	return "季度付" ;
										        	}else if(row.inCycle==2){
										        	return "半年付";
										        	}else if(row.inCycle==3){
										        	return "年度付";
										        	}
												}
								       },{
										        field:'inPaymoney',
										        title:'支付金额',
										        width:80
								        },{
										        field:'inInvoicetype',
										        title:'开票类型',
										        width:60,
										        formatter:function(value,row,index){
										        	if(row.inInvoicetype=='1'){
										        	return "普票" ;
										        	}else if(row.inInvoicetype=='2'){
										        	return "专票";
										        	}
										        }
								        },{
										        field:'inPaytime',
										        title:'付款时间',
										        width:48   
								        },{
										        field:'XX',
										        title:'操作',
										        width:80  
  											/*	 formatter:function(value,row, index){
												return "<a href='javascript:updateStatus("+row.inId+");' style='text-decoration:none;color:#000000;'><img  src='js/themes/icons/search.png'>详细</a>";
									        	}
									        */ 
								  }]]		  						
  							});
  							//搜索按钮
  							$("#sreach").click(function(){
  								var inConcode = $("#inConcode").val();
  								var inConname = $("#inConname").val();
  								var inConunit = $("#inConunit").val();
  								var inInvoiceunit = $("#inInvoiceunit").val();
  								var inPayunit = $("#inPayunit").val();
  								var timeFrom = $("#timeFrom").datebox("getValue");	
  								var timeTo = $("#timeTo").datebox("getValue");	
  								$("#recordtab").datagrid('load',{
				  						inConcode : inConcode,
				  						inConname : inConname,
				  						inConunit :inConunit,
				  						inInvoiceunit : inInvoiceunit,
				  						inPayunit :inPayunit,
				  						timeFrom : timeFrom,
				  						timeTo : timeTo,
  								});		
  							});	
  							//重置
  							$("#reset").click(function(){
  							
  								$("#inConcode").val("");
  								$("#inConname").val("");
  								$("#inConunit").val("");
  								$("#inInvoiceunit").val("");
  								$("#inPayunit").val("");
  								$("#timeFrom").datebox('clear');	
  								$("#timeTo").datebox('clear');	
  								var inConcode =null;
  								var inConname = null;
  								var inConunit = null;
  								var inInvoiceunit = null;
								var inPayunit = null;	
								var timeFrom = null;
								var timeTo = null;
  							$("#recordtab").datagrid('load',{
				  						inConcode : inConcode,
				  						inConname : inConname,				  						
				  						inConunit : inConunit,
				  						inInvoiceunit : inInvoiceunit,	
				  						inPayunit : inPayunit,
				  						timeFrom : timeFrom,
				  						timeTo : timeTo		  						
  								});						
  							});
  							//弹出窗口设置
  							$("#win").window({
								width : 700,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win").window('close');
					
  						/*
  						//收款提交
  						$("#saveBtn").click(function(){
		 						var inConcode = $("#win #inConcode").val();
 								var rdata = {
 									"inConcode" : inConcode,
 								};		
			 			$.messager.confirm('提示','请检查开票信息是否正确,确认开票?', function(r){
			 					if(r){
									$.ajax({
										url : 'contract.do?updateCollectionStatus',
										data : rdata,
										type : 'POST',
										success:function(result){
											if(result=='ok'){
													$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"收款成功",
														timeout:3000,
														showType:'slide'
													});
												$("#colltab").datagrid('reload');
											}else{
												$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"收款失败",
														timeout:3000,
														showType:'slide'
													});
													$("#colltab").datagrid('reload');
											}
										}
									});
								}
						});				
  					});
  					*/
  				});
  			
  				function updateStatus(inId){
  							$("#win").window('open');
							$("#win").window({
								title : '发票信息',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#recordtab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
							var data = {"localeCode" : row.inLocalecode};
	  						$.ajax({
				     						url:'localeBI.do?findByCode',
				     						data :data,
				     						type:'POST',
				     						async:false,
				     						success:function(result){
				     							return localeName = result, inLocalecode =row.inLocalecode;
				     						},
				     						error:function(){
				     							return localeName = "无",inLocalecode ="无";
				     						}
				     				});
	  						$("#myform").form('load',{
	  								inConcode : row.inConcode,
	  								inConname : row.inConname,
	  								inLocalecode : row.inLocalecode,
	  								inCycle : row.inCycle,
	  								inPaytype : row.inPaytype,
	  								inConunit : row.inConunit,	
	  								inInvoiceunit : row.inInvoiceunit,		
	  								inPayunit : row.inPayunit,
  									inPaymoney : row.inPaymoney,
  									inInvoicetype : row.inInvoicetype,		
	  								inTime : row.inTime,
	  								localeName :localeName
  								});	
  							//添加或者修改成功重写加载数据
							$("#recordtab").datagrid('reload');
  				}
</script>
  </head>
  
   <body class="easyui-layout">  
	
    <div data-options="region:'center',title:'收款情况统计'"  style="padding:5px;background:#eee;">

						<label>合同编码:</label>
						<input id="inConcode" name="inConcode">
						<label>合同名称:</label>
						<input id="inConname" name="inConname">
						<label>签约单位:</label>
						<input id="inConunit" name="inConunit">
						<label>开票单位:</label>
						<input id="inInvoiceunit" name="inInvoiceunit">
						<label>付款单位:</label>
						<input id="inPayunit" name="inPayunit">
						<br/><br/>
						开始时间：
        				<input  id="timeFrom"  name="timeFrom"  type= "text" class= "easyui-datebox" /> 
        				结束时间
						<input  id="timeTo"  name="timeTo"  type= "text" class= "easyui-datebox" /> 		
						 
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
						<a href="javascript:void()"  id="reset" class="easyui-linkbutton">重置</a>
    						<table id="recordtab"></table>	
						
						<!-- 弹出查看窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>合同编号:</label></td>	
									 <td>
										 <input type="hidden" id="conId" name="conId">
										 <input type="text" id="inConcode" name="inConcode" readonly="readonly">
									</td>
										<td><label>合同名称:</label></td>
										<td>
 											<input type="text" id="inConname" name="inConname" readonly="readonly">
 											</td>
								</tr>
									<tr>
										<td><label>签约场所编码:</label></td>
										<td>
										<input id="inLocalecode" type="text"  name="inLocalecode" readonly="readonly"></input>  							
										</td>
										<td><label>付款周期:</label></td>
										<td>
												<select id="inCycle"  name="inCycle" disabled="disabled"  class="easyui-combobox" style="width:200px;">   
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
												<select id="inPaytype"  name="inPaytype" disabled="disabled"  class="easyui-combobox" style="width:200px;">   
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
												<input id="inConunit" name="inConunit"  readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>开票单位:</label></td>
										<td>
												<input id="inInvoiceunit" name="inInvoiceunit"  readonly="readonly" style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>付款单位:</label></td>
										<td>
												<input id="inPayunit" name="inPayunit"  readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>付款金额:</label></td>
										<td>
										<input id="inPaymoney" name="inPaymoney" readonly="readonly"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>开票类型:</label></td>
										<td>
												<select id="inInvoicetype"  name="inInvoicetype"  disabled="disabled" class="easyui-combobox" style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">普票</option> 
												    <option value ="2">专票</option> 
												</select>   
										</td>
										<td><label>开票时间:</label></td>
										<td>
        										<input  id="inTime"  name="inTime"  type= "text" disabled="disabled" class= "easyui-datebox" /> 
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
