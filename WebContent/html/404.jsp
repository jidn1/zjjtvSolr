<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>哎呀…您访问的页面不存在</title>
	<!-- 404样式 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/util/404.css'/>" />
</head>
<body>
<div class="bg">
	<div class="cont">
		<div class="c1"><img src="<c:url value='/images/404/01.png'/>" class="img1" /></div>
		<h2>哎呀…您访问的页面不存在</h2>
		<div class="c2"><a href="<c:url value='/index.html'/>" class="home">网站首页</a></div>
		<div class="c3">提醒您 - 您可能输入了错误的网址，或者该网页已删除或移动</div>
	</div>
</div>
</body>
</html>