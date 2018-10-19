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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript">
function updateDictionary(id,status){
	var path = $("#path").val();
	$('#id').val(id);
	$('#dictionaryStatus').val(status);
$('#pageForm').attr("action",path+"/user/updateDictionary.do").submit();
	
}	
</script>
</head>
<body>
 
  <div class="slider_right"><!-- End Template component://limsZJJL_EC/webapp/ec/includes/mainContent_header.ftl -->
<!-- Begin Template component://limsZJJL_EC/webapp/ec/MyInstruments/myInstruments_list.ftl -->
	<p class="title">
	    <a href="#">设置</a>
	    <span>/</span>
	    <a href="#">数据字典</a>
	</p> 

	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav navas">
	    	<h4 style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">数据字典列表</h4>
    	</div>
    	<div class="appliance_con">
    		<table width="100%" border="1" cellspacing="1" class="z_table" style="border-collapse:collapse;">
		    	<tr class="z_tops_title"> 
		       		
			        <td >字典名称<span id="descriptionSortLable"></span></td> 
			       	<td >字典值<span id="enumCodeSortLable"></span></td> 
			       	<td >操作<span id="enumCodeSortLable"></span></td> 
		       	</tr> 
		       	<c:forEach items="${dataList }" var="data">
		       	<tr>
		     		
		     	 	<td>
		     	 		<a href="${pageContext.request.contextPath}/page/editDictionary.do">
		     	 			${data.dictionaryName }
		     	 		</a>
		     	 		
		     	 	</td>
		     	 	<td>
			     	 	${data.dictionaryValue }
			     	 </td>
			     	 <td>
			     	 <a href="javascript:void(0);" onclick="updateDictionary('${data.id}','${data.dictionaryStatus }')" style="cursor: pointer;">
			     	 <c:if test="${data.dictionaryStatus eq 'N' }">打开 </c:if>
			     	 	<c:if test="${data.dictionaryStatus eq 'Y' }">关闭 </c:if>
			     	 </a>
			     	 	
			     	 </td>
		        </tr>
		       	</c:forEach>
		       
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
                <a href="" onclick="setViewSize('${page.pageNow }')">下一页</a>  
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
    <li class="zlis">共${page.totalCount}条记录，每页显示${page.pageSize}条</li>
    
    <c:choose>
    <c:when test="${page.pageNow == page.totalPageCount }">
    <li class="zlis zlis_qw"> 当前显示${page.startPos+1}到${page.totalCount}记录</li>
    </c:when>
    <c:otherwise>
    <li class="zlis zlis_qw"> 当前显示${page.startPos+1}到${page.startPos+page.pageSize}记录</li>
    </c:otherwise>
    </c:choose>
</ul> 
</div>
</div>

 <script type="text/javascript">
function setViewSize(obj2){
	var path = $("#path").val();
		$('#pageNow').val(obj2);
	$('#pageForm').attr("action",path+"/page/myAppliances.do").submit();
}
</script>
<!-- 分页 -->
<form  id="pageForm" method="post" >
<input id="path" type="hidden" value="${pageContext.request.contextPath }">
<input type="hidden" id="pageNow" name="pageNow" value="${page.pageNow }" />
<input type="hidden" id="id" name="id" >
<input type="hidden" id="dictionaryStatus" name="dictionaryStatus" >
</form>
</body>
</html>