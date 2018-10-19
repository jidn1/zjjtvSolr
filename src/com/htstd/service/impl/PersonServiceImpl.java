package com.htstd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htstd.VO.userVO;
import com.htstd.dao.PersonDao;
import com.htstd.domain.companyPojo;
import com.htstd.domain.dataDictionaryPojo;
import com.htstd.domain.departmentPojo;
import com.htstd.domain.logoPojo;
import com.htstd.domain.rolePojo;
import com.htstd.domain.userLoginPojo;
import com.htstd.service.PersonService;
import com.htstd.util.DataUtil;

@Service
public class PersonServiceImpl implements PersonService {
	
	@Autowired
	private PersonDao personDao;

	public userLoginPojo findUserLogin(String username, String password, String donainId) throws Exception {
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("loginUser", username);
		if(password == null){
			paramMap.put("loginPassWord",null);
		}else {
			paramMap.put("loginPassWord",DataUtil.md5(password));
		}
		return personDao.findUserLogin(paramMap);
	}

	public String getPermissionsByGroupIds(String[] str) throws Exception {
		Map<String, Object> map =  new HashMap<String,Object>();
		map.put("str", str);
		return personDao.getPermissionsByGroupIds(map);
	}

	public void updateLogo(logoPojo l) {
		personDao.updateLogo(l);
	}

	public logoPojo selectLogo(String userId) {
		return personDao.selectLogo(userId);
	}

	public List<dataDictionaryPojo> selectdataDictionaryList() {
		return personDao.selectdataDictionaryList();
	}

	public void updateDictionary(dataDictionaryPojo data) {
		personDao.updateDictionary(data);
	}

	public List<rolePojo> selectRoleList(Map<String, Object> maps) {
		return personDao.selectRoleList(maps);
	}

	public int selectRoleListTotal() {
		return personDao.selectRoleListTotal();
	}

	public companyPojo selectCompanyById(String id) {
		return personDao.selectCompanyById(id);
	}

	public void updateCompanyInfo(companyPojo company) {
		personDao.updateCompanyInfo(company);
		
	}

	public List<userVO> selectUserList(Map<String, Object> maps) {
		return personDao.selectUserList(maps);
	}

	public int selectUserListTotal(Map<String, Object> maps) {
		return personDao.selectUserListTotal(maps);
	}

	public List<departmentPojo> selectDepartmentByCompany(String companyUUID) {
		return personDao.selectDepartmentByCompany(companyUUID);
	}

	public void insertDepartment(departmentPojo department) {
		personDao.insertDepartment(department);		
	}

	public List<companyPojo> selectAllCompany() {
		return personDao.selectAllCompany();
	}

	public void insertUserInfo(userLoginPojo user) {
		personDao.insertUserInfo(user);		
	}

	public void deleteUser(String userUUID) {
		personDao.deleteUser(userUUID);		
	}

	public void updateUserLogin(userLoginPojo user) {
		personDao.updateUserLogin(user);
	}

	public void insertLogo(logoPojo l) {
		personDao.insertLogo(l);
	}

	

}
