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
<meta http-equiv="content-type"content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title></title>

<link href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script type="text/javascript">
function roleGaveUser(role){
	$("#rolePermission").val(role);
	$("#pageForm").attr("action","${pageContext.request.contextPath}/user/roleGaveUserpage.do").submit();
}
	 
</script>
</head>
<body>
 
  <div class="slider_right">
	<p class="title">
	    <a href="#">设置</a>
	    <span>/</span>
	    <a href="#">角色权限</a>
	</p> 
	
	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav navas">
	    	<h4 style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">角色列表</h4>
    	</div>
    	<div class="appliance_con">
    	<table class="z_table" cellspacing="0" width="100%">
				<thead>
					<tr class="z_tops_title">
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;"  nowrap="nowrap">序号</td>
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;" nowrap="nowrap">角色名称</td>
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;">授权</td>
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;">编辑</td>
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;">操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${roleList }" var="role" varStatus="status">
						<tr valign="middle" class="bgs">
							<td style="height: 28px; padding: 0px; text-align: center;">${role.roleId }</td>
							<td style="height: 28px; padding: 0px; text-align: center;">${role.roleName }</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
							<a href="javascript:void(0);" onclick="roleGaveUser('${role.rolePermission }')">授权</a>
							</td>
							<td style="height: 28px; padding: 0px; text-align: center;">编辑</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
								<a href="javascript:void(0);">删除</a>
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
	<li class="zlis zlis_fist">
	<font size="2">共 ${page.totalPageCount} 页</font> 
     </li>
    <li class="zlis"><font size="2">第  ${page.pageNow} 页</font> </li>
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
</ul> 
</div>  
</div>
<script type="text/javascript">

function changePageSize(){
	var path = $("#path").val();
	var pagesize = $("#pagesize").val();
	$("#pageSize").val(pagesize);
	$('#pageForm').attr("action",path+"/user/rolePermission.do").submit();
}
function setViewSize(obj2){
	var path = $("#path").val();
	$('#pageNow').val(obj2);
	$('#pageForm').attr("action",path+"/user/rolePermission.do").submit();
}
</script>
<!-- 分页 -->
<form  id="pageForm" method="post" >
<input id="path" type="hidden" value="${pageContext.request.contextPath }">
<input type="hidden" id="pageNow" name="pageNow" value="${page.pageNow }" />
<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }" />
<input type="hidden" id="rolePermission" name="rolePermission" value="" />
</form>

</body>
</html>