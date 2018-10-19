<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type"content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>业务分析主页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>


<script type="text/javascript">
	    
		
</script>
</head>
<body>
 
  <div class="slider_right"><!-- End Template component://limsZJJL_EC/webapp/ec/includes/mainContent_header.ftl -->
<!-- Begin Template component://limsZJJL_EC/webapp/ec/MyInstruments/myInstruments_list.ftl -->
	<p class="title">
	    <a href="#">主菜单</a>
	    <span>/</span>
	    <a href="#">编辑订单</a>
	</p> 
	
	<form class="form-horizontal" action="updateEquipTaskOrder" method="post" name="MyEquipOrder" id="MyEquipOrder">
	<input type="hidden" name="taskOrderId" id="taskOrderId" value="10000"/>
	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav navas">
			<h4 style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon03.png') no-repeat scroll left center;">编辑订单</h4>
		</div>
		<div class="basic_info">
			<div class="basic_info_con">
                <div class="basic_info_con_L">
                	<span class="z_names w_names orderCode">订单编号</span><p class="z_star">*</p>
                	<input class="basic_infoForm basic_infoForm_a"  id="orderCode" name="orderCode" placeholder="--系统自动生成--" value="DD201706200001" readonly type="text" />
					<span class="a_spans"></span>
				</div>
				  <input type="hidden" name="taskCustomerId" placeholder="客户Id（委托单位的Id）" value="EC0001">
				<div class="basic_info_con_R">
                	<span class="z_names w_names">下单时间</span><p class="z_star">*</p>
                	<input class="basic_infoForm basic_infoForm_a"  id="" name="" readonly value="2017-06-20 14:39:06" type="text" readonly/>
					<span class="a_spans"></span>
				</div>
			</div>
			<div class="basic_info_con">
				<div class="basic_info_con_L">
                	<span class="z_names w_names taskCheckDate">委托日期</span><p class="z_star">*</p>
                	<input class="basic_infoForm basic_infoForm_a required" onClick="WdatePicker()" onchange="checkStartData(this.value);taskCheckDateData();" id="taskCheckDate" name="taskCheckDate"  value="2017-06-20" type="text" readonly/>
					<span class="a_spans"></span>
				</div>
				<div class="basic_info_con_R">
                	<span class="z_names w_names taskFetchDate">拟取时间</span><p class="z_star">*</p>
                	<input class="basic_infoForm basic_infoForm_a required" onClick="WdatePicker()"  id="taskFetchDate" onchange="checkEndData(this.value)"  name="taskFetchDate"  type="text" readonly value="2017-06-28"/>
					<span class="a_spans"></span>
				</div>
			</div>
			<div class="basic_info_con">
               <div class="basic_info_con_L">
                	<span class="z_names w_names taskCustomerName">委托单位</span><p class="z_star">*</p>
                	<input class="basic_infoForm basic_infoForm_a required" type="text" id="taskCustomerName" name="taskCustomerName" placeholder="客户名称" value="&#36828;&#33322;&#31185;&#23792;" readonly/>
					<span class="a_spans"></span>
				</div>
				<div class="basic_info_con_R">
                	<span class="z_names w_names taskCustomerLinkman">联系人</span><p class="z_star">*</p>
                	<div class="z_select_border">
                        <div class="z_container">
                        	<select id="taskCustomerLinkman" name="taskCustomerLinkman" class="basic_infoForm selects required"  onchange="javascript:changeLinkPartyName(this);">
								<option value="">--请选择--</option>
								  <option value="---新建---">---新建---</option>
								  			<option value="&#23665;&#19996;" selected>&#23665;&#19996;</option>
							</select>
							<span class="a_spans"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="basic_info_con">
                <div class="basic_info_con_L">
                	<span class="z_names w_names taskCustomerAddr">联系地址</span><p class="z_star"></p>
                	<input class="basic_infoForm basic_infoForm_a required"  id="taskCustomerAddr" name="taskCustomerAddr" placeholder="联系地址" value="&#23665;&#19996;" type="text" readonly/>
					<span class="a_spans"></span>
				</div>
				<div class="basic_info_con_R">
                	<span class="z_names w_names taskCustomerTel">手机号</span><p class="z_star"></p>
                	<input class="basic_infoForm basic_infoForm_a required"  id="taskCustomerTel" name="taskCustomerTel" placeholder="" value="15000000000" readonly/>
					<span class="a_spans"></span>
				</div>
			</div>
			<div class="basic_info_con">
					<div class="basic_info_con_L">
	                	<span class="z_names w_names taskCertCorpName">证书名称</span><p class="z_star">*</p>
	                	<div class="z_select_border">
	                        <div class="z_container">
	                        	<select id="taskCertCorpName" name="taskCertCorpName" class="basic_infoForm selects required"  onchange="javascript:changeCertUnit(this);">
									<option value="">--请选择--</option>
								  	<option value="---新建---">---新建---</option>
									  			<option value="&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;" selected>&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;</option>
								</select>
								<span class="a_spans"></span>
							</div>
						</div>
					</div>
					<div class="basic_info_con_R">
	                	<span class="z_names w_names taskCertCorpAddr">证书地址</span><p class="z_star"></p>
	                	<input class="basic_infoForm basic_infoForm_a"  id="taskCertCorpAddr" name="taskCertCorpAddr" value="&#23665;&#19996;&#28493;&#22346;"  type="text" readonly/>
						<span class="a_spans"></span>
					</div>
			</div>
			<div class="basic_info_con">
					<div class="basic_info_con_L">
	                	<span class="z_names w_names taskInvoiceTitle">发票抬头</span><p class="z_star">*</p>
	                	<div class="z_select_border">
	                        <div class="z_container">
	                        	<select id="taskInvoiceTitle" name="taskInvoiceTitle" class="basic_infoForm selects required"   onchange="javascript:changeInvoiceTitle(this);">
									<option value="">--请选择--</option>
									  	<option value="---新建---">---新建---</option>
									  			<option value="&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;" selected>&#31934;&#23454;&#65288;&#23665;&#19996;&#32622;&#20449;&#26234;&#33021;&#35774;&#22791;&#26377;&#38480;&#20844;&#21496;</option>
								</select>
								<span class="a_spans"></span>
							</div>
						</div>
					</div>
					<div class="basic_info_con_R">
	                	<span class="z_names w_names agencyId">送检平台</span><p class="z_star">*</p>
	                	<div class="z_select_border">
	                        <div class="z_container">
	                        	<select id="agencyId" name="agencyId" class="basic_infoForm selects required"  >
									<option value="">--请选择--</option>
									  			<option value="KKLIMS_BJ">&#20013;&#26816;-&#19990;&#26631;</option>
									  			<option value="KKLIMS_GD">&#20013;&#26816;-&#24191;&#19996;</option>
								</select>
								<span class="a_spans"></span>
							</div>
						</div>
					</div>
			</div>
			<div class="basic_info_con">
               <div class="basic_info_con_L">
                	<span class="z_names w_names taskComments">备注</span><p class="z_star"></p>
                	<input class="basic_infoForm basic_infoForm_a"  id="taskComments" name="taskComments" value="" type="text"/>
                	<span class="a_spans"></span>
				</div>
				<div class="basic_info_con_R">
                	<span class="z_names w_names orderType">订单类型</span><p class="z_star">*</p>
                	<input type="text" id="orderType" name="orderType" class="basic_infoForm basic_infoForm_a required" value="" readOnly>
					<span class="a_spans"></span>
				</div>
			</div>
		<div class="appliance_con">
			<table id="example" width="100%" border="1" cellspacing="1" class="z_table" style="border-collapse:collapse;">
				<tr> 
					<td>器具名称/档案号/规格/型号/出厂编号</td> 
					<td>证书编号/校验日期/检定周期/有效日期/检定结果/检定员/检定（校准）费用</td> 
				    <td>状态</td> 
				    <td>操作</td> 
				</tr> 
				     	<tr id="ins_bf742ec3b7214f72a7e70840d9648dac"> 
					       <td>
						       	&#34746;&#19997;&#21345;&#23610;/
						       	PC20170620/
						       	PL101/
						       	/
						       	EC201706
					       </td> 
					       <td>
					       		/
						       	/
						       	/
						       	/
						       	/
						       	/
						       	
					       </td> 
					       <td>
					       	未下单
						   </td>
					       <td class="center"> 
						       <button type="button"  class="z_delate " onclick="javascript:deleteRow('ins_bf742ec3b7214f72a7e70840d9648dac','bf742ec3b7214f72a7e70840d9648dac','T_O_I_STATUS_1');">删除</button>
							   <input type="hidden" name="EQUIPID" value="bf742ec3b7214f72a7e70840d9648dac" />
						   </td> 
					    </tr>
			</table>
		</div>
		<div class="bot_btns">
				<a href="#" class="bta_w" onclick="javacript:;">保存</a>
				<a href="#" class="bta_w " onclick="javascript:;">发送</a>
			 	<a href="#"  onclick="javascript:window.history.back();">返回</a>
	     </div>
	</div>
	</div>
</form>


</div>
 
</body>
</html>