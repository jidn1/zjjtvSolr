<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type"
	content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title></title>
<link rel="stylesheet" href="../css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

<script type="text/javascript">

//添加器具方法
function insertEquipment(){
	var path = $("#path").val();
	$("#equipmentForm").attr("action","${pageContext.request.contextPath }/equip/insertEquipment.do").submit();
}
	
function updateEquipment(){
	var path = $("#path").val();
	$("#equipmentForm").attr("action","${pageContext.request.contextPath }/page/writeHtml.do").submit();
	
}
</script>
</head>
<body>


	<div class="slider_right">
		<p class="title">
			<a href="#">主菜单</a> <span>/</span> <a href="#">编辑器具</a>
		</p>

		<form action="" method="post" id="equipmentForm" enctype="multipart/form-data">
		<input type="hidden" name="file_name" value="edit_appliances_info.jsp">
		<input type="hidden" name="path" value="jsps/EC">
		<input type="hidden" name="realName" value="appliances">
		<input type="hidden" name="realPath" value="html">
			<input type="hidden" name="id" id="equipmentUUID" value="${equipment.equipmentUUID }">
			<input type="hidden" id="updateType" name="updateType" value="ALL">
			<input id="path" type="hidden" value="${pageContext.request.contextPath }">
			<div class="basic_info">
				<h3 id="zclick_event" class="z_A">
					<a href="#">基本信息demo</a>
				</h3>
				<span class="SJLS"><a
					href="${pageContext.request.contextPath}/jsps/EC/My_censorship_history.jsp">送检历史</a></span>
				<div id="zhidden_enent" class="basic_infoss" style="display: block">
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names controlCode">档案号</span>
							<p class="z_star">*</p>
							<!-- ${equipment.fileNumber } -->
							<input class="basic_infoForm basic_infoForm_a required"
								id="fileNumber" name="fileNumber" value="" type="text" /> <span
								class="a_spans"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names equipStatus">器具状态</span>
							<p class="z_star">*</p>
							<div class="z_select_border">
								<div class="z_container">
									<select id="equipmentStatus" name="equipmentStatus"
										class="basic_infoForm selects required">
										<option value="">请选择</option>
										<option value='EQUIPMENT_STATUS_1' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_1' }">selected="selected"</c:if> >&#22312;&#29992;</option>
										<option value='EQUIPMENT_STATUS_2' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_2' }">selected="selected"</c:if> >&#20572;&#29992;</option>
										<option value='EQUIPMENT_STATUS_3' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_3' }">selected="selected"</c:if> >&#25439;&#22351;</option>
										<option value='EQUIPMENT_STATUS_4' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_4' }">selected="selected"</c:if> >&#38477;&#32423;</option>
										<option value='EQUIPMENT_STATUS_5' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_5' }">selected="selected"</c:if> >&#20934;&#29992;</option>
										<option value='EQUIPMENT_STATUS_6' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_6' }">selected="selected"</c:if> >&#22312;&#24211;</option>
										<option value='EQUIPMENT_STATUS_7' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_7' }">selected="selected"</c:if> >&#23553;&#23384;</option>
										<option value='EQUIPMENT_STATUS_8' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_8' }">selected="selected"</c:if> >&#25253;&#24223;</option>
										<option value='EQUIPMENT_STATUS_9' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_9' }">selected="selected"</c:if> >&#36951;&#22833;</option>
										<option value='EQUIPMENT_STATUS_10' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_10' }">selected="selected"</c:if> >&#22791;&#29992;</option>
										<option value='EQUIPMENT_STATUS_11' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_11' }">selected="selected"</c:if> >&#38480;&#29992;</option>
										<option value='EQUIPMENT_STATUS_12' <c:if test="${equipment.equipmentStatus eq'EQUIPMENT_STATUS_12' }">selected="selected"</c:if> >&#20854;&#23427;</option>
									</select> <span class="a_span" style="color: #B94A48;"></span>
								</div>
							</div>
						</div>
						<div class="basic_info_con_L">
							<span class="z_names testGroup">计量类别</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="measurementCategory" name="measurementCategory" value="${equipment.measurementCategory }"
								type="text" placeholder="" /> <span class="a_spans1"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names equipName">器具名称</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="equipmentName" name="equipmentName" value="${equipment.equipmentName }" type="text"
								placeholder="" /> <span class="a_spans1"></span>
						</div>
						<div class="basic_info_con_R">
							<span class="z_names w_names equipOrderType">客户编号</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="customerNumber" name="customerNumber" value="${equipment.customerNumber }" type="text"
								placeholder="" />
						</div>
						<div class="basic_info_con_R">
							<span class="z_names testDate">器具数量</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="equipmentCount" name="equipmentCount" value="${equipment.equipmentCount }" type="text"
								placeholder="" /> <span class="a_spans1"></span>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names w_names factoryNo">出厂编号</span>
							<p class="z_star">*</p>
							<input class="basic_infoForm basic_infoForm_c required"
								id="serialNumber" name="serialNumber" value="${equipment.serialNumber }" type="text"
								placeholder="" /> <span class="a_spans2"></span>
						</div>

						<c:if test="${ifMerge eq 'N' }">
							<div class="basic_info_con_R">
								<span class="z_names w_names equipSpec/equipModel">规格/型号</span>
								<p class="z_star"></p>
								<input class="basic_infoForm basic_infoForm_c"
									id="equipmentSpecification"
									style="width: 20%; background: none;"
									name="equipmentSpecification" type="text" value="${equipment.equipmentSpecification }"
									placeholder="" /> / <input
									class="basic_infoForm basic_infoForm_c" id="equipmentModel"
									style="width: 21%; background: none;" name="equipmentModel"
									type="text" value="${equipment.equipmentModel }" placeholder="" />
							</div>
						</c:if>
						<c:if test="${ifMerge eq 'Y' }">
							<div class="basic_info_con_R">
								<span class="z_names w_names equipSpec/equipModel">规格/型号</span>
								<p class="z_star"></p>
								<input class="basic_infoForm basic_infoForm_c required"
									id="equipmentModel" name="equipmentModel" value="${equipment.equipmentModel }" type="text"
									placeholder="" /> <span class="a_spans2"></span>
							</div>
						</c:if>

						<div class="basic_info_con_L equipAcceptDate">
							<span class="z_names">出厂日期</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_c "
								id="productionDate" name="productionDate"
								onchange="checkStartData(this.value)" onClick="WdatePicker()"
								value="<fmt:formatDate value='${equipment.productionDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder="" readonly />
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names manufacture">生产厂家</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="manufacturer"
								name="manufacturer" type="text" value="${equipment.manufacturer}"
								placeholder="" />
						</div>
						<div class="basic_info_con_R">
							<span class="z_names equipType">ABC分类</span>
							<p class="z_star"></p>
							<div class="z_select_border">
								<div class="z_container">
									<select name="abcClassification" id="abcClassification"
										class="basic_infoForm selects">
										<option value="">请选择</option>
										<option value="A" <c:if test="${equipment.abcClassification eq 'A' }">selected="selected"</c:if> >A</option>
										<option value="B" <c:if test="${equipment.abcClassification eq 'B' }">selected="selected"</c:if> >B</option>
										<option value="C" <c:if test="${equipment.abcClassification eq 'C' }">selected="selected"</c:if> >C</option>
									</select>
								</div>
							</div>
						</div>
						<div class="basic_info_con_L">
							<span class="z_names w_names equipName">ABC编号</span>
							<p class="z_star"></p>
							<input class="basic_infoForm basic_infoForm_b required"
								id="abcNumber" name="abcNumber" value="${equipment.abcNumber}" type="text"
								placeholder="" /> <span class="a_spans1"></span>
						</div>
					</div>
					<div class="basic_info_con">
						
						<div class="basic_info_con_L info_line">
							<span class="z_names accuracyLevel">彩色附录</span>
							<p class="z_star"></p>
							<c:if test="${equipment.colorAppendix  != null}">
							<input class="basic_infoForm" name="file"
								type="text" value="${equipment.colorAppendix }" onchange=""/>
							</c:if>
							<c:if test="${equipment.colorAppendix  == null}">
							<input class="basic_infoForm" name="file"
								type="file" value="" onchange=""/>
							</c:if>
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names accuracyLevel">备注</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="basicRemark" name="basicRemark"
								type="text" value="${equipment.basicRemark}" placeholder="" />
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names accuracyLevel">准确度等级</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="accuracyLevel"
								name="accuracyLevel" type="text" value="${equipment.accuracyLevel}" placeholder="" />
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names measurementRange">测量范围</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="measuringRange"
								name="measuringRange" value="${equipment.measuringRange}" type="text" placeholder="" />
						</div>
					</div>
					<div class="basic_info_con">
						<div class="basic_info_con_L info_line">
							<span class="z_names indeterminacy">不确定度</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="uncertainty" name="uncertainty"
								value="${equipment.uncertainty}" type="text" placeholder="" />
						</div>
					</div>
				</div>
			</div>


			<div class="basic_info">
				<h3 id="zclick_event" class="z_A">
					<a href="#">校检信息</a>
				</h3>
				<div id="zhidden_enent" class="basic_infoss" style="display: block">
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names certNo">证书编号</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="certificateNumber"
								name="certificateNumber" value="${equipment.certificateNumber}" type="text" placeholder="" />
						</div>
						<div class="basic_info_con_R">
							<span class="z_names testDate">首次校验日期</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="firstInspectionDate"
								onchange="settestVaildDate();" name="firstInspectionDate"
								onClick="WdatePicker()" value="<fmt:formatDate value='${equipment.firstInspectionDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder=""
								readonly />
						</div>
						<div class="basic_info_con_L">
							<span class="z_names certNo">检定单位</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="verificationUnit"
								name="verificationUnit" value="${equipment.verificationUnit}" type="text" placeholder="" />
						</div>
					</div>
				</div>

				<div class="basic_info_con">
					<div class="basic_info_con_L">
						<span class="z_names testDate">完成日期</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="completionDate"
							onchange="settestVaildDate();" name="completionDate"
							onClick="WdatePicker()" value="<fmt:formatDate value='${equipment.completionDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder=""
							readonly />
					</div>
					<div class="basic_info_con_R">
						<span class="z_names testFee">检定机构</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="verificationInstitution"
							name="verificationInstitution" type="text" value="${equipment.verificationInstitution}"
							placeholder="" />
					</div>
					<div class="basic_info_con_L">
						<span class="z_names budgetTestFee">校验日期</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="verificationDate"
							onchange="settestVaildDate();" name="verificationDate"
							onClick="WdatePicker()" value="<fmt:formatDate value='${equipment.verificationDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder=""
							readonly />
					</div>
				</div>


				<div class="basic_info_con">
					<div class="basic_info_con_L">
						<span class="z_names testCycle">检定周期</span>
						<p class="z_star"></p>
						<input class="basic_infoForm z_datas" id="verificationCycle"
							name="verificationCycle" onchange="settestVaildDate();" value="${equipment.verificationCycle}"
							type="text" placeholder="单位为月" />
					</div>
					<div class="basic_info_con_R">
						<span class="z_names testVaildDate">有效日期</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="validDate" name="validDate"
							onClick="WdatePicker()" value="<fmt:formatDate value='${equipment.validDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder=""
							readonly />
					</div>
					<div class="basic_info_con_L">
						<span class="z_names testResult">检定结果</span>
						<p class="z_star"></p>
						<div class="z_select_border">
							<div class="z_container">
								<select name="verificationResult" id="verificationResult"
									class="basic_infoForm selects">
									<option value="">请选择</option>
									<option value='EQUIP_TEST_RESULT1' <c:if test="${equipment.verificationResult eq 'EQUIP_TEST_RESULT1' }">selected="selected"</c:if> >&#21512;&#26684;</option>
									<option value='EQUIP_TEST_RESULT2' <c:if test="${equipment.verificationResult eq 'EQUIP_TEST_RESULT2' }">selected="selected"</c:if> >&#19981;&#21512;&#26684;</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="basic_info_con">
					<div class="basic_info_con_L">
						<span class="z_names testCycle">送检类型</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="inspectionType"
							name="inspectionType" type="text" value="${equipment.inspectionType}" placeholder=""
							 />
					</div>
					<div class="basic_info_con_R">
						<span class="z_names testVaildDate">校准费</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="calibrationFee"
							name="calibrationFee" type="text" value="${equipment.calibrationFee}" placeholder=""
							 />
					</div>
					<div class="basic_info_con_L">
						<span class="z_names testResult">预算费用</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="budgetFee" name="budgetFee"
							type="text" value="${equipment.budgetFee}" placeholder=""  />
					</div>
				</div>

				<div class="basic_info_con">
					<div class="basic_info_con_L">
						<span class="z_names testCycle">检定员</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="equipmentVerified"
							name="equipmentVerified" type="text" value="${equipment.equipmentVerified}" placeholder=""
							 />
					</div>
					<div class="basic_info_con_R">
						<span class="z_names testVaildDate">校检备注</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="checkRemark" name="checkRemark"
							type="text" value="${equipment.checkRemark}" placeholder="" />
					</div>
				</div>
			</div>

			<div class="basic_info">
				<h3 id="zclick_event" class="z_A">
					<a href="#">保管信息</a>
				</h3>
				<div id="zhidden_enent" class="basic_infoss" style="display: block">
					<div class="basic_info_con">
						<div class="basic_info_con_L">
							<span class="z_names certNo">接收状态</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="receiveState"
								name="receiveState" value="${equipment.receiveState}" type="text" placeholder="" />
						</div>
						<div class="basic_info_con_R">
							<span class="z_names testDate">接收日期</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="receiveDate"
								onchange="settestVaildDate();" name="receiveDate"
								onClick="WdatePicker()" value="<fmt:formatDate value='${equipment.receiveDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder=""
								readonly />
						</div>
						<div class="basic_info_con_L">
							<span class="z_names certNo">负责人</span>
							<p class="z_star"></p>
							<input class="basic_infoForm" id="equipmentPerson"
								name="equipmentPerson" value="${equipment.equipmentPerson}" type="text" placeholder="" />
						</div>
					</div>

				</div>
				<div class="basic_info_con">
					<div class="basic_info_con_L">
						<span class="z_names testDate">启用时间</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="enableDate"
							onchange="settestVaildDate();" name="enableDate"
							onClick="WdatePicker()" value="<fmt:formatDate value='${equipment.enableDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder=""
							readonly />
					</div>
					<div class="basic_info_con_R">
						<span class="z_names testFee">所属部门</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="subordinateSector"
							name="subordinateSector" type="text" value="${equipment.subordinateSector}" placeholder=""
							 />
					</div>
					<div class="basic_info_con_L">
						<span class="z_names budgetTestFee">购置日期</span>
						<p class="z_star"></p>
						<input class="basic_infoForm" id="purchaseDate"
							onchange="settestVaildDate();" name="purchaseDate"
							onClick="WdatePicker()" value="<fmt:formatDate value='${equipment.purchaseDate}'  pattern="yyyy-MM-dd"  />" type="text" placeholder=""
							readonly />
					</div>
				</div>


				<div class="basic_info_con">
					<div class="basic_info_con_L">
						<span class="z_names testCycle">使用人</span>
						<p class="z_star"></p>
						<input class="basic_infoForm z_datas" id="equipmentUser"
							name="equipmentUser" value="${equipment.equipmentUser}" type="text" placeholder="" />
					</div>
					<div class="basic_info_con_R">
						<span class="z_names testVaildDate">使用单位</span>
						<p class="z_star"></p>
						<input class="basic_infoForm z_datas" id="equipmentUseunit"
							name="equipmentUseunit" value="${equipment.equipmentUseunit}" type="text" placeholder="" />
					</div>
					<div class="basic_info_con_L">
						<span class="z_names testResult">购置价</span>
						<p class="z_star"></p>
						<input class="basic_infoForm z_datas" id="purchasePrice"
							name="purchasePrice" value="${equipment.purchasePrice}" type="text" placeholder="" />
					</div>
				</div>

				<!-- 遍历用户自定义字段 -->
				<c:if test="${fieldInfoList != null }">
					<div class="basic_info_con">
						<c:forEach items="${fieldInfoList }" var="field">
							<div class="basic_info_con_L">
								<span class="z_names testCycle">${field.fieldDescrib }</span>
								<p class="z_star"></p>
								<c:choose>
									<c:when test="${field.fieldType eq 'enum' }">
										<c:if test="${manyenumList != null }">
											<div class="z_select_border">
												<div class="z_container">
													<select name="${field.fieldName }" id="testResult" class="basic_infoForm selects">
														<option value="">请选择</option>
														<c:forEach items="${manyenumList }" var="m">
															<c:if test="${m.key eq field.fieldDescrib }">
																<c:forEach items="${m.value }" var="e">
																<c:if test="${equipment != null }">
																<c:if test="${e.enumValue eq equipment.spare_1}">
																	<option value='${e.enumValue }' selected="selected" >${e.enumValue }</option>
																	
																</c:if>
																<c:if test="${e.enumValue eq equipment.spare_2}">
																	<option value='${e.enumValue }' selected="selected" >${e.enumValue }</option>
																</c:if>
																<c:if test="${e.enumValue eq equipment.spare_3}">
																	<option value='${e.enumValue }' selected="selected" >${e.enumValue }</option>
																</c:if>
																<c:if test="${e.enumValue eq equipment.spare_4}">
																	<option value='${e.enumValue }' selected="selected" >${e.enumValue }</option>
																</c:if>
																<c:if test="${e.enumValue eq equipment.spare_5}">
																	<option value='${e.enumValue }' selected="selected" >${e.enumValue }</option>
																</c:if>
																<c:if test="${e.enumValue eq equipment.spare_6}">
																	<option value='${e.enumValue }' selected="selected" >${e.enumValue }</option>
																</c:if>
																</c:if>
																<option value='${e.enumValue }' >${e.enumValue }</option>
																</c:forEach>
															</c:if>
														</c:forEach>
													</select>
												</div>
											</div>
										</c:if>
									</c:when>
									<c:when test="${field.fieldType eq 'datetime' }">
										<input class="basic_infoForm" id="testDate"
											onchange="settestVaildDate();" name="${field.fieldName }"
											onClick="WdatePicker()" value="" type="text" placeholder=""
											readonly />
									</c:when>
									<c:otherwise>
										<input class="basic_infoForm z_datas" id="testCycle"
											name="${field.fieldName }" value="" type="text"
											placeholder="" />
									</c:otherwise>
								</c:choose>

							</div>
						</c:forEach>
					</div>
				</c:if>

				<div class="bot_btns">
				<c:if test="${equipment != null }">
				<a href="javascript:void(0)" class="bta_w" onclick="updateEquipment()">保存</a>
				</c:if>
				<c:if test="${equipment == null }">
				<a href="javascript:void(0)" class="bta_w" onclick="insertEquipment()">添加</a>
				</c:if>
					<a class="s_trw"  onclick="updateEquipment()" style="cursor: pointer;">HTML</a>
					<!-- href="<%=basePath%>/toHtml?file_name=edit_appliances_info.jsp&&path=jsps/EC&&realName=appliances&&realPath=html" -->
					<%-- href="<%=basePath%>/toHtml?name=${pageContext.request.requestURI}" --%>
					<a class="s_trw" href="/limsEC/html/writeHtml.html" style="cursor: pointer;">显示页面</a>
					<a href="#" onclick="javascript:window.history.back();">返回</a>
				</div>
			</div>

		</form>
	</div>
	
</body>
</html>