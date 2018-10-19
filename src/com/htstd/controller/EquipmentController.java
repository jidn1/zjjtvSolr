package com.htstd.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.htstd.VO.equipmentVO;
import com.htstd.VO.messageVO;
import com.htstd.domain.dataDictionaryPojo;
import com.htstd.domain.enumCustomPojo;
import com.htstd.domain.equipmentPojo;
import com.htstd.domain.FieldCustomPojo;
import com.htstd.domain.logoPojo;
import com.htstd.domain.userLoginPojo;
import com.htstd.service.EquipmentService;
import com.htstd.service.FieldEnumService;
import com.htstd.service.PersonService;
import com.htstd.util.Constant;
import com.htstd.util.ExcelUtil;
import com.htstd.util.PageUtil;
import com.htstd.util.SolrUtil;

/**
 * @描述 器具操作Controller
 * @author 吉德宁
 * @日期 2017年7月3日
 *
 */
@Controller
@RequestMapping("equip")
public class EquipmentController {
	private static final Logger logger = Logger.getLogger(EquipmentController.class);
	private SolrUtil solr = new SolrUtil();

	@Autowired
	private PersonService personService;// 用户service
	@Autowired
	private EquipmentService equipmentService;// 器具Service
	@Autowired
	private FieldEnumService fieldEnumService;// 自定义字段Service

	// 我的器具列表
	@SuppressWarnings("unchecked")
	@RequestMapping("myAppliances.do")
	public String myAppliances(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> maps = new HashMap<String, Object>();
		List<equipmentPojo> equipmentList = new ArrayList<equipmentPojo>();
		PageUtil page = null;
		String pageNow = request.getParameter("pageNow");
		String pageSize = request.getParameter("pageSize");
		String filed = request.getParameter("filed");
		String starTime = request.getParameter("starTime");
		String endTime = request.getParameter("endTime");
		if (pageSize == null || "".equals(pageSize)) {
			pageSize = "5";
		}

		if (filed != null && !"".equals(filed) || starTime != null && !"".equals(starTime)) {// 判断是否是全文搜索
			page = new PageUtil(0, Integer.parseInt(pageNow), Integer.parseInt(pageSize));// 给solr设置分页
			Map<String, Object> solrmap = solr.querySolrByKeyWord(filed, page.getStartPos(), page.getPageSize(),starTime,endTime);
			List<equipmentVO> result = (List<equipmentVO>) solrmap.get("result");
			page = new PageUtil(Integer.parseInt(solrmap.get("num").toString()), Integer.parseInt(pageNow),
					Integer.parseInt(pageSize));// 获取到solr插叙你的总行数 进行分页计算
			model.addAttribute("equipmentList", result);
			model.addAttribute("filed", filed);
			model.addAttribute("starTime", starTime);
			model.addAttribute("endTime", endTime);
		} else {// 不是全文搜索 只能是点击下/上一页
			int totalCount = (int) equipmentService.selectEquipmentListTotal();
			if (pageNow != null) {
				page = new PageUtil(totalCount, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
			} else {
				page = new PageUtil(totalCount, 1, Integer.parseInt(pageSize));
			}
			maps.put("pageSize", page.getPageSize());
			maps.put("startPos", page.getStartPos());
			equipmentList = this.equipmentService.selectEquipmentList(maps);

			model.addAttribute("equipmentList", equipmentList);
		}

		model.addAttribute("page", page);
		return "EC/My_appliances_list";
	}

	// 跳转添加器具页面
	@RequestMapping("toEquip.do")
	public String toEquip(HttpServletRequest request, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		Map<String, List<enumCustomPojo>> manyenumList = new HashMap<String, List<enumCustomPojo>>();
		Map<String, Object> maps = new HashMap<String, Object>();
		equipmentPojo equipment = new equipmentPojo();
		String equipmentUUID = request.getParameter("id");
		
		List<dataDictionaryPojo> dataList = personService.selectdataDictionaryList();// 查询用户的设置列表
		String ifMerge = null;
		for (dataDictionaryPojo data : dataList) {
			if ("器具型号/规格字段合并".equals(data.getDictionaryName())) {// 判断 型号
																	// 规格字段是否开启
				ifMerge = data.getDictionaryStatus();
			}
		}
		List<FieldCustomPojo> fieldInfoList = fieldEnumService.selectfield(String.valueOf(userLogin.getUserUUID()));// 查询用户自定义字段
		for (FieldCustomPojo f : fieldInfoList) {
			if ("enum".equals(f.getFieldType())) {// 判断是否有枚举字段
				maps.put("userid", String.valueOf(userLogin.getUserUUID()));
				maps.put("fieldid", f.getId());
				List<enumCustomPojo> enumList = fieldEnumService.selectEnum(maps);// 获取到枚举值
				manyenumList.put(f.getFieldDescrib(), enumList);
			}
		}
		
		if(equipmentUUID!=null){//查看器具信息
			equipment = equipmentService.selectEquipmentByUUID(equipmentUUID);
			model.addAttribute("equipment",equipment);
		}
		model.addAttribute("manyenumList", manyenumList);
		model.addAttribute("fieldInfoList", fieldInfoList);
		model.addAttribute("ifMerge", ifMerge);
		return "EC/edit_appliances_info";
	}

	// 添加器具
	@RequestMapping("insertEquipment.do")
	public String insertEquipment(HttpServletRequest request, Model model, equipmentPojo equipment,@RequestParam(value = "file", required = false) MultipartFile file) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		String equipmentUUID = UUID.randomUUID().toString();
		equipment.setColorAppendix(uploadColor(file));
		equipment.setEquipmentUUID(equipmentUUID);
		int c = equipmentService.insertEquipment(equipment);//保存器具
		if(c>0){//如果数据库保存成功，则同步solr数据
			List<equipmentVO> equipmentList = new ArrayList<equipmentVO>();
			equipmentVO equipmentvo = PojoToVO(equipment);
			equipmentList.add(equipmentvo);
			solr.addSolrDocument(equipmentList);//同步solr
		}
		
		return "redirect:/equip/myAppliances.do";
	}

