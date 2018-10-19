<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type"
	content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>业务分析主页</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ec/style.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ec/tag.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	type="text/css"></link>
<script type="text/javascript">
$(function(){
	$("#one").trigger("click")
})

	//切换tab页
	function changtag(obj) {
		$("#tabqh li").attr("class", "tag");
		$("#" + obj).attr("class", "current");
	}
	function nav_goto(targeturl) {
		/*  if (targeturl != null && targeturl != '') {
			if (targeturl.length > 150) {
				url = url + "&loginUser=" + '${session.loginUser.itCode}';
			}
		} */ 
		parent.frames.content.location = "${pageContext.request.contextPath}/"+targeturl+"";
	}
</script>
</head>
<body>

	<div class="slider_right">
		<p class="title">
			<a href="#">设置</a> <span>/</span> <a href="#">会员资料</a>
		</p>
		<div class="tabs_con">
			<ul id="tabqh">
				<li class="current" id="order" onclick="changtag('order')">
				<a href="#" data-toggle="tab" onclick="nav_goto('user/selectCompany.do')"><span id="one">基本信息</span></a>
				</li>
				<li id="plan" onclick="changtag('plan')">
				<a href="#" data-toggle="tab" onclick="nav_goto('user/selectDepartment.do')">部门信息</a>
				</li>
				<li id="appliances" onclick="changtag('appliances')">
				<a href="#" data-toggle="tab" onclick="nav_goto('user/certificateInfo.do')">证书信息</a>
				</li>
				<li id="invoice" onclick="changtag('invoice')">
				<a href="#" data-toggle="tab" onclick="nav_goto('user/invoiceInfo.do')">发票信息</a>
				</li>
				<li id="contact" onclick="changtag('contact')">
				<a href="#" data-toggle="tab" onclick="nav_goto('user/contacts.do')">联系人</a>
				</li>
				<li id="verification" onclick="changtag('verification')">
				<a href="#" data-toggle="tab" onclick="nav_goto('user/verificationInstitution.do')">检定机构</a>
				</li>
			</ul>

		</div>

	</div>

</body>
</html>