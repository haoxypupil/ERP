<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
   <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  <link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
  <link rel="stylesheet" href="js/themes/default/easyui.css" type="text/css"></link>
  <script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
  <style type="text/css">
  	textarea {
		white-space: pre-wrap;
		 vertical-align: middle;
        display: inline-block;
}
  
  </style>
  <script type="text/javascript">
  						$(function(){  
  							 $("#maintab").datagrid({
  								 url:"main.do?mainList",
  								 pagination:true, //页码
							     fit:false,
							     fitColumns:true,
							     loadMsg:'正在加载数据....',
							     striped:true,
							     singleSelect:true,
							     autoRowHeight:false,
							     showFooter: true,
							     columns:[[{
							     				field:'mainId',
										        title:'查看',
										       // checkbox:true,
										        width:25,
										          formatter:function(value,row, index){
														return "<a href='javascript:info("+row.mainId+");' style='text-decoration:none;color:#000000;'><img  src='js/themes/icons/search.png'></a>";
									        	} 
								        },{
										        field:'areaName',
										        title:'地区',
										        width:100,
										          formatter:function(value,row, index){
													return row.localeArea.areaName ;
												}
								        },{
										        field:'mainCompany',
										        title:'所属厂家',
										        width:100,
										        formatter:function(value,row, index){
										        	if(row.ainCompany=="1"){
										        	return "永平" ;
										        	}else{
										        	return "侨平";
										        	}	
												}		       
								        },{
										        field:'localeName',
										        title:'场所名称',
										        width:100,
										        formatter:function(value,row, index){
													return row.localBasicInfo.localeName ;
												}
								        },{
										        field:'mainLocaleStatus',
										        title:'营业状态',
										        width:100,
										     formatter:function(value,row, index){
										        	if(row.mainLocaleStatus==1){
										        	return "营业" ;
										        	}else if(row.mainLocaleStatus==2){
										        	return "停业";
										        	}else if(row.mainLocaleStatus==3){
										        	return "暂停营业";
										        	}
												}
								       },{
										        field:'mainEquipmentType',
										        title:'故障类型',
										        width:100,
										          formatter:function(value,row, index){
										        	if(row.mainEquipmentType==1){
										        	return "SJ" ;
										        	}else if(row.mainEquipmentType==2){
										        	return "XT";
										        	}
												}
								        },{
										        field:'mainDate',
										        title:'维护日期',
										        width:100
								        },{
										        field:'mainEquipmentModel',
										        title:'故障机型',
										        width:100,
										         formatter:function(value,row, index){
										        	if(row.mainEquipmentModel==1){
										        	return "X86(32)" ;
										        	}else if(row.mainEquipmentModel==2){
										        	return "X86(64)";
										        	}else if(row.mainEquipmentModel==3){
										        	return "MIPS";
										        	}else if(row.mainEquipmentModel==4){
										        	return "ARM";
										        	}
												}
								        },{
										        field:'mainFaultDescription',
										        title:'故障描述',
										        width:100
								        },{
										        field:'empName',
										        title:'维护人员',
										        width:100,
										         formatter:function(value,row,index){
													return row.employee.empName;
												}      
								        },{
										        field:'mainProcessMode',
										        title:'处理方式',
										        width:100
								        },{
										        field:'mainResult',
										        title:'维护结果',
										        width:100,
										         formatter:function(value,row, index){
										        	if(row.mainResult==1){
										        	return "成功" ;
										        	}else if(row.mainResult==2){
										        	return "不成功";
										        	}
												}
								        }
		  						]],
		  						 toolbar : [ {
										iconCls : 'icon-add',
										handler : function() {
											$("#myform").form('clear');
											$("#myform2").form('clear');
											$("#win2").window('open');
											$("#win2").window({
												title : '新增维护信息',
												iconCls : 'icon-add'
											});		
										}	
								}]
		  					});
		  					
		  					$("#win2 #localBasicInfo").combogrid({
										panelWidth:280,
										//value:'006',
										url:"localeBI.do?localeList",
										idField:'localeId',
										textField:'localeCode',
										columns:[[
											{field:'localeCode',title:'场所编号',width:110},
											{field:'localeName',title:'场所名称',width:140}
											//{field:'localeAddress',title:'场所地址',width:120},
										]]
									});
		  						
		  							//搜索按钮点击事件
  							$("#sreach").click(function(){
  								var localeArea1 = $("#localeArea").combobox("getValue");
  								 if(localeArea1=="上海市"){ localeArea="";}else{localeArea = localeArea1;}
  								 
  								var mainCompany = $("#mainCompany").combobox("getValue");
  								var mainType = $("input[name='mainType']:checked").map(function () {
  																 return $(this).val(); 
  															}).get().join('');
  								var mainFaultCause = $("input[name='mainFaultCause']:checked").map(function () { 
  																		return $(this).val(); 
  																	}).get().join('');
  							 	var mainResult = $("input[name='mainResult']:checked").map(function () {
  							 									 return $(this).val(); 
  							 									 }).get().join('');
  								var mainEquipmentType = $("input[name='mainEquipmentType']:checked").map(function () {
  																				 return $(this).val(); 
  																				}).get().join('');
  								var mainEquipmentModel = $("input[name='mainEquipmentModel']:checked").map(function () { 
  																					return $(this).val(); 
  																					}).get().join('');
  								var mainLocaleStatus = $("input[name='mainLocaleStatus']:checked").map(function () {
  																			 return $(this).val();
  																			 }).get().join('');
  								var localeName = $("#localeName").val();
  								var mainDateFrom = $("#mainDateFrom").datebox("getValue");	
  								var mainDateTo = $("#mainDateTo").datebox("getValue");	
  								
  								$("#maintab").datagrid('load',{
				  						areaid : localeArea,
				  						mainCompany : mainCompany,				  						
				  						mainType : mainType,
				  						mainFaultCause : mainFaultCause,	
				  						mainResult : mainResult,
				  						mainEquipmentType : mainEquipmentType,			  						
				  						mainEquipmentModel : mainEquipmentModel,
				  						mainLocaleStatus : mainLocaleStatus,
				  						localeName : localeName,
				  						mainDateFrom : mainDateFrom,
				  						mainDateTo : mainDateTo
  								});	
  							});	
  							
  								//重置
  							$("#reset").click(function(){
  							
  								$("#localeArea").combobox('clear');
  								$("#mainCompany").combobox('clear');
  								$("input[name='mainType']").removeAttr("checked","checked");
  								$("input[name='mainFaultCause']").removeAttr("checked","checked");
  								$("input[name='mainResult']").removeAttr("checked","checked");
  								$("input[name='mainEquipmentType']").removeAttr("checked","checked");
  								$("input[name='mainEquipmentModel']").removeAttr("checked","checked");
  								$("input[name='mainLocaleStatus']").removeAttr("checked","checked");
  								$("#localeName").val("");
  								$("#mainDateFrom").datebox('clear');	
  								$("#mainDateTo").datebox('clear');	
  								var localeArea =null;
  								var mainCompany = null;
  								var mainType = null;
  								var mainFaultCause = null;
  								var mainResult = null;
  								var mainEquipmentType = null; 
  								var mainEquipmentModel = null;	
  								var mainLocaleStatus = null; 
  								var localeName = null;	
  								var mainDateFrom = null; 
  								var mainDateTo = null;	
  							$("#maintab").datagrid('load',{
				  						areaid : localeArea,
				  						mainCompany : mainCompany,				  						
				  						mainType : mainType,
				  						mainFaultCause : mainFaultCause,	
				  						mainResult : mainResult,
				  						mainEquipmentType : mainEquipmentType,			  						
				  						mainEquipmentModel : mainEquipmentModel,
				  						mainLocaleStatus : mainLocaleStatus,
				  						localeName : localeName,
				  						mainDateFrom : mainDateFrom,
				  						mainDateTo : mainDateTo
  								});		
  							});	
  							
  							
  								//弹出查看窗口设置
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
  						
  						
  							//弹出新增窗口设置
  						$("#win2").window({
								width : 500,
								height : 600,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win2").window('close');
			     			
			     			
			     			      //关闭窗口按钮
		  				$("#close").click(function(){
			  				$("#myform").form('clear');
							$("#win").window('close');
						});			
			     		$("#saveBtn2").click(function(){
			     		
			     				var localBasicInfo = $("#win2 #localBasicInfo").combobox("getValue");  //场所编号或名称
			     				var mainLocaleLink = $("#win2 #mainLocaleLink").val();                           //联系人
			     				var mainLocaleTel = $("#win2 #mainLocaleTel").val();                               //联系电话
			     				var mainDate = $("#win2 #mainDate").datebox("getValue");					//故障时间
			     				var localeArea = $("#win2 #localeArea").combobox("getValue");				//所属地区
			     				var mainCompany = $("#win2 #mainCompany").combobox("getValue");		
			     				var mainCccType = $("#win2 input[name='mainCccType']:checked").map(function () {
  																 return $(this).val(); 
  															}).get().join('');														//认证类型
  								var mainType = $("#win2 input[name='mainType']:checked").map(function () {
  																 return $(this).val(); 
  															}).get().join('');														//出保情况
  								var mainFaultCause = $("#win2 input[name='mainFaultCause']:checked").map(function () { 
  																		return $(this).val(); 
  																	}).get().join('');												//故障原因
  																	
  								var 	mainFaultDescription = $("#win2 #mainFaultDescription").val();  //故障描述
  								
  								var mainEquipmentType = $("#win2 input[name='mainEquipmentType']:checked").map(function () {
  																				 return $(this).val(); 
  																				}).get().join('');									//故障类型
  								var mainEquipmentModel = $("#win2 input[name='mainEquipmentModel']:checked").map(function () { 
  																				return $(this).val(); 
  																				}).get().join('');									//故障机型												
								var mainProcessMode = $("#win2 #mainProcessMode").val();           //处理方式
								
								var mainResult = $("#win2 input[name='mainResult']:checked").map(function () {
  							 									 return $(this).val(); 
  							 									 }).get().join('#');												//处理结果
  							 									 
  								var mainLocaleStatus = $("#win2 input[name='mainLocaleStatus']:checked").map(function () {
  																			 return $(this).val();
  																			 }).get().join('');									//场所状态
  																			 
  								var employee = $("#win2 #employee").combobox("getValue");	       //维护人员
  								
  								var mainRemark = $("#win2 #mainRemark").val();
			     				var mdata = {
			     					"localeId" : localBasicInfo,
			     					"mainLocaleLink" : mainLocaleLink,
			     					"mainLocaleTel": mainLocaleTel,
			     					"mainCompany":mainCompany,
			     					"mainDate" : mainDate,
			     					"areaId":localeArea,
			     					"mainCccType" : mainCccType,
			     					"mainType" : mainType,
			     					"mainFaultCause": mainFaultCause,
			     					"mainFaultDescription":mainFaultDescription,
			     					"mainEquipmentType": mainEquipmentType,
			     					"mainEquipmentModel": mainEquipmentModel,                                                       
			     					"mainProcessMode" : mainProcessMode,
			     					"mainResult" : mainResult,
			     					"mainLocaleStatus" :mainLocaleStatus,
			     					"empId":employee,
			     					"mainRemark"	:mainRemark
			     				}
			     				$.messager.confirm('提示','请检查所填入信息正确,确认新增?', function(r){
			     						$.ajax({
			     							url:'main.do?addMain',
			     							data:mdata,
			     							type:'POST',
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform2").form('clear');
													$("#win2").window('close');
													$.messager.show({
														title : '消息',
														msg:"新增成功",
														timeout:3000,
														showType:'slide'
													});
												$("#maintab").datagrid('reload');
			     								}
			     							}
			     						});
			     				});
			     		});				
  					});		
  						function info(localeId){
  							$("#win").window('open');
							$("#win").window({
								title : '详细信息',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#maintab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						$("#myform").form('load',{		
	  								mainId : row.mainId,
	  								localeArea:row.localeArea.areaId,
	  								mainCompany:row.mainCompany,
	  								localBasicInfo : row.localBasicInfo.localeName,
	  								mainLocaleStatus : row.mainLocaleStatus,
	  								mainEquipmentType: row.mainEquipmentType,
	  								mainDate : row.mainDateFrom,
	  								mainEquipmentModel : row.mainEquipmentModel,
	  								mainFaultDescription : row.mainFaultDescription,
	  								employee : row.employee.empId,
	  								mainProcessMode : row.mainProcessMode,
	  								mainResult : row.mainResult		
  							});		
  							//添加或者修改成功重写加载数据
							$("#maintab").datagrid('reload');
  				}	
  		</script>					

  </head>
  
   <body class="easyui-layout">  
    <div data-options="region:'center',title:'维护信息'"  style="padding:5px;background:#eee;">
		  
						<input id="localeArea" class="easyui-combobox"
													name="localeArea"  value = "上海市" 
													data-options="
									    				url:'localeArea.do?areaList',   
											    		valueField:'areaId',
											    		textField:'areaName',
											    		panelHeight:200" >
											    		
						<select id="mainCompany" class="easyui-combobox" 
												 	name="mainCompany"  panelHeight="auto" >   
												    <option value ="1">永平</option>   
												    <option value ="2">侨平</option>   
												</select>  
											<br>
						出保情况：			
						<input type="checkbox" name="mainType"  id="mainType"  value="1">新装机
						<input type="checkbox" name="mainType"  id="mainType"  value="2">报修
						<input type="checkbox" name="mainType"  id="mainType"  value="3">巡检<br /><hr width="600px;" align="left">
						故障问题：
						<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"  value="1">金盾
						<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"   value="2">场所
						<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"   value="3">自身(硬件)
						<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"  value="4">自身(系统)<br /><hr width="600px;" align="left">
						维护结果：
						<input type="checkbox" name="mainResult"  id="mainResult"  value="1">成功
						<input type="checkbox" name="mainResult"  id="mainResult"  value="2">未成功<br /><hr width="600px;" align="left">
						故障类型：
						<input type="checkbox" name="mainEquipmentType"  id="mainEquipmentType"  value="1">SJ
						<input type="checkbox" name="mainEquipmentType"  id="mainEquipmentType"  value="2">XT<br /><hr width="600px;" align="left">
						故障机器：
						<input type="checkbox" name="mainEquipmentModel"  id="mainEquipmentModel"   value="1">X86(32位)
						<input type="checkbox" name="mainEquipmentModel"   id="mainEquipmentModel"  value="2">X86(64位)
						<input type="checkbox" name="mainEquipmentModel"  id="mainEquipmentModel"   value="3">MIPS
						<input type="checkbox" name="mainEquipmentModel"  id="mainEquipmentModel"   value="4">ARM<br /><hr width="600px;" align="left">
						场所状态：
						<input type="checkbox" name="mainLocaleStatus"  id="mainLocaleStatus"   value="1">营业
						<input type="checkbox" name="mainLocaleStatus"  id="mainLocaleStatus"   value="2">停业
						<input type="checkbox" name="mainLocaleStatus"  id="mainLocaleStatus"   value="3">暂停营业<br /><hr width="600px;" align="left">
						场所名称：
						<input type="text"  id="localeName" name="localeName"/>
						开始时间：
        				<input  id="mainDateFrom"  name="mainDateFrom"  type= "text" class= "easyui-datebox" /> 
        				结束时间
						<input  id="mainDateTo"  name="mainDateTo"  type= "text" class= "easyui-datebox" /> 
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
						<a href="javascript:void()"  id="reset" class="easyui-linkbutton">重置</a>

    						<table id="maintab" ></table>	
						
						
						
						
						<!-- 弹出窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>场所名称:</label></td>	
									 <td>
										 	<input id="localBasicInfo" class="easyui-combobox"
												name="localBasicInfo"
												data-options="
								    				url:'localeBI.do?localeList',   
										    		valueField:'localeId',   
										    		textField:'localeName',
										    		panelHeight:'auto'"  disabled="disabled"  style="width:200px;">
									</td>
									<td><label>所属地区:</label></td>
									<td>
											<input id="localeArea" class="easyui-combobox" style="width:200px;"
												name="localeArea"
												data-options="
								    				url:'localeArea.do?areaList',   
										    		valueField:'areaId',   
										    		textField:'areaName',
										    		panelHeight:'auto'" disabled="disabled" >
									</td>
								</tr>
								
								<tr>
										<td><label>所属厂家</label></td>	
										 <td>
												<select id="mainCompany" class="easyui-combobox"  disabled="disabled" style="width:200px;"
												 	name="mainCompany"  >   
												    <option value="1">永平</option>   
												    <option value ="2">侨平</option>    
												</select>  
										</td>
										<td>
												<label>营业状态:</label>
										</td>
										<td>
												<select id="mainLocaleStatus" class="easyui-combobox"  disabled="disabled" style="width:200px;"
												 	name="mainLocaleStatus" >   
												    <option value="1">营业</option>   
												    <option value ="2">停业</option>   
												    <option value ="3">暂停营业</option>  
												</select>  
										</td>
								</tr>
									
								<tr>
										<td>
												<label>故障类型:</label>
										</td>
										<td>
												<select id="mainEquipmentType" class="easyui-combobox"  disabled="disabled" style="width:200px;"
												 	name="mainEquipmentType" >   
												    <option value="1">SJ</option>   
												    <option value ="2">XT</option>   
												</select>  
										</td>
										<td><label>故障机型:</label></td>	
										<td>
												<select id="mainEquipmentModel" class="easyui-combobox"  disabled="disabled" style="width:200px;"
												 	name="mainEquipmentModel" >   
												    <option value="1">X86(32位)</option>   
												    <option value ="2">X86(64位)</option>   
												    <option value="3">MIPS</option>   
												    <option value ="4">ARM</option>  
												</select>  
										</td>	
								</tr>
								<tr>
										<td>
												<label>故障描述:</label>
										</td>
										<td>
											<textarea style="height:50px; width:250px;"  id="mainFaultDescription"  name ="mainFaultDescription" disabled="disabled"></textarea>		
										</td>
								</tr>
								<tr>
										<td>
												<label>维护人员:</label>
										</td>
										<td>
												<input id="employee" class="easyui-combobox" disabled="disabled" style="width:200px;"
												name="employee"
												data-options="
								    				url:'emp.do?findEmpList',   
										    		valueField:'empId',   
										    		textField:'empName',
										    		panelHeight:'auto'">
										</td>
										<td>
												<label>维护结果:</label>
										</td>
										<td>
											 	<select id="mainResult" class="easyui-combobox"  disabled="disabled" style="width:200px;"
												 	name="mainResult" >   
												    <option value="1">成功</option>   
												    <option value ="2">未成功</option>   
												</select>  
										</td>
								</tr>
								<tr>
										<td>
												<label>处理方式:</label>
										</td>
										<td>
										<textarea style="height:50px; width:250px;"  id="mainProcessMode"  name ="mainProcessMode" disabled="disabled"></textarea>
										</td>
								</tr>
										<tr>
												<td><label>备注：</label></td>
												<td>	
												<input type="text"  id="mainRemark"  name ="mainRemark"  disabled="disabled" style="width:200px;">
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
						
						<!--  新增窗口--> 
						
						<div id="win2" style="padding: 10px;">
								<form id="myform2" name="myform2" method="post">
								<table>
								<tr>
									<td><label>场所编码:</label></td>	
									 <td> 
									<!--
										<input id="localBasicInfo" class="easyui-combobox" style="width:250px;"
												name="localBasicInfo"
												data-options="
								    				url:'localeBI.do?localeList',   
										    		valueField:'localeId',   
										    		textField:'localeName',
										    		panelHeight:'auto'">
										    		-->
										 <select id="localBasicInfo" name="localBasicInfo" style="width:250px;"></select>
									</td>
									</tr>
									<tr>
									<td><label>联系人:</label></td> 
									<td>		
										<input type = "text" id ="mainLocaleLink" name = "mainLocaleLink" style="width:250px;"><br />
									</td>
								</tr>
								<tr>
										<td><label>联系电话：</label></td>	
										 <td>			 
											<input type = "text" id ="mainLocaleTel" name = "mainLocaleTel" style="width:250px;"><br />	
										</td>
										</tr>
										<tr>
										<td><label>所属厂家</label></td>	
										 <td>
												<select id="mainCompany" class="easyui-combobox"  style="width:250px;"
												 	name="mainCompany" panelHeight="auto">   
												    <option value="1">永平</option>   
												    <option value ="2">侨平</option>    
												</select>  
										</td>
										</tr>
										<tr>
										<td>
												<label>故障时间：</label>
										</td>
										<td>
											<input  id="mainDate"  name="mainDateFrom"  type= "text" class= "easyui-datebox"  style="width:250px;"/>
										</td>
								</tr>
								<tr>
										<td><label>所属地区：</label></td>	
										 <td>			 
											<input id="localeArea" class="easyui-combobox" style="width:250px;"
												name="localeArea"
												data-options="
								    				url:'localeArea.do?areaList',   
										    		valueField:'areaId',   
										    		textField:'areaName',
										    		panelHeight:200">	
										</td>
								</tr>
								<tr>
										<td>
												<label>认证类型：</label>
										</td>
										<td>				
											<input type="checkbox" name="mainCccType"  id="mainCccType"  value="1"/>有线
											<input type="checkbox" name="mainCccType"  id="mainCccType"  value="2"/>无线
											<input type="checkbox" name="mainCccType"  id="mainCccType"  value="3"/>无线&有线
										</td>
										</tr>
										<tr>
										<td><label>出保情况：</label></td>	
										<td>				
											<input type="checkbox" name="mainType"  id="mainType"  value="1"/>新装机
											<input type="checkbox" name="mainType"  id="mainType"  value="2"/>报修
											<input type="checkbox" name="mainType"  id="mainType"  value="3"/>巡检
										</td>	
										</tr>
										<tr>
											<td>
													<label>故障原因：</label>
											</td>
											<td>
													<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"  value="1">金盾
													<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"   value="2">场所
													<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"   value="3">自身(硬件)
													<input type="checkbox" name="mainFaultCause"  id="mainFaultCause"  value="4">自身(系统)
											</td>
											</tr>
											
						   					<tr>
											<td><label>故障描述(300<br/>字符以内)：</label></td>	
											<td><!--  
												 <input class="easyui-textbox" data-options="multiline:true"  id="mainFaultDescription"  name ="mainFaultDescription" 
													style="width:250px;height:50px">
												-->
												<textarea style="height:50px; width:250px;"  id="mainFaultDescription"  name ="mainFaultDescription" resize ="none"> </textarea>
													
													<br/>
											</td>	
											</tr>
											<tr>
												<td><label>故障类型:</label></td>	
												<td>
												<input type="checkbox" name="mainEquipmentType"  id="mainEquipmentType"  value="1">SJ
												<input type="checkbox" name="mainEquipmentType"  id="mainEquipmentType"  value="2">XT					
												</td> 	
											</tr>
											<tr>
												<td><label>故障机器：</label></td>
												<td>	
													<input type="checkbox" name="mainEquipmentModel"  id="mainEquipmentModel"   value="1">X86(32位)
													<input type="checkbox" name="mainEquipmentModel"   id="mainEquipmentModel"  value="2">X86(64位)
													<input type="checkbox" name="mainEquipmentModel"  id="mainEquipmentModel"   value="3">MIPS
													<input type="checkbox" name="mainEquipmentModel"  id="mainEquipmentModel"   value="4">ARM
												</td>
											</tr>
												<tr>
												<td><label>处理方式(300<br/>字符以内)：</label></td>
												<td>	
													<textarea style="height:50px; width:250px;"  id="mainProcessMode"  name ="mainProcessMode"></textarea>
												</td>
											</tr>
												<tr>
												<td><label>处理结果：</label></td>
												<td>	
													<input type="checkbox" name="mainResult"  id="mainResult"  value="1">成功
													<input type="checkbox" name="mainResult"  id="mainResult"  value="2">未成功
												</td>
											</tr>
												<tr>
												<td><label>场所状态：</label></td>
												<td>	
													<input type="checkbox" name="mainLocaleStatus"  id="mainLocaleStatus"   value="1">营业
													<input type="checkbox" name="mainLocaleStatus"  id="mainLocaleStatus"   value="2">停业
													<input type="checkbox" name="mainLocaleStatus"  id="mainLocaleStatus"   value="3">暂停营业
												</td>
											</tr>	
											
											<tr>
												<td>
														<label>维护人员:</label>
												</td>
												<td>
														<input id="employee" class="easyui-combobox" style="width:250px;"
														name="employee"
														data-options="
										    				url:'emp.do?findEmpList',   
												    		valueField:'empId',   
												    		textField:'empName',
												    		panelHeight:120">
												</td>
									</tr>
									
										<tr>
												<td><label>备注：</label></td>
												<td>	
												<input type="text"  id="mainRemark"  name ="mainRemark"  style="width:250px;">
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
