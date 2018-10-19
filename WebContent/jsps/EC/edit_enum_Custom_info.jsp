<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type"
	content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>业务分析主页</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
$(function() {
	var msg = $("#msg").val();
	if (msg != "" && msg != null) {
		alert(msg);
	}
});
	function addField() {
		var path = $("#path").val();
		var fieldid = $("#equipType").val();
		var enumValue = $("#enumValue").val();
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/insertEnum.do',
		   	data:{fieldid:fieldid,enumValue:enumValue},
			success:function(data){
				if(data == "success"){
					$("#enumlist").empty();
					$("#enumValue").val("");
					$.ajax({
						type:'POST',
						url:'${pageContext.request.contextPath}/user/selectEnum.do',
					   	data:{fieldid:fieldid},
						success:function(data){
							if(data.length>0){
								for(var i =0;i<data.length;i++){
							$("#enumlist").append("<li class='filedRound'>"+
									"<div id='zhidden_enenta' class='basic_infoss'"+
										"style='display: block'>"+
										"<div class='rounded'>"+data[i].enumValue+"<a onclick='delfile("+data[i].enumid+")' style='cursor: pointer;'>×</a></div>"+
									"</div></li>");
								}
							}
						}
					});
				}
			}
		});

	}
	function delfile(fileID){
		var path = $("#path").val();
		
		$("#addFieldForm").attr("action", path + "/user/deleteEnumField.do?ID="+fileID).submit();
	}
	
function selectEnum(){
	var fieldid = $("#equipType").val();
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/selectEnum.do',
		   	data:{fieldid:fieldid},
			success:function(data){
				if(data.length>0){
					$("#enumlist").empty();
					for(var i =0;i<data.length;i++){
				$("#enumlist").append("<li class='filedRound'>"+
						"<div id='zhidden_enenta' class='basic_infoss'"+
							"style='display: block'>"+
							"<div class='rounded'>"+data[i].enumValue+"<a onclick='delfile("+data[i].enumid+")' style='cursor: pointer;'>×</a></div>"+
						"</div></li>");
					}
				}else{
					$("#enumlist").empty();
				}
			}
		});
	}
	
</script>
<style type="text/css">
.rounded {
	width: 80px;
	height: 40px;
	margin: 10px;
	float: left;
	text-align: center;
	line-height: 34px;
	font-size: 10px;
	color: #46A3FF;
	font-family: Microsoft JhengHei;
	border: 2px solid #9D9D9D;
	border-radius: 30px;
}
.rounded_n{
	width: 80px;
	height: 40px;
	margin: 10px;
	float: left;
	text-align: center;
	line-height: 34px;
	font-size: 10px;
	color: #9D9D9D;
	font-family: Microsoft JhengHei;
	border: 2px solid #9D9D9D;
	border-radius: 30px;
}

.filedRound {
	float: left;
}
</style>
</head>
<body>

	<div class="slider_right">
		<p class="title">
			<a href="#">主菜单</a> <span>/</span> <a href="#">定义枚举值</a>
		</p>


		<div class="appliance_list"
			style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
			<div class="nav navas">
				<h4
					style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">自定义器具表单字段</h4>
			</div>
			<div class="basic_info">
				<ul id="enumlist">
				
				</ul>
			</div>

			<div class="basic_info">
				<h3 id="zclick_eventa" class="z_A">
					<a href="#">添加字段表单信息</a>
				</h3>
				<div id="zhidden_enenta" class="basic_infoss" style="display: block">

					<form id="addFieldForm" method="post">
						<input type="hidden" id="msg" value="${msg }"> 
						<input type="hidden" id="path" value="${pageContext.request.contextPath }"> 
						<input type="hidden" id="fieldid" name="fieldid" value="">
							
					<div class="basic_info_con">
							<div class="basic_info_con_L info_line">
								<span for="cert_linkAddress" class="z_names newPasswordVerify">枚举字段</span>
								<p class="z_star"></p>
								<select id="equipType" onchange="selectEnum()" class="basic_infoForm basic_infoForm_b required" style="width: 380px;" 
								 >
									<option value="" selected="selected">请选择</option>
									<c:forEach items="${fieldList }" var="field" varStatus="i" >
									<option value="${field.id }">${field.fieldDescrib }</option>
									</c:forEach>
									
								</select> <span class="a_spans"></span>
							</div>
						</div>
						<div class="basic_info_con">
							<div class="basic_info_con_L info_line">
								<span for="cert_linkAddress" class="z_names newPassword">枚举值</span>
								<p class="z_star"></p>
								<input style="width: 380px;"
									class="basic_infoForm basic_infoForm_b required" type="text"
									class="form-control" name="enumValue" id="enumValue"
									placeholder="请输入枚举值描述"> <span class="a_spans"></span>
							</div>
						</div>
						
						<div class="bot_btns" style="padding: 40px 0px 0px 345px;">
							<button class="zcons-unit-save"
								style="float: left; margin-right: 20px;" type="button"
								class="btn btn-info btn-lg" onclick="addField()">添加</button>
							<button class="zcons-unit-reset" style="float: left" type="reset"
								class="btn btn-info btn-lg" onclick="reset()">重置</button>
						</div>
					</form>
				</div>
			</div>


		</div>


	</div>

</body>
</html>