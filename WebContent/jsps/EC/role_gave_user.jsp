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

<script type="text/javascript">
function back(){
	var path = $("#path").val();
	$("#pageForm").attr("action",path+"/user/rolePermission.do").submit();
}


function roletUser(roleId){
	var ischecked = false;
	var path = $("#path").val();
	var select=document.getElementsByName("ids");
	 for(var i=0;i<select.length;i++){    
		 if(select[i].checked == true){
	    		ischecked = true;
	    	}
     }
	 var ids = [];
		$('input[name="ids"]:checked').each(function(){ 
		 	id =  $(this).val();
			ids.push(id);
		});
		$("#uuid").val(ids);
		$("#roleId").val(roleId);
	 if(!ischecked){
			confirm("请选择要授权的用户！");
		}else{
			$("#pageForm").attr("action",path+"/user/roleGaveUser.do").submit();
		}
}

function cancelRoletUser(roleId){
	var ischecked = false;
	var path = $("#path").val();
	var select=document.getElementsByName("ids");
	 for(var i=0;i<select.length;i++){    
		 if(select[i].checked == true){
	    		ischecked = true;
	    	}
     }
	 var ids = [];
		$('input[name="ids"]:checked').each(function(){ 
		 	id =  $(this).val();
			ids.push(id);
		});
		$("#uuid").val(ids);
		$("#roleId").val(roleId);
	 if(!ischecked){
			confirm("请选择要授权的用户！");
		}else{
			$("#pageForm").attr("action",path+"/user/cancelRoleGaveUser.do").submit();
		}
	
}

//check全选按钮
function checkedAll(){
	var allcheckBoxs=document.getElementById("checkbox_project");    
    var select=document.getElementsByName("ids");
    
    if(allcheckBoxs.checked){ //全选按钮选中其他的都选中  
       for(var i=0;i<select.length;i++){    
    	   select[i].checked = true;    
       }    
    }else{  //取消则都取消
      for(var i=0;i<select.length;i++){    
    	  select[i].checked = false;    
      }    
    }    
}
//单个check选中
function checksingle(){
	var ischecked = true;
	var allcheckBoxs=document.getElementById("checkbox_project");  
	var select=document.getElementsByName("ids");
	for(var i =0;i<select.length;i++){
		
    	if(select[i].checked == false){
    		ischecked = false;
    	}
    }
	if(ischecked){
		allcheckBoxs.checked = true;
	}else{
		allcheckBoxs.checked = false;
	}
	
}
</script>
</head>
<body>
 
  <div class="slider_right">
	<p class="title">
	    <a href="#">设置</a>
	    <span>/</span>
	    <a href="#">用户设置</a>
	</p> 
	<div class="appliance_list" style="background:url(${pageContext.request.contextPath}/images/ec/z_line.png) repeat-x">
		<div class="nav">
	    	<h4 style="background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon03.png) no-repeat scroll left center;">用户列表</h4>
	        <span class="span01"><a href="javascript:void(0);" onclick="back()"  style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon05.png') no-repeat scroll left center;">返回 </a></span>
	        <span class="span01"><a href="javascript:void(0);" onclick="roletUser('${rolePermission}')"  style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon05.png') no-repeat scroll left center;">授权 </a></span>
	        <span class="span01"><a href="javascript:void(0);" onclick="cancelRoletUser('${rolePermission}')"  style="background: rgba(0, 0, 0, 0) url('${pageContext.request.contextPath}/images/ec/zicon05.png') no-repeat scroll left center;">取消授权 </a></span>
    	</div>
    	<div class="appliance_con">
    		<table class="z_table" cellspacing="0" width="100%">
				<thead>
					<tr class="z_tops_title">
						 <td style="width:1%;padding:0px;text-align: center;" height="40px">
					    <input class="checkboxCtrl" id="checkbox_project" type="checkBox" onclick="checkedAll()"></td>
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;"  nowrap="nowrap">用户名称</td>
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;" nowrap="nowrap">用户手机号</td>
						<td style="padding: 0px; text-align: center; width: 7%; min-width: 85px;">所属部门</td>
						<td style="padding: 0px; text-align: center; width: 3%; min-width: 85px;">所属客户<span></span></td>
						<td style="padding: 0px; text-align: center; width: 3%; min-width: 85px;">用户状态<span></span></td>
						<td style="padding: 0px; text-align: center; width: 10%; min-width: 85px;">用户级别<span></span></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList }" var="data" varStatus="status">
						<tr valign="middle" class="bgs">
					          <td style="height:28px;padding:0px;text-align: center;">
					            <input value="${data.userUUID }" 
					            
					               name="ids" type="checkbox" onclick="checksingle()">
					        </td>
							<td style="height: 28px; padding: 0px; text-align: center;"><a href="javascript:void(0)" onclick="">${data.userName }</a></td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.userPhone }</td>
							<td style="height: 28px; padding: 0px; text-align: center;"></td>
							<td style="height: 28px; padding: 0px; text-align: center;">${data.companyName }</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
							<c:if test="${data.state eq '1' }">可用</c:if>
							<c:if test="${data.state eq '0' }">不可用</c:if>
							</td>
							<td style="height: 28px; padding: 0px; text-align: center;">
							${data.userLevel}
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
	$('#pageForm').attr("action",path+"/user/selectUserList.do").submit();
}
</script>
<!-- 分页 -->
<form  id="pageForm" method="post" >
<input id="path" type="hidden" value="${pageContext.request.contextPath }">
<input type="hidden" id="pageNow" name="pageNow" value="${page.pageNow }" />
<input type="hidden" id="uuid" name="uuid" value="" />
<input type="hidden" id="roleId" name="roleId" value="" />
</form>
 
</body>
</html>