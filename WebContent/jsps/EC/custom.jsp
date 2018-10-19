<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type"content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>业务分析主页</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" type="text/css"></link>
<link href='${pageContext.request.contextPath}/css/ymPrompt.css' media='all' rel='stylesheet' type='text/css' />
<script src="${pageContext.request.contextPath}/js/ymPrompt.js"></script>
<script type="text/javascript">
	    function reset(){
	    	
	    	$("input[type='password']").val("");
	    }
	    
	    function submit(){
				var password = $("password").val();
				var newPassword = $("newPassword").val();
				var newPasswordVerify = $("newPasswordVerify").val();
				if(password == null || password == ""){
					ymPrompt.alert( {
						message : "旧密码不能为空！",
						fixPosition : true,
						
						title : "操作提示",
						btn : [ [ "确定", 'confirm' ] ]
					});
					return false;
				}
				if(newPassword == null || newPassword == ""){
					ymPrompt.alert( {
						message : "新密码不能为空！",
						fixPosition : true,
						
						title : "操作提示",
						btn : [ [ "确定", 'confirm' ] ]
					});
					return false;
				}
				if(newPasswordVerify == null || newPasswordVerify == ""){
					ymPrompt.alert( {
						message : "确认密码不能为空！",
						fixPosition : true,
						
						title : "操作提示",
						btn : [ [ "确定", 'confirm' ] ]
					});
					return false;
				}
				if(newPasswordVerify != newPassword){
					ymPrompt.alert( {
						message : "两次密码不一致！",
						fixPosition : true,
						
						title : "操作提示",
						btn : [ [ "确定", 'confirm' ] ]
					});
					return false;
				}
		//$('#updatepassword').attr('action',$('#path').val()+"/page/register.do").submit();    	
	    }
</script>
</head>
<body>
 
  <div class="slider_right">
	<p class="title">
	    <a href="#">设置</a>
	    <span>/</span>
	    <a href="#">修改密码</a>
	</p> 
	
	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav navas">
	    	<h4 style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">修改密码</h4>
    	</div>
    	<div class="appliance_con">
    	<form id="updatepassword" method="post">
    	<input type="hidden" id="path" value="${pageContext.request.contextPath }">
    		<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span for="cert_customerName" class="z_names password">旧密码</span><p class="z_star"></p>
							<input style="width:380px;" class="basic_infoForm basic_infoForm_b required" type="password" class="form-control" name="password" id="password" placeholder="请输入旧密码" onblur="checkFormTC('password')">
							<span class="a_spans"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line" >
							<span for="cert_linkAddress" class="z_names newPassword">新密码</span><p class="z_star"></p>
							<input style="width:380px;"  class="basic_infoForm basic_infoForm_b required" type="password" class="form-control" name="newPassword" id="userpassword" placeholder="请输入新密码" onblur="checkPassword()">
							<span class="a_spans"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span for="cert_linkAddress" class="z_names newPasswordVerify">新密码</span><p class="z_star"></p>
							<input style="width:380px;"  class="basic_infoForm basic_infoForm_b required" type="password" class="form-control" name="newPasswordVerify" id="newPasswordVerify" placeholder="请输入确认新密码" onblur="checkRePassword()">
							<span class="a_spans"></span>
						</div>
					</div>
					<div class="bot_btns" style="padding: 40px 0px 0px 345px;">
				       	<button class="zcons-unit-save" style="float:left; margin-right:20px;" type="reset" class="btn btn-info btn-lg" onclick="javacript:submitAjax();return false;">保存</button>		
				       	<button class="zcons-unit-reset" style="float:left" type="reset" class="btn btn-info btn-lg" onclick="reset()"> 重置 </button>		
		            </div>
			</form>
		</div> 
	</div>


</div>
 
</body>
</html>