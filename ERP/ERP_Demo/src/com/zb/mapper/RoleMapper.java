package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Role;

public interface RoleMapper {
	
	/**
	 * 登录，
	 * @param rid
	 * @return
	 */
	public Role getRoleInfo(int rid);
	
	
	/**
	 * 权限管理：权限组合查询加分页展示，传入参数map封装
	 * @param map
	 * @return
	 */
	public List<Role> findRolelist(Map<String,Object> map);
	
	//计算总条目数
	public int findRoleCount(Map<String,Object> map);
	
	
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
	public Integer findRoleByRoleName(String rolename);
	
	/**
	 * 根据id查找role对应rights
	 * @param rid
	 * @return
	 */
	public Role findRoleById(Integer rid);
	
	/**
	 * 验证用户名 是否存在
	 * @param rolename
	 * @return
	 */
	public Integer nameCheck(String rolename);
}
