<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp22222.jsp' starting page</title>
    
  <head>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  	<link rel="stylesheet" href="js/themes/icon.css" type="text/css"></link>
  	<link rel="stylesheet" href="js/themes/default/easyui.css" type="text/css"></link>
  	<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
  	
  	<style type="text/css">
  .icon-reload {
    cursor: pointer;
}​
  	</style>
  	<script type="text/javascript">
  	$(function(){
  	
  	
  			$('#tt').tabs({
			    border: false,
			    onSelect: function(title) {
			        //alert(title+' is selected');  
 			   }
			}); 
		/*	$('#tt').tabs({
			    border:false,
			    onSelect:function(title){
			        alert(title+' is selected');
			    }
			});
		*/
		$('#tt').tabs('add',{
		    title:'New Tab',
		    content:'Tab Body',
		    closable:true,
		    tools:[{
		        iconCls:'icon-mini-refresh',
		        handler:function(){
		            alert('refresh');
		        }
		    }]
		});
		/*
		function addTab(title, url) {
		    if ($('#tt').tabs('exists', title)) {
		        $('#tt').tabs('select', title);
		    } else {
		        var content = 'added tab';
		        $('#tt').tabs('add', {
		            title: title,
		            iconCls: 'icon-reload',
		            content: content,
		            closable: true
		        });
		    }
		}
		*/
		function myTabUpdate(index) {
		    return Math.random() + ' index ' + index;
		}

		$(".icon-reload").live('click', function() {
		    var t = $('#tt');  
		    var tabs = t.tabs('tabs');  
		    var tabIndex = $(this).closest('li').index();
		
		    $('#tt').tabs('update', {
		        tab: tabs[tabIndex],
		        options: {
		            content: myTabUpdate(tabIndex)
		        }
		    });
		});

			addTab('Tab1', 'http://google.com');
			addTab('Tab2', 'http://google.com');
			addTab('Tab3', 'http://google.com');
			
			// get the selected tab panel and its tab object
				var pp = $('#tt').tabs('getSelected');
				var tab = pp.panel('options').tab;    // the corresponding tab object    ​
  	});
  	</script>
  </head>
  
  <body>
   <div id="tt" class="easyui-tabs" style="width:500px;height:250px;">
    <div title="Tab1" style="padding:20px;display:none;">
        tab1
    </div>
    <div title="Tab2" data-options="closable:true" style="overflow:auto;padding:20px;display:none;">
        tab2
    </div>
    <div title="Tab3" data-options="iconCls:'icon-reload',closable:true" style="display:none;">
        tab3
    </div>
</div>
  </body>
</html>
