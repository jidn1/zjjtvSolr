<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ec/style.css" type="text/css"></link>
<style type="text/css">
.slider_left {
    border: 1px solid #ddd;
    border-radius: 5px;
    float: left;
    overflow: hidden;
    width: 88%;
    margin-left:15px;
}
.red-a {
    color: red;
    font: bold 25px "宋体";
}


.z_menu_nav .li01 a {
    background: rgba(0, 0, 0, 0) url(${pageContext.request.contextPath}/images/ec/zicon01.png) no-repeat scroll left center;
    display: block;
    line-height: 35px;
    padding-left: 17px;
}
.z_menu_nav .li01 a:hover{
	background:url(${pageContext.request.contextPath}/images/ec/zicon02.png) no-repeat left center;
}
</style>
<script>
function nav_goto(targeturl){
	/* var url = targeturl;
	   if(targeturl!=null&&targeturl!=''){
             if(targeturl.length>150){
        	  url = url+"&loginUser="+'${session.loginUser.itCode}';     
             }   
        } */
	  // alert(targeturl);
	 // alert(url);//user!toUserManagement.do
		   //url="user!toUserManagement.do"
     parent.frames.content.location = "${pageContext.request.contextPath}/"+targeturl+"";
}
function changtag(obj) {
	$(".li01").attr("class", "li01");
	$("#" + obj).attr("class", "li01 checked");
}
</script>
	</head>
	<body>
		<!--左侧菜单加载容器-->
	<div class="index_box">
    <!-- slider left-->
    <div class="slider_left">	
    	<ul class="z_menu_nav">
       	    <li class="tops" style="border-top:none;">主菜单</li>
        	<li class="li01 checked" id="myHome" onclick="changtag('myHome')"><a href="#" onclick="nav_goto('page/myHome.do')">我的首页</a></li>
            <li class="li01 " id="myAppliances" onclick="changtag('myAppliances')"><a href="#" onclick="nav_goto('equip/myAppliances.do')">我的器具</a></li>
            <li class="li01 " id="myPlanList" onclick="changtag('myPlanList')"><a href="#" onclick="nav_goto('inspectionPlan/myPlanList.do')">我的计划</a></li>
            <li class="li01 " id="myOrderList" onclick="changtag('myOrderList')"><a href="#" onclick="nav_goto('commissionOrder/myOrderList.do')">我的订单</a></li>
            <li class="li01 " id="invoices" onclick="changtag('invoices')"><a href="#" onclick="">发票管理</a></li>
            <li class="tops" >设置</li>
            <li class="li01 " id="custom" onclick="changtag('custom')"><a href="#" onclick="nav_goto('user/toEditfield.do')">自定义器具字段</a></li>
            <li class="li01 " id="enumcustom" onclick="changtag('enumcustom')"><a href="#" onclick="nav_goto('user/customEnum.do')">自定义枚举值</a></li>
            <li class="li01 " id="MenberInfo" onclick="changtag('MenberInfo')"><a href="#" onclick="nav_goto('user/MenberInfo.do')">会员资料</a></li>
            <li class="li01 " id="updatePassword" onclick="changtag('updatePassword')"><a href="#" onclick="nav_goto('user/rolePermission.do')">角色权限</a></li>
            <li class="li01 " id="dataDictionary" onclick="changtag('dataDictionary')"><a href="#" onclick="nav_goto('user/selectdataDictionary.do')">数据字典</a></li>
            <li class="li01 " id="accountSetting" onclick="changtag('accountSetting')"><a href="#" onclick="nav_goto('user/selectLogo.do')">账号设置</a></li>
            <li class="li01 " id="userSetting" onclick="changtag('userSetting')"><a href="#" onclick="nav_goto('user/selectUserList.do')">用户设置</a></li>
            <li class="li01 " id="Operation" onclick="changtag('Operation')"><a href="#" onclick="">操作日志</a></li>
        </ul>
    </div>
    </div>
	</body>
</html>
