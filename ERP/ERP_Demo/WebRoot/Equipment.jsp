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
  							 $("#equtab").datagrid({
  								 url:"equipment.do?EquList",
  								 pagination:true, //页码
							     fit:false,
							     fitColumns:true,
							     loadMsg:'正在加载数据....',
							     striped:true,
							     singleSelect:true,
							     autoRowHeight:false,
							     showFooter: true,
							     columns:[[{
							     				field:'equId',
										        title:'查看',
										       // checkbox:true,
										        width:25,
										        align: 'center',
										          formatter:function(value,row, index){
													return "<a href='javascript:info("+row.equId+");' style='text-decoration:none;color:#000000;'><img  src='js/themes/icons/search.png'></a>";
									        	} 
								        },{
										        field:'equCode',
										        title:'设备编码',
										        width:100,
										      // align: 'center'
								        },{
										        field:'equName',
										        title:'设备名称',
										        width:100
								        },{
										        field:'equMac',
										        title:'设备MAC',
										        width:100	       
								        },{
										        field:'equModel',
										        title:'设备型号',
										        width:100
								        },{
										        field:'equType',
										        title:'设备类型',
										        width:100
								       },{
										        field:'suName',
										        title:'生产厂商',
										        width:100,
										         formatter:function(value,row,index){
													return row.supplier.suName;
												}      
								        },{
										        field:'equIndate',
										        title:'入库日期',
										        width:86      
								        },{
										        field:'equLocaleCode',
										        title:'安装场所编码',
										        width:100,
										         formatter:function(value,row,index){
													if(row.equLocaleCode!=null){
														return row.equLocaleCode;
													}else{
														return "未安装";
													}
												}      
								        },{ 
										        field:'localeName',
										        title:'安装场所名称', 
										        width:100,
										          formatter:function(value,row){
										          		if(row.equLocaleCode !=null){
										          		 htmlobj=$.ajax({
										          				url:'localeBI.do?findByCode',
										          				type : 'POST',
										          				data:{localeCode:row.equLocaleCode},
										          				async:false
										          				});
										          				var str = htmlobj.responseText;	
										          				str = str.replace(/\"/g, "");
										          				return str;	
										          	}else{
										          			return "无";
										          	}
										          }
								        },{
										        field:'equStatus',
										        title:'设备安装状态',
										        width:100,
										        formatter:function(value,row,index){
										        	if(row.equStatus==0){
										        		return "在库";
										        	}else if(row.equStatus==1){
										        		return "出库(待安装)";
										        	}else if(row.equStatus==2){
										        		return "暂借";
										        	}else if(row.equStatus==3){
										        		return "安装成功";
										        	}else if(row.equStatus==4){
										        		return "返厂维修";
										        	}
												}      
								        },{
										        field:'equServiceLog',
										        title:'设备流转记录',
										        width:60,
										           formatter:function(value,row,index){
										        	if(row.equServiceLog==0){
										        		return row.equServiceLog;
										        	}else if(row.equServiceLog >=1){
										        		return "<a href = 'javascript:showLog("+row.equId+")' style='text-decoration:none;color:red;'>"+row.equServiceLog+"</a>";
										        	}
												}         
								        },{
										        field:'equPerson',
										        title:'领取人',
										        width:50   
								        },{
										        field:'XX',
										        title:'操作',
										        width:100,
										        formatter:function(value,row, index){
											        if(row.equStatus==0){
															return "<a href='javascript:equOut("+row.equId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_detail.gif'>出库</a>";
										        	}else if(row.equStatus==1){
										        			return "<a href='javascript:equImpl("+row.equId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_relay.gif'>待安装</a>&nbsp&nbsp&nbsp&nbsp"
										        			+"<a href='javascript:equReIn("+row.equId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_edit.gif'>返修</a>";
										        	}else if(row.equStatus==3 || row.equStatus==2){
										        			return "<a href='javascript:equReIn("+row.equId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_acti.gif'>返修</a>&nbsp&nbsp&nbsp&nbsp"
										        			+"<a href='javascript:equUpOrDown("+row.equId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_confirm.gif'>是否上平台</a>";
										        	}else if(row.equStatus==4){
															return "<a href='javascript:equInSu("+row.equId+");' style='text-decoration:none;color:#000000;'><img  src='html/images/bt_detail.gif'>回库</a>";
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
												title : '新增设备',
												iconCls : 'icon-add'
											});		
										}	
								}]
		  					});
		  					
		  					
		  							//搜索按钮点击事件
  							$("#sreach").click(function(){
  								var equCode = $("#equCode").val();
  								var equMac = $("#equMac").val();
  								var equModel = $("#equModel").val();
  								var equType = $("#equType").combobox("getValue");	
  								var equLocaleCode = $("#equLocaleCode").val();
  								var equStatus = $("input[name='equStatus']:checked").map(function () {
  																 return $(this).val(); 
  															}).get().join('');
  								var equServiceLog = $("#equServiceLog").val();	
  								var equUpOrDown = $("#equUpOrDown").combobox("getValue");	
  													
  								$("#equtab").datagrid('load',{
				  						equCode : equCode,
				  						equMac : equMac,				  						
				  						equModel : equModel,
				  						equType : equType,	
				  						equLocaleCode : equLocaleCode,			  						
				  						equStatus : equStatus,
				  						equServiceLog:equServiceLog,
				  						equUpOrDown : equUpOrDown
  								});	
  							});	
  							
  							$("#reset").click(function(){
  							
  								$("#equCode").val("");
  								$("#equMac").val("");
  								$("#equModel").val("");
  								$("#equType").combobox('clear');
  								$("#equLocaleCode").val("");
  								$("input[name='equStatus']").removeAttr("checked","checked");
  								$("#equServiceLog").val("");		
  								//$("#equUpOrDown option:first").prop("selected", 'selected'); 
  								$("#equUpOrDown").combobox('clear');
  								//$("#equUpOrDown").prop('selectedIndex', 0);
  								//$("#equUpOrDown")[0].selectedIndex = 0;
  								var equCode =null;
  								var equMac = null;
  								var equModel = null;
  								var equType = null;
  								var equLocaleCode = null;
  								var equStatus = null; 
  								var equServiceLog = null;	
  								var equUpOrDown = null;	
  								
  								
  							$("#equtab").datagrid('load',{
				  						equCode : equCode,
				  						equMac : equMac,				  						
				  						equModel : equModel,
				  						equType : equType,	
				  						equLocaleCode : equLocaleCode,			  						
				  						equStatus : equStatus,
				  						equServiceLog:equServiceLog,
				  						equUpOrDown : equUpOrDown
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
			     			
			     			
				     		  //关闭窗口按钮
			  				$("#close").click(function(){
				  				$("#myform").form('clear');
								$("#win").window('close');
							});
  				
  							
  							//弹出新增窗口设置
  						$("#win2").window({
								width : 450,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win2").window('close');
			     			
			     			//弹出出库窗口设置
  						$("#win3").window({
								width : 650,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win3").window('close');
			     			
			     			//弹出设备安装窗口设置
  						$("#win4").window({
								width : 650,
								height : 500,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win4").window('close');
			     			
			     		//弹出设备返修窗口设置
  						$("#win5").window({
								width : 600,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win5").window('close');
			     			
			     		//弹出设备返厂维修回库窗口设置
  						$("#win6").window({
								width : 650,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win6").window('close');

						//弹出是否上平台窗口设置
  						$("#win7").window({
								width : 550,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win7").window('close');
			     			
			     		//弹出设备流转历史窗口设置
  						$("#win8").window({
								width : 800,
								height : 400,
								modal : true,
								minimizable : false,
								draggable : true,
								inline : true,
								resizable :true
							});	
			     			$("#win8").window('close');
			     			 
			     			//添加
			     		$("#saveBtn2").click(function(){
			     		
			     				var equCode = $("#win2 #equCode").val(); 									//设备编号
			     				var equName = $("#win2 #equName").val();                          	    //设备名称
			     				var equMac = $("#win2 #equMac").val();                               		//设备mac
			     				var equModel = $("#win2 #equModel").val();   							//设备型号
			     				var equType = $("#win2 #equType").combobox("getValue");  //设备类型
			     				var supplier = $("#win2 #supplier").combobox("getValue");		//设备厂商
			     				var equRemark = $("#win2 #equRemark").val();   								//备注
			     				var mdata = {
			     					//"localeId" : localBasicInfo,
			     					"equCode" : equCode,
			     					"equName": equName,
			     					"equMac":equMac,
			     					"equModel" : equModel,
			     					"equType":equType,
			     					"suid" : supplier,
			     					"equRemark" : equRemark,
			     					};
			     		/*			if(equCode=="" || equCode==null){
			     						$.messager.confirm('提示', '设备编码为必填项!');
			     					}else if(equName=="" || equName==null){
			     						$.messager.confirm('提示', '设备名称为必填项！');
			     					}else if(equMac=="" || equMac==null){
			     						$.messager.confirm('提示', '设备Mac为必填项！');
			     					}else if(equModel=="" || equModel==null){
			     						$.messager.confirm('提示', '设备型号为必填项！');
			     					}else if(equType=="" || equType==null){
			     						$.messager.confirm('提示', '设备类型为必填项！');
			     					}else if(supplier=="" || supplier==null){
			     						$.messager.confirm('提示', '设备厂商为必填项！');
			     					}else{
			     			*/
			     				$.messager.confirm('提示','请检查所填入信息正确,确认新增?', function(r){
			     						if(r){
			     						$.ajax({
			     							url:'equipment.do?addEqu',
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
												$("#equtab").datagrid('reload');
			     								}else{
			     									$("#myform2").form('clear');
													$("#win2").window('close');
													$.messager.show({
														title : '消息',
														msg:"新增失败",
														timeout:3000,
														showType:'slide'
													});
													$("#equtab").datagrid('reload');
			     								}
			     							}
			     						});
			     					}
			     				});	
			     		});		
			     		
			     		//出库
			     		$("#saveBtn3").click(function(){
			     		//设备厂商
			     				var equCode = $("#win3 #equCode").val(); 	
			     				var equRemark = $("#win3 #equRemark").val(); 
			     				var equPerson = $("#win3 #equPerson").val();   
			     				var equStatus = $("#win3 #equStatus").combobox("getValue");	
			     				if(equStatus=='1' || equStatus=='2'){
			     					elStatus = equStatus;
			     				}else if(equStatus=='4'){
			     					elStatus = '5';
			     				}						
			     				var mdata = {
			     					"equCode" : equCode,
			     					"equRemark" : equRemark,
			     					"equPerson" : equPerson,
			     					"equStatus" : equStatus,
			     					"elStatus" :elStatus,
			     					};
			     				/*	if(equPerson=="" || equPerson==null){
			     						$.messager.confirm('提示', '请填写处理人！');
			     					}else if(equStatus<1){
			     						$.messager.confirm('提示', '请选择设备去向！');
			     					}else{
			     				*/
			     				$.messager.confirm('提示','请检查所填入信息正确,确认领取?', function(r){
			     						if(r){
			     						$.ajax({
			     							url:'equipment.do?equOut',
			     							data:mdata,
			     							type:'POST',
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform3").form('clear');
													$("#win3").window('close');
													$.messager.show({
														title : '消息',
														msg:"领取成功",
														timeout:3000,
														showType:'slide'
													});
												$("#equtab").datagrid('reload');
			     								}else{
			     									$("#myform3").form('clear');
													$("#win3").window('close');
													$.messager.show({
														title : '消息',
														msg:"领取失败",
														timeout:3000,
														showType:'slide'
													});
													$("#equtab").datagrid('reload');
			     								}
			     							}
			     						});
			     					}
			     				});
			     		});
				
			     		//输入场所编码提示场所名称
			     		$("#win4 #equLocaleCode").bind('input propertychange',function(){
  								var equLocaleCode = $("#win4 #equLocaleCode").val();
			  						ldata = {
			  								"localeCode" : equLocaleCode
			  						};
			     				$.ajax({
			     						url:'localeBI.do?findByCode',
			     						data :ldata,
			     						type:'POST',
			     						async:false,
			     						success:function(result){
			     							return  $("#win4 #name").html("场所名称："), $("#win4 #localeName").html(result);
			     						},
			     						error:function(){
			     							return $("#win4 #name").html(""), $("#win4 #localeName").html("");
			     						}
			     				});
			     			});	
			     	
			     		//安装
			     		$("#saveBtn4").click(function(){
			     		//设备厂商
			     				var equCode = $("#win4 #equCode").val();
			     				var equLocaleCode = $("#win4 #equLocaleCode").val();   	
			     			 //var localeName = $("#win4 #localeName").text();
			     				var equUpOrDown = $("#win4  #equUpOrDown").combobox("getValue");		
			     					
			     				var edata = {
			     					"equCode" : equCode,
									"equLocaleCode" : equLocaleCode,
									"equUpOrDown" : equUpOrDown
			     					};
			     				$.messager.confirm('提示','请检查所填入信息正确,确认安装?', function(r){
			     					if(r){
			     						$.ajax({
			     							url:'equipment.do?equImp',
			     							data:edata,
			     							type:'POST',
			     							async:false,
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform4").form('clear');
													$("#win4").window('close');
													$("#win4 #name").html(""); 
													$("#win4 #localeName").html("");
													$.messager.show({
														title : '消息',
														msg:"安装成功",
														timeout:3000,
														showType:'slide'
													});
												$("#equtab").datagrid('reload');
			     								}else{
			     									$("#myform4").form('clear');
													$("#win4").window('close');
													$("#win4 #name").html(""); 
													$("#win4 #localeName").html("");
													$.messager.show({
														title : '消息',
														msg:"安装失败",
														timeout:3000,
														showType:'slide'
													});
													$("#equtab").datagrid('reload');
			     								}
			     							}
			     						});
			     					}
			     				});	
			     		});
			     			//返修
			     		$("#saveBtn5").click(function(){
			     				var equCode = $("#win5 #equCode").val();
			     				var elReason = $("#win5 #elReason").val(); 
			     				var elPerson = $("#win5 #elPerson").val();
			     				var equStatus = $("#win5 #equStatus").combobox("getValue");	
				     				if(equStatus=='2'){
				     				 	elStatus =equStatus;
				     				}else if(equStatus=='1' || equStatus=='3'){
				     					elStatus ="4";
				     				}   	  	
			     				var mdata = {
			     					"equCode" : equCode,
									"elReason" : elReason,
									"elPersonIn" : elPerson,
									"elStatus" : elStatus,
			     					};
			     			/*		if(elReason=="" || elReason==null){
			     					$.messager.confirm('提示', '请填写返修原因！');
			     					}else if(elPerson ==null || elPerson==""){
			     					$.messager.confirm('提示', '请填写返修人员！');
			     					}else{
			     			*/
			     				$.messager.confirm('提示','请检查所填入信息正确,返修?', function(r){
			     						$.ajax({
			     							url:'equipment.do?equReIn',
			     							data:mdata,
			     							type:'POST',
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform5").form('clear');
													$("#win5").window('close');
													$.messager.show({
														title : '消息',
														msg:"返修成功",
														timeout:3000,
														showType:'slide'
													});
												$("#equtab").datagrid('reload');
			     								}
			     							}
			     						});
			     				});
			     		});	
			     		
			     		//返厂维修回库
			     		$("#saveBtn6").click(function(){
			     				var equCode = $("#win6 #equCode").val();
			     				var elPersonIn = $("#win6 #elPersonIn").val();
			     				var equRemark = $("#win6 #equRemark").val();	  	
			     				var mdata = {
			     					"equCode" : equCode,
									"elPersonIn" : elPersonIn,
									"equRemark" : equRemark,
			     					};
			     			/*		if(elPersonIn ==null || elPersonIn==""){
			     					$.messager.confirm('提示', '请填写回库处理人！');
			     					}else{
			     			*/
			     				$.messager.confirm('提示','请检查所填入信息正确?', function(r){
			     						$.ajax({
			     							url:'equipment.do?equBackforSu',
			     							data:mdata,
			     							type:'POST',
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform6").form('clear');
													$("#win6").window('close');
													$.messager.show({
														title : '消息',
														msg:"回库成功",
														timeout:3000,
														showType:'slide'
													});
												$("#equtab").datagrid('reload');
			     								}
			     							}
			     						});
			     				});
			     		});	
			     		
			     		//修改是否上平台
			     		$("#saveBtn7").click(function(){
			     				var equCode = $("#win7 #equCode").val();
			     				var equUpOrDown = $("#win7 #equUpOrDown").val();	
			     				var mdata = {
			     					"equCode" : equCode,
									"equUpOrDown" : equUpOrDown,
			     					};
			     		/*			if(equUpOrDown ==null || equUpOrDown==""){
			     					$.messager.confirm('提示', '请选择是否上平台！');
			     					}else{
			     		*/
			     				$.messager.confirm('提示','确定修改?', function(r){
			     						$.ajax({
			     							url:'equipment.do?equUpOrDown',
			     							data:mdata,
			     							type:'POST',
			     							success:function(result){
			     								if(result=="ok"){
			     									$("#myform7").form('clear');
													$("#win7").window('close');
													$.messager.show({
														title : '消息',
														msg:"修改成功",
														timeout:3000,
														showType:'slide'
													});
												$("#equtab").datagrid('reload');
			     								}
			     							}
			     						});
			     				});
			     		});		
			     			
  				});		
  						//查看
  						function info(equId){
  							$("#win").window('open');
							$("#win").window({
								title : '详细信息',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#equtab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						
  						var data = {"localeCode" : row.equLocaleCode};
	  						$.ajax({
				     						url:'localeBI.do?findByCode',
				     						data :data,
				     						type:'POST',
				     						async:false,
				     						success:function(result){
				     							return localeName = result, equLocaleCode =row.equLocaleCode;
				     						},
				     						error:function(){
				     							return localeName = "无",equLocaleCode ="无";
				     						}
				     				});
  						$("#myform").form('load',{		
	  								equId : row.equId,
	  								equCode:row.equCode,
	  								equName :row.equName,
	  								equMac : row.equMac,
	  								equModel : row.equModel,
	  								equType: row.equType,
	  								supplier : row.supplier.suName,
	  								equIndate : row.equIndate,
	  								equLocaleCode : equLocaleCode,
	  								equStatus : row.equStatus,
	  								equServiceLog : row.equServiceLog,
	  								equRemark : row.equRemark,
	  								localeName: localeName,
	  								equUpOrDown : row.equUpOrDown
  							});		
  							//添加或者修改成功重写加载数据
							$("#equtab").datagrid('reload');
  				}	
  					//设备出库
  					function equOut(equId){
  							$("#win3").window('open');
							$("#win3").window({
								title : '出库',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#equtab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						$("#myform3").form('load',{		
	  								equId : row.equId,
	  								equCode :row.equCode,
	  								equName :row.equName,
	  								equMac : row.equMac,
	  								equModel : row.equModel,
	  								equType: row.equType,
	  								supplier : row.supplier.suName,
	  								equIndate : row.equIndate,
  							});		
  							//添加或者修改成功重写加载数据
							$("#equtab").datagrid('reload');
  				}	
  				
  					//安装
  					function equImpl(equId){
  							$("#win4").window('open');
							$("#win4").window({
								title : '安装',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#equtab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						$("#myform4").form('load',{		
	  								equId : row.equId,
	  								equCode :row.equCode,
	  								equName :row.equName,
	  								equMac : row.equMac,
	  								equModel : row.equModel,
	  								equType: row.equType,
	  								supplier : row.supplier.suName,
	  								equIndate : row.equIndate,
	  								equPerson : row.equPerson,
	  								equRemark : row.equRemark,
  							});		
  							//添加或者修改成功重写加载数据
							$("#equtab").datagrid('reload');
  				}	
  						
  						
  						//返修
  						function equReIn(equId){
  							$("#win5").window('open');
							$("#win5").window({
								title : '设备返修',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#equtab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						
  						var data = {"localeCode" : row.equLocaleCode};
	  						$.ajax({
				     						url:'localeBI.do?findByCode',
				     						data :data,
				     						type:'POST',
				     						async:false,
				     						success:function(result){
				     							return localeName = result, equLocaleCode =row.equLocaleCode;
				     						},
				     						error:function(){
				     							return localeName = "无",equLocaleCode ="无";
				     						}
				     				});
  						$("#myform5").form('load',{		
	  								equId : row.equId,
	  								equCode :row.equCode,
	  								equName :row.equName,
	  								equMac : row.equMac,
	  								equModel : row.equModel,
	  								equType: row.equType,
	  								supplier : row.supplier.suName,
	  								equIndate : row.equIndate,
	  								equLocaleCode : equLocaleCode,
	  								equStatus : row.equStatus,
	  								equServiceLog : row.equServiceLog,
	  								localeName : localeName,
	  								equRemark : row.equRemark,
  							});		
  							//添加或者修改成功重写加载数据
							$("#equtab").datagrid('reload');
  				}	
  				
  				//返厂维修
  						function equInSu(equId){
  							$("#win6").window('open');
							$("#win6").window({
								title : '设备返厂回库',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#equtab").datagrid('getSelected');
  						//向form中绑定指定的元素信息
  						$("#myform6").form('load',{		
	  								equId : row.equId,
	  								equCode :row.equCode,
	  								equName :row.equName,
	  								equMac : row.equMac,
	  								equModel : row.equModel,
	  								equType: row.equType,
	  								supplier : row.supplier.suName,
	  								equIndate : row.equIndate,
	  								equStatus : row.equStatus,
	  								equServiceLog : row.equServiceLog,
  							});		
  							//添加或者修改成功重写加载数据
							$("#equtab").datagrid('reload');
  				}	
  				
  						//修改是否上平台
  						function equUpOrDown(equId){
  							$("#win7").window('open');
							$("#win7").window({
								title : '设备返厂回库',
							});
							//获取当前选中的datagrid的整行对象
						var row = $("#equtab").datagrid('getSelected');
						
							var data = {"localeCode" : row.equLocaleCode};
	  						$.ajax({
				     						url:'localeBI.do?findByCode',
				     						data :data,
				     						type:'POST',
				     						async:false,
				     						success:function(result){
				     							return localeName = result, equLocaleCode =row.equLocaleCode;
				     						},
				     						error:function(){
				     							return localeName = "无",equLocaleCode ="无";
				     						}
				     				});
  						//向form中绑定指定的元素信息
  						$("#myform7").form('load',{		
	  								equId : row.equId,
	  								equCode :row.equCode,
	  								equName :row.equName,
	  								equMac : row.equMac,
	  								equModel : row.equModel,
	  								equType: row.equType,
	  								supplier : row.supplier.suName,
	  								localeName : localeName,
	  								equRemark : row.equRemark,
	  								equUpOrDown : row.equUpOrDown
  							});		
  							//添加或者修改成功重写加载数据
							$("#equtab").datagrid('reload');
  				}	
  						
  						function showLog(equId){
  							$("#win8").window('open');
							$("#win8").window({
								title : '设备流转记录',
							});
							
								//获取当前选中的datagrid的整行对象
						var row = $("#equtab").datagrid('getSelected');
						
						var data = {"equCode" : row.equCode};
							$.ajax({
								url:'equipment.do?findReInList',
								data : data,
								type:'POST',
								success:function(result){
									var tab1 = "<table  border="+1+">";
									tab1+="<tr><td colspan="+7+" align='center'>设备流转记录表</td></tr>";
									tab1+="<tr><td>设备编码</td><td>安装场所编码</td><td>出库人</td><td>出库时间</td><td>返修人</td><td>返修时间</td><td>返修原因</td></tr>";
									for(var i = 0; i<result.length;i++){
										var l = result[i];
										tab1 += "<tr><td>"+l.equCode+"</td><td>"+l.localeCode+"</td><td>"+l.elPersonOut+"</td><td>"+l.elTimeout+"</td><td>"+l.elPersonIn+"</td><td>"+l.elTimein+"</td><td>"+l.elReason+"</td></tr>";
									}
									tab1 +="</table>";
									$("#win8 #tab1").html(tab1);
								}
							
							});
							//查询设备返厂信息
							$.ajax({
								url:'equipment.do?findReSuList',
								data : data,
								type:'POST',
								success:function(result){
									var tab2 = "<table  border="+1+">";
									tab2+="<tr><td colspan="+7+" align='center'>设备返厂记录</td></tr>";
									tab2+="<tr><td>设备编码</td><td>返厂时间</td><td>返厂处理人</td><td>回库时间</td><td>回库处理人</td><td>返修原因</td></tr>";
									if(result.length>=1){
									for(var i = 0; i<result.length;i++){
										var l = result[i];
										tab2 += "<tr><td>"+l.equCode+"</td><td>"+l.elTimeout+"</td><td>"+l.elPersonOut+"</td><td>"+l.elTimein+"</td><td>"+l.elPersonIn+"</td><td>"+l.elReason+"</td></tr>";
									}
									}else{
										tab2 +="<tr><td colspan="+7+" align='center'>暂无返厂记录</td></tr>";
									}
									tab2 +="</table>";
									$("#win8 #tab2").html(tab2);
								}
							}); 
							
  						}
  				
  				
  		</script>					

  </head>
  
   <body class="easyui-layout">  
    <div data-options="region:'center',title:'设备信息'"  style="padding:5px;background:#eee;">			
						<input type="checkbox" name="equStatus"  id="equStatus"  value="0">在库
						<input type="checkbox" name="equStatus"  id="equStatus"  value="1">出库(待安装)
						<input type="checkbox" name="equStatus"  id="equStatus"  value="2">暂借
						<input type="checkbox" name="equStatus"  id="equStatus"  value="3">安装完成
						<input type="checkbox" name="equStatus"  id="equStatus"  value="4">设备返修<br /><br />
    
		  				设备编码：
							<input type="text"  id="equCode"  name="equCode">  
						设备MAC：
							<input type="text"  id="equMac"  name="equMac">  
						设备型号：
							<input type="text"  id="equModel"  name="equModel">  
						设备种类：
							<select id="equType" class="easyui-combobox" 
												 	name="equType"  panelHeight="auto" >   
												 	<option value="">全部</option>
												    <option value="SJ">SJ</option>   
												    <option value ="XT">XT</option>   
												    <option value ="交换机">交换机</option> 
												     <option value ="镜像交换机">镜像交换机</option>   
												    <option value ="路由器">路由器</option>   
												    <option value ="AP">AP</option>   
												</select>  
							<br /><br />
						场所编码：
							<input type="text"  id="equLocaleCode"  name="equLocaleCode"> 
						维修记录：
						<input type="text"  id="equServiceLog"  name="equServiceLog">
						是否上平台
						<select id="equUpOrDown" class="easyui-combobox" 
												 	name="equUpOrDown"   panelHeight="auto" >  
												 	<option value ="">全部</option> 
												    <option value ="0">未上平台</option>   
												    <option value ="1">已上平台</option>   
												</select>  
												
						<a href="javascript:void()"  id="sreach" class="easyui-linkbutton">查询</a>
						
						<a href="javascript:void()"  id="reset" class="easyui-linkbutton">重置</a>

    						<table id="equtab" ></table>	
						
						
						
						
						<!-- 弹出查看窗口 -->
						<div id="win" style="padding: 10px;">
								<form id="myform" name="myform" method="post">
								<table>
								<tr>
									<td><label>设备编号:</label></td>	
									 <td>
										 	<input id="equCode" name="equCode"  readonly="readonly"  style="width:200px;">
									</td>
									<td><label>设备名称:</label></td>
									<td>
											<input id="equName" name="equName" readonly="readonly" style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>设备Mac</label></td>	
									<td>   
											<input id="equMac" name="equMac" readonly="readonly" style="width:200px;">
									</td>
									<td>
											<label>设备型号:</label>
									</td>
									<td>
											<input id="equModel" name="equModel" readonly="readonly" style="width:200px;"> 
									</td>
								</tr>
									
								<tr>
										<td>
												<label>设备类型:</label>
										</td>
										<td>
												<select id="equType" class="easyui-combobox" 
												 	name="equType"  disabled="disabled">   
												    <option value="SJ">SJ</option>   
												    <option value ="XT">XT</option>   
												    <option value ="交换机">交换机</option> 
												     <option value ="镜像交换机">镜像交换机</option>   
												    <option value ="路由器">路由器</option>   
												    <option value ="AP">AP</option>   
												</select>  
										</td>
										<td><label>设备厂家:</label></td>	
										<td>
  												<input id="supplier" class="easyui-combobox" disabled="disabled"  style="width:200px;"
												name="supplier"
												data-options="
								    				url:'supp.do?suppList',   
										    		valueField:'suId',   
										    		textField:'suName',
										    		panelHeight:'auto'">
										</td>	
								</tr>
								<tr>
										<td>
												<label>入库时间:</label>
										</td>
										<td>
												<input id="equIndate" name="equIndate" readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>场所名称:</label></td>	
										<td>
  												<input id="localeName"  name="localeName" readonly="readonly" style="width:200px;">
										</td>	
								</tr>
								<tr>
										<td>
												<label>场所编码:</label>
										</td>
										<td>
												<input id="equLocaleCode" name="equLocaleCode" readonly="readonly"  style="width:200px;"> 
										</td>
										<td>
												<label>设备状态:</label>
										</td>
										<td>
											 	<select id="equStatus"  name="equStatus"  class="easyui-combobox"  disabled="disabled" style="width:200px;">   
												    <option value="0">在库</option>   
												    <option value ="1">出库(待安装)</option> 
												    <option value ="2">暂借</option> 
												    <option value ="3">安装完成</option> 
												</select>  
										</td>
								</tr>
								<tr>
										<td>
												<label>返修历史:</label>
										</td>
										<td>
												<input id="equServiceLog" name="equServiceLog" readonly="readonly" style="width:200px;"> 
										</td>
										<td>
												<label>备注信息:</label>
										</td>
										<td>
												<input id="equRemark" name="equRemark" readonly="readonly" style="width:200px;"> 
										</td>
								</tr>
								<tr>
									<td>是否上平台:</td>
										<td>
												<select id="equUpOrDown"  name="equUpOrDown"  class="easyui-combobox"  disabled="disabled"  style="width:200px;">   
												    <option value ="0">否</option> 
												    <option value ="1">是</option>
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
						
						<!--  新增窗口 -->
						
						<div id="win2" style="padding: 10px;">
								<form id="myform2" name="myform2" method="post">
								<table>
								<tr>
									<td><label>设备编号:</label></td>	
									 <td>
										 	<input id="equCode" name="equCode"  style="width:200px;">
									</td>
									</tr>
									<tr>
									<td><label>设备名称:</label></td>
									<td>
											<input id="equName" name="equName"  style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>设备Mac</label></td>	
									<td>   
											<input id="equMac" name="equMac"  style="width:200px;">
									</td>
									</tr>
									<tr>
									<td><label>设备型号:</label></td>
									<td>
											<input id="equModel" name="equModel" style="width:200px;"> 
									</td>
								</tr>	
								<tr>
										<td><label>设备类型:</label></td>
										<td>
												<select id="equType" class="easyui-combobox"  style="width:200px;"
												 	name="equType"  panelHeight="auto" >   
												    <option value="SJ">SJ</option>   
												    <option value ="XT">XT</option>   
												    <option value ="交换机">交换机</option> 
												     <option value ="镜像交换机">镜像交换机</option>   
												    <option value ="路由器">路由器</option>   
												    <option value ="AP">AP</option>   
												</select>  
										</td>
										</tr>
									<tr>
										<td><label>设备厂家:</label></td>	
										<td>
  												<input id="supplier" class="easyui-combobox"  style="width:200px;"
												name="supplier"
												data-options="
								    				url:'supp.do?suppList',   
										    		valueField:'suId',   
										    		textField:'suName',
										    		panelHeight:'auto'">
										</td>	
								</tr>
									<tr>
										<td><label>备注信息:</label></td>
										<td>
												<input id="equRemark" name="equRemark"  style="width:200px;"> 
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
						
						<!-- 出库窗口 -->
						<div id="win3" style="padding: 10px;">
								<form id="myform3" name="myform3" method="post">
								<table>
								<tr>
									<td><label>设备编号:</label></td>	
									 <td>
										 	<input id="equCode" name="equCode"  readonly="readonly"  style="width:200px;">
									</td>
									<td><label>设备名称:</label></td>
									<td>
											<input id="equName" name="equName" readonly="readonly" style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>设备Mac</label></td>	
									<td>   
											<input id="equMac" name="equMac" readonly="readonly" style="width:200px;">
									</td>
									<td>
											<label>设备型号:</label>
									</td>
									<td>
											<input id="equModel" name="equModel" readonly="readonly" style="width:200px;"> 
									</td>
								</tr>
								<tr>
										<td>
												<label>设备类型:</label>
										</td>
										<td>
												<select id="equType" class="easyui-combobox" 
												 	name="equType"  disabled="disabled">   
												    <option value="SJ">SJ</option>   
												    <option value ="XT">XT</option>   
												    <option value ="交换机">交换机</option> 
												     <option value ="镜像交换机">镜像交换机</option>   
												    <option value ="路由器">路由器</option>   
												    <option value ="AP">AP</option>   
												</select>  
										</td>
										<td><label>设备厂家:</label></td>	
										<td>
  												<input id="supplier" class="easyui-combobox" disabled="disabled"  style="width:200px;"
												name="supplier"
												data-options="
								    				url:'supp.do?suppList',   
										    		valueField:'suId',   
										    		textField:'suName',
										    		panelHeight:'auto'">
										</td>	
								</tr>
								<tr>
										<td>
												<label>入库时间:</label>
										</td>
										<td>
												<input id="equIndate" name="equIndate" readonly="readonly" style="width:200px;"> 
										</td>
										<td>
												<label>设备去向</label>
										</td>
										<td>
												<select id="equStatus"  name="equStatus"  class="easyui-combobox" style="width:200px;"  panelHeight="auto" >   
												    <option value ="1">出库(场所)</option> 
												    <option value ="2">暂借</option>
												    <option value ="4">返厂维修</option>  
												</select>   
										</td>
								</tr>
								<tr>
										<td>
												<label>领取人:</label>
										</td>
										<td>
												<input id="equPerson" name="equPerson" style="width:200px;"> 
										</td>
										
										
										<td>
												<label>备注信息:</label>
										</td>
										<td>
												<input id="equRemark" name="equRemark" style="width:200px;"> 
										</td>
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn3" class="easyui-linkbutton">提交</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
						
						<!-- 安装窗口 -->
						<div id="win4" style="padding: 10px;">
								<form id="myform4" name="myform4" method="post">
								<table>
								<tr>
									<td><label>设备编号:</label></td>	
									 <td>
										 	<input id="equCode" name="equCode"  readonly="readonly"  style="width:200px;">
									</td>
									<td><label>设备名称:</label></td>
									<td>
											<input id="equName" name="equName" readonly="readonly" style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>设备Mac</label></td>	
									<td>   
											<input id="equMac" name="equMac" readonly="readonly" style="width:200px;">
									</td>
									<td>
											<label>设备型号:</label>
									</td>
									<td>
											<input id="equModel" name="equModel" readonly="readonly" style="width:200px;"> 
									</td>
								</tr>
								<tr>
										<td>
												<label>设备类型:</label>
										</td>
										<td>
												 <input id="equType" name="equType" readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>设备厂家:</label></td>	
										<td>
  												<input id="supplier" class="easyui-combobox" disabled="disabled"  style="width:200px;"
												name="supplier"
												data-options="
								    				url:'supp.do?suppList',   
										    		valueField:'suId',   
										    		textField:'suName',
										    		panelHeight:'auto'">
										</td>	
								</tr>
								<tr>
										<td>
												<label>入库时间:</label>
										</td>
										<td>
												<input id="equIndate" name="equIndate" readonly="readonly" style="width:200px;"> 
										</td>
										  
										<td><label>安装场所编码:</label></td>	
										<td>
  												<input id="equLocaleCode" name="equLocaleCode" style="width:200px;">
										</td>	
								</tr>
								<tr>
										<td>
												<label>备注信息:</label>
										</td>
										<td>
												<input id="equRemark" name="equRemark" style="width:200px;"> 
										</td>
										<td> 
											<label id="name" ></label>
										</td>	
										<td>
											<div id="localeName" ></div>
										</td>
								</tr>
								<tr>
										<td>
												<label>领取人:</label>
										</td>
										<td>
												<input id="equPerson" name="equPerson" readonly="readonly" style="width:200px;"> 
										</td>
										<td>是否上平台:</td>
										<td>
												<select id="equUpOrDown"  name="equUpOrDown"  class="easyui-combobox" style="width:200px;"  panelHeight="auto" >   
												    <option value ="0">否</option> 
												    <option value ="1">是</option>
												</select>
										</td>		   
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()"  id="saveBtn4" class="easyui-linkbutton">确认安装</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
						
						<!-- 弹出返修窗口 -->
						<div id="win5" style="padding: 10px;">
								<form id="myform5" name="myform5" method="post">
								<table>
								<tr>
									<td><label>设备编号:</label></td>	
									 <td>
										 	<input id="equCode" name="equCode"  readonly="readonly"  style="width:200px;">
									</td>
									<td><label>设备名称:</label></td>
									<td>
											<input id="equName" name="equName" readonly="readonly" style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>设备Mac</label></td>	
									<td>   
											<input id="equMac" name="equMac" readonly="readonly" style="width:200px;">
									</td>
									<td>
											<label>设备型号:</label>
									</td>
									<td>
											<input id="equModel" name="equModel" readonly="readonly" style="width:200px;"> 
									</td>
								</tr>
									
								<tr>
										<td>
												<label>设备类型:</label>
										</td>
										<td>
												<input id="equType" name="equType" readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>设备厂家:</label></td>	
										<td>
  												<input id="supplier" class="easyui-combobox" disabled="disabled"  style="width:200px;"
												name="supplier"
												data-options="
								    				url:'supp.do?suppList',   
										    		valueField:'suId',   
										    		textField:'suName',
										    		panelHeight:'auto'">
										</td>	
								</tr>
								<tr>
										<td>
												<label>入库时间:</label>
										</td>
										<td>
												<input id="equIndate" name="equIndate" readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>场所名称:</label></td>	
										<td>
  												<input id="localeName"  name="localeName"  readonly="readonly"  style="width:200px;">
										</td>	
								</tr>
								<tr>
										<td>
												<label>场所编码:</label>
										</td>
										<td>
												<input id="equLocaleCode" name="equLocaleCode" readonly="readonly"  style="width:200px;"> 
										</td>
										<td>
												<label>设备状态:</label>
										</td>
										<td>
											 	<select id="equStatus" class="easyui-combobox"  disabled="disabled" style="width:200px;"
												 	name="equStatus" >   
												    <option value="0">在库</option>   
												    <option value ="1">未安装</option> 
												    <option value ="2">暂借</option>
												    <option value ="3">安装成功</option>  
												</select>  
										</td>
								</tr>
								<tr>
										<td>
												<label>返修历史:</label>
										</td>
										<td>
												<input id="equServiceLog" name="equServiceLog" readonly="readonly" style="width:200px;"> 
										</td>
										<td>
												<label>备注信息:</label>
										</td>
										<td>
												<input id="equRemark" name="equRemark" readonly="readonly" style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td>
												<label>返修原因:</label>
										</td>
										<td>
												<input id="elReason" name="elReason" style="width:200px;"> 
										</td>
										<td>
												<label>返修人:</label>
										</td>
										<td>
												<input id="elPerson" name="elPerson" style="width:200px;"> 
										</td>
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn5" class="easyui-linkbutton">提交</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
						
						
						<!-- 设备返厂回库窗口 -->
							<div id="win6" style="padding: 10px;">
								<form id="myform6" name="myform6" method="post">
								<table>
								<tr>
									<td><label>设备编号:</label></td>	
									 <td>
										 	<input id="equCode" name="equCode"  readonly="readonly"  style="width:200px;">
									</td>
									<td><label>设备名称:</label></td>
									<td>
											<input id="equName" name="equName" readonly="readonly" style="width:200px;">
									</td>
								</tr>
								
								<tr>
									<td><label>设备Mac</label></td>	
									<td>   
											<input id="equMac" name="equMac" readonly="readonly" style="width:200px;">
									</td>
									<td>
											<label>设备型号:</label>
									</td>
									<td>
											<input id="equModel" name="equModel" readonly="readonly" style="width:200px;"> 
									</td>
								</tr>
									
								<tr>
										<td>
												<label>设备类型:</label>
										</td>
										<td>
												<input id="equType" name="equType" readonly="readonly" style="width:200px;"> 
										</td>
										<td><label>设备厂家:</label></td>	
										<td>
  												<input id="supplier" class="easyui-combobox" disabled="disabled"  style="width:200px;"
												name="supplier"
												data-options="
								    				url:'supp.do?suppList',   
										    		valueField:'suId',   
										    		textField:'suName',
										    		panelHeight:'auto'">
										</td>	
								</tr>
								<tr>
										<td>
												<label>入库时间:</label>
										</td>
										<td>
												<input id="equIndate" name="equIndate" readonly="readonly" style="width:200px;"> 
										</td>
										 <td>
												<label>设备状态:</label>
										</td>
										<td>
											 	<select id="equStatus" class="easyui-combobox"  disabled="disabled" style="width:200px;"
												 	name="equStatus" >   
												    <option value="0">在库</option>   
												    <option value ="1">待安装</option> 
												    <option value ="2">暂借</option>
												    <option value ="3">安装完成</option>
												     <option value ="4">返厂维修中</option>    
												</select>  
										</td>
								</tr>
								<tr>
										<td>
												<label>返修历史:</label>
										</td>
										<td>
												<input id="equServiceLog" name="equServiceLog" readonly="readonly" style="width:200px;"> 
										</td>
											<td>
												<label>备注</label>
										</td>
										<td>
												<input id="equRemark" name="equRemark" style="width:200px;"> 
										</td>
								</tr>
								<tr>
										<td>
												<label>处理人:</label>
										</td>
										<td>
												<input id="elPersonIn" name="elPersonIn" style="width:200px;"> 
										</td>
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn6" class="easyui-linkbutton">关闭</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
						
						
						<!-- 修改是否上平台 -->
						<div id="win7" style="padding: 10px;">
								<form id="myform7" name="myform7" method="post">
								<table>
								<tr>
									<td><label>设备编号:</label></td>	
									 <td>
										 	<input id="equCode" name="equCode"  readonly="readonly"  style="width:150px;">
									</td>
									<td><label>设备名称:</label></td>
									<td>
											<input id="equName" name="equName" readonly="readonly" style="width:150px;">
									</td>
								</tr>
								
								<tr>
									<td><label>设备Mac</label></td>	
									<td>   
											<input id="equMac" name="equMac" readonly="readonly" style="width:150px;">
									</td>
									<td>
											<label>设备型号:</label>
									</td>
									<td>
											<input id="equModel" name="equModel" readonly="readonly" style="width:150px;"> 
									</td>
								</tr>
								<tr>
										<td>
												<label>设备类型:</label>
										</td>
										<td>
												 <input id="equType" name="equType" readonly="readonly" style="width:150px;"> 
										</td>
										<td><label>设备厂家:</label></td>	
										<td>
  												<input id="supplier" class="easyui-combobox" disabled="disabled"  style="width:150px;"
												name="supplier"
												data-options="
								    				url:'supp.do?suppList',   
										    		valueField:'suId',   
										    		textField:'suName',
										    		panelHeight:'auto'">
										</td>	
								</tr>
								<tr>
										<td><label>安装场所编码:</label></td>	
										<td>
  												<input id="equLocaleCode" name="equLocaleCode" readonly="readonly"  style="width:150px;">
										</td>	
										<td><label>场所名称:</label></td>	
										<td>
  												<input id="localeName"  name="localeName" readonly="readonly" style="width:150px;">
										</td>	
								</tr>
								<tr>
										<td>
												<label>备注信息:</label>
										</td>
										<td>
												<input id="equRemark" name="equRemark" readonly="readonly" style="width:150px;"> 
										</td>
										<td>是否上平台:</td>
										<td>
												<select id="equUpOrDown"  name="equUpOrDown"  class="easyui-combobox" style="width:150px;"  panelHeight="auto" >   
												    <option value ="0">否</option> 
												    <option value ="1">是</option>
												</select>
										</td>		   
								</tr>
						   			<tr>
							   			<td colspan="4" align="center">
											<a href="javascript:void()" id="saveBtn7" class="easyui-linkbutton">提交</a>
										</td>
									</tr>
									</table>
								</form>
						</div>
						
						<div id="win8" style="padding: 10px;">
								<table id="tab1" border="1" align="center"></table>
								<br/>
								<br/>
								<table id="tab2" border="1" align="center"></table>
						
						</div>
    </div>  
    
  </body>
</html>
