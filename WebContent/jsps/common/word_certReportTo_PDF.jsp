<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*,net.sf.json.JSONArray,java.text.SimpleDateFormat"
    pageEncoding="gb2312"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
   /*  FileMakerCtrl fmCtrl = new FileMakerCtrl(request);
	//���÷�����ҳ��
	fmCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
	//���ñ���ҳ��
	String path = (String) request.getContextPath();
	String realPath = (String) request.getAttribute("realPath");
	String fileName = (String) request.getAttribute("fileName");
	fmCtrl.setSaveFilePage(request.getContextPath()+"/zxdPrint/saveToPdf.html?realPath="+realPath);
	
	WordDocument doc = new WordDocument();  
	  
	
	fmCtrl.setWriter(doc);
	//fmCtrl.setJsFunction_OnProgressComplete("OnProgressComplete()");
	fmCtrl.fillDocument(realPath, DocumentOpenType.Word);
	fmCtrl.setTagId("FileMakerCtrl1");//���б��� */
	PageOfficeCtrl poCtrl=new PageOfficeCtrl(request);
	//���÷�����ҳ��
	poCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
	poCtrl.setTitlebar(false); //���ر�����
	poCtrl.setMenubar(false); //���ز˵���
	poCtrl.setOfficeToolbars(false);//����Office������
	//���ñ���ҳ��
	String path = (String) request.getContextPath();
	String realPath = (String) request.getAttribute("realPath");
	Integer id = (Integer) request.getAttribute("id");
	poCtrl.setSaveFilePage(request.getContextPath()+"/zxdPrint/saveToPdf.html?realPath="+realPath+"&id="+id);
	//����Զ��尴ť
	poCtrl.addCustomToolButton("����","Save",1);
	poCtrl.addCustomToolButton("���Ϊ","showDialogSave",1);
	poCtrl.addCustomToolButton("��ӡ","wordToPrint",6);
	poCtrl.addCustomToolButton("�ر�","Close",15);
	WordDocument doc = new WordDocument();
	
	poCtrl.setWriter(doc);
	
	//��Word�ĵ�
	poCtrl.webOpen(realPath,OpenModeType.docNormalEdit,"������");
	poCtrl.setTagId("PageOfficeCtrl1");//���б���
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ԭʼ��¼</title>
<script type="text/javascript" src="/images/jquery/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/images/common.js"></script>
<script type="text/javascript" src="/sysCommon/images/pageOffice/pageoffice.js"></script>
<script type="text/javascript">
    function Save() {
        document.getElementById("PageOfficeCtrl1").WebSave();
        if(confirm("�����ɹ�!\n�Ƿ�رյ�ǰ����?")){
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