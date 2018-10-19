<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type"content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>业务分析主页</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/my_appliances_list.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
<!--jquery 事件-->
function seeEquipment(equipmentUUID){
	var path = $("#path").val();
	$("#id").val(equipmentUUID);
	$("#MyInstruments").attr("action",path+"/equip/toEquip.do").submit();
	
}
</script>
<style type="text/css">
.tabInput{
  box-sizing: border-box;
  text-align:center;
  font-size:1.4em;
  height:33px;
  border-radius:4px;
  border:1px solid #c8cccf;
  color:#6a6f77;
  -web-kit-appearance:none;
  -moz-appearance: none;
  display:block;
  outline:0;
  padding:0 1em;
  text-decoration:none;
  width:100%;
}
.updateInput{
  box-sizing: border-box;
  text-align:center;
  font-size:1.4em;
  height:28px;
  border-radius:4px;
  border:1px solid #c8cccf;
  color:#6a6f77;
  -web-kit-appearance:none;
  -moz-appearance: none;
  display:block;
  outline:0;
  padding:0 1em;
  text-decoration:none;
  width:100%;
}
.updatatb{
width: 65px;
}
</style>
</head>
<body>
 
  <div class="slider_right">
	<p class="title">
	    <a href="#">主菜单</a>
	    <span>/</span>
	    <a href="#">我的器具</a>
	</p> 
	<div class="tabs_con">
	<form action="" id="MyInstruments" method="post" class="form-search" action="MyInstruments">
		<input type="hidden" id="equipmentName" name="equipmentName" >
		<input type="hidden" id="manufacturer" name="manufacturer" >
		<input type="hidden" id="serialNumber" name="serialNumber" >
		<input type="hidden" id="equipmentModel" name="inspectionType" >
		<input type="hidden" id="validDate" name="validDate" value="">
		<input type="hidden" id="verificationInstitution" name="verificationDate" >
		<input type="hidden" id="subordinateSector" name="subordinateSector" >
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="updateType" name="updateType" value="PART">
	<div class="appliance_top">
    <span class="zsearch_name" >全文搜索：</span>
    <input type="text" class="basic_infoForm zsearch_con" id="controlCode" value="${filed }"/>
    <span class="zsearch_name" >有效日期：</span>
    <input class="basic_infoForm zsearch_con" type="text"  id="starTime" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}'})" value="${starTime }" readonly="readonly"><span class="zjh" >--</span>
	<input class="basic_infoForm zsearch_con" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'starTime\')}'})"  id="endTime" onclick="WdatePicker()" value="${endTime }" readonly="readonly">
	<div class="btnw_a" id="click_event"  >
	<a class="s_trw" onclick="query()" style="cursor: pointer;"> 查询</a>
	 
	 
	 </div>
	</div>
	</form>
	</div>
	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav">
	    	<h4 style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">器具列表</h4>
	        <span class="span01"><a href="javascript:void(0);" onclick="addEquipment()" title="添加器具" style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon05.png') no-repeat scroll left center;">添加器具 </a></span>
	        <span class="span02"><a href="javascript:void(0);" onclick="javascript:uploadExcelInstrumentsData()" title="导入器具" style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon05.png') no-repeat scroll left center;">导入器具 </a></span>
	        <span class="span03"><a href="javascript:void(0);" onclick="javascript:excel()" title="导出器具" style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon06.png') no-repeat scroll left center;">导出器具 </a></span>
	        <span class="span04"><a href="${pageContext.request.contextPath}/jsps/EC/edit_Plan_info.jsp" title="生成送检计划"  onclick="javascript:;" style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon07.png') no-repeat scroll left center;">生成送检计划 </a></span>
	        <span class="span04"><a href="${pageContext.request.contextPath}/jsps/EC/edit_Order_info.jsp" title="生成送检委托单"  onclick="javascript:void(0);" style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon08.png') no-repeat scroll left center;">生成送检委托单 </a></span>
	        <span class="span04"><a href="javascript:void(0);" onclick="batchUpdate()" style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon08.png') no-repeat scroll left center;">批量修改 </a></span>
	        <span class="span04"><a href="javascript:void(0);" onclick="deleteEquip()" style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon08.png') no-repeat scroll left center;">删除 </a></span>
    	</div>
    	<div class="appliance_con">
    		<table class="z_table" cellspacing="0" width="100%">
				<thead>
					<tr class="z_tops_title">
					    <td style="width:1%;padding:0px;text-align: center;" height="40px">
					    <input class="checkboxCtrl" id="checkbox_project" type="checkBox" onclick="checkedAll()"></td>
						<td style="padding: 0px; text-align: center; width: 4%;  " nowrap="nowrap">档案号<span ></span></td>
						<td style="padding: 0px; text-align: center; width: 6%;  " nowrap="nowrap">器具名称<span></span></td>
						<td style="padding: 0px; text-align: center; width: 6%;  ">型号<span></span></td>
						<td style="padding: 0px; text-align: center; width: 6%;  ">出厂编号<span></span></td>
						<td style="padding: 0px; text-align: center; width: 6%;  ">生产厂家<span></span></td>
						<td style="padding: 0px; text-align: center; width: 4%;  ">有效日期<span></span></td>
						<td style="padding: 0px; text-align: center; width: 2%;  ">检测费</td>
						<td style="padding: 0px; text-align: center; width: 4%;  ">检定机构</td>
						<td style="padding: 0px; text-align: center; width: 4%;  ">所属部门</td>
						<td style="padding: 0px; text-align: center; width: 2%;  ">使用人</td>
						<td style="padding: 0px; text-align: center; width: 4%;  ">所属计划</td>
						<td style="padding: 0px; text-align: center; width: 4%;  ">状态</td>
						<td style="padding: 0px; text-align: center; width: 4%;  ">操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${equipmentList }" var="data" varStatus="status">
						<tr valign="middle" class="bgs">
					        <td style="height:28px;padding:0px;text-align: center;">
					            <input value="${data.equipmentUUID }"  name="ids" type="checkbox" onclick="checksingle()">
					        </td>
							<td style="height: 28px; padding: 0px; text-align: center;"><a href="javascript:void(0);" onclick="seeEquipment('${data.equipmentUUID}')">${data.fileNumber }</a></td>
							<td style="height: 28px; padding: 0px; text-align: center;"><input type="text" value="${data.equipmentName }" name="equipmentName" class="tabInput equipName" readonly ondblclick="dbClickUpdate(this)" onblur="inputContet(this)"/></td>
							<td style="height: 28px; padding: 0px; text-align: center;"><input type="text" value="${data.equipmentModel }" name="equipmentModel" class="tabInput equipmentModel" readonly ondblclick="dbClickUpdate(this)" onblur="inputContet(this)"/></td>
							<td style="height: 28px; padding: 0px; text-align: center;"><input type="text" value="${data.serialNumber }" name="serialNumber" class="tabInput ccbh" readonly ondblclick="dbClickUpdate(this)" onblur="inputContet(this)"/></td>
							<td style="height: 28px; padding: 0px; text-align: center;"><input type="text" value="${data.manufacturer }" name="manufacturer" class="tabInput sccj" readonly ondblclick="dbClickUpdate(this)" onblur="inputContet(this)"/></td>
							<td style="height: 28px; padding: 0px; text-align: center;">
							<input type="text" value="<fmt:formatDate value='${data.validDate}'  pattern="yyyy-MM-dd"  />" onClick="WdatePicker()" name="validDate" class="tabInput yxDate"  readonly ondblclick="dbClickUpdate(this)" onblur="inputContet(this)"/></td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.orderNumber }</td>
							<td style="height: 28px; padding: 0px; text-align: center;"><input type="text" value="${data.verificationInstitution }" name="verificationInstitution" class="tabInput verificationInstitution" readonly ondblclick="dbClickUpdate(this)" onblur="inputContet(this)"/></td>
							<td style="height: 28px; padding: 0px; text-align: center;"><input type="text" value="${data.subordinateSector }" name="subordinateSector" class="tabInput sdeptment" readonly ondblclick="dbClickUpdate(this)" onblur="inputContet(this)"/></td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.equipmentUser }</td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.planNumber }</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_1' }">可用</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_2' }">停用</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_3' }">损坏</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_4' }">降级</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_5' }">准用</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_6' }">在库</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_7' }">封存</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_8' }">报废</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_9' }">遗失</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_10' }">备用</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_11' }">限用</c:if>
							<c:if test="${data.equipmentStatus eq 'EQUIPMENT_STATUS_12' }">其他</c:if>
							</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
							<input type="button" value="保存" onclick="updateEquip(this,'${data.equipmentUUID }')">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div> 
	</div>
