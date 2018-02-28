<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  <link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
  <link rel="stylesheet" href="js/themes/default/easyui.css" type="text/css"></link>
  <script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript">
  				$(function(){   //---------------场所查询页面
  							$("#localeBItab").datagrid({
  								url:"localeBI.do?findLocaleBI",
  								 pagination:true, //页码
							     fit:false,
							     fitColumns:true,
							     loadMsg:'请等待....',
							     striped:true,
							     columns:[[{
							     				field:'localeId',
										        title:'查看',
										       // checkbox:true,
										        width:18,
										         formatter:function(value,row, index){
													return "<a href='javascript:Info("+row.localeId+");' style='text-decoration:none;color:#000000;'><img  src='js/themes/icons/search.png'></a>";
									        	} 
								        },{
							     				field:'localeCode',
										        title:'场所编号',
										        //checkbox:true,
										        width:100
								        },{
										        field:'localeName',
										        title:'场所名称',
										        width:100
								        },{
										        field:'typeName',
										        title:'场所类型',
										        width:100,
											        formatter:function(value,row, index){
											        	return row.localeType.typeName;
													}
								        },{
										        field:'areaName',
										        title:'所属地区',
										        width:100,
											        formatter:function(value,row, index){
											        	return row.localeArea.areaName;
													}
								        },{
										        field:'localeAddress',
										        title:'详细地址',
										        width:100
								        },{
										        field:'localeLegalPerson',
										        title:'企业法人',
										        width:100
								        },{
										        field:'localeTelnum',
										        title:'联系方式',
										        width:100
								        },{
										        field:'localeStatus',
										        title:'营业状态',
										        width:100,
										        formatter:function(value,row,index){
										        	if(row.localeStatus==0){
										        		return "停业";
										        	}else if(row.localeStatus==1){
										        		return "正常营业";
										        	}else if(row.localeStatus==2){
										        		return "暂停营业";
										        	}
										        }
								        },{
										        field:'localeVpn',
										        title:'场所VPN',
										        width:100
								        },{
										       field:'XX',
										        title:'操作',
										        width:100,
											    formatter:function(value,row, index){
														return "<a href='javascript:update("+row.localeId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_edit.gif'>修改</a>";
									        	} 
								        }	
		  						 ]],
		  						 
		  					//添加按钮
		  					 toolbar : [ {
										iconCls : 'icon-add',
										handler : function() {
										    $("#myform").form('clear');
											$("#myform2").form('clear');
											//$("#win #localeOpen ").timespinner('clear');
											//$("#win #localeClose ").timespinner('clear');
											//$("#win2 #localeOpen ").timespinner('clear');
											//$("#win2 #localeClose ").timespinner('clear');
											$("#win #localeOpen").timespinner('setValue', '00:00');
											$("#win #localeClose").timespinner('setValue', '00:00');
											$("#win2 #localeOpen").timespinner('setValue', '00:00');
											$("#win2 #localeClose").timespinner('setValue', '00:00');
											$("#win").window('open');
											$("#win").window({
												title : '添加',
												iconCls : 'icon-add'
											});		
										}	
								}]
  							});
  							
  							
  							//搜索按钮点击事件
  							$("#sreach").click(function(){
  								var localeCode = $("#localeCode").val();
  								var localeName = $("#localeName").val();
  								var localeArea = $("#localeArea").combobox("getValue");
  								var localeStatus = $("#localeStatus").combobox("getValue");
  								$("#localeBItab").datagrid('load',{
				  						localeCode : localeCode,
				  						localeName : localeName,
				  						areaid :localeArea,	
				  						localeStatus :localeStatus	
  								});		
  							});		
  							//重置
  							$("#reset").click(function(){
  							
  								$("#localeCode").val("");
  								$("#localeName").val("");
  								$("#localeArea").combobox('clear');
  								$("#localeStatus").combobox('clear');
  								var localeCode =null;
  								var localeName = null;
  								var localeArea = null;
  								var localeStatus = null;
  							$("#localeBItab").datagrid('load',{
				  					localeCode : localeCode,
				  					localeName : localeName,				  						
				  					localeArea : localeArea,
				  					localeStatus :localeStatus		  						
  								});						
  							});
  							
  							/**
  								//导出按钮点击事件
  							$("#export").click(function(){   //expportCsv
  								var localeCode = $("#localeCode").val();
  								var localeName = $("#localeName").val();
  								var localeArea = $("#localeArea").combobox("getValue");
  								var localeStatus = $("#localeStatus").combobox("getValue");
  								var edata = {
  									"localeCode" : localeCode,
  									"localeName" : localeName,
  									"localeArea" : localeArea,
  									"localeStatus" : localeStatus,
  								};
  								$.ajax({
  										url:'localeBI.do?exportCsv',
  										data:edata,
  										type:'POST',
  										success:function(result){
	  											if(result=="ok"){
	  											$.messager.show({
												title : '消息',
												msg:"导出成功",
												timeout:3000,
												showType:'slide'
												});
  											}
  										}
  								});
  							});	
  							
  								//导入按钮点击事件
  							$("#import").click(function(){   //importCsv
  								$.ajax({
  										url:'localeBI.do?importCsv',
  										//data:edata,
  										type:'POST',
  										success:function(result){
	  											if(result=="ok"){
	  											$.messager.show({
												title : '消息',
												msg:"导入成功",
												timeout:3000,
												showType:'slide'
												});
  											}
  										}
  								});
  							});		
  							*/
  								//弹出窗口设置
  							$("#win").window({
								width : 650,
								height : 450,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	 																																		
			     			$("#win").window('close');	
			     			
			     			//弹出查看窗口设置
  							$("#win2").window({
								width : 650,
								height : 450,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win2").window('close');	
			     				
			     	$("#saveBtn").click(function(){
		 						var localeId = $("#win #localeId").val();
		 						var localeCode = $("#win #localeCode").val();		
		 						var localeName = $("#win #localeName").val();	
		 						var localeAddress = $("#win #localeAddress").val();
		 						var localeLongitude = $("#win #localeLongitude").val();
		 						var localeLatitude = $("#win #localeLatitude").val();	
		 					    var localeNature = $("#win #localeNature").combobox("getValue");		
		 						var localeLegalPerson = $("#win #localeLegalPerson").val();	
		 						var localeIdNum = $("#win #localeIdNum").val();
		 						var localeTelnum = $("#win #localeTelnum").val();
		 						var localeOpen = $("#win #localeOpen").timespinner('getValue');
		 						var localeClose = $("#win #localeClose").timespinner('getValue');	
		 						var localeNetadd = $("#win #localeNetadd").val();
		 						var localeOrgCode = $("#win #localeOrgCode").val();
		 						var localeVpn = $("#win #localeVpn").val();	
		 						var localeStatus = $("#win #localeStatus").combobox("getValue");	
		 						var localeArea = $("#win #localeArea").combobox("getValue");
		 						var localeType = $("#win #localeType").combobox("getValue");
		 						var localeIdType = $("#win #localeIdType").combobox("getValue");
		 						var localeNetway = $("#win #localeNetway").combobox("getValue");
		 						var localeOperator = $("#win #localeOperator").combobox("getValue");
		 						
		 						var mdata = {
		 							"localeId" : localeId,
		 							"localeCode" : localeCode,
		 							"localeName" : localeName,
		 							"localeAddress" : localeAddress,
		 							"localeLongitude" : localeLongitude,
		 							"localeLatitude" : localeLatitude,
		 							"localeNature" : localeNature,
		 							"localeLegalPerson" : localeLegalPerson,
		 							"localeIdNum" : localeIdNum,
		 							"localeTelnum" : localeTelnum,
		 							"localeOpen" : localeOpen,
		 							"localeClose" : localeClose,
		 							"localeNetadd" : localeNetadd,
		 							"localeOrgCode" : localeOrgCode,
		 							"localeVpn" : localeVpn,
		 							"localeStatus" : localeStatus,
		 							"areaId" : localeArea,
		 							"typeId" : localeType,
		 							"idTypeId" : localeIdType,
		 							"netwayId" : localeNetway,
		 							"operatorId" : localeOperator
 								};
			 					var mess = "";
			 					if(localeId==null || localeId==""){
			 						mess = "添加";
			 					}else{
			 						mess = "修改";
			 					}
					$.messager.confirm('提示','确认'+mess, function(r){
						if(r){
							$.ajax({
								url : 'localeBI.do?addOrUpdateLocale',
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
										$("#localeBItab").datagrid('reload');
									}
								}
							});	
						}
					});		
 				});				
  			});	  		
				
  				//修改
  				function update(localeId){
  							$("#win #localeOpen").timespinner('setValue', '00:00');
							$("#win #localeClose").timespinner('setValue', '00:00');
							$("#myform").form('clear');
  							$("#win").window('open');
							$("#win").window({
								title : '修改',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#localeBItab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						
	  						$("#myform").form('load',{
	  								
	  								localeId : row.localeId,
	  								localeCode : row.localeCode,
	  								localeName : row.localeName,
	  								localeAddress : row.localeAddress,
	  								localeLongitude : row.localeLongitude,
	  								localeLatitude : row.localeLatitude,				
	  								localeNature : row.localeNature,
	  								localeLegalPerson : row.localeLegalPerson,
	  								localeIdNum : row.localeIdNum,
	  								localeTelnum : row.localeTelnum,
	  								localeOpen : row.localeOpen,
	  								localeClose : row.localeClose,
	  								localeNetadd : row.localeNetadd,
	  								localeOrgCode : row.localeOrgCode,
	  								localeStatus : row.localeStatus,
	  								localeVpn : row.localeVpn,
	  								localeIdType : row.localeIdType.idTypeId,
	  								localeType : row.localeType.typeId,
	  								localeArea : row.localeArea.areaId,
	  								localeNetway : row.localeNetway.netwayId,
	  								localeOperator:row.localeOperator.operatorId
  							});		
  							//添加或者修改成功重写加载数据
							$("#localeBItab").datagrid('reload');
  			
  				};	
  				
  				//修改
  				function Info(localeId){
							$("#win2 #localeOpen").timespinner('setValue', '00:00');
							$("#win2 #localeClose").timespinner('setValue', '00:00');
  							$("#myform2").form('clear');
  							$("#win2").window('open');
							$("#win2").window({
								title : '查看',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#localeBItab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						
	  						$("#myform2").form('load',{
	  								
	  								localeId : row.localeId,
	  								localeCode : row.localeCode,
	  								localeName : row.localeName,
	  								localeAddress : row.localeAddress,
	  								localeLongitude : row.localeLongitude,
	  								localeLatitude : row.localeLatitude,				
	  								localeNature : row.localeNature,
	  								localeLegalPerson : row.localeLegalPerson,
	  								localeIdNum : row.localeIdNum,
	  								localeTelnum : row.localeTelnum,
	  								localeOpen : row.localeOpen,
	  								localeClose : row.localeClose,
	  								localeNetadd : row.localeNetadd,
	  								localeOrgCode : row.localeOrgCode,
	  								localeStatus : row.localeStatus,
	  								localeVpn : row.localeVpn,
	  								localeIdType : row.localeIdType.idTypeId,
	  								localeType : row.localeType.typeId,
	  								localeArea : row.localeArea.areaId,
	  								localeNetway : row.localeNetway.netwayId,
	  								localeOperator:row.localeOperator.operatorId
  							});		
  							//添加或者修改成功重写加载数据
							$("#localeBItab").datagrid('reload');
  			
  				};	
  				
  				$("#localeBItab").tabs({
								  onBeforeClose: function(title,index){
									var target = this;	
									$.messager.confirm('确认','你确认想要关闭'+title,function(r){
										if (r){
											var opts = $(target).tabs('options');
											var bc = opts.onBeforeClose;
											opts.onBeforeClose = function(){};  // 允许现在关闭
											$(target).tabs('close',index);
											opts.onBeforeClose = bc;  // 还原事件函数
										}
									});
									return false;	// 阻止关闭
								  }
							});	
  			
  </script>
  </head>
  
  <body class="easyui-layout" >  
	
    <div data-options="region:'center',title:'查询场所信息' "  style="padding:5px;background:#eee;">
				<label>场所名称:</label> 
						<input id="localeName" name="localeName">
				<label>场所编号:</label> 
						<input id="localeCode" name="localeCode" type="text" style="width: 128">
				<label>场所地址:</label> 
						<input id="localeArea" class="easyui-combobox"
													name="localeArea"
													data-options="
									    				url:'localeArea.do?areaList',   
											    		valueField:'areaId',
											    		textField:'areaName',
											    		panelHeight:300" >	
											    		
				<label>营业状态:</label> 
						<select id="localeStatus" class="easyui-combobox" 
												 	name="localeStatus" >  
												 	<option value ="">全部</option> 
												    <option value ="1">正常营业</option>   
												    <option value ="0">停业</option>
												    <option value ="3">暂停营业</option>     
												</select>  
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
						<a href="javascript:void()"  id="reset" class="easyui-linkbutton">重置</a>
						<br/><br/>
						<a href="javascript:void()"  id="export" class="easyui-linkbutton" >导出</a>
						<a href="javascript:void()"  id="import" class="easyui-linkbutton">导入</a>
    						<table id="localeBItab" ></table>	
				
				
				<!-- 弹出 修改窗口 -->
			 
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
									<tr>
										<td><label>场所编码:</label></td>	
										 <td>
											 <input type="hidden" id="localeId" name="localeId">
											 <input type="text" id="localeCode" name="localeCode">
										</td>
										<td><label>营业开始时间:</label></td>	
										 <td>
											 <!--  <input type="text" id="localeOpen" name="localeOpen" >-->
											 <input id="localeOpen" name="localeOpen" class="easyui-timespinner"  style="width:80px;"   
       											 data-options="min:'00:00'" />  
										</td>
									</tr>
									<tr>
										<td><label>场所名称:</label></td> 
										<td>
												 <input type="text" id="localeName" name="localeName" >
										</td>
										<td><label>营业结束时间:</label></td>	
										 <td>
											  <input id="localeClose" name="localeClose" class="easyui-timespinner"  style="width:80px;"   
       											 data-options="min:'00:00'" />  
										</td>
									</tr>	
									<tr>
										<td><label>场所类型:</label></td> 
										<td>
												<input id="localeType" class="easyui-combobox"
													name="localeType"
													data-options="
									    				url:'localeType.do?typeList',   
											    		valueField:'typeId',
											    		textField:'typeName',
											    		panelHeight:'auto'">	
										</td>
										<td><label>网络接入方式:</label></td> 
										<td>
												<input id="localeNetway" class="easyui-combobox"
													name="localeNetway"
													data-options="
									    				url:'localeNetway.do?netwayList',   
											    		valueField:'netwayId',
											    		textField:'netwayName',
											    		panelHeight:'auto'">	
										</td>
									</tr>
									<tr>
										<td><label>经营性质:</label></td>	
										 <td>
												 <select id="localeNature" class="easyui-combobox" 
												 	name="localeNature" panelHeight="auto">   
												    <option value="0">经营</option>   
												    <option value ="1">非经营</option>   
												    <option value ="2">其他</option>   
												</select>  
										</td>
										<td><label>网络运营商:</label></td> 
										<td>
												<input id="localeOperator" class="easyui-combobox"
													name="localeOperator"
													data-options="
									    				url:'localeOp.do?operatorList',   
											    		valueField:'operatorId',
											    		textField:'operatorName',
											    		panelHeight:'auto'">	
										</td>
									</tr>
									<tr>
										<td>
												<label>经营法人:</label>
										</td>
										<td>
												<input type="text" id="localeLegalPerson" name="localeLegalPerson" />
										</td>
										<td>
												<label>接入账号或固定IP:</label>
										</td>
										<td>
												<input type="text" id="localeNetadd" name="localeNetadd" />
										</td>
									</tr>	
									<tr>
											<td>
													<label>法人证件类型:</label>
											</td>
											<td>
												<input id="localeIdType" class="easyui-combobox"
													name="localeIdType"
													data-options="
									    				url:'localeIdType.do?IdTypeList',   
											    		valueField:'idTypeId',
											    		textField:'idTypeName',
											    		panelHeight:'auto'">	
											</td>
											<td><label>场所经度:</label></td>	
											<td>
												 <input type="text" id="localeLongitude" name="localeLongitude" >
											</td>	
									</tr>		
									<tr>	
										<td><label>法人证件号码:</label></td>	
										<td>
											 <input type="text" id="localeIdNum" name="localeIdNum" >
										</td>	
										<td><label>场所纬度:</label></td>	
										<td>
											 <input type="text" id="localeLatitude" name="localeLatitude" >
										</td>	
									</tr>
									<tr>
											<td>
													<label>法人联系方式:</label>
											</td>
											<td>
													<input type="text" id="localeTelnum" name="localeTelnum" >
											</td>
											<td><label>场所组织机构代码:</label></td>	
											<td>
												 <input type="text" id="localeOrgCode" name="localeOrgCode" >
											</td>	
									</tr>
									<tr>
											<td>
													<label>所属地区:</label>
											</td>
											<td>
												<input id="localeArea" class="easyui-combobox"
													name="localeArea"
													data-options="
									    				url:'localeArea.do?areaList',   
											    		valueField:'areaId',
											    		textField:'areaName',
											    		panelHeight:'auto'">	
											</td>
											<td><label>场所VPN:</label></td>	
										<td>
											 <input type="text" id="localeVpn"  name="localeVpn" >
										</td>	
									</tr>
									<tr>
											<td>
													<label>场所详细地址:</label>
											</td>
											<td>
													<input type="text" id="localeAddress" name="localeAddress" >
											</td>
											<td>
													<label>场所营业状态:</label>
											</td>
											<td>
													<select id="localeStatus" class="easyui-combobox" 
												 	name="localeStatus" panelHeight="auto">   
												    <option value="1">正常营业</option>   
												    <option value ="0">停业</option>   
												    <option value ="2">暂停营业</option>   
												</select>  
											</td>
									</tr>		
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn" class="easyui-linkbutton" >确定</a>
									
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
										<td><label>场所编码:</label></td>	
										 <td>
											 <input type="hidden" id="localeId" name="localeId">
											 <input type="text" id="localeCode" name="localeCode" readonly="readonly">
										</td>
										<td><label>营业开始时间:</label></td>	
										 <td>
											 <!--  <input type="text" id="localeOpen" name="localeOpen" >-->
											 <input id="localeOpen" name="localeOpen" class="easyui-timespinner"  style="width:80px;"   
											 disabled="disabled" 
       											 data-options="min:'00:00'" />  
										</td>
									</tr>
									<tr>
										<td><label>场所名称:</label></td> 
										<td>
												 <input type="text" id="localeName" name="localeName"  readonly="readonly">
										</td>
										<td><label>营业结束时间:</label></td>	
										 <td>
											  <input id="localeClose" name="localeClose" class="easyui-timespinner"  style="width:80px;"   
       											 data-options="min:'00:00'" disabled="disabled" />  
										</td>
									</tr>	
									<tr>
										<td><label>场所类型:</label></td> 
										<td>
												<input id="localeType" class="easyui-combobox" disabled="disabled"
													name="localeType"
													data-options="
									    				url:'localeType.do?typeList',   
											    		valueField:'typeId',
											    		textField:'typeName',
											    		panelHeight:'auto'">	
										</td>
										<td><label>网络接入方式:</label></td> 
										<td>
												<input id="localeNetway" class="easyui-combobox" disabled="disabled"
													name="localeNetway"
													data-options="
									    				url:'localeNetway.do?netwayList',   
											    		valueField:'netwayId',
											    		textField:'netwayName',
											    		panelHeight:'auto'">	
										</td>
									</tr>
									<tr>
										<td><label>经营性质:</label></td>	
										 <td>
												 <select id="localeNature" class="easyui-combobox"  disabled="disabled"
												 	name="localeNature" >   
												    <option value="0">经营</option>   
												    <option value ="1">非经营</option>   
												    <option value ="2">其他</option>   
												</select>  
										</td>
										<td><label>网络运营商:</label></td> 
										<td>
												<input id="localeOperator" class="easyui-combobox" disabled="disabled"
													name="localeOperator"
													data-options="
									    				url:'localeOp.do?operatorList',   
											    		valueField:'operatorId',
											    		textField:'operatorName',
											    		panelHeight:'auto'">	
										</td>
									</tr>
									<tr>
										<td>
												<label>经营法人:</label>
										</td>
										<td>
												<input type="text" id="localeLegalPerson" name="localeLegalPerson"  readonly="readonly"/>
										</td>
										<td>
												<label>接入账号或固定IP:</label>
										</td>
										<td>
												<input type="text" id="localeNetadd" name="localeNetadd"  readonly="readonly"/>
										</td>
									</tr>	
									<tr>
											<td>
													<label>法人证件类型:</label>
											</td>
											<td>
												<input id="localeIdType" class="easyui-combobox" disabled="disabled"
													name="localeIdType"
													data-options="
									    				url:'localeIdType.do?IdTypeList',   
											    		valueField:'idTypeId',
											    		textField:'idTypeName',
											    		panelHeight:'auto'">	
											</td>
											<td><label>场所经度:</label></td>	
											<td>
												 <input type="text" id="localeLongitude" name="localeLongitude"  readonly="readonly"/>
											</td>	
									</tr>		
									<tr>	
										<td><label>法人证件号码:</label></td>	
										<td>
											 <input type="text" id="localeIdNum" name="localeIdNum"  readonly="readonly"/>
										</td>	
										<td><label>场所纬度:</label></td>	
										<td>
											 <input type="text" id="localeLatitude" name="localeLatitude" readonly="readonly"/>
										</td>	
									</tr>
									<tr>
											<td>
													<label>法人联系方式:</label>
											</td>
											<td>
													<input type="text" id="localeTelnum" name="localeTelnum" readonly="readonly">
											</td>
											<td><label>场所组织机构代码:</label></td>	
											<td>
												 <input type="text" id="localeOrgCode" name="localeOrgCode" readonly="readonly">
											</td>	
									</tr>
									<tr>
											<td>
													<label>所属地区:</label>
											</td>
											<td>
												<input id="localeArea" class="easyui-combobox" disabled="disabled"
													name="localeArea"
													data-options="
									    				url:'localeArea.do?areaList',   
											    		valueField:'areaId',
											    		textField:'areaName',
											    		panelHeight:300">	
											</td>
											<td><label>场所VPN:</label></td>	
										<td>
											 <input type="text" id="localeVpn"  name="localeVpn" readonly="readonly">
										</td>	
									</tr>
									<tr>
											<td>
													<label>场所详细地址:</label>
											</td>
											<td>
													<input type="text" id="localeAddress" name="localeAddress" readonly="readonly">
											</td>
											<td>
													<label>场所营业状态:</label>
											</td>
											<td>
													<select id="localeStatus" class="easyui-combobox"  disabled="disabled"
												 	name="localeStatus" >   
												    <option value="1">正常营业</option>   
												    <option value ="0">停业</option>   
												    <option value ="2">暂停营业</option>   
												</select>  
											</td>
									</tr>		
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn" class="easyui-linkbutton" >确定</a>
									
										</td>
									</tr>
									</table>
								</form>
						</div>
    </div>  
</body>  
</html>
