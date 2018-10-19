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

<link rel="stylesheet" href="../css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>


<script type="text/javascript">
	
</script>
</head>
<body>

	<div class="slider_right">
		<p class="title">
			<a href="#">主菜单</a> <span>/</span> <a href="#">编辑计划</a>
		</p>
		<form action="" method="post" name="MyEquipSendPaln" id="MyEquipSendPaln">
			<input type="hidden" class="form-control" name="customerId" id="customerId" value="EC0001"> 
			<input type="hidden" class="form-control" name="planId" id="planId" value="10000">
			<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
				<div class="nav navas">
					<h4 style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon03.png') no-repeat scroll left center;">编辑计划</h4>
				</div>
				<div class="basic_info" style="border-top: none;">
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names planNo">计划编号</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_a" id="planNo"
								name="planNo" placeholder="计划编号" value="JH201706200001"
								type="text" readonly /> <span class="a_spans"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names createdStamp">编制时间</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_a" id="createdStamp"
								name="createdStamp" placeholder="编制时间"
								value="2017-06-20 14:13:00" type="text" readonly /> <span
								class="a_spans"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names planName">计划名称</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_a required"
								id="planName" name="planName" placeholder="计划名称"
								value="&#26816;&#27979;&#34746;&#19997;&#21345;&#23610;"
								type="text" /> <span class="a_spans"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names planDeptId">部门</span>
							<p class="z_star">*</p>
							<div class="z_select_border">
								<div class="z_container">
									<select id="planDeptId" name="planDeptId"
										class="basic_infoForm selects required">
										<option value="">请选择</option>
										<option value="1234567890s10">&nbsp;&#20135;&#21697;&#30740;&#21457;</option>
										<option value="1234567890s101">&nbsp;&nbsp;&nbsp;&#30740;&#21457;&#19968;&#32452;</option>
										<option value="1234567890s102">&nbsp;&nbsp;&nbsp;&#30740;&#21457;&#20108;&#32452;</option>
									</select> <span class="a_spans"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names planStartDate">开始时间</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_a required"
								id="planStartDate" onClick="WdatePicker()" name="planStartDate"
								onchange="checkStartData(this.value);" value="2017-06-20"
								type="text" readonly /> <span class="a_spans"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names planEndDate">结束时间</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_a required"
								id="planEndDate" onClick="WdatePicker()"
								onchange="checkEndData(this.value)" name="planEndDate"
								value="2017-07-19" type="text" readonly /> <span class="a_spans"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names planCreatedPerson">计划人</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_a"
								id="planCreatedPerson" name="planCreatedPerson"
								value="&#24352;&#19977;" type="text" /> <span class="a_spans"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names planRemark">说明</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_a" id="planRemark"
								name="planRemark" value="" type="text" /> <span class="a_spans"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names planStatus">状态</span>
							<p class="z_star"></p>
							<div class="z_select_border">
								<div class="z_container">
									<select name="planStatus" id="planStatus"
										class="basic_infoForm selects">
										<option value="EQUIP_PLAN_STATUS1">未完成</option>
										<option value="EQUIP_PLAN_STATUS2">已完成</option>
									</select>
								</div>
							</div>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names planBudgetFee">总计</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_a" id="planBudgetFee"
								name="planBudgetFee" value="200" type="text" /> <span
								class="a_spans"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names planStatus">执行人</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_a" id="planBudgetFee"
								name="planBudgetFee" value="" type="text" /> <span
								class="a_spans"></span>
						</div>
					</div>
					<div class="appliance_con" style="border-bottom: none;">
						<table id="example" width="100%" border="1" cellspacing="1"
							class="z_table" style="border-collapse: collapse;">
							<tr>
								<td style="width: 10px;"><input type="checkbox"
									id="checkAll" group="ids" /></td>
								<td>器具名称</td>
								<td>档案号</td>
								<td>规格</td>
								<td>型号</td>
								<td>出厂编号</td>
								<td>所属业务类型</td>
								<td>预算费用</td>
								<td>操作</td>
							</tr>
							<tr id="tr_bf742ec3b7214f72a7e70840d9648dac">
								<td></td>
								<td>&#34746;&#19997;&#21345;&#23610;</td>
								<td>PC20170620</td>
								<td>PL101</td>
								<td></td>
								<td>EC201706</td>
								<td>实验室<input type="hidden"
									id="equipOrderTypebf742ec3b7214f72a7e70840d9648dac"
									value="EQUIP_ORDER_TYPE1"></td>
								<td><input type="text" class="form-control"
									name="budgetaryPrice_bf742ec3b7214f72a7e70840d9648dac"
									id="budgetaryPrice_bf742ec3b7214f72a7e70840d9648dac"
									value="200" onchange="toNumSet(this);sumFeeCount();"></td>
								<td class="center">
									<button type="button" class="z_delate z_delate_disabled"
										disabled="disabled"
										" onclick="deleteRow('tr_bf742ec3b7214f72a7e70840d9648dac','bf742ec3b7214f72a7e70840d9648dac')">删除</button>
									<input type="hidden" name="EQUIPID"
									value="bf742ec3b7214f72a7e70840d9648dac" />
								</td>
							</tr>
						</table>
					</div>
					<div class="bot_btns">
						<a href="#" class="bta_w" onclick="javacript:;">保存</a>

						<a href="#" onclick="javascript:window.history.back();">返回</a>
					</div>
				</div>
				</div>
		</form>


	</div>

</body>
</html>