<!-- 导入器具 -->
	<div id="myModal" class="profile-alert">
	    <h3 class="profile-alert-h3">导入器具
	        <a onclick="closeModalWindow('myModal');return false;" class="profile-alert-colse">×</a>
	    </h3>
	    <form  action="importEquipAccountByExcel" method="post" name="ImportInstrumentsByExcel" id="ImportInstrumentsByExcel"  enctype="multipart/form-data">
	        <dl class="profile-alert-dl">
	            <dt><span class="excelPath">导入文件</span><span style="color: red;"></span> </dt>
	            <dd> <input type="file" name="file" id="excelPath" placeholder="Excel导入文件" style="width:80%;">
	            <a  href="${pageContext.request.contextPath }/equip/upload/DownExcel.html" >下载器具模板 </a>
	            <!-- onclick="window.location.href='downloadCommonFile?fileId=DEVICE_TEMPLATE';return false;" -->
	                <span class="a_spans" ></span>
	            </dd>
	        </dl>
	    </form>
	    <div class="alert-btn">
	        <a href="javascript:;" onclick="closeModalWindow('myModal');return false;" class="alert-btn-a alert-btn-close">关闭</a>
	        
	        <a href="javascript:;" onclick="saveFile();return false;" class="alert-btn-a alert-btn-save">导入</a>
	       
	    </div>
	</div>
