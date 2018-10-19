package com.htstd.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.htstd.VO.userVO;
import com.htstd.domain.FieldCustomPojo;
import com.htstd.domain.companyPojo;
import com.htstd.domain.dataDictionaryPojo;
import com.htstd.domain.departmentPojo;
import com.htstd.domain.enumCustomPojo;
import com.htstd.domain.logoPojo;
import com.htstd.domain.rolePojo;
import com.htstd.domain.userLoginPojo;
import com.htstd.service.FieldEnumService;
import com.htstd.service.PersonService;
import com.htstd.util.ValidCodeUtil;
import com.htstd.util.DataUtil;
import com.htstd.util.Email;
import com.htstd.util.ListUtils;
import com.htstd.util.PageUtil;
import com.mysql.jdbc.StringUtils;

/**
 * 
 * @描述 系统管理
 * @author 吉德宁
 * @日期 2017年7月3日
 *
 */
@Controller
@RequestMapping("user")
public class UserController {

	private static final Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private PersonService personService;// 用户service
	@Autowired
	private FieldEnumService fieldEnumService;
	
	@RequestMapping("check.do")  
    public void createCode(HttpServletRequest request, HttpServletResponse response) throws IOException {  
        // 通知浏览器不要缓存  
        response.setHeader("Expires", "-1");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setHeader("Pragma", "-1");  
        ValidCodeUtil util = ValidCodeUtil.Instance();  
        // 将验证码输入到session中，用来验证  
        String code = util.getString();  
        request.getSession().setAttribute("code", code);  
        // 输出打web页面  
        ImageIO.write(util.getImage(), "jpg", response.getOutputStream());  
    } 
	

	@RequestMapping("Login.do")
	public String userlogin(String username, String password, Model model, HttpServletRequest request,HttpServletResponse response
			) throws Exception {
		HttpSession session = request.getSession();
		 String codeSession =  (String) session.getAttribute("code");  
		try {
			// 判断用户名是否为空
			if (null == username || "".equals(username)) {
				model.addAttribute("error", "用户名不能为空");
				return "index/index";
			}
			if (null == password || "".equals(password)) {
				model.addAttribute("error", "密码不能为空");
				return "index/index";
			}
			if ("null".equals(username)) {
				model.addAttribute("error", "用户名(" + username + ")或密码(" + password + ")错误!");
				return "index/index";
			}

			// 登录
			userLoginPojo userLogin = this.personService.findUserLogin(null, password, username);
			if (userLogin == null) {

				userLogin = this.personService.findUserLogin(username, password, null);
			}
			if (null == userLogin) {
				model.addAttribute("error", "用户名(" + username + ")或密码(" + password + ")错误!");
				return "index/index";
			}
			
			String key = request.getSession().getId();
			Cookie cookie = new Cookie("sessionId", key);
			cookie.setPath("/");//设置cookie路径
			response.addCookie(cookie);
			
			session.setAttribute("userLogin", userLogin);
			ServletContext application = request.getServletContext();
			application.setAttribute(userLogin.getUserUUID() + "ID", request.getSession().getId());

			return "main";
		} catch (Exception e) {
			logger.error("Login.do" + e);
			model.addAttribute("message", "抱歉，访问网页出错，请刷新重试！" + "用户名(" + username + ")或密码(" + password + ")错误!");
			return "error/error";
		}
	}
	
	//跳转注册页面
	@RequestMapping("toRegister.do")
	public String toRegister(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "index/register";
	}

	// 注册账号
	@RequestMapping("register.do")
	public String Register(HttpServletRequest request, HttpServletResponse response, Model model) {
		String url = "http://192.168.1.38:8090/limsCenter";
		String msg = null;

		String returnstr = Email.sendMessage("smtp.126.com", "jidn_jd@126.com", "jidening11",
				request.getParameter("email"), "中检远航（北京）科技有限公司来信请回复",
				"欢迎使用中检远航计量器具在线管理系统，请点击<a href='" + url + "'>激活账号</a>进行登录", "text/html;charset=utf-8");
		if ("ok".equals(returnstr)) {
			msg = "ok";
		} else {
			msg = "err";
		}
		return "index/register";
	}

