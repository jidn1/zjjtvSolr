package com.htstd.domain;

/**
 * 
 * @描述 权限类 
 * @author 吉德宁
 * @日期 2017年7月12日
 *
 */
public class rolePojo {

	public rolePojo(){}
	
	
	
	private int roleId;//主键
	private String roleName;//角色名称
	private String rolePermission;//角色权限
	
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRolePermission() {
		return rolePermission;
	}
	public void setRolePermission(String rolePermission) {
		this.rolePermission = rolePermission;
	}
	
	
	
}
