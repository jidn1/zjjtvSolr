<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div class="searchTxt" style="min-width: 640px;width: 32%;">
	      <span class="chasp">标准名称</span>
	      <input type="text" id="userNameText" value="${sc.userName }" placeholder="请输入标准名称" class="chast" style="width: 180px;"/>
           <c:if test="${fn:contains(sessionScope.userLogin.groupId,'DRAFTER') == false }">
		      <select id="deptIdText" class="chast" style="width:210px;">
		         	<option value="">请选择编制单位</option>
					<c:forEach items="${sessionScope.depts }" var="dept" >
						<option value="${dept.partyId }" <c:if test="${dept.partyId == sc.deptId }">selected="selected"</c:if>>${dept.groupName }</option>
		            </c:forEach>
		      </select>
	      </c:if>
	      <select id="orderTypeText" class="chast" style="width: 89px;">
		      	<option value="">标准级别</option>
				<c:forEach items="${sessionScope.stdTypes }" var="sType">
					<option value="${sType.enumId }" <c:if test="${sType.enumId eq sc.orderType }">selected="selected"</c:if>>${sType.description }</option>
				</c:forEach>
	      </select>
	<div class="search-bt-left" onclick="search();"></div>
</div>
</html>