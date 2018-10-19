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
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
function saveUser(){
	var userName = $("#userName").val();
	var companyUUID = $("#companyUUID").val();
	var departmentUUID = $("#departmentUUID").val();
	var loginUser = $("#loginUser").val();
	var loginPassWord = $("#loginPassWord").val();
	var state = $("#state").val();
	if(userName == null || userName ==""){
		confirm("用户名称不能为空！");
		return false;
	}
	if(companyUUID == null || companyUUID ==""){
		confirm("所属客户不能为空！");
		return false;
	}
	if(departmentUUID == null || departmentUUID ==""){
		confirm("所属部门不能为空！");
		return false;
	}
	if(loginUser == null || loginUser ==""){
		confirm("登录账号不能为空！");
		return false;
	}
	if(loginPassWord == null || loginPassWord ==""){
		confirm("登录密码不能为空！");
		return false;
	}
	if(state == null || state ==""){
		confirm("状态不能为空！");
		return false;
	}
	
	$("#MyInstrumentsForm").attr("action","${pageContext.request.contextPath}/user/insertuser.do").submit();
	
}
	
</script>
</head>
<body>

	<div class="slider_right">
		<!-- End Template component://limsZJJL_EC/webapp/ec/includes/mainContent_header.ftl -->
		<!-- Begin Template component://limsZJJL_EC/webapp/ec/MyInstruments/myInstruments_list.ftl -->
		<p class="title">
			<a href="JavaScript:void(0)">设置</a> <span>/</span> <a href="JavaScript:void(0)">用户设置</a><span>/</span> <a href="JavaScript:void(0)">编辑用户</a>
		</p>

		<form  method="post" name="MyInstrumentsForm" id="MyInstrumentsForm">
			<input type="hidden" name="equipId" id="equipId" class="" value="">
			<div class="basic_info">
				<h3 id="zclick_event" class="z_A">
					<a href="#">用户信息</a>
				</h3>
				<div id="zhidden_enent" class="basic_infoss" style="display: block">
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names controlCode">用户名称</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_a required"
								id="userName" name="userName" value="" type="text" /> <span
								class="a_spans"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names equipStatus">所属客户</span>
							<p class="z_star">*</p>
							<div class="z_select_border">
								<div class="z_container">
									<select id="companyUUID" name="companyUUID"
										class="basic_infoForm selects required">
										<option value="">请选择</option>
										<c:forEach items="${companyList }" var="company">
											<option value="${company.companyUUID }">${company.companyName }</option>
										</c:forEach>
									</select> <span class="a_span" style="color: #B94A48;"></span>
								</div>
							</div>
						</div>
						<div class="basic_info_con_L">
							<span class="z_names testGroup">所属部门</span>
							<p class="z_star">*</p>
							<div class="z_select_border">
								<div class="z_container">
									<select id="departmentUUID" name="departmentUUID"
										class="basic_infoForm selects required">
										<option value="">请选择</option>
										<c:forEach items="${departmentList }" var="department">
											<option value="${department.departmentUUID }">${department.departmentName }</option>
										</c:forEach>
									</select> <span class="a_span" style="color: #B94A48;"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names equipName">登录账号</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="loginUser" name="loginUser"
								value="" type="text"
								placeholder="" /> <span class="a_spans1"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names equipOrderType">登录密码</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="loginPassWord" name="loginPassWord"
								value="" type="text"
								placeholder="" />
						</div>
						<div class="basic_info_con_L">
							<span class="z_names w_names equipName">用户邮箱</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="userEmail" name="userEmail" value="" type="text"
								placeholder="" /> <span class="a_spans1"></span>
						</div>
						<!--  
						<div class="basic_info_con_R">
							<span class="z_names testDate">用户级别</span>
							<p class="z_star">*</p>
							<div class="z_select_border">
								<div class="z_container">
									<select id="userLevel" name="userLevel"
										class="basic_infoForm selects required">
										<option value="">请选择</option>
										<c:forEach items="${roleList }" var="role">
											<option value="${role.rolePermission }">${role.roleName }</option>
										</c:forEach>
									</select> <span class="a_span" style="color: #B94A48;"></span>
								</div>
							</div>
						</div>-->
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names factoryNo">用户手机号</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_c required"
								id="userPhone" name="userPhone" value="" type="text"
								placeholder="" /> <span class="a_spans2"></span>
						</div>

							<div class="basic_info_con_R">
								<span class="z_names w_names equipSpec/equipModel">用户地址</span>
								<p class="z_star"></p>
								<input class="basic_infoForm basic_infoForm_c required"
									id="userAddress" name="userAddress" value="" type="text" placeholder="" />
								<span class="a_spans2"></span>
							</div>

						<div class="basic_info_con_L equipAcceptDate">
							<span class="z_names">用户传真</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_c "
								id="userFax" name="userFax"value="" type="text" placeholder=""/>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names manufacture">用户固话</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="userTelephone" name="userTelephone"
								type="text" value="" placeholder="" />
						</div>
						<div class="basic_info_con_R">
							<span class="z_names equipType">状态</span>
							<p class="z_star"></p>
							<div class="z_select_border">
								<div class="z_container">
									<select name="state" id="state"
										class="basic_infoForm selects">
										<option value="">请选择</option>
										<option value="1">可用</option>
										<option value="0">不可用</option>
									</select>
								</div>
							</div>
						</div>
						
					</div>
					
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names accuracyLevel">备注</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="remark" name="remark"
								type="text" value="" placeholder="" />
						</div>
					</div>
				</div>
			</div>
			
	<div class="bot_btns">
		<a href="javascript:void(0);" class="bta_w" onclick="javacript:saveUser();">保存</a> 
		<a href="javascript:void(0);" onclick="javascript:window.history.back();">返回</a>
	</div>
	
	</form>
</div>
</body>
</html>