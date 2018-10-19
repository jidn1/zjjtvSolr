package com.htstd.util;

import java.io.File;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;

public class PdfUtil {
	static final int wdDoNotSaveChanges = 0;// 不保存待定的更改。
	static final int wdFormatPDF = 17;// PDF 格式

	/**
	 * 将word文件转换成pdf文件
	 * @param filename
	 * @throws Exception
	 */
	public static String wordToPdf(String filename,String orderFile) throws Exception {
//		String filename = "D:\\word2pdf.doc";
		String toFilename = orderFile + ".pdf";
		//System.out.println("启动Word");
		//long start = System.currentTimeMillis();
		ActiveXComponent app = null;
		try {
			app = new ActiveXComponent("Word.Application");
			app.setProperty("Visible", false);
			Dispatch docs = app.getProperty("Documents").toDispatch();
			//System.out.println("打开文档" + filename);
			Dispatch doc = Dispatch.call(docs,"Open",filename,false,true).toDispatch();
			//System.out.println("转换文档到PDF" + toFilename);
			File tofile = new File(toFilename);
			if (tofile.exists()) {
				tofile.delete();
			}
			Dispatch.call(doc,"SaveAs",toFilename,wdFormatPDF);
			Dispatch.call(doc, "Close", false);
			//long end = System.currentTimeMillis();
			//System.out.println("word转换pdf用时：" + (end - start) + "ms.");
		} catch (Exception e) {
			System.out.println("========Error:文档转换失败：" + e.getMessage());
			return "false";
		} finally {
			if (app != null)
				app.invoke("Quit", wdDoNotSaveChanges);
		}
		return "true";
	}
}
