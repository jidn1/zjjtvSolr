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
	function insertUser() {
		var path = $("#path").val();
		$("#MyInstruments").attr("action", path + "/user/toedituserpage.do")
				.submit();
	}
	function deleteUser(uuid) {
		var path = $("#path").val();
		$("#uuid").val(uuid);
		$("#MyInstruments").attr("action", path + "/user/deleteUser.do")
				.submit();
	}
function searchUser() {
	var path = $("#path").val();
	var userName = $("input[name='userName']").val().trim();
	var state = $("select[name='state']").val().trim();
	var departmentUUID = $("select[name='departmentUUID']").val().trim();
	var companyUUID = $("select[name='companyUUID']").val().trim();
	
	$("#userName").val(userName);
	$("#state").val(state);
	$("#departmentUUID").val(departmentUUID);
	$("#companyUUID").val(companyUUID);
	
	$("#pageForm").attr("action", path + "/user/selectUserList.do").submit();
}
</script>
</head>
<body>

	<div class="slider_right">
		<p class="title">
			<a href="#">设置</a> <span>/</span> <a href="#">用户设置</a>
		</p>
		<div class="tabs_con">
			<form action="" id="MyInstruments" method="post" class="form-search"
				action="MyInstruments">
				<input type="hidden" value="" id="uuid" name="uuid">
				<div class="appliance_top">
					<span class="zsearch_name" style="margin-left: 20px; width: 70px;">用户名称：</span>
					<input type="text" class="basic_infoForm zsearch_con" 
						name="userName" value='${userName}' /> 
					<span class="zsearch_name">是否可用：</span>
					<select  name="state" class="basic_infoForm zsearch_con">
						<option value="">请选择</option>
						<option value="1" <c:if test="${state eq '1' }"> selected="selected"</c:if>>可用</option>
						<option value="0" <c:if test="${state eq '0' }"> selected="selected"</c:if>>不可用</option>
					</select> 
					<span class="zsearch_name">所属部门：</span> 
					<select  name="departmentUUID" class="basic_infoForm zsearch_con">
						<option value="">请选择</option>
						<c:forEach items="${departmentList }" var="department">
							<option value="${department.departmentUUID  }"  <c:if test="${department.departmentUUID eq departmentUUID }">selected="selected"</c:if> >${department.departmentName }</option>
						</c:forEach>
					</select> 
					<span class="zsearch_name">所属客户：</span> 
					<select  name="companyUUID" class="basic_infoForm zsearch_con">
						<option value="">请选择</option>
						<c:forEach items="${companyList }" var="company">
							<option value="${company.companyUUID }" <c:if test="${company.companyUUID eq companyUUID }">selected="selected"</c:if> >${company.companyName }</option>
						</c:forEach>
					</select>
					<div class="btnw_a" id="click_event">
						<a class="s_trw" onclick="javascript:searchUser();"> 查询</a>
					</div>
				</div>

			</form>
		</div>
		<div class="appliance_list"
			style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
			<div class="nav">
				<h4 style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">用户列表</h4>
				<span class="span01"><a href="javascript:void(0);"
					onclick="insertUser()"
					style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon05.png') no-repeat scroll left center;">添加用户
				</a></span>
			</div>
			<div class="appliance_con">
				<table class="z_table" cellspacing="0" width="100%">
					<thead>
						<tr class="z_tops_title">
							<td
								style="padding: 0px; text-align: center; width: 7%; min-width: 85px;"
								nowrap="nowrap">用户名称</td>
							<td
								style="padding: 0px; text-align: center; width: 7%; min-width: 85px;"
								nowrap="nowrap">用户手机号</td>
							<td
								style="padding: 0px; text-align: center; width: 7%; min-width: 85px;">所属部门</td>
							<td
								style="padding: 0px; text-align: center; width: 3%; min-width: 85px;">所属客户<span></span></td>
							<td
								style="padding: 0px; text-align: center; width: 3%; min-width: 85px;">用户状态<span></span></td>
							<td
								style="padding: 0px; text-align: center; width: 10%; min-width: 85px;">用户级别<span></span></td>
							<td style="padding: 0px; text-align: center; width: 4%">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList }" var="data" varStatus="status">
							<tr valign="middle" class="bgs">

								<td style="height: 28px; padding: 0px; text-align: center;"><a
									href="javascript:void(0)" onclick="">${data.userName }</a></td>
								<td style="height: 28px; padding: 0px; text-align: center;">${data.userPhone }</td>
								<td style="height: 28px; padding: 0px; text-align: center;">${data.departmentName }</td>
								<td style="height: 28px; padding: 0px; text-align: center;">${data.companyName }</td>
								<td style="height: 28px; padding: 0px; text-align: center;">
									<c:if test="${data.state eq '1' }">可用</c:if> <c:if
										test="${data.state eq '0' }">不可用</c:if>
								</td>
								<td style="height: 28px; padding: 0px; text-align: center;">
									${data.userLevel} <%-- <c:if test="${data.userLevel eq 'ROLE_PERMISSION_0' }">超级管理员</c:if>
							 <c:if test="${data.userLevel eq 'ROLE_PERMISSION_1' }">器具管理员</c:if>
							 <c:if test="${data.userLevel eq 'ROLE_PERMISSION_2' }">计划管理员</c:if>
							 <c:if test="${data.userLevel eq 'ROLE_PERMISSION_3' }">计划执行员</c:if>
							 <c:if test="${data.userLevel eq 'ROLE_PERMISSION_4' }">订单确认人</c:if>
							 <c:if test="${data.userLevel eq 'ROLE_PERMISSION_5' }">器具负责人</c:if> --%>
								</td>
								<td style="height: 28px; padding: 0px; text-align: center;">
									<a href="javascript:void(0);"
									onclick="deleteUser('${data.userUUID }')">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>

		<!-- 分页样式 -->
		<div align="center">
			<ul class="z_pages">
				<li class="zlis zlis_fist"><font size="2">共
						${page.totalPageCount} 页</font></li>
				<li class="zlis"><font size="2">第 ${page.pageNow} 页</font></li>
				<li class="zlis"><a href="javascript:void(0)"
					onclick="setViewSize('1')">首页</a></li>
				<c:choose>
					<c:when test="${page.pageNow - 1 > 0}">
						<li class="zlis"><a href="javascript:void(0)"
							onclick="setViewSize('${page.pageNow-1 }')">上一页</a></li>

					</c:when>
					<c:when test="${page.pageNow - 1 <= 0}">
						<li class="zlis"><a href="javascript:void(0)"
							onclick="setViewSize('${1}')">上一页</a></li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${page.totalPageCount==0}">
						<li class="zlis"><a href=""
							onclick="setViewSize('${page.pageNow }')">下一页</a></li>
					</c:when>
					<c:when test="${page.pageNow + 1 < page.totalPageCount}">
						<li class="zlis"><a href="javascript:void(0)"
							onclick="setViewSize('${page.pageNow + 1 }')">下一页</a></li>
					</c:when>
					<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
						<li class="zlis"><a href="javascript:void(0)"
							onclick="setViewSize('${page.totalPageCount }')">下一页</a></li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${page.totalPageCount==0}">
						<li class="zlis"><a href="javascript:void(0)"
							onclick="setViewSize('${page.pageNow }')">尾页</a></li>
					</c:when>
					<c:otherwise>
						<li class="zlis"><a href="javascript:void(0)"
							onclick="setViewSize('${page.totalPageCount }')">尾页</a></li>
					</c:otherwise>
				</c:choose>
				<li class="zlis">共${page.totalCount}条记录，每页显示 <select
					id="pagesize" onchange="changePageSize()">
						<option value="5"
							<c:if test="${page.pageSize==5 }">selected=""selected</c:if>>5</option>
						<option value="10"
							<c:if test="${page.pageSize==10 }">selected=""selected</c:if>>10</option>
						<option value="20"
							<c:if test="${page.pageSize==20 }">selected=""selected</c:if>>20</option>
				</select> 条
				</li>

				<c:choose>
					<c:when test="${page.pageNow == page.totalPageCount }">
						<li class="zlis zlis_qw">
							当前显示${page.startPos+1}到${page.totalCount}记录</li>
					</c:when>
					<c:otherwise>
						<li class="zlis zlis_qw">
							当前显示${page.startPos+1}到${page.startPos+page.pageSize}记录</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

<script type="text/javascript">
function changePageSize(){
	var path = $("#path").val();
	var pagesize = $("#pagesize").val();
	$("#pageSize").val(pagesize);
	$('#pageForm').attr("action",path+"/user/selectUserList.do").submit();
}
function setViewSize(obj2) {
	var path = $("#path").val();
	$('#pageNow').val(obj2);
	$('#pageForm').attr("action", path + "/user/selectUserList.do").submit();
}
</script>
<!-- 分页 -->
<form id="pageForm" method="post">
<input id="path" type="hidden" value="${pageContext.request.contextPath }"> 
<input type="hidden" id="pageNow" name="pageNow" value="${page.pageNow }" />
<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }" />
<input type="hidden" id="userName" name="userName"  />
<input type="hidden" id="state" name="state"  />
<input type="hidden" id="departmentUUID" name="departmentUUID" />'
<input type="hidden" id="companyUUID" name="companyUUID"  />
</form>

</body>
</html>