<%@page import="com.zhuozhengsoft.pageoffice.PDFCtrl"%>
<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*, com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="gb2312"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	// ����˵����������Home��End��PageUp��PageDown�������ƶ���ҳ�����ּ���+��-�����Ŵ���С�����ּ���/��*������תҳ�档

	PDFCtrl poCtrl1 = new PDFCtrl(request);//����PDFCtrl�ؼ�����
	//pdfCtrl.setServerPage("poserver.do"); 
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //���÷�����ҳ��
	/* poCtrl1.setTitlebar(false); //���ر�����
	poCtrl1.setMenubar(false); //���ز˵���
	poCtrl1.setTitlebar(false);//����Office������ */
	poCtrl1.setJsFunction_AfterDocumentOpened("AfterDocumentOpened()");
	poCtrl1.addCustomToolButton("����", "PrintFile()", 6);
	//poCtrl1.addCustomToolButton("����/��ʾ��ǩ", "SetBookmarks()", 0);
	poCtrl1.addCustomToolButton("-", "", 0);
	poCtrl1.addCustomToolButton("ʵ�ʴ�С", "SetPageReal()", 16);
	poCtrl1.addCustomToolButton("�ʺ�ҳ��", "SetPageFit()", 17);
	poCtrl1.addCustomToolButton("�ʺϿ��", "SetPageWidth()", 18);
	poCtrl1.addCustomToolButton("-", "", 0);
	poCtrl1.addCustomToolButton("��ҳ", "FirstPage()", 8);
	poCtrl1.addCustomToolButton("��һҳ", "PreviousPage()", 9);
	poCtrl1.addCustomToolButton("��һҳ", "NextPage()", 10);
	poCtrl1.addCustomToolButton("βҳ", "LastPage()", 11);
	poCtrl1.addCustomToolButton("-", "", 0);
	
	poCtrl1.addCustomToolButton("ȫ��", "SwitchFullScreen()", 4);
	//���ý�ֹ����
	poCtrl1.setAllowCopy(false);

	String realPath = (String) request.getAttribute("realPath");
	//String param = new String(filePath.getBytes("UTF-8"),"GBK");
	poCtrl1.webOpen(realPath);//���ļ�
	poCtrl1.setTagId("PDFCtrl1");//���б���
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>��PDF�ļ�</title>
		<!--**************   ׿�� PageOffice �ͻ��˴��뿪ʼ    ************************-->
		<script language="javascript" type="text/javascript">
	function PrintFile() {
		//alert(document.getElementById("PDFCtrl1").Caption);//��ʾ����
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
		<!--**************   ׿�� PageOffice �ͻ��˴������    ************************-->
	</head>
	<body>
		<div style="width: auto; height: 700px;">
			<po:PDFCtrl id="PDFCtrl1">
			</po:PDFCtrl>
		</div>
	</body>
</html>

