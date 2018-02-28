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
  							$("#invotab").datagrid({
  								url:"contract.do?findInvoiceList",
  								 pagination:true, //页码
							     fit:false,
							     fitColumns:true,
							     loadMsg:'请等待....',
							     striped:true,
							      autoRowHeight:false,
							     columns:[[/*{
							     				field:'conId',
										        title:'序号',
										        checkbox:true,
										        width:100
								        },*/{
										        field:'conCode',
										        title:'合同编号',
										        width:100
								        },{
										        field:'conName',
										        title:'合同名称',
										        width:100
								        },{
										        field:'conLocalecode',
										        title:'安装场所编码',
										        width:100 
								        },{
										        field:'conUnit',
										        title:'签约单位',
										        width:120	       
								        },{
										        field:'conInvoice',
										        title:'开票单位',
										        width:120	       
								        },{
										        field:'conPayunit',
										        title:'付款单位',
										        width:120	       
								        },{
										        field:'conLinkman',
										        title:'项目联系人',
										        width:70	       
								        },{
										        field:'conAmount',
										        title:'合同总金额',
										        width:70	       
								        },{
										        field:'conCycle',
										        title:'支付周期',
										        width:70,
										     formatter:function(value,row, index){
										        	if(row.conCycle==1){
										        	return "季度付" ;
										        	}else if(row.conCycle==2){
										        	return "半年付";
										        	}else if(row.conCycle==3){
										        	return "年度付";
										        	}
												}
								       },{
										        field:'conPaymoney',
										        title:'支付金额',
										        width:80
								        },{
										        field:'conInvoicetype',
										        title:'开票类型',
										        width:60,
										        formatter:function(value,row,index){
										        	if(row.conInvoicetype==1){
										        	return "普票" ;
										        	}else if(row.conInvoicetype==2){
										        	return "专票";
										        	}
										        }
								        },{
										        field:'conActivetime',
										        title:'合同生效时间',
										        width:48   
								        },{
										        field:'XX',
										        title:'操作',
  												 formatter:function(value,row, index){
													return "<a href='javascript:updateStatus("+row.conId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_edit.gif'>开票</a>";
									        	} 
								  }]]		  						
  							});
  							//搜索按钮
  							$("#sreach").click(function(){
  								var conCode = $("#conCode").val();
  								var conName = $("#conName").val();
  								var conUnit = $("#conUnit").val();
  								var conInvoice = $("#conInvoice").val();
  								var conPayunit = $("#conPayunit").val();
  								$("#invotab").datagrid('load',{
				  						conCode : conCode,
				  						conName : conName,
				  						conUnit :conUnit,
				  						conInvoice : conInvoice,
				  						conPayunit :conPayunit,
  								});		
  							});	
  							//重置
  							$("#reset").click(function(){
  							
  								$("#conCode").val("");
  								$("#conName").val("");
  								$("#conUnit").val("");
  								$("#conInvoice").val("");
  								$("#conPayunit").val("");
  								var conCode =null;
  								var conUnit = null;
  								var conInvoice = null;
  								var conName = null;
								var conPayunit = null;	
  							$("#invotab").datagrid('load',{
				  						conCode : conCode,
				  						conName : conName,				  						
				  						conUnit : conUnit,
				  						conInvoice : conInvoice,	
				  						conPayunit : conPayunit		  						
  								});						
  							})
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
		 						var conCode = $("#win #conCode").val();
		 						var conName = $("#win #conName").val();
		 						var conLocalecode = $("#win #conLocalecode").val();
		 						var conCycle = $("#win #conCycle").combobox("getValue");
		 						var conPaymethod = $("#win #conPaymethod").combobox("getValue");		
		 						var conUnit = $("#win #conUnit").val();
		 						var conInvoice = $("#win #conInvoice").val();
		 						var conPayunit = $("#win #conPayunit").val();
		 						var conPaymoney = $("#win #conPaymoney").val();
		 						var conInvoicetype = $("#win #conInvoicetype").combobox("getValue");
 								var rdata = {
 									"conCode" : conCode,
 									"conName" : conName,
 									"conLocalecode" : conLocalecode,
 									"conCycle" : conCycle,
 									"conPaymethod" : conPaymethod,
 									"conUnit" : conUnit,
 									"conInvoice" : conInvoice,
 									"conPayunit" : conPayunit,
 									"conPaymoney" : conPaymoney,
 									"conInvoicetype" : conInvoicetype,
 								};		
			 			$.messager.confirm('提示','请检查开票信息是否正确,确认开票?', function(r){
			 					if(r){
									$.ajax({
										url : 'contract.do?updateInvoiceStatus',
										data : rdata,
										type : 'POST',
										success:function(result){
											if(result=='ok'){
													$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"开票成功",
														timeout:3000,
														showType:'slide'
													});
												$("#invotab").datagrid('reload');
											}else{
												$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"开票失败",
														timeout:3000,
														showType:'slide'
													});
													$("#invotab").datagrid('reload');
													$("#colltab").datagrid('reload');
											}
										}
									});
								}
						});				
  					});
  				});
  				
  				function updateStatus(conId){
  							$("#win").window('open');
							$("#win").window({
								title : '开票信息',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#invotab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
							var data = {"localeCode" : row.conLocalecode};
	  						$.ajax({
				     						url:'localeBI.do?findByCode',
				     						data :data,
				     						type:'POST',
				     						async:false,
				     						success:function(result){
				     							return localeName = result, conLocalecode =row.conLocalecode;
				     						},
				     						error:function(){
				     							return localeName = "无",conLocalecode ="无";
				     						}
				     				});
	  						$("#myform").form('load',{
	  								conCode : row.conCode,
	  								conName : row.conName,
	  								conLocalecode : row.conLocalecode,
	  								conCycle : row.conCycle,
	  								conPaymethod : row.conPaymethod,
	  								conUnit : row.conUnit,	
	  								conInvoice : row.conInvoice,		
	  								conPayunit : row.conPayunit,
  									conPaymoney : row.conPaymoney,
  									conInvoicetype : row.conInvoicetype,		
	  								conActivetime : row.conActivetime,
	  								localeName :localeName
  								});	
  							//添加或者修改成功重写加载数据
							$("#invotab").datagrid('reload');
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
	
    <div data-options="region:'center',title:'领料订单处理'"  style="padding:5px;background:#eee;">

						<label>合同编码:</label>
						<input id="conCode" name="conCode">
						<label>合同名称:</label>
						<input id="conName" name="conName">
						<label>签约单位:</label>
						<input id="conUnit" name="conUnit">
						<label>开票单位:</label>
						<input id="conInvoice" name="conInvoice">
						<label>付款单位:</label>
						<input id="conPayunit" name="conPayunit">

						 
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
						<a href="javascript:void()"  id="reset" class="easyui-linkbutton">重置</a>
    						<table id="invotab"></table>	
						
						<!-- 弹出开票操作窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>合同编号:</label></td>	
									 <td>
										 <input type="hidden" id="conId" name="conId">
										 <input type="text" id="conCode" name="conCode" readonly="readonly">
									</td>
										<td><label>合同名称:</label></td>
										<td>
 											<input type="text" id="conName" name="conName" readonly="readonly">
 											</td>
								</tr>
									<tr>
										<td><label>签约场所编码:</label></td>
										<td>
										<input id="conLocalecode" type="text"  name="conLocalecode" readonly="readonly"></input>  							
										</td>
										<td><label>付款周期:</label></td>
										<td>
												<select id="conCycle"  name="conCycle"  class="easyui-combobox" style="width:200px;" disabled="disabled">   
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
												<select id="conPaymethod"  name="conPaymethod"  class="easyui-combobox" style="width:200px;" disabled="disabled">   
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
												<input id="conUnit" name="conUnit"  style="width:200px;" readonly="readonly"> 
										</td>
										<td><label>开票单位:</label></td>
										<td>
												<input id="conInvoice" name="conInvoice"  style="width:200px;"readonly="readonly"> 
										</td>
								</tr>
								<tr>
										<td><label>付款单位:</label></td>
										<td>
												<input id="conPayunit" name="conPayunit"  style="width:200px;"readonly="readonly"> 
										</td>
										<td><label>付款金额:</label></td>
										<td>
										<input id="conPaymoney" name="conPaymoney"  style="width:200px;"readonly="readonly"> 
										</td>
								</tr>
								<tr>
										<td><label>开票类型:</label></td>
										<td>
												<select id="conInvoicetype"  name="conInvoicetype"  class="easyui-combobox" style="width:200px;" disabled="disabled">   
												    <option value="">请选择</option>   
												    <option value ="1">普票</option> 
												    <option value ="2">专票</option> 
												</select>   
										</td>
										<td><label>合同生效时间:</label></td>
										<td>
        										<input  id="conActivetime"  name="conActivetime"  type= "text" class= "easyui-datebox"  disabled="disabled"/> 
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
