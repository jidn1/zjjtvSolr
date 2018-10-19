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

			<div class="zcons" id="tab_invoiceInfo">
				<div class="department-head" style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x scroll 0 0;">
					<span>发票信息列表</span> <a href="javascript:addInvoiceModal();" style="background: #fff url(${pageContext.request.contextPath}/images/ec/zicon05.png) no-repeat scroll 5px center;"
						class="department-add"> 添加发票信息</a>
				</div>
				<div style="padding: 10px; border: 1px solid #ccc;">
					<table id="invoiceTbl" class="department-table" cellspacing="0"
						width="100%">
						<tr>
							<td>发票名称</td>
							<td>操作</td>
						</tr>
						<tr id="tr_invoice10000">
							<td><span id="span_invoice_customerName10000">&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;</span>
								<input id="invoice_customerName10000" type="hidden"
								value="&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;" />
							</td>
							<td>
								<button type="button" class="profiles-btn profiles-btn-edit"
									onclick="editInvoiceModal('10000')">编辑</button>
								<button type="button" class="profiles-btn profiles-btn-del"
									onclick="deleteInvoice('10000')">删除</button>
							</td>
						</tr>
					</table>
				</div>
				<div id="myInvoiceModal" class="profile-alert">
					<h3 class="profile-alert-h3">
						编辑发票信息 <a
							onclick="closeModalWindow('myInvoiceModal');return false;"
							class="profile-alert-colse">×</a>
					</h3>
					<form class="form-horizontal" action="createCertContacts"
						method="post" name="MyInvoiceForm" id="MyInvoiceForm">
						<input type="hidden" name="taskCustomerId"
							id="invoice_taskCustomerId" /> <input type="hidden"
							name="customerId" value="EC0001" /> <input type="hidden"
							name="customerType" value="JL_TASK_CUST_TYPE_3" />
						<dl class="profile-alert-dl">
							<dt>
								<span class="invoice_customerName">发票名称</span> <span
									style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required"
									name="customerName" id="invoice_customerName"
									placeholder="发票名称"
									onblur="javascript:checkFormTC(this.id);return false;">
								<span class="a_spans" style="margin-left: 0;"></span>
							</dd>
						</dl>
					</form>
					<div class="alert-btn">
						<a href="#" onclick="javascript:saveInvoiceInfo();return false;"
							class="alert-btn-a alert-btn-save">保存</a> <a href="#"
							onclick="closeModalWindow('myInvoiceModal');return false;"
							class="alert-btn-a alert-btn-close">关闭</a>
					</div>
				</div>
				<script>
					function saveInvoiceInfo() {
						var formId = "MyInvoiceForm";
						var url = $("#" + formId).attr('action');
						if ($("#invoice_taskCustomerId").val()) {
							url = "updateCertContacts";
						}
						if (checkFormTC("invoice_customerName")) {
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
												window.location.href = "MyProfiles?tabName=tab_invoiceInfo";
											}
										}
									});
						}
					}
					function addInvoiceModal() {
						$("#invoice_taskCustomerId").val("");
						$("#invoice_customerName").val("");
						$("#invoice_linkAddress").val("");
						openModalWindow('myInvoiceModal');
					}
					function editInvoiceModal(taskCustomerId) {
						$("#invoice_taskCustomerId").val(taskCustomerId);
						$("#invoice_customerName").val(
								$("#invoice_customerName" + taskCustomerId)
										.val());
						$("#invoice_linkAddress").val(
								$("#invoice_linkAddress" + taskCustomerId)
										.val());
						openModalWindow('myInvoiceModal');
					}
					function deleteInvoice(taskCustomerId) {
						if (confirm("删除此记录?")) {
							$.ajax({
								url : 'deleteCertContacts',
								type : 'POST',
								cache : false,
								data : {
									'taskCustomerId' : taskCustomerId
								},
								success : function(msg) {
									$("#tr_invoice" + taskCustomerId).remove();
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