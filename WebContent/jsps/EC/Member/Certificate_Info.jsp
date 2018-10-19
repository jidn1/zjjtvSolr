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

<script type="text/javascript">
	
</script>
</head>
<body>

	<div class="slider_right">

		<div class="tabs_con">

			<div class="zcons" id="tab_certInfo">
				<div class="department-head" style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x scroll 0 0;">
					<span>证书信息列表</span> <a href="javascript:addCertModal();" style="background: #fff url(${pageContext.request.contextPath}/images/ec/zicon05.png) no-repeat scroll 5px center;"
						class="department-add"> 添加证书信息</a>
				</div>
				<div style="padding: 10px; border: 1px solid #ccc;">
					<table id="certTbl" class="department-table" cellspacing="0"
						width="100%">
						<tr>
							<td>证书名称</td>
							<td>证书地址</td>
							<td>操作</td>
						</tr>
						<tr id="tr_cert10001">
							<td><span id="span_cert_customerName10001">&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;</span>
								<input id="cert_customerName10001" type="hidden"
								value="&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;" />
							</td>
							<td><span id="span_cert_linkAddress10001">&#23665;&#19996;&#28493;&#22346;</span>
								<input id="cert_linkAddress10001" type="hidden"
								value="&#23665;&#19996;&#28493;&#22346;" /></td>
							<td>
								<button type="button" class="profiles-btn profiles-btn-edit"
									onclick="editCertModal('10001')">编辑</button>
								<button type="button" class="profiles-btn profiles-btn-del"
									onclick="deleteCert('10001')">删除</button>
							</td>
						</tr>
					</table>
				</div>
				<div id="myCertModal" class="profile-alert">
					<h3 class="profile-alert-h3">
						编辑证书 <a onclick="closeModalWindow('myCertModal');return false;"
							class="profile-alert-colse">×</a>
					</h3>
					<form class="form-horizontal" action="createCertContacts"
						method="post" name="MyCertForm" id="MyCertForm">
						<input type="hidden" name="taskCustomerId"
							id="cert_taskCustomerId" /> <input type="hidden"
							name="customerId" value="EC0001" /> <input type="hidden"
							name="customerType" value="JL_TASK_CUST_TYPE_1" />
						<dl class="profile-alert-dl">
							<dt>
								<span class="cert_customerName">证书名称</span> <span
									style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required"
									name="customerName" id="cert_customerName" placeholder="证书名称"
									onblur="javascript:checkFormTC(this.id);return false;">
								<span class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="cert_linkAddress">证书地址</span> <span
									style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required"
									name="linkAddress" id="cert_linkAddress" placeholder="证书地址"
									onblur="javascript:checkFormTC(this.id);return false;">
								<span class="a_spans" style="margin-left: 0;"></span>
							</dd>
						</dl>
					</form>
					<div class="alert-btn">
						<a href="#" onclick="javascript:saveCertInfo();return false;"
							class="alert-btn-a alert-btn-save">保存</a> <a href="#"
							onclick="closeModalWindow('myCertModal');return false;"
							class="alert-btn-a alert-btn-close">关闭</a>
					</div>
				</div>
				<script>
					function saveCertInfo() {
						var formId = "MyCertForm";
						var url = $("#" + formId).attr('action');
						if ($("#cert_taskCustomerId").val()) {
							url = "updateCertContacts";
						}
						var customerStr = [ "cert_customerName",
								"cert_linkAddress" ];
						var flag = true;
						for (var i = 0; i < customerStr.length; i++) {
							var currentflag = checkFormTC(customerStr[i]);
							if (!currentflag) {
								flag = false;
							}
						}
						if (flag) {
							$
									.ajax({
										url : url,
										type : 'POST',
										datatype : "json",
										cache : false,
										data : $("#" + formId).serialize(),
										success : function(result) {
											if (result._ERROR_MESSAGE_LIST_) {
												alert(result._ERROR_MESSAGE_LIST_);
											} else {
												//更新列表显示
												window.location.href = "MyProfiles?tabName=tab_certInfo";
											}
										}
									});
						}
					}
					function addCertModal() {
						$("#cert_taskCustomerId").val("");
						$("#cert_customerName").val("");
						$("#cert_linkAddress").val("");
						openModalWindow('myCertModal');
					}
					function editCertModal(taskCustomerId) {
						$("#cert_taskCustomerId").val(taskCustomerId);
						$("#cert_customerName").val(
								$("#cert_customerName" + taskCustomerId).val());
						$("#cert_linkAddress").val(
								$("#cert_linkAddress" + taskCustomerId).val());
						openModalWindow('myCertModal');
					}
					function deleteCert(taskCustomerId) {
						if (confirm("删除此记录?")) {
							$.ajax({
								url : 'deleteCertContacts',
								type : 'POST',
								cache : false,
								data : {
									'taskCustomerId' : taskCustomerId
								},
								success : function(msg) {
									$("#tr_cert" + taskCustomerId).remove();
								}
							});
						}
					}
				</script>
			</div>

		</div>
	</div>
</body>
</html>