	// 跳转top菜单页
	@RequestMapping("top.do")
	public String top(Model model, HttpServletRequest request) throws Exception {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		logoPojo logo = personService.selectLogo(userLogin.getUserUUID());
		model.addAttribute("logo", logo);
		model.addAttribute("userLogin", userLogin);
		return "top";
	}

	// 跳转left页面
	@RequestMapping("left.do")
	public String left(Model model, HttpServletRequest request) throws Exception {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");

		return "menu";
	}

	// 注销
	@RequestMapping("Logout.do")
	public String logout(Model model, HttpServletRequest request) throws Exception {
		logger.info("====================用户注销功能操作==========UserController.logout=========================start");
		request.getSession().removeAttribute("userLogin");
		model.addAttribute("error", "用户已退出");
		return "index/index";
	}

	// 用户修改logo
	@RequestMapping("updateLogo.do")
	public String updateLogo(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		logoPojo l = new logoPojo();
		ResourceBundle resourceBundleDta = ResourceBundle.getBundle("upload");//获取uppload配置的路径
		String path = (String) resourceBundleDta.getObject("LogoPath");//获取路径
		String fileName = file.getOriginalFilename();//获取文件名称
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {//如果文件夹不存在则创建它
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String photoSrc = path + "//" + fileName;
		l.setPath(photoSrc);
		l.setUserId(userLogin.getUserUUID());
		personService.updateLogo(l);//保存图片
		model.addAttribute("logo", l);
		model.addAttribute("msg", "success");
		return "EC/account_setting";
	}

	// 用户修改logo
	@RequestMapping("selectLogo.do")
	public String selectLogo(HttpServletRequest request, HttpServletResponse response, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		logoPojo logo = personService.selectLogo(userLogin.getUserUUID());
		model.addAttribute("logo", logo);
		return "EC/account_setting";
	}

	// 数据字典列表
	@RequestMapping("selectdataDictionary.do")
	public String selectdataDictionary(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<dataDictionaryPojo> dataList = personService.selectdataDictionaryList();
		model.addAttribute("dataList", dataList);//查询数据字典
		return "EC/Data_Dictionary_List";
	}

	// 数据字典更改数据字典状态
	@RequestMapping("updateDictionary.do")
	public String updateDictionary(HttpServletRequest request, HttpServletResponse response, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		String dictionaryStatus = request.getParameter("dictionaryStatus");
		if ("N".equals(dictionaryStatus)) {//判断当前数据字典状态
			dictionaryStatus = "Y";
		} else if ("Y".equals(dictionaryStatus)) {
			dictionaryStatus = "N";
		}
		dataDictionaryPojo data = new dataDictionaryPojo();
		data.setId(id);
		data.setDictionaryStatus(dictionaryStatus);
		personService.updateDictionary(data);//修改状态
		return "redirect:/user/selectdataDictionary.do";
	}

	// 跳转自定义器具页面
	@RequestMapping("toEditfield.do")
	public String toEditfield(HttpServletRequest request, HttpServletResponse response, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		if (userLogin == null) {
			return "index/index";
		}
		List<FieldCustomPojo> fieldList = fieldEnumService.selectfieldByuserId(String.valueOf(userLogin.getUserUUID()));
		List<FieldCustomPojo> fieldInfoList = fieldEnumService.selectfield(String.valueOf(userLogin.getUserUUID()));
		model.addAttribute("fieldList", fieldList);
		Integer[] files = new Integer[] { 1, 2, 3, 4, 5, 6 };
		Integer[] exitFiles = new Integer[fieldInfoList.size()];
		if (fieldInfoList.size() >= 6) { // 控制用户添加字段字数 如果大于 则不让添加
			model.addAttribute("msg", "不可再添加");
			return "EC/edit_field_Custom_info";
		} else if (fieldInfoList.size() > 0 && fieldInfoList.size() < 6) {
			for (int i = 0; i < fieldInfoList.size(); i++) {//遍历当前用户已经添加过哪些自定义字段
				exitFiles[i] = Integer.parseInt(fieldInfoList.get(i).getFieldName().split("_")[1]);
			}
			List<Integer> integer = this.compare(exitFiles, files);//比对是否有重复字段
			model.addAttribute("fieldName", "spare_" + this.compare(exitFiles, files).get(0));//定义下次添加的字段
		} else {
			model.addAttribute("fieldName", "spare_1");//如果没有添加过字段初始化自定义字段
		}
		return "EC/edit_field_Custom_info";
	}

	// 比较不同
	public List<Integer> compare(Integer[] files, Integer[] exitFiles) {
		List<Integer> list1 = Arrays.asList(files);
		List<Integer> list2 = new ArrayList<Integer>();
		for (Integer t : exitFiles) {
			if (!list1.contains(t)) {
				list2.add(t);
			}
		}
		return list2;
	}

	// 添加自定义字段
	@RequestMapping("Editfield.do")
	public String Editfield(HttpServletRequest request, HttpServletResponse response, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		String fieldName = request.getParameter("fieldName");
		String fieldType = request.getParameter("fieldType");
		String fieldDescrib = request.getParameter("fieldDescrib");
		FieldCustomPojo filed = new FieldCustomPojo();
		filed.setFieldName(fieldName);
		filed.setFieldType(fieldType);
		filed.setFieldDescrib(fieldDescrib);
		filed.setUserId(String.valueOf(userLogin.getUserUUID()));
		List<FieldCustomPojo> fieldInfoList = fieldEnumService.selectfield(String.valueOf(userLogin.getUserUUID()));
		if (fieldInfoList.size() >= 6) { // 控制用户添加字段字数 如果大于 则不让添加
			model.addAttribute("msg", "不可再添加");
			return "redirect:/user/toEditfield.do";
		}
		fieldEnumService.insertField(filed);

		return "redirect:/user/toEditfield.do";
	}

	// 跳转自定义枚举字段页面
	@RequestMapping("customEnum.do")
	public String customEnum(HttpServletRequest request, HttpServletResponse response, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		if (userLogin == null) {
			return "index/index";
		}
		List<FieldCustomPojo> fieldList = fieldEnumService.selectfieldEnum(String.valueOf(userLogin.getUserUUID()));
		model.addAttribute("fieldList", fieldList);
		return "EC/edit_enum_Custom_info";
	}


	// 删除自定义字段
	@RequestMapping("deleteField.do")
	public String deleteField(HttpServletRequest request, HttpServletResponse response, Model model) {
		int id = Integer.parseInt(request.getParameter("ID"));
		fieldEnumService.deleteField(id);
		return "redirect:/user/toEditfield.do";
	}
	// 删除自定义枚举字段
	@RequestMapping("deleteEnumField.do")
	public String deleteEnumField(HttpServletRequest request, HttpServletResponse response, Model model) {
		int id = Integer.parseInt(request.getParameter("ID"));
		fieldEnumService.deleteEnum(id);
		return "redirect:/user/customEnum.do";
	}

	// 查看枚举字段值
	@RequestMapping("selectEnum.do")
	public @ResponseBody List<enumCustomPojo> selectEnum(HttpServletRequest request) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		Map<String, Object> maps = new HashMap<String, Object>();
		String fieldid = request.getParameter("fieldid");
		/*
		 * if(userLogin ==null){ return "index/index"; }
		 */
		maps.put("fieldid", fieldid);
		maps.put("userid", userLogin.getUserUUID());
		List<enumCustomPojo> enumList = fieldEnumService.selectEnum(maps);

		return enumList;
	}

