<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
		/**
		* 分页
		*/
		function setViewSize(obj1,obj2,obj3,obj4,obj5,obj6){
			if(obj1 != null){
				$('#pageSize').val(obj1);
				$('#pageNo').val(0);
			}
			if(obj2 != null){
				$('#pageNo').val(obj2);
			}
			if(obj3 != null){
				$('#pageNo').val(obj3);
			}
			if(obj4 != null){
				$('#pageNo').val(obj4);
			}
			if(obj5 != null){
				$('#pageNo').val(obj5);
			}
			if(obj6 != null){
				$('#pageNo').val(obj6);
			}
			$('#pageForm').submit();
		}
</script>		
	<div class="datagrid-pager pagination"
		style="border-top: 1px solid #dddddd">
		<table border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td><select onchange="setViewSize(this.value);return false;"
						name="pageSize" class="pagination-page-list">
							<option <c:if test="${sc.pageSize == 15 }">selected="selected"</c:if> value="15">15</option>
							<option <c:if test="${sc.pageSize == 20 }">selected="selected"</c:if> value="20">20</option>
							<option <c:if test="${sc.pageSize == 30 }">selected="selected"</c:if> value="30">30</option>
							<option <c:if test="${sc.pageSize == 50 }">selected="selected"</c:if> value="50">50</option>
							<option <c:if test="${sc.pageSize == 100 }">selected="selected"</c:if> value="100">100</option>
							<option <c:if test="${sc.pageSize == 200 }">selected="selected"</c:if> value="200">200</option>
							<option <c:if test="${sc.pageSize == 1000 }">selected="selected"</c:if> value="1000">1000</option>
					</select></td>
					<td><div class="pagination-btn-separator"></div></td>
					<td><a href="javascript:void(0);" <c:if test="${currentPage != 1}">onclick="setViewSize(null,1);return false;"</c:if> class="l-btn l-btn-plain <%-- <c:if test="${currentPage == 1}">l-btn-disabled</c:if> --%>"><span><span class="l-btn-text">
						<span class="l-btn-empty pagination-first">&nbsp;</span></span></span></a></td>
					<td><a href="javascript:void(0);" <c:if test="${currentPage != 1}">onclick="setViewSize(null,null,'${currentPage-1 }');return false;"</c:if> class="l-btn l-btn-plain <%-- <c:if test="${currentPage == 1}">l-btn-disabled</c:if> --%>"><span><span class="l-btn-text">
						<span class="l-btn-empty pagination-prev">&nbsp;</span></span></span></a></td>
					<td><div class="pagination-btn-separator"></div></td>
					<td><span style="padding-left: 6px;">第</span></td>
					<td>
					 <select onchange="setViewSize(null,null,null,this.value);return false;"
						name="pages" class="pagination-page-list">
							<c:choose>
							<c:when test="${_page == currentPage }">
								<option value="${_page }">${_page }</option>
							</c:when>
							<c:otherwise>
								<c:forEach begin="${showStart }" end="${showEnd }" var="_page">
									<option value="${_page }" <c:if test="${sc.pageNo == _page}">selected="selected"</c:if>>${_page }</option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</select>
					</td>
					<td><span style="padding-right: 6px;">共${pageCount }页</span></td>
					<td><div class="pagination-btn-separator"></div></td>
					<td><a href="javascript:void(0);" <c:if test="${currentPage != pageCount && pageCount != 0}">onclick="setViewSize(null,null,null,null,'${currentPage + 1}');return false;"</c:if> class="l-btn l-btn-plain <%-- <c:if test="${currentPage == pageCount || pageCount == 0}">l-btn-disabled</c:if> --%>"><span><span class="l-btn-text">
						<span class="l-btn-empty pagination-next">&nbsp;</span></span></span></a></td>
					<td><a href="javascript:void(0);" <c:if test="${currentPage != pageCount && pageCount != 0}">onclick="setViewSize(null,null,null,null,null,'${pageCount }');return false;"</c:if> class="l-btn l-btn-plain <%-- <c:if test="${currentPage == pageCount || pageCount == 0}">l-btn-disabled</c:if> --%>"><span><span class="l-btn-text">
						<span class="l-btn-empty pagination-last">&nbsp;</span></span></span></a></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div class="pagination-info" style="float: left; margin-left: 10px">共${totalCount }记录</div>
		<div style="clear: both;"></div>
	</div>
	<form class="pageForm" id="pageForm" method="post">
		<input id="permissionGroupId" name="permissionGroupId" type="hidden"/>
		<input id="permissionDescription" name="permissionDescription" type="hidden"/>
		<input id="pageNo" name="pageNo" type="hidden" >
		<input id="pageSize" name="pageSize" type="hidden" value="${sc.pageSize }">
		<input id="userName" name="userName" value="${sc.userName }" type="hidden"/>
		<input id="firstName" name="firstName" value="${sc.firstName }" type="hidden"/>
		<input id="statusId" name="statusId" value="${sc.statusId }" type="hidden"/>
		<input id="orderLevelId" name="orderLevelId" value="${sc.orderLevelId }" type="hidden"/>
		<input id="orderType" name="orderType" value="${sc.orderType }" type="hidden"/>
		<input id="deptId" name="deptId" value="${sc.deptId }" type="hidden"/>
		<input id="initialState" name="initialState" value="${sc.initialState }" type="hidden"/>
		<input id="loginDeptId" name="loginDeptId" value="${sessionScope.userLogin.deptId }" type="hidden"/>
		<input type="hidden"  name="loginId" value="${sessionScope.userLogin.partyId }">
		<input id="beginTime" name="beginTime" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${sc.beginTime }"/>" type="hidden"/>
		<input id="endTime" name="endTime" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${sc.endTime }"/>" type="hidden"/>
			<c:choose>
				<c:when test="${fn:contains(sessionScope.userLogin.groupId,'SYSTEM')}">
					<input name="groupId" value="SYSTEM" type="hidden"/>
				</c:when>
				<c:when test="${fn:contains(sessionScope.userLogin.groupId,'COURTYARD')}">
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'COURTYARD_ADMIN')}">
						<input name="groupId" value="COURTYARD_ADMIN" type="hidden"/>
					</c:if>
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'COURTYARD_LEADER') || fn:contains(sessionScope.userLogin.groupId,'COURTYARD_SUPERVISOR')}">
						<input name="groupId" value="COURTYARD" type="hidden"/>
					</c:if>
				</c:when>
				<c:when test="${fn:contains(sessionScope.userLogin.groupId,'FOCAL_POINT')}">
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'FOCAL_POINT_ADMIN')}">
						<input name="groupId" value="FOCAL_POINT_ADMIN" type="hidden"/>
					</c:if>
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'FOCAL_POINT_DIVISION') || fn:contains(sessionScope.userLogin.groupId,'FOCAL_POINT_SUPERVISOR')}">
						<input name="groupId" value="FOCAL_POINT" type="hidden"/>
					</c:if>
				</c:when>
				<c:when test="${fn:contains(sessionScope.userLogin.groupId,'DRAFTER')}">
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'DRAFTER_AUTHOR')}">
						<input name="groupId" value="DRAFTER_AUTHOR" type="hidden"/>
					</c:if>
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'DRAFTER_TECHNICAL')}">
						<input name="groupId" value="DRAFTER_TECHNICAL" type="hidden"/>
					</c:if>
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'DRAFTER_ADMIN') || fn:contains(sessionScope.userLogin.groupId,'DRAFTER_DIVISION') || fn:contains(sessionScope.userLogin.groupId,'DRAFTER_SUPERVISOR')}">
						<input name="groupId" value="DRAFTER" type="hidden"/>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${fn:contains(sessionScope.userLogin.groupId,'EXPERTS')}">
						<input name="groupId" value="EXPERTS" type="hidden"/>
					</c:if>
				</c:otherwise>
			</c:choose>
	</form>
</html>