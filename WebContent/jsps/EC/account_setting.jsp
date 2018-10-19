<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type"content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>账号设置</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/account_setting.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript">
$(function(){
	var msg = $("#msg").val().trim();
	if(msg!="" &&msg!=null){
		$("#msg").val("");
		window.parent.frames["top"].location.reload();
	}
});
//修改密码
function updatePassword() {
	openModalWindow("mypassword");
}
</script>
</head>
<body>
<input id="path" type="hidden" value="${pageContext.request.contextPath }">
<input type="hidden" id="msg" value="${msg }">
  <div class="slider_right">
	<p class="title">
	    <a href="#">设置</a>
	    <span>/</span>
	    <a href="#">账号设置</a>
	</p> 
	
	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav navas">
	    	<h4>账号设置</h4>
    	</div>
    	<div class="appliance_con">
    		<table width="100%" border="1" cellspacing="1" class="z_table" style="border-collapse:collapse;">
		    	<tr class="z_tops_title"> 
		       		<td>序号</td>
			        <td onclick="setSortField('controlCode','')">类别<span id="controlCodeSortLable"></span></td> 
			        <td>操作</td>
		       	</tr>
		       	<tr height="50px">
		       		<td>1</td>
		       		<td>用户名</td>
		       		<td>
		       		<button type="button" class="profiles-btn profiles-btn-edit" onclick="openModalUrl1('UserLoginIdEdit','ECL0001','name');">设置</button></td>
		       	</tr>
		       	<tr height="50px">
		       		<td>2</td>
		       		<td>手机号</td>
		       		<td><button type="button" class="profiles-btn profiles-btn-edit" onclick="javascript:openModalUrl1('UserLoginIdEdit','ECL0001','phone');">设置</button></td>
		       	</tr>
		       	<tr height="50px">
		       		<td>3</td>
		       		<td>Logo设置</td>
		       		<td><button type="button" class="profiles-btn profiles-btn-edit" onclick="javascript:updateLogo();">设置</button></td>
		       	</tr>
		       		<tr height="50px">
		       		<td>4</td>
		       		<td>密码设置</td>
		       		<td><button type="button" class="profiles-btn profiles-btn-edit" onclick="javascript:updatePassword();">设置</button></td>
		       	</tr>
		    </table>
		</div> 
	</div>
	
<!-- 修改Logo -->
<div id="myModal" class="profile-alert">
	    <h3 class="profile-alert-h3">Logo设置<!-- ${pageContext.request.contextPath}/images/ec/z_logo.png -->
	        <a onclick="closeModalWindow('myModal');return false;" class="profile-alert-colse">×</a>
	    </h3>
	    <form  action="user/updateLogo.do" method="post" name="" id="logo"  enctype="multipart/form-data">
	        <table  style="margin-bottom: 30px;margin: 0 auto;">
						<tr>
						 <td>&nbsp;</td>
								<td><img  id="userPhoto" src="<%=basePath%>/ShowImage?realImagePath=${logo.path}"></td>
						</tr>
						<tr>
						  <td>&nbsp;</td>
						  <td><input type="text" style="width: 300px;" name="" value="${logo.path}" class="basic_infoForm basic_infoForm_a "></td>
						</tr>
							<tr>
								<td>&nbsp;</td>
								<td>
									<input id="myFile" type="file" name="file" onchange="uploadFile(this,'userPhoto')" style="width: 150px;"/>
								</td>
							</tr>
						</table>
	   
	    <div class="alert-btn">
	        <a href="javascript:;" onclick="closeModalWindow('myModal');return false;" class="alert-btn-a alert-btn-close">关闭</a>
	        <input type="button" class="alert-btn-a alert-btn-save" value="保存" onclick="subLogo()">
	    </div>
	     </form>
</div>

<!-- 修改密码 -->
<div id="mypassword" class="profile-alert">
	    <h3 class="profile-alert-h3">修改密码
	        <a onclick="closeModalWindow('mypassword');return false;" class="profile-alert-colse">×</a>
	    </h3>
	    <form  action="" method="post" name="" id="updatepassword"  >
	        <table  style="margin-bottom: 30px;margin: 0 auto;">
						<tr>
						<td>旧密码：</td>
						<td>
						<input style="width:300px;" class="basic_infoForm basic_infoForm_a required" type="password" class="form-control" name="password" id="password" placeholder="请输入旧密码" >
						</td>
						</tr>
						<tr>
						<td>新密码：</td>
						<td>
						<input style="width:300px;"  type="password"  name="newPassword" value="" class="basic_infoForm basic_infoForm_a required" placeholder="请输入新密码" >
						</td>
						</tr>
						<tr>
						<td>确认密码：</td>
						<td>
						<input style="width:300px;"  type="password"  name="newPasswordVerify"  class="basic_infoForm basic_infoForm_a required" placeholder="请确认新密码" >
						</td>
						</tr>		
		</table>
	    <div class="alert-btn">
	        <a href="javascript:;" onclick="closeModalWindow('mypassword');return false;" class="alert-btn-a alert-btn-close">关闭</a>
	        <input type="button" class="alert-btn-a alert-btn-save" value="保存" onclick="submitpass()">
	    </div>
	     </form>
</div>

</div>
 
</body>
</html>