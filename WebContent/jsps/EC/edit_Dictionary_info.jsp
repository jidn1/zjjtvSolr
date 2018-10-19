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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ec/ec_common.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	    
		
</script>
</head>
<body>
 
  <div class="slider_right">
	<p class="title">
	    <a href="#">设置</a>
	    <span>/</span>
	    <a href="#">数据字典</a>
	</p> 
	
	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav navas">
	    	<h4 style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">编辑数据字典</h4>
    	</div>
    	<div class="appliance_con">
				<div class="basic_info_con">
					<div class="basic_info_con_L info_line">
						<span for="description" class="z_names description">字典名称</span><p class="z_star"></p>
						  <input style="width:450px;" type="text" class="basic_infoForm basic_infoForm_b required" name="description"  id="description" placeholder="请输入描述" value="&#22120;&#20855;&#21040;&#26399;&#25552;&#37266;&#22825;&#25968;" readonly>
					</div>
				</div>
				<div class="basic_info_con">
					<div class="basic_info_con_L " style="width:100%">
						<span for="enumCode" class="z_names enumCode ">字典值</span><p class="z_star"></p>
											<input type="text" style='width:450px;' class="basic_infoForm basic_infoForm_a required" name="enumCode" id="enumCode" placeholder="" value="7">
							<span class="a_spans"></span>
						</div>
					</div>
					<div class="bot_btns" style="margin:1% 0 -2.5% 25% !important;text-align:left!important">
						  <a  class="bta_w bta_wt" onclick="">保存 </a>
						  <a  class="bta_w bta_wt" onclick="javascript:window.history.back();"> 返回</a>
					</div>
 		</div>
	</div>


</div>
 
</body>
</html>