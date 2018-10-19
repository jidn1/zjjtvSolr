<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*,net.sf.json.JSONArray,java.text.SimpleDateFormat"
    pageEncoding="gb2312"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
   /*  FileMakerCtrl fmCtrl = new FileMakerCtrl(request);
	//设置服务器页面
	fmCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
	//设置保存页面
	String path = (String) request.getContextPath();
	String realPath = (String) request.getAttribute("realPath");
	String fileName = (String) request.getAttribute("fileName");
	fmCtrl.setSaveFilePage(request.getContextPath()+"/zxdPrint/saveToPdf.html?realPath="+realPath);
	
	WordDocument doc = new WordDocument();  
	  
	
	fmCtrl.setWriter(doc);
	//fmCtrl.setJsFunction_OnProgressComplete("OnProgressComplete()");
	fmCtrl.fillDocument(realPath, DocumentOpenType.Word);
	fmCtrl.setTagId("FileMakerCtrl1");//此行必需 */
	PageOfficeCtrl poCtrl=new PageOfficeCtrl(request);
	//设置服务器页面
	poCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
	poCtrl.setTitlebar(false); //隐藏标题栏
	poCtrl.setMenubar(false); //隐藏菜单栏
	poCtrl.setOfficeToolbars(false);//隐藏Office工具条
	//设置保存页面
	String path = (String) request.getContextPath();
	String realPath = (String) request.getAttribute("realPath");
	Integer id = (Integer) request.getAttribute("id");
	poCtrl.setSaveFilePage(request.getContextPath()+"/zxdPrint/saveToPdf.html?realPath="+realPath+"&id="+id);
	//添加自定义按钮
	poCtrl.addCustomToolButton("保存","Save",1);
	poCtrl.addCustomToolButton("另存为","showDialogSave",1);
	poCtrl.addCustomToolButton("打印","wordToPrint",6);
	poCtrl.addCustomToolButton("关闭","Close",15);
	WordDocument doc = new WordDocument();
	
	poCtrl.setWriter(doc);
	
	//打开Word文档
	poCtrl.webOpen(realPath,OpenModeType.docNormalEdit,"张佚名");
	poCtrl.setTagId("PageOfficeCtrl1");//此行必需
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>原始记录</title>
<script type="text/javascript" src="/images/jquery/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/images/common.js"></script>
<script type="text/javascript" src="/sysCommon/images/pageOffice/pageoffice.js"></script>
<script type="text/javascript">
    function Save() {
        document.getElementById("PageOfficeCtrl1").WebSave();
        if(confirm("操作成功!\n是否关闭当前窗口?")){
			window.close();
		}
    }
   function wordToPrint(){
	   document.getElementById("PageOfficeCtrl1").ShowDialog(4); 
	}
   function showDialogSave(){
	   document.getElementById("PageOfficeCtrl1").ShowDialog(3); 
   }  
   function Close(){
	   window.close();
   }
</script>
</head>
<body style="margin: 0px;padding: 0px;">
    <div style=" width:auto; height:700px;">
        <po:PageOfficeCtrl id="PageOfficeCtrl1">
        </po:PageOfficeCtrl>
    </div>
</body>
</html>