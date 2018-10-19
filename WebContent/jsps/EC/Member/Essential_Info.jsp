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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript">
	function savePartyCustomer(){
		var companyName = $("#companyName").val();
		if(companyName == null || companyName ==""){
			confirm("单位名称不能为空！");
			return false;
		}
		
		$("#MyEntrustingPartyForm").attr("action","${pageContext.request.contextPath}/user/updateCompany.do").submit();
	}
</script>
</head>
<body>

	<div class="slider_right">

		<div class="tabs_con">

			<div id="z_content">
				<div style="display: block;" class="zcons" id="tab_unitInfo">
					<form class="form-horizontal" action="" method="post" name="MyEntrustingPartyForm" id="MyEntrustingPartyForm">
						<input type="hidden" name="companyUUID" value="${company.companyUUID  }"/>
						<dl class="zcons-unit-dl">
							<dt>
								<span class="customerName">单位名称</span> <span style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required"
									name="companyName" id="companyName" placeholder="请输入单位名称"
									value="${company.companyName }"> <span
									class="a_spans"></span>
							</dd>
							<dt>单位代码</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="companyCode"
									id="companyCode" placeholder="请输入单位代码" value="${company.companyCode }">
							</dd>
							<dt>地址</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="companyAddress"
									id="companyAddress" placeholder="请输入地址"
									value="${company.companyAddress }">
							</dd>
							<dt>邮编</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="companyZipCode"
									id="companyZipCode" placeholder="请输入邮编" value="${company.companyZipCode }">
							<dt>开户行</dt>
							<dd>
								<input type="text" class="basic_infoForm"
									name="companyOpenBank" id="companyOpenBank"
									placeholder="请输入开户行" value="${company.companyOpenBank }">
							</dd>
							<dt>账号</dt>
							<dd>
								<input type="text" class="basic_infoForm"
									name="companyCardNumber" id="companyCardNumber"
									placeholder="请输入账号" value="${company.companyCardNumber }">
							</dd>
							<c:if test="${userLogin.userLevel eq 'ROLE_PERMISSION_0' }">
								<dt class="unit-dt">
									<button class="zcons-unit-save" type="button" onclick="savePartyCustomer()">保存</button>
								</dt>
								<dd class="unit-dd">
									<button class="zcons-unit-reset" type="reset">重置</button>
								</dd>
							</c:if>
							
						</dl>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>