	// 单个修改器具
	@RequestMapping("updateEquipment.do")
	public String updateEquipment(HttpServletRequest request, Model model, equipmentPojo equipment,String updateType) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		List<equipmentVO> items = new ArrayList<equipmentVO>();
		String equipmentUUID = request.getParameter("id");
		equipmentPojo equipmentp = equipmentService.selectEquipmentByUUID(equipmentUUID);
		equipment.setEquipmentUUID(equipmentUUID);
		int c = equipmentService.updateEquipmentByUUID(equipment);
		if(c>0){
			if(Constant.PART.equals(updateType)){//判断器具修改方式 列表部分修改
				if (equipment.getEquipmentName() != null && !"".equals(equipment.getEquipmentName())) {
					equipmentp.setEquipmentName(equipment.getEquipmentName());
				}
				if (equipment.getManufacturer() != null && !"".equals(equipment.getManufacturer())) {
					equipmentp.setManufacturer(equipment.getManufacturer());
				}
				if (equipment.getSerialNumber() != null && !"".equals(equipment.getSerialNumber())) {
					equipmentp.setSerialNumber(equipment.getSerialNumber());
				}
				if (equipment.getEquipmentModel() != null && !"".equals(equipment.getEquipmentModel())) {
					equipmentp.setEquipmentModel(equipment.getEquipmentModel());
				}
				if (equipment.getValidDate() != null && !"".equals(equipment.getValidDate())) {
					equipmentp.setValidDate(equipment.getValidDate());
				}
				if (equipment.getVerificationInstitution() != null && !"".equals(equipment.getVerificationInstitution())) {
					equipmentp.setVerificationInstitution(equipment.getVerificationInstitution());
				}
				if (equipment.getSubordinateSector() != null && !"".equals(equipment.getSubordinateSector())) {
					equipmentp.setSubordinateSector(equipment.getSubordinateSector());
				}
				
				equipmentVO equipmentvo = this.PojoToVO(equipmentp);
				items.add(equipmentvo);
			}else if(Constant.ALL.equals(updateType)){//器具全部修改信息
				equipmentVO equipmentvo = this.PojoToVO(equipment);
				items.add(equipmentvo);
			}
			
			solr.addSolrDocument(items);//同步solr
		}
		
