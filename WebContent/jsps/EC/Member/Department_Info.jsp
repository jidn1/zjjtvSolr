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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript">
//部门添加
function insertDepartmentInfo(){
	
	var departmentName =$("#departmentName").val();
	var departmentParent = $("#departmentParent").val();
	var departmentNumber = $("#departmentNumber").val();
	
	if (departmentName == ''|| departmentName == null) {
	confirm("部门名称不能为空！");
	return false;
	}
	if (departmentName == departmentParent) {
		confirm("部门名称不能和上级部门名称相同！");
		return false;
		}
	if (departmentNumber == ''|| departmentNumber == null) {
		confirm("排序号不能为空！");
		return false;
		}
	
	$("#MyDeptInfoForm").attr("action","${pageContext.request.contextPath}/user/insertDepartment.do").submit();
	
}
	
	
</script>
</head>
<body>
<div class="slider_right">

		<div class="tabs_con">

			<div class="zcons" id="tab_departmentInfo">
				<div class="department-head" style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x scroll 0 0;">
					<span>部门列表</span> <a href="javascript:addDeptInfoModal();" style="background: #fff url(${pageContext.request.contextPath}/images/ec/zicon05.png) no-repeat scroll 5px center;"
						class="department-add">添加部门</a>
				</div>
				<div style="padding: 10px; border: 1px solid #ccc;">
					<table id="department" class="department-table" cellspacing="0" width="100%">
						<tr>
							<td>部门名称</td>
							<td>部门编号</td>
							<td>排序号</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${departmentList }" var="dept">
						 <c:if test="${dept.departmentNumber != '0' }">
						 <tr>
							<td>&nbsp;&nbsp;<span id="span_deptInfo_groupName1234567890s10">${dept.departmentName }</span></td>
							<td><span id="span_deptInfo_barCode1234567890s10">${dept.departmentCode }</span></td>
							<td><span id="span_deptInfo_sortNum1234567890s10">${dept.departmentNumber }</span></td>
							<td><input type="hidden"
								id="deptInfo_parentPartyId1234567890s10" value="1234567890" />
								<button type="button" class="profiles-btn profiles-btn-edit"
									onclick="">编辑</button>
								<button type="button" class="profiles-btn profiles-btn-del"
									onclick="">删除</button></td>
						</tr>
						 </c:if>
						<c:if test="${dept.departmentNumber == '0' }">
						<tr>
							<td><span id="span_deptInfo_groupName1234567890s10">${dept.departmentName }</span></td>
							<td><span id="span_deptInfo_barCode1234567890s10">${dept.departmentCode }</span></td>
							<td><span id="span_deptInfo_sortNum1234567890s10">${dept.departmentNumber }</span></td>
							<td><input type="hidden"
								id="deptInfo_parentPartyId1234567890s10" value="1234567890" />
								<button type="button" class="profiles-btn profiles-btn-edit"
									onclick="">编辑</button>
								<button type="button" class="profiles-btn profiles-btn-del"
									onclick="">删除</button></td>
						</tr>
						</c:if>
						</c:forEach>
					</table>
				</div>
				
