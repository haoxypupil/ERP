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
	<link rel="stylesheet" href="js/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
	<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
				$(function(){
						$("#contab").datagrid({
								 url:'contract.do?findConList',
								 pagination:true, //页码
							     fit:false,
							     fitColumns:true,
							     loadMsg:'正在加载数据....',
							     striped:true,
							     singleSelect:true,
							     autoRowHeight:false,
							     showFooter: true,
							     columns:[[{
							     				field:'conId',
										        title:'查看',
										      // checkbox:true,
										        width:25,
										          formatter:function(value,row, index){
														return "<a href='javascript:conInfo("+row.conId+");' style='text-decoration:none;color:#000000;'><img  src='js/themes/icons/search.png'></a>";
									        	} 
								        },{
										        field:'conCode',
										        title:'合同编号',
										        width:100,
								        },{
										        field:'conName',
										        title:'合同名称',
										        width:100	       
								        },{
										        field:'conLocalecode',
										        title:'签约场所编码',
										        width:100	       
								        },{
										        field:'localeName',
										        title:'场所名称',
										        width:100,
										          formatter:function(value,row){
										          		if(row.conLocalecode !=null){
										          		 htmlobj=$.ajax({
										          				url:'localeBI.do?findByCode',
										          				type : 'POST',
										          				data:{localeCode:row.conLocalecode},
										          				async:false
										          				});
										          				var str = htmlobj.responseText;	
										          				str = str.replace(/\"/g, "");
										          				return str ;	
										          	}else{
										          			return "无";
										          	}
										          }
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
														return "<a href='javascript:updateUnit("+row.conId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_edit.gif'>修改</a>";
									        	} 
								        }
		  						]],
		  						 toolbar : [ {
										iconCls : 'icon-add',
										handler : function() {
											$("#myform").form('clear');
											$("#myform").form('clear');
											$("#win").window('open');
											$("#win").window({
												title : '新增合同信息',
												iconCls : 'icon-add'
											});		
										}	
								}]
		  					});
		  					
		  					//弹出新增窗口设置
  							$("#win").window({
								width : 700,
								height : 450,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win").window('close');	
			     			
			     			//弹出详情窗口设置
  							$("#win2").window({
								width : 700,
								height : 450,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win2").window('close');	
			     			
		  					 //关闭窗口按钮
		  				$("#close").click(function(){
			  				$("#myform2").form('clear');
							$("#win2").window('close');
						});
						
							//弹出详情窗口设置
  							$("#win3").window({
								width : 700,
								height : 450,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win3").window('close');	
		  						
		  					//搜索按钮点击事件
  							$("#sreach").click(function(){
  								var conCode = $("#conCode").val();
  								var conName = $("#conName").val();
  								var conLinkman = $("#conLinkman").val();
  								var conCycle = $("#conCycle").combobox("getValue");
  								var conLocalecode = $("#conLocalecode").val();
  								var conUnit = $("#conUnit").val();
  								
  								var conPayunit = $("#conPayunit").val();
  								var conTimefrom = $("#conTimefrom").datebox("getValue");	
  								var conTimeto = $("#conTimeto").datebox("getValue");	
  								
  								$("#contab").datagrid('load',{
				  						conCode : conCode,
				  						conName : conName,				  						
				  						conLinkman : conLinkman,
				  						conCycle : conCycle,	
				  						conLocalecode : conLocalecode,
				  						conUnit : conUnit,			  						
				  						conPayunit : conPayunit,
				  						conTimefrom : conTimefrom,
				  						conTimeto : conTimeto
  								});	
  							});	
  							//重置
  							$("#reset").click(function(){
  							
  								$("#conCode").val("");
  								$("#conName").val("");
  								$("#conLinkman").val("");
  								$("#conCycle").val("");
  								$("#conLocalecode").val("");
  								$("#conUnit").val("");	
  								$("#conPayunit").val("");
  								$("#conTimefrom").datebox('clear');	
  								$("#conTimeto").datebox('clear');	
  								var conCode =null;
  								var conName = null;
  								var conLinkman = null;
  								var conCycle = null;
  								var conLocalecode = null;
  								var conUnit = null; 
  								var conPayunit = null;	
  								var conTimefrom = null; 
  								var conTimeto = null;	

  							$("#contab").datagrid('load',{
				  						conCode : conCode,
				  						conName : conName,				  						
				  						conLinkman : conLinkman,
				  						conCycle : conCycle,	
				  						conLocalecode : conLocalecode,			  						
				  						conUnit : conUnit,
				  						conPayunit : conPayunit,
				  						conTimefrom : conTimefrom,
				  						conTimeto : conTimeto,
  								});		
  							});	
  								
  								//输入场所编码提示场所名称
			     		$("#win #conLocalecode").bind('input propertychange',function(){
  								var conLocalecode = $("#win #conLocalecode").val();
			  						ldata = {
			  								"localeCode" : conLocalecode
			  						};
			     				$.ajax({
			     						url:'localeBI.do?findByCode',
			     						data :ldata,
			     						type:'POST',
			     						async:false,
			     						success:function(result){
			     							return $("#win #localeName").html(result);
			     						},
			     						error:function(){
			     							return $("#win #localeName").html("");
			     						}
			     				});
			     			});	
  								//添加
  								$("#saveBtn").click(function(){
			     		
			     				var conCode = $("#win  #conCode").val(); 								
			     				var conName = $("#win #conName").val();                          	  
			     				var conLinkman = $("#win #conLinkman").val();                               		
			     				var conAmount = $("#win #conAmount").val();   
			     				var conTerm = $("#win #conTerm").val();   	
			     				var conCycle = $("#win #conCycle").combobox("getValue");		
			     				var conPaymethod = $("#win #conPaymethod").combobox("getValue");					
			     				var conLocalecode = $("#win #conLocalecode").val();  
			     				var conTime = $("#win #conTime").datebox("getValue");	
			     				var conUnit = $("#win #conUnit").val();   	
			     				var conInvoice = $("#win #conInvoice").val();   	
			     				var conPayunit = $("#win #conPayunit").val(); 
			     				var conPaymoney = $("#win #conPaymoney").val();   								
			     				var conInvoicetype = $("#win #conInvoicetype").combobox("getValue");
			     				
			     				var conActivetime = $("#win #conActivetime").datebox("getValue");	
			     				var conPaytime1 = $("#win #conPaytime1").datebox("getValue");	
			     				var conPaytime2 = $("#win #conPaytime2").datebox("getValue");	
			     				var conPaytime3 = $("#win #conPaytime3").datebox("getValue");	
			     				var conPaytime4 = $("#win #conPaytime4").datebox("getValue");	
			     						 								
			     				var mdata = {
			     					"conCode" : conCode,
			     					"conName": conName,
			     					"conLinkman":conLinkman,
			     					"conAmount" : conAmount,
			     					"conTerm":conTerm,
			     					"conCycle" : conCycle,
			     					"conPaymethod" : conPaymethod,
			     					"conLocalecode" : conLocalecode,
			     					"conTime": conTime,
			     					"conUnit":conUnit,
			     					"conInvoice" : conInvoice,
			     					"conPayunit":conPayunit,
			     					"conPaymoney" : conPaymoney,
			     					"conInvoicetype" : conInvoicetype,
			     					"conActivetime" : conActivetime,
			     					"conPaytime1": conPaytime1,
			     					"conPaytime2":conPaytime2,
			     					"conPaytime3" : conPaytime3,
			     					"conPaytime4":conPaytime4,
			     					};
			     				$.messager.confirm('提示','请检查所填入信息正确,确认新增?', function(r){
			     						if(r){
			     						$.ajax({
			     							url:'contract.do?addCon',
			     							data:mdata,
			     							type:'POST',
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"新增成功",
														timeout:3000,
														showType:'slide'
													});
												$("#contab").datagrid('reload');
			     								}else{
			     									$("#myform").form('clear');
													$("#win").window('close');
													$.messager.show({
														title : '消息',
														msg:"新增失败",
														timeout:3000,
														showType:'slide'
													});
													$("#contab").datagrid('reload');
			     								}
			     							}
			     						});
			     					}
			     				});	
			     			});	
			     			
			     				//修改
  								$("#saveBtn3").click(function(){
			     				
			     				var conCode = $("#win3  #conCode").val(); 						
			     				var conName = $("#win3 #conName").val();                          	  
			     				var conLinkman = $("#win3 #conLinkman").val();                               		
			     				var conAmount = $("#win3 #conAmount").val();   
			     				var conTerm = $("#win3 #conTerm").val();   	
			     				var conCycle = $("#win3 #conCycle").combobox("getValue");		
			     				var conPaymethod = $("#win3 #conPaymethod").combobox("getValue");					
			     				var conLocalecode = $("#win3 #conLocalecode").val();  
			     				var conTime = $("#win3 #conTime").datebox("getValue");	
			     				var conUnit = $("#win3 #conUnit").val(); 
			     				var conInvoice = $("#win3 #conInvoice").val();   	
			     				var conPayunit = $("#win3 #conPayunit").val(); 
			     			
			     				var conPaymoney = $("#win3 #conPaymoney").val();   								
			     				var conInvoicetype = $("#win3 #conInvoicetype").combobox("getValue");
			     				var conActivetime = $("#win3 #conActivetime").datebox("getValue");	
			     				var conPaytime1 = $("#win3 #conPaytime1").datebox("getValue");	
			     				var conPaytime2 = $("#win3 #conPaytime2").datebox("getValue");	
			     				var conPaytime3 = $("#win3 #conPaytime3").datebox("getValue");	
			     				var conPaytime4 = $("#win3 #conPaytime4").datebox("getValue");	
			     				
			     				var conLocalestatus = $("#win3 #conLocalestatus").combobox("getValue");								
			     				var mdata = {
			     					"conCode" : conCode,
			     					
			     					"conName": conName,
			     					"conLinkman":conLinkman,
			     					"conAmount" : conAmount,
			     					"conTerm":conTerm,
			     					"conCycle" : conCycle,
			     					"conPaymethod" : conPaymethod,
			     					"conLocalecode" : conLocalecode,
			     					"conTime": conTime,
			     					"conUnit":conUnit,
			     					"conPaymoney" : conPaymoney,
			     					"conInvoicetype" : conInvoicetype,
			     					"conActivetime" : conActivetime,
			     					"conPaytime1": conPaytime1,
			     					"conPaytime2":conPaytime2,
			     					"conPaytime3" : conPaytime3,
			     					"conPaytime4":conPaytime4,
			     					"conInvoice" : conInvoice,
			     					"conPayunit":conPayunit,
			     					"conLocalestatus" : conLocalestatus,
			     					};
			     				$.messager.confirm('提示','请检查所填入信息正确,确认修改?', function(r){
			     						if(r){
			     						$.ajax({
			     							url:'contract.do?updateUnit',
			     							data:mdata,
			     							type:'POST',
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform3").form('clear');
													$("#win3").window('close');
													$.messager.show({
														title : '消息',
														msg:"修改成功",
														timeout:3000,
														showType:'slide'
													});
												$("#contab").datagrid('reload');
			     								}else{
			     									$("#myform3").form('clear');
													$("#win3").window('close');
													$.messager.show({
														title : '消息',
														msg:"修改失败",
														timeout:3000,
														showType:'slide'
													});
													$("#contab").datagrid('reload');
			     								}
			     							}
			     						});
			     					}
			     				});	
			     			});					
  						});	
  						
  						//查看信息
						function conInfo(conId){
  							$("#win2").window('open');
							$("#win2").window({
								title : '详细信息',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#contab").datagrid('getSelected');
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
  						$("#myform2").form('load',{		
	  								conId : row.conId,
	  								conCode:row.conCode,
	  								conName :row.conName,
	  								conLinkman : row.conLinkman,
	  								conAmount : row.conAmount,
	  								conTerm : row.conTerm,
			     					conCycle : row.conCycle,
			     					conPaymethod : row.conPaymethod,
			     					conLocalecode : row.conLocalecode,
			     					localeName : localeName,
			     					conTime : row.conTime,
			     					conUnit : row.conUnit,
			     					conInvoice : row.conInvoice,
			     					conPayunit : row.conPayunit,
			     					conPaymoney : row.conPaymoney,
			     					conInvoicetype : row.conInvoicetype,
			     					conActivetime : row.conActivetime,
			     					conPaytime1 : row.conPaytime1,
			     					conPaytime2 : row.conPaytime2,
			     					conPaytime3 : row.conPaytime3,
			     					conPaytime4 : row.conPaytime4,
			     					conLocalestatus : row.conLocalestatus
  							});		
  							//添加或者修改成功重写加载数据
							$("#contab").datagrid('reload');
  				}	
	
				function updateUnit(conId){
  							$("#win3").window('open');
							$("#win3").window({
								title : '修改合同信息',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#contab").datagrid('getSelected');
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
  						$("#myform3").form('load',{		
	  								conId : row.conId,
	  								conCode:row.conCode,
	  								conName :row.conName,
	  								conLinkman : row.conLinkman,
	  								conAmount : row.conAmount,
	  								conTerm : row.conTerm,
			     					conCycle : row.conCycle,
			     					conPaymethod : row.conPaymethod,
			     					conLocalecode : row.conLocalecode,
			     					localeName : localeName,
			     					conTime : row.conTime,
			     					conUnit : row.conUnit,
			     					conInvoice : row.conInvoice,
			     					conPayunit : row.conPayunit,
			     					conPaymoney : row.conPaymoney,
			     					conInvoicetype : row.conInvoicetype,
			     					conActivetime : row.conActivetime,
			     					conPaytime1 : row.conPaytime1,
			     					conPaytime2 : row.conPaytime2,
			     					conPaytime3 : row.conPaytime3,
			     					conPaytime4 : row.conPaytime4,
			     					conLocalestatus : row.conLocalestatus
  							});		
  							//添加或者修改成功重写加载数据
							$("#contab").datagrid('reload');
				}
	
	</script>
	
</head>
  
   <body class="easyui-layout">  
    <div data-options="region:'center',title:'合同信息'"  style="padding:5px;background:#eee;">
    					合同编码：
							<input type="text"  id="conCode"  name="conCode">  
						合同名称：
							<input type="text"  id="conName"  name="conName">  
						项目联系人：
							<input type="text"  id="conLinkman"  name="conLinkman">  
						签约场所：
							<input type="text"  id="conLocalecode"  name="conLocalecode"> 
						签约单位：
							<input type="text"  id="conUnit"  name="conUnit">
							<br /><br />
						付款单位：
							<input type="text"  id="conPayunit"  name="conPayunit"> 
						支付周期
						<select id="conCycle" class="easyui-combobox" 
												 	name="conCycle" >  
												 	<option value ="">全部</option> 
												    <option value ="1">季度付</option>   
												    <option value ="2">半年付</option>
												    <option value ="3">年度付</option>     
												</select>  
												
							<br /><br />					
						开始时间：
        				<input  id="conTimefrom"  name="conTimefrom"  type= "text" class= "easyui-datebox" /> 
        				结束时间
						<input  id="conTimeto"  name="conTimeto"  type= "text" class= "easyui-datebox" /> 					
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
						
						<a href="javascript:void()"  id="reset" class="easyui-linkbutton">重置</a>
    						<table id="contab" ></table>	
    						
    						
    						
    						<!-- 添加 -->
    						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>合同编号:</label></td>	
									 <td>
										 	<input id="conCode" name="conCode"  style="width:200px;">
									</td>
									<td><label>合同名称:</label></td>
									<td>
											<input id="conName" name="conName"  style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>项目联系人</label></td>	
									<td>   
											<input id="conLinkman" name="conLinkman"  style="width:200px;">
									</td>
									<td><label>签约场所编码:</label></td>
									<td>
											<input id="conLocalecode" name="conLocalecode" style="width:200px;"> 
									</td>
								</tr>	
								<tr>
										<td><label>总金额:</label></td>
										<td>
												<input id="conAmount" name="conAmount"  style="width:200px;"> 
										</td>
										<td><label>签约场所名称:</label></td>
										<td><div id="localeName"></div></td>
								</tr>
								<tr>
										<td><label>合同期限:</label></td>
										<td>
												<input id="conTerm" name="conTerm"  style="width:200px;"> 
										</td>
										<td><label>付款周期:</label></td>
										<td>
												<select id="conCycle"  name="conCycle"  class="easyui-combobox" style="width:200px;"  panelHeight="auto" >   
												    <option value="">请选择</option>   
												    <option value ="1">季度付</option> 
												    <option value ="2">半年付</option> 
												    <option value ="3">年度付</option> 
												</select>   
										</td>
								</tr>
								<tr>
										<td><label>签约日期:</label></td>
										<td>
												<input  id="conTime"  name="conTime"  type= "text" class= "easyui-datebox" /> 
										</td>
										<td><label>支付方式:</label></td>
										<td>
												<select id="conPaymethod"  name="conPaymethod"  class="easyui-combobox" style="width:200px;"  panelHeight="auto" >   
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
												<input id="conUnit" name="conUnit"  style="width:200px;"> 
										</td>
										<td><label>开票单位:</label></td>
										<td>
												<input id="conInvoice" name="conInvoice"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>付款单位:</label></td>
										<td>
												<input id="conPayunit" name="conPayunit"  style="width:200px;"> 
										</td>
										<td><label>付款金额:</label></td>
										<td>
										<input id="conPaymoney" name="conPaymoney"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>开票类型:</label></td>
										<td>
												<select id="conInvoicetype"  name="conInvoicetype"  class="easyui-combobox" style="width:200px;"  panelHeight="auto" >   
												    <option value="">请选择</option>   
												    <option value ="1">普票</option> 
												    <option value ="2">专票</option> 
												</select>   
										</td>
										<td><label>合同生效时间:</label></td>
										<td>
        										<input  id="conActivetime"  name="conActivetime"  type= "text" class= "easyui-datebox" /> 
										</td>
								</tr>
								<tr>
										<td><label>付款时间1:</label></td>
										<td>
												<input  id="conPaytime1"  name="conPaytime1"  type= "text" class= "easyui-datebox" /> 
										</td>
										<td><label>付款时间2:</label></td>
										<td>
									<input  id="conPaytime2"  name="conPaytime2"  type= "text" class= "easyui-datebox" /> 
										</td>
								</tr>
								<tr>
										<td><label>付款时间3:</label></td>
										<td>
												<input  id="conPaytime3"  name="conPaytime3"  type= "text" class= "easyui-datebox" /> 
										</td>
										<td><label>付款时间4:</label></td>
										<td>
										<input  id="conPaytime4"  name="conPaytime4"  type= "text" class= "easyui-datebox" /> 
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
						
						
						<!-- 详细信息 -->
						<div id="win2" style="padding: 10px;">
								<form id="myform2" name="myform2" method="post">
								<table>
								<tr>
									<td><label>合同编号:</label></td>	
									 <td>
										 	<input id="conCode" name="conCode"  readonly="readonly"  style="width:200px;">
									</td>
									<td><label>合同名称:</label></td>
									<td>
											<input id="conName" name="conName"  readonly="readonly" style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>项目联系人</label></td>	
									<td>   
											<input id="conLinkman" name="conLinkman" readonly="readonly"  style="width:200px;">
									</td>
									<td><label>签约场所编码:</label></td>
									<td>
											<input id="conLocalecode" name="conLocalecode"  readonly="readonly" style="width:200px;"> 
									</td>
								</tr>	
								<tr>
										<td><label>总金额:</label></td>
										<td>
												<input id="conAmount" name="conAmount" readonly="readonly"  style="width:200px;"> 
										</td>
										<td><label>签约场所名称:</label></td>
										<td>
												<input id="localeName" name="localeName"  readonly="readonly"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>合同期限:</label></td>
										<td>
												<input id="conTerm" name="conTerm"  readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>付款周期:</label></td>
										<td>
												<select id="conCycle"  name="conCycle"  class="easyui-combobox" disabled="disabled" style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">季度付</option> 
												    <option value ="2">半年付</option> 
												    <option value ="3">年度付</option> 
												</select>   
										</td>
								</tr>
								<tr>
										<td><label>签约日期:</label></td>
										<td>
												<input  id="conTime"  name="conTime"  type= "text" disabled="disabled" class= "easyui-datebox" /> 
										</td>
										<td><label>支付方式:</label></td>
										<td>
												<select id="conPaymethod"  name="conPaymethod"  class="easyui-combobox" disabled="disabled" style="width:200px;">   
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
												<input id="conUnit" name="conUnit"  readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>开票单位:</label></td>
										<td>
												<input id="conInvoice" name="conInvoice"  readonly="readonly" style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>付款单位:</label></td>
										<td>
												<input id="conPayunit" name="conPayunit"  readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>付款金额:</label></td>
										<td>
										<input id="conPaymoney" name="conPaymoney"  readonly="readonly" style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>开票类型:</label></td>
										<td>
												<select id="conInvoicetype"  name="conInvoicetype"  class="easyui-combobox"  disabled="disabled"  style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">普票</option> 
												    <option value ="2">专票</option> 
												</select>   
										</td>
										<td><label>合同生效时间:</label></td>
										<td>
        										<input  id="conActivetime"  name="conActivetime"  disabled="disabled" type= "text" class= "easyui-datebox" /> 
										</td>
								</tr>
								<tr>
										<td><label>付款时间1:</label></td>
										<td>
												<input  id="conPaytime1"  name="conPaytime1" disabled="disabled"  type= "text" class= "easyui-datebox" /> 
										</td>
										<td><label>付款时间2:</label></td>
										<td>
									<input  id="conPaytime2"  name="conPaytime2"  type= "text" class= "easyui-datebox"  disabled="disabled" /> 
										</td>
								</tr>
								<tr>
										<td><label>付款时间3:</label></td>
										<td>
												<input  id="conPaytime3"  name="conPaytime3"  type= "text" class= "easyui-datebox" disabled="disabled" /> 
										</td>
										<td><label>付款时间4:</label></td>
										<td>
										<input  id="conPaytime4"  name="conPaytime4"  type= "text" class= "easyui-datebox" disabled="disabled" /> 
										</td>
								</tr>
								<tr>
										<td><label>场所营业状态:</label></td>
										<td>
												<select id="conLocalestatus"  name="conLocalestatus" disabled="disabled"  style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">正常营业</option> 
												    <option value ="0">停业</option> 
												</select>   
										</td>
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="close" class="easyui-linkbutton">关闭</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
						
						
						
						<!-- 修改付款/发票单位资料-->
						<div id="win3" style="padding: 10px;">
								<form id="myform3" name="myform3" method="post">
								<table>
								<tr>
									<td><label>合同编号:</label></td>	
									 <td>
										 	<input id="conCode" name="conCode" style="width:200px;">
									</td>
									<td><label>合同名称:</label></td>
									<td>
											<input id="conName" name="conName"   style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>项目联系人</label></td>	
									<td>   
											<input id="conLinkman" name="conLinkman"  style="width:200px;">
									</td>
									<td><label>签约场所编码:</label></td>
									<td>
											<input id="conLocalecode" name="conLocalecode" style="width:200px;"> 
									</td>
								</tr>	
								<tr>
										<td><label>总金额:</label></td>
										<td>
												<input id="conAmount" name="conAmount"  style="width:200px;"> 
										</td>
										<td><label>签约场所名称:</label></td>
										<td>
												<input id="localeName" name="localeName"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>合同期限:</label></td>
										<td>
												<input id="conTerm" name="conTerm"  style="width:200px;"> 
										</td>
										<td><label>付款周期:</label></td>
										<td>
												<select id="conCycle"  name="conCycle"  class="easyui-combobox"  style="width:200px;" panelHeight="auto" >   
												    <option value="">请选择</option>   
												    <option value ="1">季度付</option> 
												    <option value ="2">半年付</option> 
												    <option value ="3">年度付</option> 
												</select>   
										</td>
								</tr>
								<tr>
										<td><label>签约日期:</label></td>
										<td>
												<input  id="conTime"  name="conTime"  type= "text" class= "easyui-datebox" /> 
										</td>
										<td><label>支付方式:</label></td>
										<td>
												<select id="conPaymethod"  name="conPaymethod"  class="easyui-combobox" panelHeight="auto" style="width:200px;">   
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
												<input id="conUnit" name="conUnit"  style="width:200px;"> 
										</td>
										<td><label>开票单位:</label></td>
										<td>
												<input id="conInvoice" name="conInvoice"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>付款单位:</label></td>
										<td>
												<input id="conPayunit" name="conPayunit"  style="width:200px;"> 
										</td>
										<td><label>付款金额:</label></td>
										<td>
										<input id="conPaymoney" name="conPaymoney"  style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td><label>开票类型:</label></td>
										<td>
												<select id="conInvoicetype"  name="conInvoicetype"  class="easyui-combobox"  panelHeight="auto" style="width:200px;">   
												    <option value="">请选择</option>   
												    <option value ="1">普票</option> 
												    <option value ="2">专票</option> 
												</select>   
										</td>
										<td><label>合同生效时间:</label></td>
										<td>
        										<input  id="conActivetime"  name="conActivetime" type= "text" class= "easyui-datebox" /> 
										</td>
								</tr>
								<tr>
										<td><label>付款时间1:</label></td>
										<td>
												<input  id="conPaytime1"  name="conPaytime1" type= "text" class= "easyui-datebox" /> 
										</td>
										<td><label>付款时间2:</label></td>
										<td>
									<input  id="conPaytime2"  name="conPaytime2"  type= "text" class= "easyui-datebox" /> 
										</td>
								</tr>
								<tr>
										<td><label>付款时间3:</label></td>
										<td>
												<input  id="conPaytime3"  name="conPaytime3"  type= "text" class= "easyui-datebox" /> 
										</td>
										<td><label>付款时间4:</label></td>
										<td>
										<input  id="conPaytime4"  name="conPaytime4"  type= "text" class= "easyui-datebox" /> 
										</td>
								</tr>
								<tr>
										<td><label>场所营业状态:</label></td>
										<td>
												<select id="conLocalestatus"  name="conLocalestatus" class="easyui-combobox"  style="width:200px;" panelHeight="auto" >   
												    <option value="">请选择</option>   
												    <option value ="1">正常营业</option> 
												    <option value ="0">停业</option> 
												</select>   
										</td>
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn3" class="easyui-linkbutton">确认提交</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
    </div>

  </body>
</html>