		return "redirect:/equip/myAppliances.do";
	}

	// 批量修改器具
	@RequestMapping("batchUpdateEquipment.do")
	public String batchUpdateEquipment(HttpServletRequest request, Model model, equipmentPojo equipment) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		Map<String, Object> maps = new HashMap<String, Object>();
		List<equipmentPojo> equipmentsolr = new ArrayList<equipmentPojo>();
		List<equipmentVO> items = new ArrayList<equipmentVO>();
		String[] ids = request.getParameter("equipmentId").split(",");
		maps.put("equipmentUUID", ids);
		List<equipmentPojo> equipmentList = equipmentService.selectEquipmentByUUIDs(maps);//获取要修改的器具信息

		for (equipmentPojo equipmentp : equipmentList) {//把要修改的的值赋值给器具
			if (equipment.getEquipmentName() != null && !"".equals(equipment.getEquipmentName())) {
				equipmentp.setEquipmentName(equipment.getEquipmentName());
			}
			if (equipment.getManufacturer() != null && !"".equals(equipment.getManufacturer())) {
				equipmentp.setManufacturer(equipment.getManufacturer());
			}
			if (equipment.getSerialNumber() != null && !"".equals(equipment.getSerialNumber())) {
				equipmentp.setSerialNumber(equipment.getSerialNumber());
			}
			if (equipment.getInspectionType() != null && !"".equals(equipment.getInspectionType())) {
				equipmentp.setInspectionType(equipment.getInspectionType());
			}
			if (equipment.getValidDate() != null && !"".equals(equipment.getValidDate())) {
				equipmentp.setValidDate(equipment.getValidDate());
			}
			if (equipment.getVerificationDate() != null && !"".equals(equipment.getVerificationDate())) {
				equipmentp.setVerificationDate(equipment.getVerificationDate());
			}
			if (equipment.getSubordinateSector() != null && !"".equals(equipment.getSubordinateSector())) {
				equipmentp.setSubordinateSector(equipment.getSubordinateSector());
			}
			int c = equipmentService.updateEquipmentByUUID(equipmentp);
			if (c > 0) {//判断数据库是否批量修改成功
				equipmentsolr.add(equipmentp);
			}
		}

		if (equipmentsolr.size() > 0) {//同步solr
			for (equipmentPojo equip : equipmentList) {
				equipmentVO equipmentvo = PojoToVO(equip);
				items.add(equipmentvo);
			}
			solr.addSolrDocument(items);// 更新solr数据
		}

		return "redirect:/equip/myAppliances.do";
	}

	// 删除器具
	@RequestMapping("deleteEquipment.do")
	public String deleteEquipment(HttpServletRequest request, Model model) throws Exception {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		Map<String, Object> maps = new HashMap<String, Object>();
		String[] ids = request.getParameter("id").split(",");
		maps.put("equipmentUUID", ids);
		equipmentService.deleteEquipment(maps);// 执行删除操作
		 solr.deleteSolrDocument(ids);//更新solr数据
		return "redirect:/equip/myAppliances.do";
	}

	// 导出器具Excel
	@RequestMapping("exportEquipAccountByExcel.do")
	public @ResponseBody Object exportEquipAccountByExcel(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Map<String, Object> map = new HashMap<String, Object>();
		String[] ids = request.getParameter("id").split(",");
		map.put("equipmentUUID", ids);
		List<FieldCustomPojo> fieldInfoList = fieldEnumService.selectfield(String.valueOf(userLogin.getUserUUID()));// 查询用户自定义字段
		List<equipmentPojo> bmwe = equipmentService.selectEquipmentByUUIDs(map);// 查询出导出的数据
		String exportFileName = sdf.format(new Date()) + "器具列表.xls";// 导出文件名
		HSSFWorkbook wb = new HSSFWorkbook();// 声明一个工作表
		HSSFSheet sheet = wb.createSheet("器具表");// 声明一个文件中的子表
		sheet.setDefaultColumnWidth((short) 15);// 给单子表指定一个长度
		HSSFCellStyle style = wb.createCellStyle();// 生成一个样式
		style.setAlignment(HSSFCellStyle.VERTICAL_CENTER);// 设置上下居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 设置字体
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("	档案号  ");
		cell.setCellStyle(style);
		cell = row.createCell(1);
		cell.setCellValue("	器具状态  ");
		cell.setCellStyle(style);
		cell = row.createCell(2);
		cell.setCellValue("	计量类别 ");
		cell.setCellStyle(style);
		cell = row.createCell(3);
		cell.setCellValue("	器具名称  ");
		cell.setCellStyle(style);
		cell = row.createCell(4);
		cell.setCellValue("	客户编号  ");
		cell.setCellStyle(style);
		cell = row.createCell(5);
		cell.setCellValue("	器具数量  ");
		cell.setCellStyle(style);
		cell = row.createCell(6);
		cell.setCellValue("	出厂编号  ");
		cell.setCellStyle(style);
		cell = row.createCell(7);
		cell.setCellValue("	型号 ");
		cell.setCellStyle(style);
		cell = row.createCell(8);
		cell.setCellValue("	出厂日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(9);
		cell.setCellValue("	生产厂家 ");
		cell.setCellStyle(style);
		cell = row.createCell(10);
		cell.setCellValue("	ABC分类 ");
		cell.setCellStyle(style);
		cell = row.createCell(11);
		cell.setCellValue("	ABC编号 ");
		cell.setCellStyle(style);
		cell = row.createCell(12);
		cell.setCellValue("	准确度等级 ");
		cell.setCellStyle(style);
		cell = row.createCell(13);
		cell.setCellValue("	测量范围 ");
		cell.setCellStyle(style);
		cell = row.createCell(14);
		cell.setCellValue("	不确定度 ");
		cell.setCellStyle(style);
		cell = row.createCell(15);
		cell.setCellValue("	证书编号 ");
		cell.setCellStyle(style);
		cell = row.createCell(16);
		cell.setCellValue("	首次校检日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(17);
		cell.setCellValue("	检定单位 ");
		cell.setCellStyle(style);
		cell = row.createCell(18);
		cell.setCellValue("	完成日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(19);
		cell.setCellValue("	检定机构");
		cell.setCellStyle(style);
		cell = row.createCell(20);
		cell.setCellValue("	校检日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(21);
		cell.setCellValue("	检定周期 ");
		cell.setCellStyle(style);
		cell = row.createCell(22);
		cell.setCellValue("	有效日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(23);
		cell.setCellValue("	检定结果 ");
		cell.setCellStyle(style);
		cell = row.createCell(24);
		cell.setCellValue("	送检类型 ");
		cell.setCellStyle(style);
		cell = row.createCell(25 );
		cell.setCellValue("	校准费");
		cell.setCellStyle(style);
		cell = row.createCell(26);
		cell.setCellValue("	预算费用 ");
		cell.setCellStyle(style);
		cell = row.createCell(27);
		cell.setCellValue("	检定员 ");
		cell.setCellStyle(style);
		cell = row.createCell(28);
		cell.setCellValue("	接收状态 ");
		cell.setCellStyle(style);
		cell = row.createCell(29);
		cell.setCellValue("	接收日期 ");
		cell.setCellStyle(style);
		cell = row.createCell(30);
		cell.setCellValue("	负责人");
		cell.setCellStyle(style);
		cell = row.createCell(31);
		cell.setCellValue("	启用时间");
		cell.setCellStyle(style);
		cell = row.createCell(32);
		cell.setCellValue("	所属部门");
		cell.setCellStyle(style);
		cell = row.createCell(33);
		cell.setCellValue("	购置日期");
		cell.setCellStyle(style);
		cell = row.createCell(34);
		cell.setCellValue("	使用人");
		cell.setCellStyle(style);
		cell = row.createCell(35);
		cell.setCellValue("	使用单位");
		cell.setCellStyle(style);
		cell = row.createCell(36);
		cell.setCellValue("	购置价");
		cell.setCellStyle(style);
		
		if(fieldInfoList.size()>0){//如果用户有自定义字段则导出自定义字段 
			for(int i=0;i<fieldInfoList.size();i++){
				cell = row.createCell(37+i);
				cell.setCellValue(fieldInfoList.get(i).getFieldName());
				cell.setCellStyle(style);
			}
		}

		for (int i = 0; i < bmwe.size(); i++) {
			row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(bmwe.get(i).getFileNumber());// 给excel表格赋值
			row.createCell(1).setCellValue(getEquipmentStatus(bmwe.get(i).getEquipmentStatus(), null, null, null));
			row.createCell(2).setCellValue(bmwe.get(i).getMeasurementCategory());
			row.createCell(3).setCellValue(bmwe.get(i).getEquipmentName());
			row.createCell(4).setCellValue(bmwe.get(i).getCustomerNumber());
			row.createCell(5).setCellValue(bmwe.get(i).getEquipmentCount());
			row.createCell(6).setCellValue(bmwe.get(i).getSerialNumber());
			row.createCell(7).setCellValue(bmwe.get(i).getEquipmentModel());
			row.createCell(8).setCellValue(
					bmwe.get(i).getProductionDate() != null ? sdf.format(bmwe.get(i).getProductionDate()) : "");
			row.createCell(9).setCellValue(bmwe.get(i).getManufacturer());
			row.createCell(10).setCellValue(bmwe.get(i).getAbcClassification());
			row.createCell(11).setCellValue(bmwe.get(i).getAbcNumber());
			row.createCell(12).setCellValue(bmwe.get(i).getAccuracyLevel());
			row.createCell(13).setCellValue(bmwe.get(i).getMeasuringRange());
			row.createCell(14).setCellValue(bmwe.get(i).getUncertainty());
			row.createCell(15).setCellValue(bmwe.get(i).getCertificateNumber());
			row.createCell(16).setCellValue(bmwe.get(i).getFirstInspectionDate() != null
					? sdf.format(bmwe.get(i).getFirstInspectionDate()) : "");
			row.createCell(17).setCellValue(bmwe.get(i).getVerificationUnit());
			row.createCell(18).setCellValue(
					bmwe.get(i).getCompletionDate() != null ? sdf.format(bmwe.get(i).getCompletionDate()) : "");
			row.createCell(19).setCellValue(bmwe.get(i).getVerificationInstitution());
			row.createCell(20).setCellValue(
					bmwe.get(i).getVerificationDate() != null ? sdf.format(bmwe.get(i).getVerificationDate()) : "");
			row.createCell(21).setCellValue(bmwe.get(i).getVerificationCycle() == null ? "" : "");
			row.createCell(22)
					.setCellValue(bmwe.get(i).getValidDate() != null ? sdf.format(bmwe.get(i).getValidDate()) : "");
			row.createCell(23)
					.setCellValue(bmwe.get(i).getVerificationResult() != null ? bmwe.get(i).getInspectionType() : "");
			row.createCell(24)
					.setCellValue(bmwe.get(i).getInspectionType() != null ? bmwe.get(i).getInspectionType() : "");
			row.createCell(25)
					.setCellValue(bmwe.get(i).getCalibrationFee() != null ? bmwe.get(i).getCalibrationFee() : 0.00);
			row.createCell(26).setCellValue(bmwe.get(i).getBudgetFee() != null ? bmwe.get(i).getBudgetFee() : 0.00);
			row.createCell(27).setCellValue(bmwe.get(i).getEquipmentVerified() != null ? bmwe.get(i).getEquipmentVerified() : "");
			row.createCell(28).setCellValue(bmwe.get(i).getReceiveState() != null ? bmwe.get(i).getReceiveState() : "");
			row.createCell(29).setCellValue(bmwe.get(i).getReceiveDate() != null ? sdf.format(bmwe.get(i).getReceiveDate()) : "");
			row.createCell(30).setCellValue(bmwe.get(i).getEquipmentPerson() != null ? bmwe.get(i).getEquipmentPerson() : "");
			row.createCell(31).setCellValue(bmwe.get(i).getEnableDate() != null ? sdf.format(bmwe.get(i).getEnableDate()) : "");
			row.createCell(32).setCellValue(bmwe.get(i).getSubordinateSector() != null ? bmwe.get(i).getSubordinateSector() : "");
			row.createCell(33).setCellValue(bmwe.get(i).getPurchaseDate() != null ? sdf.format(bmwe.get(i).getPurchaseDate()) : "");
			row.createCell(34).setCellValue(bmwe.get(i).getEquipmentUser() != null ? bmwe.get(i).getEquipmentUser() : "");
			row.createCell(35).setCellValue(bmwe.get(i).getEquipmentUseunit() != null ? bmwe.get(i).getEquipmentUseunit() : "");
			row.createCell(36).setCellValue(bmwe.get(i).getPurchasePrice() != null ? bmwe.get(i).getPurchasePrice() : 0.00);
			row.createCell(37).setCellValue(bmwe.get(i).getSpare_1() != null ? bmwe.get(i).getSpare_1() : "");
			row.createCell(38).setCellValue(bmwe.get(i).getSpare_2() != null ? bmwe.get(i).getSpare_2() : "");
			row.createCell(39).setCellValue(bmwe.get(i).getSpare_3() != null ? bmwe.get(i).getSpare_3() : "");
			row.createCell(40).setCellValue(bmwe.get(i).getSpare_4() != null ? bmwe.get(i).getSpare_4() : "");
			row.createCell(41).setCellValue(bmwe.get(i).getSpare_5() != null ? bmwe.get(i).getSpare_5() : "");
			row.createCell(42).setCellValue(bmwe.get(i).getSpare_6() != null ? bmwe.get(i).getSpare_6() : "");

		}
		try {
			response.setHeader("Content-Disposition",
					"attachment;filename=" + new String((exportFileName).getBytes(), "ISO-8859-1"));// 设定输出文件头
			response.setContentType("application/vnd.ms-excel;charset=UTF-8");// 设置内容编码
			OutputStream outStream = response.getOutputStream();
			wb.write(outStream);
			outStream.close();
		} catch (Exception e) {

		} finally {

		}
		// 返回值一定要注意 不然会报 Cannot call sendError() after the response has called
		return "success";
	}

	// 导入器具Excel
	@RequestMapping("importEquipmentByExcel.do")
	public @ResponseBody Object importEquipmentByExcel(HttpServletRequest request, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		messageVO msg = new messageVO();
		List<equipmentVO> items = new ArrayList<equipmentVO>();// solr类集合
		int repeat = 0;
		try {
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(file.getInputStream());// 把excel路径放入
			HSSFSheet sheet = hssfWorkbook.getSheetAt(0);// 获取excel里第一个sheet
			HSSFRow hang = sheet.getRow(0); // 获得excel里的第一行
			int lie = sheet.getRow(0).getPhysicalNumberOfCells(); // gtkqbasegod
			int hangshu = sheet.getLastRowNum();
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {

				HSSFRow hssfRow = sheet.getRow(i);// 获取excel表格行
				int minCol = hssfRow.getFirstCellNum();
				int maxCol = hssfRow.getLastCellNum();
				String[] arr = new String[70];
				for (int j = minCol; j < maxCol; j++) {// 遍历数据
					HSSFCell cell = hssfRow.getCell(j);
					if (cell == null) {// 查看是否有空值 如果有则赋值为空
						arr[j] = "空";
						continue;
					}
					arr[j] = cell.toString();
				}
				Map<String, Object> maps = new HashMap<String, Object>();
				String equipmentName = arr[3];// 获取器具名称
				String equipmentModel = arr[7];// 获取器具型号
				String serialNumber = arr[6];// 获取出厂编号
				String manufacturer = arr[9];// 获取生产厂家
				maps.put("equipmentName", equipmentName);
				maps.put("equipmentModel", equipmentModel);
				maps.put("serialNumber", serialNumber);
				maps.put("manufacturer", manufacturer);
				equipmentPojo equipment = equipmentService.selectEquipmentByNameAndModel(maps);// 查看该器具是否存在

				if (equipment != null) {// 如果器具存在则更新数据库
					equipment.setFileNumber(arr[0]);
					equipment.setEquipmentStatus(getEquipmentStatus(null, arr[1], null, null));
					equipment.setMeasurementCategory(arr[2]);
					equipment.setEquipmentName(arr[3]);
					equipment.setCustomerNumber(arr[4]);
					equipment.setEquipmentCount(arr[5].toString() == null ? Integer.parseInt(arr[5].toString()) : 0);
					equipment.setSerialNumber(arr[6]);
					equipment.setEquipmentModel(arr[7]);
					equipment.setProductionDate(arr[8].toString() == null ? java.sql.Date.valueOf(arr[8]) : new Date());
					equipment.setManufacturer(arr[9]);
					equipment.setAbcClassification(arr[10]);
					equipment.setAbcNumber(arr[11]);
					equipment.setAccuracyLevel(arr[12]);
					equipment.setMeasuringRange(arr[13]);
					equipment.setUncertainty(arr[14]);
					equipment.setCertificateNumber(arr[15]);
					equipment.setFirstInspectionDate(arr[16] == null ? java.sql.Date.valueOf(arr[16]) : new Date());
					equipment.setVerificationUnit(arr[17]);
					equipment.setCompletionDate(arr[18] == null ? java.sql.Date.valueOf(arr[18]) : new Date());
					equipment.setVerificationInstitution(arr[19]);
					equipment.setVerificationDate(arr[20] == null ? java.sql.Date.valueOf(arr[20]) : new Date());
					equipment.setVerificationCycle(arr[21] == null ? Integer.parseInt(arr[21]) : 0);
					equipment.setValidDate(arr[22] == null ? java.sql.Date.valueOf(arr[22]) : new Date());
					equipment.setVerificationResult(getEquipmentStatus(null, null, null, arr[23]));
					equipment.setInspectionType(arr[24]);
					equipment.setCalibrationFee(arr[25] == null ? Double.valueOf(arr[25]) : 0.00);
					equipment.setBudgetFee(arr[26] == null ? Double.valueOf(arr[26]) : 0.00);
					equipment.setEquipmentVerified(arr[27]);

					int c = equipmentService.updateEquipmentByUUID(equipment);
					if (c > 0) {
						equipmentVO equipmentvo = PojoToVO(equipment);
						items.add(equipmentvo);
					}

					repeat++;
				} else {// 如果器具不存在则新添加器具信息
					equipmentPojo equip = new equipmentPojo();
					String equipmentUUID = UUID.randomUUID().toString();
					equip.setEquipmentUUID(equipmentUUID);
					equip.setFileNumber(arr[0]);
					equip.setEquipmentStatus(getEquipmentStatus(null, arr[1], null, null));
					equip.setMeasurementCategory(arr[2]);
					equip.setEquipmentName(arr[3]);
					equip.setCustomerNumber(arr[4]);
					equip.setEquipmentCount(arr[5].toString() == null ? Integer.parseInt(arr[5].toString()) : 0);
					equip.setSerialNumber(arr[6]);
					equip.setEquipmentModel(arr[7]);
					equip.setProductionDate(arr[8].toString() == null ? java.sql.Date.valueOf(arr[8]) : new Date());
					equip.setManufacturer(arr[9]);
					equip.setAbcClassification(arr[10]);
					equip.setAbcNumber(arr[11]);
					equip.setAccuracyLevel(arr[12]);
					equip.setMeasuringRange(arr[13]);
					equip.setUncertainty(arr[14]);
					equip.setCertificateNumber(arr[15]);
					equip.setFirstInspectionDate(arr[16] == null ? java.sql.Date.valueOf(arr[16]) : new Date());
					equip.setVerificationUnit(arr[17]);
					equip.setCompletionDate(arr[18] == null ? java.sql.Date.valueOf(arr[18]) : new Date());
					equip.setVerificationInstitution(arr[19]);
					equip.setVerificationDate(arr[20] == null ? java.sql.Date.valueOf(arr[20]) : new Date());
					equip.setVerificationCycle(arr[21] == null ? Integer.parseInt(arr[21]) : 0);
					equip.setValidDate(arr[22] == null ? java.sql.Date.valueOf(arr[22]) : new Date());
					equip.setVerificationResult(getEquipmentStatus(null, null, null, arr[23]));
					equip.setInspectionType(arr[24]);
					equip.setCalibrationFee(arr[25] == null ? Double.valueOf(arr[25]) : 0.00);
					equip.setBudgetFee(arr[26] == null ? Double.valueOf(arr[26]) : 0.00);
					equip.setEquipmentVerified(arr[27]);
					int c = equipmentService.insertEquipment(equip);// 添加器具
					if (c > 0) {
						equipmentVO equipmentvo = PojoToVO(equip);
						items.add(equipmentvo);
					}

				}
			}
			 solr.addSolrDocument(items);//更新solr数据
			msg.setSheetLastRowNumber(items.size());// 设置导入总行数
			msg.setExcelRepeatCount(repeat);// 设置重复数据
		} catch (IOException e) {

		}
		return msg;
	}

	// 下载模板
	@RequestMapping("downExcel.do")
	public @ResponseBody Object downExcel(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			HSSFWorkbook wb = ExcelUtil.createTemplate(response.getOutputStream());// 获取到一个模板
			response.setHeader("Content-Disposition",
					"attachment;filename=" + new String(("器具上传模板.xls").getBytes(), "ISO-8859-1"));// 设定输出文件头
			response.setContentType("application/vnd.ms-excel;charset=UTF-8");
			OutputStream outStream = response.getOutputStream();// 打开输出流
			wb.write(outStream);// 写出到浏览器 直接下载
			outStream.close();
		} catch (Exception e) {

		} finally {

		}
		return "success";
	}

	// 获取器具状态&检验结果
	public String getEquipmentStatus(String equipmentStatus, String equimentStatusName, String verificationResult,
			String verificationResultName) {
		String equipmentMessage = "";
		if (equipmentStatus != null) {
			if ("EQUIPMENT_STATUS_1".equals(equipmentStatus)) {
				equipmentMessage = "可用";
			}
			if ("EQUIPMENT_STATUS_2".equals(equipmentStatus)) {
				equipmentMessage = "停用";
			}
			if ("EQUIPMENT_STATUS_3".equals(equipmentStatus)) {
				equipmentMessage = "损坏";
			}
			if ("EQUIPMENT_STATUS_4".equals(equipmentStatus)) {
				equipmentMessage = "降级";
			}
			if ("EQUIPMENT_STATUS_5".equals(equipmentStatus)) {
				equipmentMessage = "准用";
			}
			if ("EQUIPMENT_STATUS_6".equals(equipmentStatus)) {
				equipmentMessage = "在库";
			}
			if ("EQUIPMENT_STATUS_7".equals(equipmentStatus)) {
				equipmentMessage = "封存";
			}
			if ("EQUIPMENT_STATUS_8".equals(equipmentStatus)) {
				equipmentMessage = "报废";
			}
			if ("EQUIPMENT_STATUS_9".equals(equipmentStatus)) {
				equipmentMessage = "遗失";
			}
			if ("EQUIPMENT_STATUS_10".equals(equipmentStatus)) {
				equipmentMessage = "备用";
			}
			if ("EQUIPMENT_STATUS_11".equals(equipmentStatus)) {
				equipmentMessage = "限用";
			}
			if ("EQUIPMENT_STATUS_12".equals(equipmentStatus)) {
				equipmentMessage = "其他";
			}
		}

		if (equimentStatusName != null) {
			if ("可用".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_1";
			}
			if ("停用".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_2";
			}
			if ("损坏".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_3";
			}
			if ("降级".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_4";
			}
			if ("准用".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_5";
			}
			if ("在库".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_6";
			}
			if ("封存".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_7";
			}
			if ("报废".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_8";
			}
			if ("遗失".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_9";
			}
			if ("备用".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_10";
			}
			if ("限用".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_11";
			}
			if ("其他".equals(equimentStatusName)) {
				equipmentMessage = "EQUIPMENT_STATUS_12";
			}
		}

		if (verificationResult != null) {
			if ("合格".equals(verificationResult)) {
				equipmentMessage = "EQUIP_TEST_RESULT1";
			}
			if ("不合格".equals(verificationResult)) {
				equipmentMessage = "EQUIP_TEST_RESULT2";
			}
		}

		if (verificationResultName != null) {
			if ("EQUIP_TEST_RESULT1".equals(verificationResultName)) {
				equipmentMessage = "合格";
			}
			if ("EQUIP_TEST_RESULT2".equals(verificationResultName)) {
				equipmentMessage = "不合格";
			}
		}

		return equipmentMessage;
	}

	// 转换VO类
	public equipmentVO PojoToVO(equipmentPojo equipment) {
		equipmentVO equipmentvo = new equipmentVO();

		equipmentvo.setEquipmentUUID(equipment.getEquipmentUUID() != null ? equipment.getEquipmentUUID() : "");
		equipmentvo.setEquipmentName(equipment.getEquipmentName() != null ? equipment.getEquipmentName() : "");
		equipmentvo.setEquipmentModel(equipment.getEquipmentModel() != null ? equipment.getEquipmentModel() : "");
		equipmentvo.setSerialNumber(equipment.getSerialNumber() != null ? equipment.getSerialNumber() : "");
		equipmentvo.setAccuracyLevel(equipment.getAccuracyLevel() != null ? equipment.getAccuracyLevel() : "");
		equipmentvo
				.setAbcClassification(equipment.getAbcClassification() != null ? equipment.getAbcClassification() : "");
		equipmentvo.setAbcNumber(equipment.getAbcNumber() != null ? equipment.getAbcNumber() : "");
		equipmentvo.setEquipmentPerson(equipment.getEquipmentPerson() != null ? equipment.getEquipmentPerson() : "");
		equipmentvo.setEquipmentStatus(getEquipmentStatus(equipment.getEquipmentStatus(), null, null, null));
		equipmentvo.setManufacturer(equipment.getManufacturer() != null ? equipment.getManufacturer() : "");
		equipmentvo.setMeasuringRange(equipment.getMeasuringRange() != null ? equipment.getMeasuringRange() : "");
		equipmentvo.setUncertainty(equipment.getUncertainty() != null ? equipment.getUncertainty() : "");
		equipmentvo.setFileNumber(equipment.getFileNumber() != null ? equipment.getFileNumber() : "");
		equipmentvo.setCustomerNumber(equipment.getCustomerNumber() != null ? equipment.getCustomerNumber() : "");
		equipmentvo.setProductionDate(equipment.getProductionDate());
		equipmentvo.setMeasurementCategory(
				equipment.getMeasurementCategory() != null ? equipment.getMeasurementCategory() : "");
		equipmentvo.setBasicRemark(equipment.getBasicRemark() != null ? equipment.getBasicRemark() : "");
		equipmentvo.setCheckRemark(equipment.getCheckRemark() != null ? equipment.getCheckRemark() : "");
		equipmentvo.setEquipmentCreater(equipment.getEquipmentCreater() != null ? equipment.getEquipmentCreater() : "");
		equipmentvo.setCreaterDate(equipment.getCreaterDate());
		equipmentvo.setVerificationInstitution(
				equipment.getVerificationInstitution() != null ? equipment.getVerificationInstitution() : "");
		equipmentvo.setVerificationDate(equipment.getVerificationDate());
		equipmentvo.setValidDate(equipment.getValidDate());
		equipmentvo.setVerificationResult(getEquipmentStatus(null, null, equipment.getVerificationResult(), null));
		equipmentvo.setInspectionType(equipment.getInspectionType() != null ? equipment.getInspectionType() : "");
		equipmentvo.setCalibrationFee(equipment.getCalibrationFee() != null ? equipment.getCalibrationFee() : 0.00);
		equipmentvo.setBudgetFee(equipment.getBudgetFee() != null ? equipment.getBudgetFee() : 0.00);
		equipmentvo
				.setCertificateNumber(equipment.getCertificateNumber() != null ? equipment.getCertificateNumber() : "");
		equipmentvo.setFirstInspectionDate(equipment.getFirstInspectionDate());
		equipmentvo.setVerificationUnit(equipment.getVerificationUnit() != null ? equipment.getVerificationUnit() : "");
		equipmentvo.setCompletionDate(equipment.getCompletionDate());
		equipmentvo.setPurchaseDate(equipment.getPurchaseDate());
		equipmentvo.setPurchasePrice(equipment.getPurchasePrice() != null ? equipment.getPurchasePrice() : 0.00);
		equipmentvo.setStorageRemark(equipment.getStorageRemark() != null ? equipment.getStorageRemark() : "");
		equipmentvo
				.setSubordinateSector(equipment.getSubordinateSector() != null ? equipment.getSubordinateSector() : "");
		equipmentvo.setEquipmentUser(equipment.getEquipmentUser() != null ? equipment.getEquipmentUser() : "");
		equipmentvo.setReceiveDate(equipment.getReceiveDate());
		equipmentvo.setEnableDate(equipment.getEnableDate());
		equipmentvo.setPlanNumber(equipment.getPlanNumber() != null ? equipment.getPlanNumber() : "");
		equipmentvo.setOrderNumber(equipment.getOrderNumber() != null ? equipment.getOrderNumber() : "");
		equipmentvo.setSpare_1(equipment.getSpare_1() != null ? equipment.getSpare_1() : "");
		equipmentvo.setSpare_2(equipment.getSpare_2() != null ? equipment.getSpare_2() : "");
		equipmentvo.setSpare_3(equipment.getSpare_3() != null ? equipment.getSpare_3() : "");
		equipmentvo.setSpare_4(equipment.getSpare_4() != null ? equipment.getSpare_4() : "");
		equipmentvo.setSpare_5(equipment.getSpare_5() != null ? equipment.getSpare_5() : "");
		equipmentvo.setSpare_6(equipment.getSpare_6() != null ? equipment.getSpare_6() : "");

		return equipmentvo;
	}
	
	// 上传彩色附录
	public String uploadColor( MultipartFile file) {
		ResourceBundle resourceBundleDta = ResourceBundle.getBundle("upload");
		String path = (String) resourceBundleDta.getObject("colorPath");
		String fileName = file.getOriginalFilename();
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String colorPath = path + "//" + fileName;
		return colorPath;//返回路径
	}

}