<div id="deptInfoModal" class="profile-alert">
	<h3 class="profile-alert-h3">
		编辑部门 <a onclick="closeModalWindow('deptInfoModal');return false;"
			class="profile-alert-colse">×</a>
	</h3>
	<form class="form-horizontal" action="createPartyGroup" method="post" name="MyDeptInfoForm" id="MyDeptInfoForm">
		<input type='hidden' name='roleTypeId' value='DEPARTMENT'>
		<input type="hidden" name="partyId" id="deptInfo_partyId" value="" />
		<dl class="profile-alert-dl">
			<dt>
				<span class="deptInfo_groupName">部门名称</span> <span
					style="color: red;">*</span>
			</dt>
			<dd>
				<input type="text" class="basic_infoForm required"
					name="departmentName" id="departmentName" placeholder="部门名称"
					onblur="checkFormTC(this.id);"> <span class="a_spans"
					style="margin-left: 0;"></span>
			</dd>
			<dt>
				<span class="deptInfo_barCode">部门编号</span> <span
					style="color: red;"></span>
			</dt>
			<dd>
				<input type="text" class="basic_infoForm" name="departmentCode"
					id="departmentCode" placeholder="部门编号"> <span
					class="a_spans" style="margin-left: 0;"></span>
			</dd>
			<dt>
				<span class="deptInfo_parentPartyId">上级部门</span> <span
					style="color: red;"></span>
			</dt>
			<dd>
				<select id="departmentParent" name="departmentParent" class="basic_infoForm basic_infoForm_ie8"
					onchange="isSameDeptName(this.id);">
					<option value="1234567890">请选择</option>
					<c:forEach items="${departmentList }" var="dept">
					<option value="${dept.departmentUUID }">${dept.departmentName }</option>
					</c:forEach>
				</select> <span class="a_spans" style="margin-left: 0;"></span>
			</dd>
			<dt>
				<span class="deptInfo_sortNum">排序号</span> <span
					style="color: red;"></span>
			</dt>
			<dd>
				<input type="text" class="basic_infoForm" name="departmentNumber"
					id="departmentNumber" placeholder="排序号"
					onchange="isSortNum(this.id);"> <span class="a_spans"
					style="margin-left: 0;"></span>
			</dd>
		</dl>
	</form>
	<div class="alert-btn">
		<a href="javascript:;" onclick="javascript:insertDepartmentInfo();return false;" class="alert-btn-a alert-btn-save">保存</a> 
		<a href="javascript:;" onclick="closeModalWindow('deptInfoModal');return false;" class="alert-btn-a alert-btn-close">关闭</a>
	</div>
