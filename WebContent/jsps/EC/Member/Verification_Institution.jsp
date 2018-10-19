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
	
</script>
</head>
<body>

	<div class="slider_right">

		<div class="tabs_con">

			<div class="zcons" id="tab_agency">
				<div class="department-head" style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x scroll 0 0;">
					<span>检定机构信息列表</span>
					<a href="javascript:addAgencyModal();" style="background: #fff url(${pageContext.request.contextPath}/images/ec/zicon05.png) no-repeat scroll 5px center;"
						class="department-add"> 添加检定机构信息</a>
				</div>
				<div style="padding: 10px; border: 1px solid #ccc;">
					<table id="agency" class="department-table" cellspacing="0"
						width="100%">
						<tr>
							<td>检定机构名称</td>
							<td>联系人</td>
							<td>电话</td>
							<td>地址</td>
							<td>操作</td>
						</tr>
					</table>
				</div>
				<div id="myAgencyModal" class="profile-alert">
					<h3 class="profile-alert-h3">
						编辑检定机构信息 <a
							onclick="closeModalWindow('myAgencyModal');return false;"
							class="profile-alert-colse">×</a>
					</h3>
					<form class="form-horizontal" action="createEquipTestAgency"
						method="post" name="MyAgencyForm" id="MyAgencyForm">
						<input type="hidden" name="customerUuid" value="EC0001" /> <input
							name="agencyId" id="agencyId" type="hidden" value="" />
						<dl class="profile-alert-dl">
							<dt>
								<span class="agencyName">机构名称</span> <span style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required"
									name="agencyName" id="agencyName" placeholder="机构名称"
									onblur="javascript:checkFormTC(this.id);return false;">
								<span class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="agencyLinkman">联系人</span> <span style="color: red;"></span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="agencyLinkman"
									id="agencyLinkman" placeholder="联系人"> <span
									class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="agencyTel">电话</span> <span style="color: red;"></span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="agencyTel"
									id="agencyTel" placeholder="电话"> <span class="a_spans"
									style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="agencyAddr">地址</span> <span style="color: red;"></span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm " name="agencyAddr"
									id="agencyAddr" placeholder="地址"> <span class="a_spans"
									style="margin-left: 0;"></span>
							</dd>
						</dl>
					</form>
					<div class="alert-btn">
						<a href="#" id="agency_save"
							onclick="javacript:saveAgencyInfo();return false;"
							class="alert-btn-a alert-btn-save">保存</a> <a href="#"
							onclick="closeModalWindow('myAgencyModal');return false;"
							class="alert-btn-a alert-btn-close">关闭</a>
					</div>
				</div>
				<script>
					function saveAgencyInfo() {
						var formId = "MyAgencyForm";
						var url = $("#" + formId).attr('action');
						if ($("#agencyId").val()) {
							url = "updateEquipTestAgency";
						}
						if (checkFormTC("agencyName")) {
							$
									.ajax({
										url : url,
										type : 'POST',
										datatype : "json",
										cache : false,
										data : $("#MyAgencyForm").serialize(),
										success : function(result) {
											if (result._ERROR_MESSAGE_LIST_) {
												alert(result._ERROR_MESSAGE_LIST_);
											} else {
												window.location.href = "MyProfiles?tabName=tab_agency";

											}
										}
									});
						}
					}
					function addAgencyModal() {
						$("#agencyId").val("");
						$("#agencyName").val("");
						$("#agencyLinkman").val("");
						$("#agencyTel").val("");
						$("#agencyAddr").val("");
						openModalWindow("myAgencyModal");
					}
					function editagencyModal(agencyId) {
						$("#agencyId").val(agencyId);
						$("#agencyName").val(
								$("#span_agency_agencyName" + agencyId).text());
						$("#agencyLinkman").val(
								$("#span_agency_agencyLinkman" + agencyId)
										.text());
						$("#agencyTel").val(
								$("#span_agency_agencyTel" + agencyId).text());
						$("#agencyAddr").val(
								$("#span_agency_agencyAddr" + agencyId).text());
						openModalWindow("myAgencyModal");
					}
					function deleteAgency(agencyId) {
						if (confirm("删除此记录?")) {
							$.ajax({
								url : 'deleteEquipTestAgencyAjax',
								type : 'POST',
								cache : false,
								data : {
									'agencyId' : agencyId
								},
								success : function(msg) {
									$("#tr_agency" + agencyId).remove();

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