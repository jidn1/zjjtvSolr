<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中检远航计量器具在线</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
</head>
<frameset rows="110,*,33" border="0" id="allFrame" >
		<frame name="top" id="top" src="${pageContext.request.contextPath}/user/top.do" scrolling="auto" frameborder="0"
			noresize framespacing="0" />
		<frameset cols="210,*" border="0" id="frameset_body">
			<frame id="left" name="left" src="${pageContext.request.contextPath}/jsps/menu.jsp" scrolling="auto" frameborder="0"
				noresize framespacing="0" />
			<frame id="content" name="content" src="${pageContext.request.contextPath}/page/myHome.do" scrolling="auto"
				frameborder="0" noresize framespacing="0" />
		</frameset>
		<frame id="bottom" name="bottom" scrolling="auto" src="${pageContext.request.contextPath}/jsps/bottom.jsp" noresize
			framespacing="0" frameborder="0" />
		<noframes>
			<body>
				<p>
	
				</p>
			</body>
		</noframes>
</frameset>
</html>