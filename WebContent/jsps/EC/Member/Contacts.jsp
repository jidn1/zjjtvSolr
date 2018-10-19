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

			<div class="zcons" id="tab_linkInfo">
				<div class="department-head" style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x scroll 0 0;">
					<span>联系人信息列表</span> <a href="javascript:addLinkManModal();" style="background: #fff url(${pageContext.request.contextPath}/images/ec/zicon05.png) no-repeat scroll 5px center;"
						class="department-add"> 添加联系人信息</a>
				</div>
				<div style="padding: 10px; border: 1px solid #ccc;">
					<table id="linkman" class="department-table" cellspacing="0"
						width="100%">
						<tr>
							<td>姓名</td>
							<td>手机</td>
							<td>邮箱</td>
							<td>地址</td>
							<td>传真</td>
							<td style="width: 7%">主要联系人</td>
							<td>备注</td>
							<td>操作</td>
						</tr>
						<tr id="tr_linkECL0001">
							<td><span id="span_linkman_firstNameECL0001">&#24352;&#19977;</span>(管理员账号)
							</td>
							<td><span id="span_linkman_personPhoneECL0001">13199999999</span>
								<span><a href="#"
									onclick="openVerifyPhoneModalUrl('verifyPhone','13199999999','ECL0001','EC0001')"
									style="color: #FF4040">未验证</a></span></td>
							<td><span id="span_linkman_personEmailECL0001">zhangsan&#64;163.com</span>
							</td>
							<td><span id="span_linkman_homeAddrECL0001"></span></td>
							<td><span id="span_linkman_personalFaxECL0001"></span></td>
							<td>是 <input type="hidden"
								id="linkman_customerLinkManFlagECL0001" value="Y" />
							</td>
							<td><span id="span_linkman_personCommentsECL0001"></span></td>
							<td><input type="hidden" id="linkman_officePhoneECL0001"
								value="" /> <input type="hidden"
								id="linkman_personalFaxECL0001" value="" /> <input
								type="hidden" id="linkman_isVerifyPhoneECL0001" value="" />
								<button type="button" class="profiles-btn profiles-btn-edit"
									onclick="editLinkManModal('ECL0001')">编辑</button></td>
						</tr>
						<tr id="tr_linkECL0002">
							<td><span id="span_linkman_firstNameECL0002">&#24352;&#19977;</span>
							</td>
							<td><span id="span_linkman_personPhoneECL0002">13199999999</span>
								<span><a href="#"
									onclick="openVerifyPhoneModalUrl('verifyPhone','13199999999','ECL0002','EC0001')"
									style="color: #FF4040">未验证</a></span></td>
							<td><span id="span_linkman_personEmailECL0002">zhangsan&#64;163.com</span>
							</td>
							<td><span id="span_linkman_homeAddrECL0002"></span></td>
							<td><span id="span_linkman_personalFaxECL0002"></span></td>
							<td>否 <input type="hidden"
								id="linkman_customerLinkManFlagECL0002" value="N" />
							</td>
							<td><span id="span_linkman_personCommentsECL0002"></span></td>
							<td><input type="hidden" id="linkman_officePhoneECL0002"
								value="" /> <input type="hidden"
								id="linkman_personalFaxECL0002" value="" /> <input
								type="hidden" id="linkman_isVerifyPhoneECL0002" value="" />
								<button type="button" class="profiles-btn profiles-btn-edit"
									onclick="editLinkManModal('ECL0002')">编辑</button>
								<button type="button" class="profiles-btn profiles-btn-del"
									onclick="deleteLinkMan('ECL0002','ECL0001')">删除</button></td>
						</tr>
						<tr id="tr_linkeps_10000">
							<td><span id="span_linkman_firstNameeps_10000">&#23665;&#19996;</span>
							</td>
							<td><span id="span_linkman_personPhoneeps_10000">15000000000</span>
								<span><a href="#"
									onclick="openVerifyPhoneModalUrl('verifyPhone','15000000000','eps_10000','EC0001')"
									style="color: #9ACD32">已验证</a></span></td>
							<td><span id="span_linkman_personEmaileps_10000"></span></td>
							<td><span id="span_linkman_homeAddreps_10000">&#23665;&#19996;</span>
							</td>
							<td><span id="span_linkman_personalFaxeps_10000"></span></td>
							<td>否 <input type="hidden"
								id="linkman_customerLinkManFlageps_10000" value="N" />
							</td>
							<td><span id="span_linkman_personCommentseps_10000"></span>
							</td>
							<td><input type="hidden" id="linkman_officePhoneeps_10000"
								value="" /> <input type="hidden"
								id="linkman_personalFaxeps_10000" value="" /> <input
								type="hidden" id="linkman_isVerifyPhoneeps_10000" value="Y" />
								<button type="button" class="profiles-btn profiles-btn-edit"
									onclick="editLinkManModal('eps_10000')">编辑</button>
								<button type="button" class="profiles-btn profiles-btn-del"
									onclick="deleteLinkMan('eps_10000','ECL0001')">删除</button></td>
						</tr>
					</table>
				</div>
				<div id="myLinkManModal" class="profile-alert">
					<h3 class="profile-alert-h3">
						编辑联系人信息 <a
							onclick="closeModalWindow('myLinkManModal');return false;"
							class="profile-alert-colse">×</a>
					</h3>
					<form class="form-horizontal" action="createCrmContacts"
						method="post" name="MyLinkManForm" id="MyLinkManForm">
						<input name="roleTypeIdFrom" type="hidden" value="EC_CUSTOMER" />
						<input name="partyId" id="linkman_partyId" type="hidden"
							value="EC0001" /> <input name="personId" id="linkman_personId"
							type="hidden" value="" /> <input type="hidden"
							id="isVerifyPhone" value="" />
						<dl class="profile-alert-dl">
							<dt>
								<span class="firstName">联系人姓名</span> <span style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required"
									name="firstName" id="firstName" placeholder="联系人姓名"
									onblur="javascript:checkFormTC(this.id);return false;">
								<span class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="personPhone">手机</span> <span style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required" name="phone"
									id="personPhone" placeholder="手机"
									onblur="javascript:isPhone(this.id);return false;"> <span
									class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="personEmail">邮箱</span> <span style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required" name="email"
									id="personEmail" placeholder="邮箱"
									onblur="javascript:checkFormTC(this.id);return false;">
								<span class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="homeAddr">地址</span> <span style="color: red;">*</span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm required"
									name="homeAddr" id="homeAddr" placeholder="地址"
									onblur="javascript:checkFormTC(this.id);return false;">
								<span class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="officePhone">固话</span> <span style="color: red;"></span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="officePhone"
									id="officePhone" placeholder="固话"> <span
									class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="personalFax">传真</span> <span style="color: red;"></span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="personalFax"
									id="personalFax" placeholder="传真"> <span
									class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="personalFax">主要联系人</span> <span style="color: red;"></span>
							</dt>
							<dd>
								<select name="customerLinkManFlag" id="customerLinkManFlag"
									class="basic_infoForm">
									<option value="Y">是</option>
									<option value="N" selected>否</option>
								</select> <span class="a_spans" style="margin-left: 0;"></span>
							</dd>
							<dt>
								<span class="personComments">备注</span> <span style="color: red;"></span>
							</dt>
							<dd>
								<input type="text" class="basic_infoForm" name="personComments"
									id="personComments" placeholder="备注"> <span
									class="a_spans" style="margin-left: 0;"></span>
							</dd>
						</dl>
					</form>
					<div class="alert-btn">
						<a href="#" onclick="javascript:saveLinkInfo();return false;"
							class="alert-btn-a alert-btn-save">保存</a> <a href="#"
							onclick="closeModalWindow('myLinkManModal');return false;"
							class="alert-btn-a alert-btn-close">关闭</a>
					</div>
				</div>
				<div id="verifyPhoneModal" class="profile-alert"></div>
				<script>
					function saveLinkInfo() {
						var formId = "MyLinkManForm";
						var url = $("#" + formId).attr('action');
						if ($("#linkman_personId").val()) {
							url = "updateCrmContacts";
						}
						if ($("#isVerifyPhone").val() != "Y") {
							var customerLinkManFlag = $(
									"#customerLinkManFlag option:selected")
									.val();
							if (customerLinkManFlag == "Y") {
								//添加验证手机号是否验证。
								alert("联系人手机未验证,不能设置为主要联系人！");
								return false;
							}
						}
						var customerStr = [ "firstName", "personEmail",
								"homeAddr" ];
						var flag = true;
						flag = isPhone("personPhone");
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
												showMessage(
														'错误提示',
														result._ERROR_MESSAGE_LIST_
																+ "", "danger");
												$('#myModal').modal({
													'modalbackdrop' : 'static'
												}).modal('show');
											} else {
												//$("#myLinkManModal").modal("hide");
												window.location.href = "MyProfiles?tabName=tab_linkInfo";

											}
										}
									});
						}
					}
					function isPhone(id) {
						var moRegn = /^1[3-8]{1}[0-9]{9}$/;
						var obj = $("#" + id);
						if (obj.val() == '') {
							obj.addClass("errorC");
							obj.next('span').html("手机号码不能为空");
							obj.next('span').css("display", "block");
							return false;
						} else {
							if (!moRegn.test(obj.val())) {
								obj.addClass("errorC");
								obj.next('span').html("请输入正确的手机号");
								obj.next('span').css("display", "block");
								return false;
							} else {
								obj.addClass("checkedN");
								obj.removeClass("errorC");
								obj.next('span').css("display", "none");
								$(".eee").css("display", "none");
								return true;
							}
						}
					}
					function addLinkManModal() {
						$("#linkman_personId").val("");
						$("#firstName").val("");
						$("#personPhone").val("");
						$("#email").val("");
						$("#homeAddr").val("");
						$("#officePhone").val("");
						$("#personalFax").val("");
						$("#personComments").val("");
						openModalWindow("myLinkManModal");
					}
					function editLinkManModal(personId) {
						$("#linkman_personId").val(personId);
						$("#firstName").val(
								$("#span_linkman_firstName" + personId).text());
						$("#personPhone").val(
								$("#span_linkman_personPhone" + personId)
										.text());
						$("#personEmail").val(
								$("#span_linkman_personEmail" + personId)
										.text());
						$("#homeAddr").val(
								$("#span_linkman_homeAddr" + personId).text());
						$("#personComments").val(
								$("#span_linkman_personComments" + personId)
										.text());

						$("#officePhone").val(
								$("#linkman_officePhone" + personId).val());
						$("#customerLinkManFlag").val(
								$("#linkman_customerLinkManFlag" + personId)
										.val());
						$("#personalFax").val(
								$("#linkman_personalFax" + personId).val());
						$("#isVerifyPhone").val(
								$("#linkman_isVerifyPhone" + personId).val());
						openModalWindow("myLinkManModal");
					}
					function deleteLinkMan(personId, partyId) {
						if (confirm("确认删除?")) {
							$.ajax({
								url : 'deletePersonFormPartyCustomer',
								type : 'POST',
								cache : false,
								data : {
									'personId' : personId,
									'partyId' : partyId
								},
								success : function(result) {
									if (result._ERROR_MESSAGE_LIST_
											|| result._ERROR_MESSAGE_) {
										if (result._ERROR_MESSAGE_LIST_) {
											alert(result._ERROR_MESSAGE_LIST_);
										}
										if (result._ERROR_MESSAGE_) {
											alert(result._ERROR_MESSAGE_);
										}
									} else {
										$("#tr_link" + personId).remove();
									}
								}
							});
						}
					}
					function openVerifyPhoneModalUrl(url, phone, personId,
							partyId) {
						$.ajax({
							url : url,
							type : 'POST',
							datatype : "json",
							cache : false,
							data : {
								phone : phone,
								personId : personId,
								partyId : partyId
							},
							async : false,
							success : function(result) {
								$('#verifyPhoneModal').html(result);
								openModalWindow('verifyPhoneModal');
							}
						});
					}
				</script>
			</div>
		</div>
	</div>
</body>
</html>