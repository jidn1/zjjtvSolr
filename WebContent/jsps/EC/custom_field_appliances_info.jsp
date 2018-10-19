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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
	
</script>
</head>
<body>

	<div class="slider_right">
		<!-- End Template component://limsZJJL_EC/webapp/ec/includes/mainContent_header.ftl -->
		<!-- Begin Template component://limsZJJL_EC/webapp/ec/MyInstruments/myInstruments_list.ftl -->
		<p class="title">
			<a href="#">主菜单</a> <span>/</span> <a href="#">编辑器具</a>
		</p>



		<form action="updateEquipAccount" method="post"
			name="MyInstrumentsForm" id="MyInstrumentsForm">
			<input type="hidden" name="equipId" id="equipId" class="" value="">
			<div class="basic_info">
				<h3 id="zclick_event" class="z_A">
					<a href="#">基本信息</a>
				</h3>
				<div id="zhidden_enent" class="basic_infoss" style="display: block">
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names controlCode">档案号</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_a required"
								id="controlCode" name="controlCode" value="PC20170620"
								type="text" /> <span class="a_spans"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names equipStatus">器具状态</span>
							<p class="z_star">*</p>
							<div class="z_select_border">
								<div class="z_container">
									<select id="equipStatus" name="equipStatus"
										class="basic_infoForm selects required">
										<option value="">请选择</option>
										<option value='EQUIP_STATUS1'>&#22312;&#29992;</option>
										<option value='EQUIP_STATUS10'>&#22791;&#29992;</option>
										<option value='EQUIP_STATUS11'>&#38480;&#29992;</option>
										<option value='EQUIP_STATUS12'>&#20854;&#23427;</option>
										<option value='EQUIP_STATUS2'>&#20572;&#29992;</option>
										<option value='EQUIP_STATUS3'>&#25439;&#22351;</option>
										<option value='EQUIP_STATUS4'>&#38477;&#32423;</option>
										<option value='EQUIP_STATUS5'>&#20934;&#29992;</option>
										<option value='EQUIP_STATUS6'>&#22312;&#24211;</option>
										<option value='EQUIP_STATUS7'>&#23553;&#23384;</option>
										<option value='EQUIP_STATUS8'>&#25253;&#24223;</option>
										<option value='EQUIP_STATUS9'>&#36951;&#22833;</option>
									</select> <span class="a_span" style="color: #B94A48;"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names equipName">器具名称</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="equipName" name="equipName"
								value="&#34746;&#19997;&#21345;&#23610;" type="text"
								placeholder="" /> <span class="a_spans1"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names equipOrderType">送检类型</span>
							<p class="z_star">*</p>
							<div class="z_select_border">
								<div class="z_container">
									<select id="equipOrderType" name="equipOrderType"
										class="basic_infoForm selects required">
										<option selected value='EQUIP_ORDER_TYPE1'>实验室</option>
										<option value='EQUIP_ORDER_TYPE2'>巡检</option>
									</select> <span class="a_span"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names factoryNo">出厂编号</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_c required"
								id="factoryNo" name="factoryNo" value="EC201706" type="text"
								placeholder="" /> <span class="a_spans2"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names equipSpec/equipModel">规格/型号</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_c" id="equipSpec"
								style="width: 26%; background: none;" name="equipSpec"
								type="text" value="PL101" placeholder="" /> /<input
								class="basic_infoForm basic_infoForm_c" id="equipModel"
								style="width: 26%; background: none;" name="equipModel"
								type="text" value="" placeholder="" />
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names manufacture">生产厂家</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="manufacture" name="manufacture"
								type="text" value="&#27743;&#33487;" placeholder="" />
						</div>
						<div class="basic_info_con_R">
							<span class="z_names equipType">ABC分类</span>
							<p class="z_star"></p>
							<div class="z_select_border">
								<div class="z_container">
									<select name="equipType" id="equipType"
										class="basic_infoForm selects">
										<option value="">请选择</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names accuracyLevel">准确度等级</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="accuracyLevel"
								name="accuracyLevel" type="text" value="" placeholder="" />
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names measurementRange">测量范围</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="measurementRange"
								name="measurementRange" value="" type="text" placeholder="" />
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names indeterminacy">不确定度</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="indeterminacy"
								name="indeterminacy" value="" type="text" placeholder="" />
						</div>
					</div>
				</div>
				<div class="basic_info">
					<h3 id="zclick_eventa" class="z_A">
						<a href="#">保管信息</a>
					</h3>
					<div id="zhidden_enenta" class="basic_infoss"
						style="display: block">
						<div class="basic_info_con">
							<div class="basic_info_con_L">
								<span class="z_names useDeptId">所属部门</span>
								<p class="z_star"></p>
								<div class="z_select_border">
									<div class="z_container">
										<select name="useDeptId" id="useDeptId"
											class="basic_infoForm selects">
											<option value="">请选择</option>
											<option value="1234567890s10">&nbsp;&#20135;&#21697;&#30740;&#21457;</option>
											<option value="1234567890s101">&nbsp;&nbsp;&nbsp;&#30740;&#21457;&#19968;&#32452;</option>
											<option value="1234567890s102">&nbsp;&nbsp;&nbsp;&#30740;&#21457;&#20108;&#32452;</option>
										</select>
									</div>
								</div>
							</div>
							<div class="basic_info_con_R">
								<span class="z_names usePersonId">负责人</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="usePersonId"
									name="usePersonId" value="" type="text" placeholder="" />
							</div>
						</div>
						<div class="basic_info_con">
							<div class="basic_info_con_L equipAcceptDate">
								<span class="z_names">接收日期</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="equipAcceptDate"
									name="equipAcceptDate" onchange="checkStartData(this.value)"
									onClick="WdatePicker()" value="" type="text" placeholder=""
									readonly />
							</div>
							<div class="basic_info_con_R equipAcceptStatus">
								<span class="z_names">接收状态</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" name="equipAcceptStatus"
									id="equipAcceptStatus" type="text" value="" placeholder="" />
							</div>
						</div>
						<div class="basic_info_con">
							<div class="basic_info_con_L">
								<span class="z_names purchaseDate">购置日期</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="purchaseDate"
									name="purchaseDate" onchange="checkEndData(this.value)"
									onClick="WdatePicker()" value="" type="text" placeholder=""
									readonly /> <span class="add-on"><i class="icon-th"></i></span>
							</div>
							<div class="basic_info_con_R">
								<span class="z_names purchasePrice">购置价</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="purchasePrice"
									name="purchasePrice" value="" type="text" placeholder="" />
							</div>
						</div>
					</div>
				</div>
				<div class="basic_info">
					<h3 id="zclick_eventb" class="z_A">
						<a href="javascript:;">检定/校准信息</a>
					</h3>
					<span class="z_we"><a
						href="InstrumentSendHistory?equipId=bf742ec3b7214f72a7e70840d9648dac">送检历史</a></span>
					<div id="zhidden_enentb" class="basic_infoss"
						style="display: block">
						<div class="basic_info_con">
							<div class="basic_info_con_L">
								<span class="z_names testGroup">检定机构</span>
								<p class="z_star"></p>
								<div class="z_select_border">
									<div class="z_container">
										<select name="testGroup" id="testGroup"
											class="basic_infoForm selects">
											<option value="">请选择</option>
										</select>
									</div>
								</div>
							</div>
							<div class="basic_info_con_R">
								<span class="z_names testDate">校验日期</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="testDate"
									onchange="settestVaildDate();" name="testDate"
									onClick="WdatePicker()" value="" type="text" placeholder=""
									readonly />
							</div>
						</div>
						<div class="basic_info_con">
							<div class="basic_info_con_L">
								<span class="z_names certNo">证书编号</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="certNo" name="certNo" value=""
									type="" placeholder="" />
							</div>
							<div class="basic_info_con_R">
								<span class="z_names testCycle">检定周期</span>
								<p class="z_star"></p>
								<input class="basic_infoForm z_datas" id="testCycle"
									name="testCycle" onchange="settestVaildDate();" value=""
									type="text" placeholder="单位为月" />
							</div>
						</div>
						<div class="basic_info_con">
							<div class="basic_info_con_L">
								<span class="z_names testResult">检定结果</span>
								<p class="z_star"></p>
								<div class="z_select_border">
									<div class="z_container">
										<select name="testResult" id="testResult"
											class="basic_infoForm selects">
											<option value="">请选择</option>
											<option value='EQUIP_TEST_RESULT1'>&#21512;&#26684;</option>
											<option value='EQUIP_TEST_RESULT2'>&#19981;&#21512;&#26684;</option>
										</select>
									</div>
								</div>
							</div>
							<div class="basic_info_con_R">
								<span class="z_names testVaildDate">有效日期</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="testVaildDate"
									name="testVaildDate" onClick="WdatePicker()" value=""
									type="text" placeholder="" readonly />
							</div>
						</div>
						<div class="basic_info_con">
							<div class="basic_info_con_L">
								<span class="z_names testVaildDate">鉴定员</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="testPersonName"
									name="testPersonName" value="" type="text" placeholder="" />
							</div>
							<div class="basic_info_con_R">
								<span class="z_names testFee">检定/校准费</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="testFee" name="testFee"
									type="text" value="" placeholder="" readonly="readonly" />
							</div>
						</div>
						<div class="basic_info_con">
							<div class="basic_info_con_L">
								<span class="z_names remark">备注</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="remark" name="remark"
									type="text" value="" placeholder="" />
							</div>
							<div class="basic_info_con_R">
								<span class="z_names budgetTestFee">预算检定费用</span>
								<p class="z_star"></p>
								<input class="basic_infoForm" id="budgetTestFee"
									name="budgetTestFee" type="text" value="" placeholder="" />
							</div>
						</div>
					</div>
				</div>
				<div class="bot_btns">
					<a href="#" class="bta_w"
						onclick="javacript:;">保存</a> 
						<a href="#" onclick="javascript:window.history.back();">返回</a>
				</div>
			</div>
		</form>



	</div>

</body>
</html>