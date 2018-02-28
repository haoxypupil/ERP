package com.zb.service;

import java.util.List;
import com.zb.entity.Role;

public interface RoleService {
	
	
	/**
	 * 权限管理：权限组合查询加分页展示，传入参数map封装
	 * @param map
	 * @return
	 */
	public List<Role> findRolelist(String rolename,int index,int size);
	
	//计算总条目数
	public int findRoleCount(String rolename);
	
	
	/**
	 * 权限管理：新增角色
	 * @param role
	 */
	public void addRole(Role role);
	
	
	/**
	 * 权限管理 ：编辑角色
	 * @param role
	 */
	public void updateRole(Role role);
	
	
	/**
	 * 权限管理 ： 删除角色
	 * @param rid
	 */
	public void delRole(Integer rid);
	
	/**
	 * 根据名字查找roleId(新增中间表用)
	 * @param roleName
	 * @return
	 */
	public void findRoleByRoleName(Role role);
	
	/**
	 * 验证用户名是否存在
	 * @param rolename
	 * @return
	 */
	public Integer nameCheck(String rolename);
	
	/**
	 * 根据id查找role对应rights
	 * @param rid
	 * @return
	 */
	public Role findRoleById(Integer rid);
}