<!-- 批量修改 -->
<div id="deptInfoModal" class="profile-alert">
    <h3 class="profile-alert-h3">批量修改 <a onclick="closeModalWindow('deptInfoModal');return false;"
			class="profile-alert-colse">×</a>
	</h3>
	<form id="batchForm" method="post">
		<input type="hidden" name="equipmentId" id="equipmentId"/>
		
		<table >
		  <tr align="center">
		    <td class="updatatb">器具名称</td>
		    <td><input type="text" name="equipmentName" id="equipmentNames" class="updateInput"/></td>
		    <td class="updatatb">生厂厂家</td>
		    <td><input type="text" name="manufacturer" id="manufacturers" class="updateInput"/></td>
		    <td class="updatatb">出厂编号</td>
		    <td><input type="text" name="serialNumber" id="serialNumbers" class="updateInput"/></td>
		  </tr>
		   <tr align="center">
		    <td class="updatatb">型号</td>
		    <td><input type="text" name="equipmentModel" id="equipmentModels" class="updateInput"/></td>
		    <td class="updatatb">检定机构</td>
		    <td><input class="updateInput" id="verificationInstitutions" name="verificationInstitution" type="text" /></td>
		    <td class="updatatb">有效日期</td>
		    <td><input class="updateInput" id="validDates"
					name="validDate" onchange="checkStartData(this.value)"
					onClick="WdatePicker()" value="" type="text" placeholder=""
					readonly />
			</td>
		  </tr>
		    <tr align="center">
		    <td class="updatatb">所属部门</td>
		    <td><input type="text" name="subordinateSector" id="subordinateSectors" class="updateInput"/></td>
		  </tr>
		</table>
	</form>
	<div class="alert-btn">
		<a href="javascript:void(0);" onclick="javascript:seebatchUpdate();return false;" class="alert-btn-a alert-btn-save">确认</a>
		<a href="javascript:void(0);" onclick="javascript:savebatchUpdate();return false;" class="alert-btn-a alert-btn-save">保存</a> 
		<a href="javascript:void(0);" onclick="closeModalWindow('deptInfoModal');return false;" class="alert-btn-a alert-btn-close">关闭</a>
	</div>
