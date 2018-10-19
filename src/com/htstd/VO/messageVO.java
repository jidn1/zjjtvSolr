package com.htstd.VO;
/**
 * 
 * @描述 提示信息类
 * @author 吉德宁
 * @日期 2017年7月15日
 *
 */
public class messageVO {

	private int sheetLastRowNumber;//总行数
	private int excelRepeatCount;//重复条数
	private int repeatCount;
	
	
	public int getSheetLastRowNumber() {
		return sheetLastRowNumber;
	}
	public void setSheetLastRowNumber(int sheetLastRowNumber) {
		this.sheetLastRowNumber = sheetLastRowNumber;
	}
	public int getExcelRepeatCount() {
		return excelRepeatCount;
	}
	public void setExcelRepeatCount(int excelRepeatCount) {
		this.excelRepeatCount = excelRepeatCount;
	}
	public int getRepeatCount() {
		return repeatCount;
	}
	public void setRepeatCount(int repeatCount) {
		this.repeatCount = repeatCount;
	}
	
	
	
}
