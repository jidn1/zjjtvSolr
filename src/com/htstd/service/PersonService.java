package com.htstd.service;

import java.util.List;
import java.util.Map;

import com.htstd.VO.userVO;
import com.htstd.domain.companyPojo;
import com.htstd.domain.dataDictionaryPojo;
import com.htstd.domain.departmentPojo;
import com.htstd.domain.logoPojo;
import com.htstd.domain.rolePojo;
import com.htstd.domain.userLoginPojo;

public interface PersonService {
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @param donainId 
	 * @return
	 * @throws Exception
	 */
	public userLoginPojo findUserLogin(String username, String password, String donainId) throws Exception;
	/**
	 * 查询权限
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public String getPermissionsByGroupIds(String[] str) throws Exception;
	/**
	 *  修改用户logo
	 * @param l
	 */
	public void updateLogo(logoPojo l);
	/**
	 *  添加用户logo
	 * @param l
	 */
	public void insertLogo(logoPojo l);
	/**
	 * 查看用户logo
	 * @param userId
	 * @return
	 */
	public logoPojo selectLogo(String userId);
	/**
	 * 查看数据字典列表
	 * @return
	 */
	public List<dataDictionaryPojo> selectdataDictionaryList();
	/**
	 * 更改数据字典状态
	 * @param data
	 */
	public void updateDictionary(dataDictionaryPojo data);
	/**
	 * 查询角色列表
	 * @param maps
	 * @return
	 */
	public List<rolePojo> selectRoleList(Map<String,Object> maps);
	/**
	 * 查询角色列表总行数
	 * @param maps
	 * @return
	 */
	public int selectRoleListTotal();
	/**
	 * 查看客户基本信息
	 * @param company
	 */
	public companyPojo selectCompanyById(String id);
	/**
	 * 编辑基本信息
	 * @param company
	 */
	public void updateCompanyInfo(companyPojo company);
	/**
	 * 查询用户list
	 * @return
	 */
	public List<userVO> selectUserList(Map<String,Object> maps);
	/**
	 * 查询用户总行数
	 * @return
	 */
	public int selectUserListTotal(Map<String,Object> maps);
	/**
	 * 根据客户查询部门
	 * @return
	 */
	public List<departmentPojo> selectDepartmentByCompany(String companyUUID);
	/**
	 * 添加部门信息
	 * @param department
	 */
	public void insertDepartment(departmentPojo department);
	/**
	 * 查看所有客户信息
	 * @param company
	 */
	public List<companyPojo> selectAllCompany();
	/**
	 * 添加用户
	 * @param company
	 */
	public void insertUserInfo(userLoginPojo user);
	/**
	 * 删除用户
	 * @param company
	 */
	public void deleteUser(String userUUID);
	/**
	 * 更改用户
	 * @param company
	 */
	public void updateUserLogin(userLoginPojo user);
	
}
