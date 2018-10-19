<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国航天八院标准化网络工作平台</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/register.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/register.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.9.1.min.js"></script>
</head>
<style type="text/css">
	*html{
		background-image:url(about:blank);
		background-attachment:fixed;
	}
</style>
<script type="text/javascript">
function subregister(){
     $('#registerForm').attr('action',$('#path').val()+"/user/register.do").submit();
}
</script>
<body>
<div class="myhead">
			<h1>
				<a href="#"><img src="${pageContext.request.contextPath}/images/ec/z_logo.png" /></a>
			</h1>
		    <div class="head-left">
		        计量器具在线管理系统
		    </div>
		    <ul class="head-right">
		        <li><a href="#" >帮助中心</a></li>
		        <li>|</li>
		        <li><a href="#">联系客服</a></li>
			    	<li>|</li>
	                <li><a class="login" id="" href="<c:url value='/index.html'/>" style="">请登录</a></li>
	                <li>|</li>
	                <li><a href="#" id="headerShowRegisterWindow" style="" class="red-a">免费注册</a></li>
			    	<li><a class="login" href="#" style="">Hi , 欢迎来中检！</a></li>
		    </ul>
		</div>
<div class="container1">
    <div class="container1-inner">
        <h3>用户注册</h3>
        <form class="registerForm" id="registerForm" method="post">
        <input type="hidden" id="path" value="${pageContext.request.contextPath }">
            <fieldset>
                <p class="legend"><em><span></span>邮箱注册</em></p>
                <ul>
                    <li>
                        <label for="">邮箱账号</label>
                        <div>
                            <input type="text" id="userPhoneInp" name="email" placeholder="请输入邮箱账号" onblur="checkUserPhone();"/>
                            <span class="info">手机通过验证后也可登录，帮助密码找回</span>
							<i></i>
                        </div>
                    </li>
                    <li>
                        <label for="">动态码</label>
                        <div>
                            <input type="text" id="phoneCheckCodeInp" style="width:60%" name="phoneCheckCode" placeholder="请输入动态码"/>
							<button type="button" class="phoneCheckBtn" id="phoneCheckCodeBtn" onclick="sendRegisterInfoSms('person');">发送动态码</button>
                            <span class="info">请输入系统发给您手机短信的动态码</span>
							<i></i>
                        </div>
                    </li>
                    <li>
                        <label for="">设置密码</label>
                        <div>
                            <input type="password" name="userPassword"  id="userpassword" onblur="checkPassword();"/>
                            <span class="info">6-20位字母、数字组成</span>
							<i></i>
                        </div>
                    </li>
                    <li>
                        <label for="">确认密码</label>
                        <div>
                            <input type="password" name="CONFIRM_PASSWORD" id="rePassword" onblur="checkRePassword();"/>
                            <span class="info">再次输入您设置的密码</span>
							<i></i>
                        </div>
                    </li>
                    <li class="no-label">
                        <input name="isAgreeAgreement" type="checkbox" onclick="checkAgreement();" checked="checked"/>我已阅读并同意
						<a href="RegisterAgreement" target="_blank">《中检网用户注册协议》</a>
						<em class="btn_error" id="isAgreeAgreementTip"></em>
					</li>
                    <li class="no-label">
                        <button type="button" class="submitBtn" id="submitBtn" onclick="subregister();">注册并登陆</button>
                    </li>
                </ul>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>