<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>中检远航计量器具在线</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function nav_goto(targeturl) {
	/*  if (targeturl != null && targeturl != '') {
		if (targeturl.length > 150) {
			url = url + "&loginUser=" + '${session.loginUser.itCode}';
		}
	} */ 
	window.parent.parent.location.href = "${pageContext.request.contextPath}/"+targeturl+"";
}

</script>

<style type="text/css">
.myhead {
    height: 80px;
    margin: 0 auto;
    position: relative;
    width: 93%;
}

.head-left {
    border-left: 1px dashed #ccc;
    float: left;
    font: 20px/40px "microsoft yahei";
    height: 40px;
    margin: 30px 6px 0 150px;
    padding-left: 8px;
    width: 250px;
}
.head-right {
    float: right;
    font: 12px/80px "microsoft yahei";
    height: 80px;
    width: 40%;
}

</style>
</head>

<body>
<!--开始-->
<div class="myhead">
			<h1>
				<img src="<%=basePath%>/ShowImage?realImagePath=${logo.path}" style="width: 222px;height: 62px; margin-top: 15px;" />
			</h1>
		    <div class="head-left">
		        计量器具在线管理系统
		    </div>
		    <ul class="head-right">
		        <li><a href="javascript:void(0);" >帮助中心</a></li>
		        <li>|</li>
		        <li><a href="javascript:void(0);">联系客服</a></li>
			        <li>|</li>
			        <li><a href="javascript:void(0);">服务商中心</a></li>
			        <li>|</li>
			        <li><a href="javascript:void(0);">我的平台</a></li>
	                <li class="asa">
					    ${userLogin.userName }
				    	<a onclick="nav_goto('user/Logout.do');" href="#" id="headerLogout" style="">[退出]&nbsp;</a><span>|</span>
				    </li>
		    </ul>
</div>

	<div id="myModal" class="profile-alert">
	    <h3 class="profile-alert-h3">导入器具
	        <a onclick="closeModalWindow('myModal');return false;" class="profile-alert-colse">×</a>
	    </h3>
	    <form  action="importEquipAccountByExcel" method="post" name="ImportInstrumentsByExcel" id="ImportInstrumentsByExcel"  enctype="multipart/form-data">
	        <dl class="profile-alert-dl">
	            <dt><span class="excelPath">导入文件</span><span style="color: red;"></span> </dt>
	            <dd> <input type="file" name="excelPath" id="excelPath" placeholder="Excel导入文件" style="width:80%;">
	            <a  href="javascript:void(0);" onclick="window.location.href='downloadCommonFile?fileId=DEVICE_TEMPLATE';return false;">下载器具模板 </a>
	                <span class="a_spans" ></span>
	            </dd>
	        </dl>
	    </form>
	    <div class="alert-btn">
	        <a href="javascript:;" onclick="closeModalWindow('myModal');return false;" class="alert-btn-a alert-btn-close">关闭</a>
	        <a href="javascript:;" onclick="saveFile('ImportInstrumentsByExcel');return false;" class="alert-btn-a alert-btn-save">导入</a>
	    </div>
	</div>
</body>
</html>