package com.htstd.util;

import java.io.IOException;
import java.io.OutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * 
 * @描述 Excel 工具类
 * @author 吉德宁
 * @日期 2017年6月20日
 *
 */
public class ExcelUtil {

	public static HSSFWorkbook  createTemplate(OutputStream output) throws IOException {
		
		HSSFWorkbook wb = new HSSFWorkbook();// 声明一个工作表
		HSSFSheet sheet = wb.createSheet("器具表");// 声明一个文件中的子表
		sheet.setDefaultColumnWidth((short) 15);// 给单子表指定一个长度
		HSSFCellStyle style = wb.createCellStyle();// 生成一个样式
		style.setAlignment(HSSFCellStyle.VERTICAL_CENTER);//设置上下居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//左右居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 设置字体
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("	档案号  ");
		cell.setCellStyle(style);
		cell = row.createCell(1);
		cell.setCellValue("	 器具名称 ");
		cell.setCellStyle(style);
		cell = row.createCell(2);
		cell.setCellValue("	型号 ");
		cell.setCellStyle(style);
		cell = row.createCell(3);
		cell.setCellValue("	出厂编号  ");
		cell.setCellStyle(style);
		cell = row.createCell(4);
		cell.setCellValue("	生产厂家  ");
		cell.setCellStyle(style);
		cell = row.createCell(5);
		cell.setCellValue("	器具状态  ");
		cell.setCellStyle(style);
		cell = row.createCell(6);
		cell.setCellValue("	使用部门  ");
		cell.setCellStyle(style);
		cell = row.createCell(7);
		cell.setCellValue("	使用人 ");
		cell.setCellStyle(style);
		cell = row.createCell(8);
		cell.setCellValue("	分类 ");
		cell.setCellStyle(style);
		cell = row.createCell(9);
		cell.setCellValue("	准确度等级 ");
		cell.setCellStyle(style);
		cell = row.createCell(10);
		cell.setCellValue("	测量范围 ");
		cell.setCellStyle(style);
		cell = row.createCell(11);
		cell.setCellValue("	不确定度 ");
		cell.setCellStyle(style);
		cell = row.createCell(12);
		cell.setCellValue("	证书编号 ");
		cell.setCellStyle(style);
		cell = row.createCell(13);
		cell.setCellValue("	送检单位 ");
		cell.setCellStyle(style);
		cell = row.createCell(14);
		cell.setCellValue("	检定机构");
		cell.setCellStyle(style);
		cell = row.createCell(15);
		cell.setCellValue("	检测日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(16);
		cell.setCellValue("	检测周期 ");
		cell.setCellStyle(style);
		cell = row.createCell(17);
		cell.setCellValue("	有效日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(18);
		cell.setCellValue("	检测类型");
		cell.setCellStyle(style);
		cell = row.createCell(19);
		cell.setCellValue("	校准费");
		cell.setCellStyle(style);
		cell = row.createCell(20);
		cell.setCellValue("	预算费用");
		cell.setCellStyle(style);
		cell = row.createCell(21);
		cell.setCellValue("	检定员");
		cell.setCellStyle(style);
		
		return wb;
		
	}
}
