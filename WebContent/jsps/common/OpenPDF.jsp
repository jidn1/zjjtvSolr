<%@page import="com.zhuozhengsoft.pageoffice.PDFCtrl"%>
<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*, com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="gb2312"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	// 按键说明：光标键、Home、End、PageUp、PageDown可用来移动或翻页；数字键盘+、-用来放大缩小；数字键盘/、*用来旋转页面。

	PDFCtrl poCtrl1 = new PDFCtrl(request);//定义PDFCtrl控件对象
	//pdfCtrl.setServerPage("poserver.do"); 
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //设置服务器页面
	/* poCtrl1.setTitlebar(false); //隐藏标题栏
	poCtrl1.setMenubar(false); //隐藏菜单栏
	poCtrl1.setTitlebar(false);//隐藏Office工具条 */
	poCtrl1.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
	poCtrl1.addCustomToolButton("下载", "PrintFile()", 6);
	//poCtrl1.addCustomToolButton("隐藏/显示书签", "SetBookmarks()", 0);
	poCtrl1.addCustomToolButton("-", "", 0);
	poCtrl1.addCustomToolButton("实际大小", "SetPageReal()", 16);
	poCtrl1.addCustomToolButton("适合页面", "SetPageFit()", 17);
	poCtrl1.addCustomToolButton("适合宽度", "SetPageWidth()", 18);
	poCtrl1.addCustomToolButton("-", "", 0);
	poCtrl1.addCustomToolButton("首页", "FirstPage()", 8);
	poCtrl1.addCustomToolButton("上一页", "PreviousPage()", 9);
	poCtrl1.addCustomToolButton("下一页", "NextPage()", 10);
	poCtrl1.addCustomToolButton("尾页", "LastPage()", 11);
	poCtrl1.addCustomToolButton("-", "", 0);
	
	poCtrl1.addCustomToolButton("全屏", "SwitchFullScreen()", 4);
	//设置禁止拷贝
	poCtrl1.setAllowCopy(false);

	String realPath = (String) request.getAttribute("realPath");
	//String param = new String(filePath.getBytes("UTF-8"),"GBK");
	poCtrl1.webOpen(realPath);//打开文件
	poCtrl1.setTagId("PDFCtrl1");//此行必须
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>打开PDF文件</title>
		<!--**************   卓正 PageOffice 客户端代码开始    ************************-->
		<script language="javascript" type="text/javascript">
	function PrintFile() {
		//alert(document.getElementById("PDFCtrl1").Caption);//显示标题
		document.getElementById("PDFCtrl1").ShowDialog(4);
	}
    function AfterDocumentOpened() {
		document.getElementById("PDFCtrl1").BookmarksVisible = false;
        //alert(document.getElementById("PDFCtrl1").Caption);
    }
   /*  function SetBookmarks() {
        //document.getElementById("PDFCtrl1").BookmarksVisible = !document.getElementById("PDFCtrl1").BookmarksVisible;
    	document.getElementById("PDFCtrl1").BookmarksVisible = false;
    } */
    
    function SwitchFullScreen() {
        document.getElementById("PDFCtrl1").FullScreen = !document.getElementById("PDFCtrl1").FullScreen;
    }
    function SetPageReal() {
        document.getElementById("PDFCtrl1").SetPageFit(1);
    }
    function SetPageFit() {
        document.getElementById("PDFCtrl1").SetPageFit(2);
    }
    function SetPageWidth() {
        document.getElementById("PDFCtrl1").SetPageFit(3);
    }
    function ZoomIn() {
        document.getElementById("PDFCtrl1").ZoomIn();
    }
    function ZoomOut() {
        document.getElementById("PDFCtrl1").ZoomOut();
    }
    function FirstPage() {
        document.getElementById("PDFCtrl1").GoToFirstPage();
    }
    function PreviousPage() {
        document.getElementById("PDFCtrl1").GoToPreviousPage();
    }
    function NextPage() {
        document.getElementById("PDFCtrl1").GoToNextPage();
    }
    function LastPage() {
        document.getElementById("PDFCtrl1").GoToLastPage();
    }
    function RotateRight() {
        document.getElementById("PDFCtrl1").RotateRight();
    }
    function RotateLeft() {
        document.getElementById("PDFCtrl1").RotateLeft();
    }
</script>
		<!--**************   卓正 PageOffice 客户端代码结束    ************************-->
	</head>
	<body>
		<div style="width: auto; height: 700px;">
			<po:PDFCtrl id="PDFCtrl1">
			</po:PDFCtrl>
		</div>
	</body>
</html>