</div>

<!-- 分页样式 -->
<div align="center">  
  <ul class="z_pages">
	<li class="zlis zlis_fist">
	<font size="2">共 ${page.totalPageCount} 页</font> 
     </li>
    <li class="zlis"><font size="2">第 <input type="text" value="${page.pageNow}" style="width: 20px;" /> 页</font> </li>
    <li class="zlis"><a href="javascript:void(0)" onclick="setViewSize('1')">首页</a></li>
     <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
            <li class="zlis"><a href="javascript:void(0)" onclick="setViewSize('${page.pageNow-1 }')">上一页</a></li>
                  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                 <li class="zlis"><a href="javascript:void(0)" onclick="setViewSize('${1}')">上一页</a> </li> 
            </c:when>  
      </c:choose>  
     <c:choose>  
     		<c:when test="${page.totalPageCount==0}">  
                <li class="zlis" >  <a href="" onclick="setViewSize('${page.pageNow }')">下一页</a>  </li> 
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}"> 
            <li class="zlis" > <a href="javascript:void(0)" onclick="setViewSize('${page.pageNow + 1 }')">下一页</a> </li> 
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
            <li class="zlis" > <a href="javascript:void(0)" onclick="setViewSize('${page.totalPageCount }')">下一页</a> </li> 
            </c:when>  
    </c:choose>  
     <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
            <li class="zlis" > <a href="javascript:void(0)" onclick="setViewSize('${page.pageNow }')">尾页</a>   </li>
            </c:when>  
            <c:otherwise>  
             <li class="zlis" > <a href="javascript:void(0)" onclick="setViewSize('${page.totalPageCount }')">尾页</a>    </li>
            </c:otherwise>  
   </c:choose>  
    <li class="zlis zlis_qw">共${page.totalCount}条记录，每页显示
      <select id="pagesize" onchange="changePageSize()">
        <option value="5" <c:if test="${page.pageSize==5 }">selected=""selected</c:if>>5</option>
        <option value="10" <c:if test="${page.pageSize==10 }">selected=""selected</c:if>>10</option>
        <option value="20" <c:if test="${page.pageSize==20 }">selected=""selected</c:if>>20</option>
      </select>
            条</li>
    <!-- 
    <c:choose>
    <c:when test="${page.pageNow == page.totalPageCount }">
    <li class="zlis zlis_qw"> 当前显示${page.startPos+1}到${page.totalCount}记录</li>
    </c:when>
    <c:otherwise>
    <li class="zlis zlis_qw"> 当前显示${page.startPos+1}到${page.startPos+page.pageSize}记录</li>
    </c:otherwise>
    </c:choose>
     -->
</ul> 
</div>  
</div>

<script type="text/javascript">

function changePageSize(){
	var path = $("#path").val();
	var pagesize = $("#pagesize").val();
	$("#pageSize").val(pagesize);
	$('#pageForm').attr("action",path+"/equip/myAppliances.do").submit();
}
function setViewSize(obj2){
	var path = $("#path").val();
	$('#pageNow').val(obj2);
	$('#pageForm').attr("action",path+"/equip/myAppliances.do").submit();
}
</script>
<!-- 分页 -->
<form  id="pageForm" method="post" >
<input id="path" type="hidden" value="${pageContext.request.contextPath }">
<input type="hidden" id="pageNow" name="pageNow" value="${page.pageNow }" />
<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }" />
<input type="hidden" id="filed" name="filed" value="${filed }" />
<input type="hidden" id="starTimes" name="starTime"  />
<input type="hidden" id="endTimes" name="endTime"  />
</form>

</body>
</html>