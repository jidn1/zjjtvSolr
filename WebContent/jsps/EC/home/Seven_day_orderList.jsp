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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="slider_right">
		<div class="tabs_con">
			<div id="z_content">
				<div class="zcons" style="display: block;" id="tab_taskOrder">
					<table width="100%" border="0" cellspacing="1" class="z_table"
						style="border-collapse: collapse;">
						<tr class="z_tops_title">
							<td>订单编号</td>
							<td>下单日期</td>
							<td>联系人</td>
							<td>状态</td>
							<td>数量</td>
						</tr>
						<tr class="bgs">
							<td><a href="#" onclick="edit('10000')">DD201706200001</a></td>
							<td>2017-06-20 14:39:06</td>
							<td>&#23665;&#19996;</td>
							<td>未下单</td>
							<td>1</td>
						</tr>
					<c:forEach items="${products }" var="data" varStatus="status">
						<tr valign="middle">
					        <td style="height:28px;padding:0px;text-align: center;">
					            <input value="${data.id }" name="projectId" type="checkbox">
					        </td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.name }</td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.age }</td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.address }</td>
							<td style="height: 28px; padding: 0px; text-align: center;"></td>
							<td style="height: 28px; padding: 0px; text-align: center;"></td>
							<td style="height: 28px; padding: 0px; text-align: center;">
								 
							</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
							<c:if test="">可用</c:if>
							<c:if test="">禁用</c:if>
							</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
								<a href="<c:url value='/person/loginUser/editLoginUser.html?partyId=${data.id }'/>">编辑</a>
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>

			</div>
		</div>

	</div>
</body>
</html>