	// 添加枚举值
	@RequestMapping("insertEnum.do")
	public @ResponseBody String insertEnum(HttpServletRequest request) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		String fieldid = request.getParameter("fieldid");
		String enumValue = request.getParameter("enumValue");
		enumCustomPojo en = new enumCustomPojo();
		en.setEnumValue(enumValue);
		en.setFieldid(Integer.parseInt(fieldid));
		en.setUserId(userLogin.getUserUUID());

		fieldEnumService.insertEnum(en);

		return "success";
	}

	@RequestMapping("rolePermission.do")
	public String rolePermission(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<rolePojo> roleList = new ArrayList<rolePojo>();
		Map<String, Object> maps = new HashMap<String, Object>();
		PageUtil page = null;
		String pageNow = request.getParameter("pageNow");
		String pageSize = request.getParameter("pageSize");
		if (pageSize == null || "".equals(pageSize)) {
			pageSize = "5";
		}

		int totalCount = (int) personService.selectRoleListTotal();
		if (pageNow != null && pageNow != "") {
			page = new PageUtil(totalCount, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
			maps.put("startPos", page.getStartPos());
			maps.put("pageSize", page.getPageSize());
			roleList = personService.selectRoleList(maps);
		} else {
			page = new PageUtil(totalCount, 1, Integer.parseInt(pageSize));
			maps.put("startPos", page.getStartPos());
			maps.put("pageSize", page.getPageSize());
			roleList = personService.selectRoleList(maps);
		}

		model.addAttribute("roleList", roleList);
		model.addAttribute("page", page);
		return "EC/role_list";
	}

	// 会员资料 查看基本信息
	@RequestMapping("selectCompany.do")
	public String selectCompany(HttpServletRequest request, HttpServletResponse response, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		companyPojo company = personService.selectCompanyById(userLogin.getCompanyUUID());
		model.addAttribute("company", company);
		model.addAttribute("userLogin", userLogin);
		return "EC/Member/Essential_Info";
	}

	// 会员资料修改基本信息
	@RequestMapping("updateCompany.do")
	public String updateCompany(HttpServletRequest request, HttpServletResponse response, Model model,
			companyPojo company) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		personService.updateCompanyInfo(company);
		model.addAttribute("userLogin", userLogin);
		return "redirect:/user/selectCompany.do";
	}

	// 查看用户信息
	@RequestMapping("selectUserList.do")
	public String selectUserList(HttpServletRequest request, HttpServletResponse response, Model model,
			userVO uservo) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		List<userVO> userList = new ArrayList<userVO>();
		List<departmentPojo> departmentList = new ArrayList<departmentPojo>();
		List<departmentPojo> deptList = personService.selectDepartmentByCompany(userLogin.getCompanyUUID());
		Map<String, Object> maps = new HashMap<String, Object>();
		PageUtil page = null;
		String pageNow = request.getParameter("pageNow");
		String pageSize = request.getParameter("pageSize");
		
		if (pageSize == null || "".equals(pageSize)) {
			pageSize = "5";
		}
		
		maps.put("uservo", uservo);
		maps.put("pageSize", Integer.parseInt(pageSize));
		int totalCount = (int) personService.selectUserListTotal(maps);
		if (pageNow != null && pageNow != "") {
			page = new PageUtil(totalCount, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
			maps.put("startPos", page.getStartPos());
		} else {
			page = new PageUtil(totalCount, 1, Integer.parseInt(pageSize));
			maps.put("startPos", page.getStartPos());
		}

		List<userVO> user = personService.selectUserList(maps);
		List<companyPojo> companyList = personService.selectAllCompany();
		for (userVO u : user) {
			StringBuilder role = new StringBuilder("");
			if (u.getUserLevel() != null) {

				String[] roles = u.getUserLevel().split(",");
				for (int i = 0; i < roles.length; i++) {
					if (roles[i].trim().equals("ROLE_PERMISSION_0")) {
						role.append("超级管理员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_1")) {
						role.append("器具管理员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_2")) {
						role.append("计划管理员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_3")) {
						role.append("计划执行员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_4")) {
						role.append("订单确认人").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_5")) {
						role.append("器具负责人").append(",");
					}
				}
				u.setUserLevel(role.toString());
			}

			userList.add(u);
		}
		// 遍历部门 排序
		for (departmentPojo department : deptList) {
			if ("0".equals(department.getDepartmentParent())) {
				departmentList.add(department);
				String parentUUID = department.getDepartmentUUID();
				for (departmentPojo d : deptList) {
					if (parentUUID.equals(d.getDepartmentParent())) {
						departmentList.add(d);
						String third = d.getDepartmentUUID();
						for (departmentPojo dp : deptList) {
							if (third.equals(dp.getDepartmentParent())) {
								departmentList.add(dp);
							}
						}
					}
				}
			}
		}

		model.addAttribute("companyList", companyList);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("userName", uservo.getUserName());
		model.addAttribute("state", uservo.getState());
		model.addAttribute("companyUUID", uservo.getCompanyUUID());
		model.addAttribute("departmentUUID", uservo.getDepartmentUUID());
		model.addAttribute("userList", userList);
		model.addAttribute("userLogin", userLogin);
		return "EC/My_user_list";
	}

	// 查看部门信息
	@RequestMapping("selectDepartment.do")
	public String selectDepartment(HttpServletRequest request, HttpServletResponse response, Model model,
			companyPojo company) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		List<departmentPojo> departmentList = new ArrayList<departmentPojo>();
		List<departmentPojo> deptList = personService.selectDepartmentByCompany(userLogin.getCompanyUUID());
		// 遍历部门 排序
		for (departmentPojo department : deptList) {
			if ("0".equals(department.getDepartmentParent())) {
				departmentList.add(department);
				String parentUUID = department.getDepartmentUUID();
				for (departmentPojo d : deptList) {
					if (parentUUID.equals(d.getDepartmentParent())) {
						departmentList.add(d);
						String third = d.getDepartmentUUID();
						for (departmentPojo dp : deptList) {
							if (third.equals(dp.getDepartmentParent())) {
								departmentList.add(dp);
							}
						}
					}
				}
			}
		}

		model.addAttribute("departmentList", departmentList);
		model.addAttribute("userLogin", userLogin);
		return "EC/Member/Department_Info";
	}

	// 添加部门信息
	@RequestMapping("insertDepartment.do")
	public String insertDepartment(HttpServletRequest request, HttpServletResponse response, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		departmentPojo department = new departmentPojo();
		String departmentUUID = UUID.randomUUID().toString();
		String departmentName = request.getParameter("departmentName");
		String departmentCode = request.getParameter("departmentCode");
		String departmentParent = request.getParameter("departmentParent");
		int departmentNumber = Integer.parseInt(request.getParameter("departmentNumber"));
		String departmentCompanyUUID = userLogin.getCompanyUUID();

		if (departmentParent == null || departmentParent == "") {
			departmentParent = "0";
		}

		department.setDepartmentUUID(departmentUUID);
		department.setDepartmentName(departmentName);
		department.setDepartmentCode(departmentCode);
		department.setDepartmentParent(departmentParent);
		department.setDepartmentNumber(departmentNumber);
		department.setDepartmentCompanyUUID(departmentCompanyUUID);

		personService.insertDepartment(department);

		return "redirect:/user/selectDepartment.do";
	}

	// 跳转添加用户页面
	@RequestMapping("toedituserpage.do")
	public String toedituserpage(HttpServletRequest request, HttpServletResponse response, Model model) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		Map<String, Object> maps = new HashMap<String, Object>();
		List<departmentPojo> departmentList = new ArrayList<departmentPojo>();
		List<departmentPojo> deptList = personService.selectDepartmentByCompany(userLogin.getCompanyUUID());
		// 遍历部门 排序
		for (departmentPojo department : deptList) {
			if ("0".equals(department.getDepartmentParent())) {
				departmentList.add(department);
				String parentUUID = department.getDepartmentUUID();
				for (departmentPojo d : deptList) {
					if (parentUUID.equals(d.getDepartmentParent())) {
						departmentList.add(d);
						String third = d.getDepartmentUUID();
						for (departmentPojo dp : deptList) {
							if (third.equals(dp.getDepartmentParent())) {
								departmentList.add(dp);
							}
						}
					}
				}
			}
		}
		List<companyPojo> companyList = personService.selectAllCompany();
		int total = personService.selectRoleListTotal();
		maps.put("startPos", 0);
		maps.put("pageSize", total);
		List<rolePojo> roleList = personService.selectRoleList(maps);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("companyList", companyList);
		model.addAttribute("roleList", roleList);
		return "EC/edit_user_info";
	}

	// 添加用户信息
	@RequestMapping("insertuser.do")
	public String insertuser(HttpServletRequest request, HttpServletResponse response, Model model,
			userLoginPojo user) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		logoPojo l = new logoPojo();
		String userUUID = UUID.randomUUID().toString();
		user.setUserUUID(userUUID);
		user.setLoginPassWord(DataUtil.md5(user.getLoginPassWord()));
		personService.insertUserInfo(user);
		l.setUserId(userUUID);

		personService.insertLogo(l);
		return "redirect:/user/selectUserList.do";
	}

	// 删除用户信息
	@RequestMapping("deleteUser.do")
	public String deleteUser(HttpServletRequest request, HttpServletResponse response, Model model,
			userLoginPojo user) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		String uuid = request.getParameter("uuid");
		personService.deleteUser(uuid);
		return "redirect:/user/selectUserList.do";
	}

	// 删除用户信息
	@RequestMapping("roleGaveUserpage.do")
	public String roleGaveUserpage(HttpServletRequest request, HttpServletResponse response, Model model,userVO uservo) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		String rolePermission = request.getParameter("rolePermission");
		List<userVO> userList = new ArrayList<userVO>();
		Map<String, Object> maps = new HashMap<String, Object>();
		PageUtil page = null;
		String pageNow = request.getParameter("pageNow");
		String pageSize = request.getParameter("pageSize");
		if (pageSize == null || "".equals(pageSize)) {
			pageSize = "5";
		}
		maps.put("uservo", uservo);
		maps.put("pageSize", Integer.parseInt(pageSize));
		int totalCount = (int) personService.selectUserListTotal(maps);
		if (pageNow != null) {
			page = new PageUtil(totalCount, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
			maps.put("startPos", page.getStartPos());
		} else {
			page = new PageUtil(totalCount, 1, Integer.parseInt(pageSize));
			maps.put("startPos", page.getStartPos());
		}

		List<userVO> user = personService.selectUserList(maps);

		for (userVO u : user) {
			if (u.getUserLevel() != null) {
				StringBuilder role = new StringBuilder("");
				String[] roles = u.getUserLevel().split(",");
				for (int i = 0; i < roles.length; i++) {

					if (roles[i].trim().equals("ROLE_PERMISSION_0")) {
						role.append("超级管理员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_1")) {
						role.append("器具管理员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_2")) {
						role.append("计划管理员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_3")) {
						role.append("计划执行员").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_4")) {
						role.append("订单确认人").append(",");
					}
					if (roles[i].trim().equals("ROLE_PERMISSION_5")) {
						role.append("器具负责人").append(",");
					}
					u.setUserLevel(role.toString());

				}
			}
			userList.add(u);

		}
		
		model.addAttribute("userList", userList);
		model.addAttribute("rolePermission", rolePermission);
		return "EC/role_gave_user";
	}

	// 授权用户
	@RequestMapping("roleGaveUser.do")
	public String roleGaveUser(HttpServletRequest request, HttpServletResponse response, Model model,userVO uservo) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		Map<String, Object> maps = new HashMap<String, Object>();
		List<userLoginPojo> userList = new ArrayList<userLoginPojo>();
		String[] uuid = request.getParameter("uuid").split(",");
		String rolePermission = request.getParameter("roleId");
		
		
		maps.put("uservo", uservo);
		int totalCount = (int) personService.selectUserListTotal(maps);
		maps.put("pageSize", totalCount);
		maps.put("startPos", 0);
		
		List<userVO> user = personService.selectUserList(maps);
		for (int i = 0; i < uuid.length; i++) {

			for (int j = 0; j < user.size(); j++) {

				if (uuid[i].equals(user.get(j).getUserUUID())) {
					userLoginPojo ulp = new userLoginPojo();
					if (user.get(j).getUserLevel() != null && !user.get(j).getUserLevel().equals("")) {
						String[] roleUUID = user.get(j).getUserLevel().split(",");
						boolean flag =true;
						for(int n=0;n<roleUUID.length;n++){
							if(roleUUID[n].trim().equals(rolePermission)){
								flag = false ;
								break;
							}
						}
						if(flag){
							ulp.setUserLevel(user.get(j).getUserLevel() + "," + rolePermission);
						}
					} else {
						ulp.setUserLevel(rolePermission);
					}
					ulp.setUserUUID(uuid[i]);
					userList.add(ulp);
				}
			}
		}

		for (userLoginPojo u : userList) {
			personService.updateUserLogin(u);
		}
		model.addAttribute("rolePermission", rolePermission);
		return "redirect:/user/roleGaveUserpage.do";
	}
	
	// 取消授权用户
	@RequestMapping("cancelRoleGaveUser.do")
	public String cancelRoleGaveUser(HttpServletRequest request, HttpServletResponse response, Model model,userVO uservo) {
		userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		Map<String, Object> maps = new HashMap<String, Object>();
		List<userLoginPojo> userList = new ArrayList<userLoginPojo>();
		String[] uuid = request.getParameter("uuid").split(",");
		String rolePermission = request.getParameter("roleId");
		
		
		maps.put("uservo", uservo);
		int totalCount = (int) personService.selectUserListTotal(maps);
		maps.put("pageSize", totalCount);
		maps.put("startPos", 0);
		
		List<userVO> user = personService.selectUserList(maps);
		for (int i = 0; i < uuid.length; i++) {

			for (int j = 0; j < user.size(); j++) {

				if (uuid[i].equals(user.get(j).getUserUUID())) {
					userLoginPojo ulp = new userLoginPojo();
					if (user.get(j).getUserLevel() != null && !user.get(j).getUserLevel().equals("")) {
						String[] roleUUID = user.get(j).getUserLevel().split(",");
						List<String> list = new ArrayList(Arrays.asList(roleUUID));
						boolean flag =true;
						for(int n=0;n<list.size();n++){
							if(list.get(n).trim().equals(rolePermission)){
								list.remove(n);
								flag = false ;
								break;
							}
						}
						if(!flag){
							String permission = ListUtils.listToString(list, ',');
							ulp.setUserLevel(permission);
						}else{
							ulp.setUserLevel(user.get(j).getUserLevel());
						}
						
					} else {
						ulp.setUserLevel("");
					}
					ulp.setUserUUID(uuid[i]);
					userList.add(ulp);
				}
			}
		}

		for (userLoginPojo u : userList) {
			personService.updateUserLogin(u);
		}
		model.addAttribute("rolePermission", rolePermission);
		return "redirect:/user/roleGaveUserpage.do";
	}
	
	//会员资料
	@RequestMapping("MenberInfo.do")
	public String MenberInfo(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "EC/Member/Menber_main";
	}
	
	//证书信息
	@RequestMapping("certificateInfo.do")
	public String certificateInfo(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "EC/Member/Certificate_Info";
	}
	
	//发票信息
	@RequestMapping("invoiceInfo.do")
	public String invoiceInfo(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "EC/Member/Invoice_Info";
	}
	
	//联系人
	@RequestMapping("contacts.do")
	public String contacts(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "EC/Member/Contacts";
	}
	
	//检定机构
	@RequestMapping("verificationInstitution.do")
	public String verificationInstitution(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "EC/Member/Verification_Institution";
	}

}
