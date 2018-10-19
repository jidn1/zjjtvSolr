<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国航天八院标准化网络工作平台</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style1.css" type="text/css"></link>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/login.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.9.1.min.js"></script>
</head>
<style type="text/css">
	.foot .copy{ text-align: center;position: relative; width: 450px;margin: 0 auto;height: 50px;}
	.foot .copy img{ vertical-align: middle;}
	.foot .copy a{display: inline-block; font:12px "microsoft yahei"; color: #333;border: 1px solid #ccc;padding: 2px 6px;}
	.foot .copy a:hover{ color: #f40;}
	.copy .foot-er{ border: none;position: absolute;top: -18px;left: 468px;}
</style>
<script type="text/javascript">
function subLogin(){
	 var username = $("#username").val();
     var password = $("#password").val();
     if('' == username || undefined == username || null == username){
         $("#err").html("用户名不能为空");
         return false;
     }
     if('' == password || undefined == password || null == password){
     	 $("#err").html("用户密码不能为空");
         return false;
     }
     $('#loginForm').attr('action',$('#path').val()+"/page/login.html").submit();
}
</script>
<body>
<div class="contain">
    <div class="myhead">
        <h1>
            <a href="#">
                <img src="${pageContext.request.contextPath}/images/ec/logo1.png"  alt=""/>
             </a>
        </h1>
        <div class="head-left">
           计量器具在线
        </div>
        <ul class="head-right">
            <li><a href="helpcenter">帮助中心</a></li>
            <li>|</li>
            <li><a href="contractCustomer" >联系客服</a></li>
            <li>|</li>
            <li><a href="login">请登录&nbsp;</a></li>
            <li>|</li>
            <li><a href="memberRegister" class="red-a">免费注册</a></li>
            <li><a href="main">Hi,欢迎来中检！&nbsp;</a></li>
        </ul>
    </div>
    <div class="mybanner">
        <img src="${pageContext.request.contextPath}/images/ec/banner1.jpg">
    	<div class="point">
        	<div class="addtel">
            <span>
            中国检验认证集团黑龙江有限公司
            </span>
            <p>电话：0451-87015257</p>
			</div>
        </div>
        <div class="point bjpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团北京有限公司
            </span>
                <p>电话：010-58619588</p>
            </div>
        </div>
        <div class="point tjpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团天津有限公司
            </span>
                <p>电话：022-65661393</p>
            </div>
        </div>
        <div class="point hbpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团河北有限公司
            </span>
                <p>电话：0311-85980925</p>
            </div>
        </div>
        <div class="point qhdpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团秦皇岛有限公司
            </span>
                <!--<p>电话：0451-87015257</p>-->
            </div>
        </div>
        <div class="point sxpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团山西有限公司
            </span>
                <p>电话：0351-6168655（检验鉴定部）</p>
                <p>0351-6162689（认证部）</p>
                <p>0351-6165350（报检校准部）</p>
            </div>
        </div>
        <div class="point qhdpoint nmpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团内蒙古有限公司
            </span>
                <!--<p>电话：0451-87015257</p>-->
            </div>
        </div>
        <div class="point qhdpoint mzpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团满洲里有限公司
            </span>
                <!--<p>电话：0451-87015257</p>-->
            </div>
        </div>
        <div class="point lnpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团辽宁有限公司
            </span>
                <p>电话：0411-82808037</p>
            </div>
        </div>
        <div class="point jlpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团吉林有限公司
            </span>
               <p>电话：0431-7607277</p>
            </div>
        </div>
        <div class="point sdpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团山东有限公司
            </span>
                <p> 电话：0532-80887958</p>
            </div>
        </div>
        <div class="point qhdpoint hnpoint">
            <div class="addtel">
            <span>
            	<!--<img src="img/logo.png" width="30" height="30" />-->
            中国检验认证集团河南有限公司
            </span>
                <!--<p>电话：0451-87015257</p>-->
            </div>
        </div>
        <div class="login">
          	<h2>会员登录</h2>
            <form id="loginForm" method="post"   >
            	<input type="hidden" id="path" value="${pageContext.request.contextPath }">
                 <div class="login1">用户名/手机号&nbsp;<input id="username" name="username" type="text"/></div>
                 <div class="login2">密码<input id="password" type="password" name="password"/></div>
                 <div class="login3"><span><input type="checkbox" />记住密码</span><a href="FindPassword">忘记密码？</a></div>
                 <div class="login4"><input id="sublogin" type="image" src="${pageContext.request.contextPath}/images/ec/login.gif" onclick="subLogin()"/></div>
                 <div class="login5">
                     <a href="###">还没有账号？</a>
                     <a href="memberRegister">立即注册</a>
                  </div>
                  	<div class="hidden">您的用户名或密码错误</div>
            </form>
        </div>
    </div>
     <div style="background-color: #f5f5f5;">
        <p style="width: 80%;margin: 0 auto;font-size: 12px;text-align: center;"> <span style="color: red;"> 注意事项：</span>为了保证页面效果，请使用IE8及以上版本的浏览器，推荐使用最新版本的IE或者FIREFOX，其它的浏览器可能不能正常使用本系统。</p>
    </div>
    <div class="foot">
    <ul class="clearfix">
        <li><a href="aboutus">关于我们</a></li>
        <li>丨</li>
        <li><a href="Contactus">联系我们</a></li>
        <li>丨</li>
        <li><a href="helpcenter">帮助中心</a></li>
    </ul>
    <p class="f12">开发运营：北京远航科峰软件技术有限公司 <span style="padding-left: 20px;">联系电话： 400-665-9978</span></p>
    <div class="copy">
         <a href="http://www.beian.gov.cn/portal/recordQuery">
             <img src="${pageContext.request.contextPath}/images/ec/gongan.png" alt="" width="30"/>京公安备号11010802020312号</a>
         <a href="">
             <img src="${pageContext.request.contextPath}/images/ec/u87.jpg" alt="" width="30"/>京ICP备13007911号-3</a>
	     <span class="foot-er">
	     	 <img src="${pageContext.request.contextPath}/images/ec/small-er.jpg" width="60" alt=""/>
	     </span>
     </div>
</div>
</div>
</body>
</html>