</div>
<script>
	function saveDepartmentInfo() {
		var formId = "MyDeptInfoForm";
		var url = $("#" + formId).attr('action');
		if ($("#deptInfo_partyId").val()) {
			url = "updatePartyGroup";
		}
		if ($("#deptInfo_groupName").val() == ''
				|| $("#deptInfo_groupName").val() == 'undefined'
				|| $("#deptInfo_groupName").val() == null) {
			$("#deptInfo_groupName").addClass("errorC");
			$("#deptInfo_groupName").next('span').html(
					"部门名称不能为空");
			$("#deptInfo_groupName").next('span').css(
					"display", "block");
			return false;
		} else {
			$("#deptInfo_groupName").addClass("checkedN");
			$("#deptInfo_groupName").removeClass("errorC");
			$("#deptInfo_groupName").next('span').css(
					"display", "none");
			$(".eee").css("display", "none");
		}
		if ($("#deptInfo_parentPartyId").val() != ''
				&& $("#deptInfo_parentPartyId").val() != 'undefined'
				&& $("#deptInfo_parentPartyId").val() != null) {
			if ($("#deptInfo_partyId").val() != ''
					&& $("#deptInfo_partyId").val() != 'undefined'
					&& $("#deptInfo_partyId").val() != null) {
				if ($("#deptInfo_partyId").val() == $(
						"#deptInfo_parentPartyId").val()) {
					$("#parentPartyId").addClass("errorC");
					$("#parentPartyId").next('span').html(
							"上级部门不能与当前部门相同");
					$("#parentPartyId").next('span').css(
							"display", "block");
					return false;
				} else {
					$("#parentPartyId").addClass("checkedN");
					$("#parentPartyId").removeClass("errorC");
					$("#parentPartyId").next('span').css(
							"display", "none");
					$(".eee").css("display", "none");
				}
			}
		}
		if ($("#deptInfo_sortNum").val() != ''
				&& $("#deptInfo_sortNum").val() != 'undefined'
				&& $("#deptInfo_sortNum").val() != null) {
			if (!isSortNum("deptInfo_sortNum")) {
				return false;
			}
		}
		$
				.ajax({
					url : url,
					type : 'POST',
					data : $("#" + formId).serializeArray(),
					async : false,
					error : function(result) {
						$("#gray").css("display", "block");
						$("#deptInfoModal").css("display",
								"block");
					},
					success : function(result) {
						if (result._ERROR_MESSAGE_LIST_) {
							$('#myModal').modal({
								'modalbackdrop' : 'static'
							}).modal('show');
						} else {
							//更新列表显示
							if (result.taskCustomerId) {
							} else {
								$(
										"#span_cert_customerName"
												+ $(
														"#deptInfo_partyId")
														.val())
										.text(
												$(
														"#deptInfo_groupName")
														.val());
								$(
										"#span_cert_linkAddress"
												+ $(
														"#deptInfo_taskCustomerId")
														.val())
										.text(
												$(
														"#deptInfo_linkAddress")
														.val());
								$(
										"#deptInfo_customerName"
												+ $(
														"#deptInfo_taskCustomerId")
														.val())
										.text(
												$(
														"#deptInfo_customerName")
														.val());
								$(
										"#deptInfo_linkAddress"
												+ $(
														"#deptInfo_taskCustomerId")
														.val())
										.text(
												$(
														"#deptInfo_linkAddress")
														.val());
							}
							window.location.href = "MyProfiles?tabName=tab_departmentInfo";
						}
					}
				});
	}
	function isSameDeptName(id) {
		var obj = $("#" + id);
		if ($("#deptInfo_partyId").val() != ''
				&& $("#deptInfo_partyId").val() != 'undefined'
				&& $("#deptInfo_partyId").val() != null) {
			if (obj.val() != '' && obj.val() != null
					&& obj.val() != 'undefined') {
				if ($("#deptInfo_partyId").val() == obj.val()) {
					obj.addClass("errorC");
					obj.next('span').html("上级部门不能与当前部门相同");
					obj.next('span').css("display", "block");
					return false;
				} else {
					$("#" + id).addClass("checkedN");
					$("#" + id).removeClass("errorC");
					$("#" + id).next('span').css("display",
							"none");
					$(".eee").css("display", "none");
				}
			}
		} else {
			$("#deptInfo_partyId").addClass("errorC");
			$("#deptInfo_partyId").next('span')
					.html("部门名称不能为空");
			$("#deptInfo_partyId").next('span').css("display",
					"block");
			return false;
		}
	}
	function isSortNum(id) {
		var moRegn = /^[0-9]*$/;
		var obj = $("#" + id);
		if (!moRegn.test(obj.val())) {
			obj.addClass("errorC");
			obj.next('span').html("排序号只能为数字");
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
	function addDeptInfoModal() {
		$("#deptInfo_partyId").val("");
		$("#deptInfo_groupName").val("");
		$("#deptInfo_barCode").val("");
		$("#deptInfo_parentPartyId").val("1234567890");
		$("#deptInfo_sortNum").val("");
		openModalWindow('deptInfoModal');
	}
	function editDeptInfoModal(partyId) {
		$("#deptInfo_partyId").val(partyId);
		$("#deptInfo_groupName").val(
				$("#span_deptInfo_groupName" + partyId).text());
		$("#deptInfo_barCode").val(
				$("#span_deptInfo_barCode" + partyId).text());
		$("#deptInfo_parentPartyId").val(
				$("#deptInfo_parentPartyId" + partyId).val());
		$("#deptInfo_sortNum").val(
				$("#span_deptInfo_sortNum" + partyId).text());
		openModalWindow('deptInfoModal');
	}
	function deleteDeptInfo(partyId) {
		if (confirm("删除部门信息?\n注:含有子部门时也会删除")) {
			$.ajax({
				url : 'updatePartyStatus',
				type : 'POST',
				cache : false,
				data : {
					'ids' : partyId,
					'statusId' : "PARTY_DISABLED"
				},
				success : function(msg) {
					window.location.href = "MyProfiles";
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