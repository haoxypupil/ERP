package com.zb.mapper;

import java.util.List;
import java.util.Map;
import com.zb.entity.Users;	

public interface UserMapper {
	
	//登录方法
	public Users findUserLogin(Map<String, Object> map);
	
	
	/**
	 * 查询所有用户展示加分页
	 * @param map
	 * @return
	 */
	public List<Users> findUserlist(Map<String,Object> map);
	
	//计算总条目数
	public int findUserCount(Map<String,Object> map);
	
	
	/**
	 * 权限管理：新增用户
	 * @param users
	 */
	public int addUser(Users users);
	
	
	/**
	 * 权限管理 ：编辑用户
	 * @param users
	 */
	public int updateUser(Users users);
	
	
	/**
	 * 权限管理 ： 删除用户
	 * @param uid  
	 */
	public void delUser(Integer uid);
	
	/**
	 * 根据id查找
	 * @param uid
	 * @return
	 */
	public Users findUserById(Integer uid);
	
	/**
	 * 验证用户名是否存在
	 * @param name
	 * @return
	 */
	public int userNameChecked(String uname);
}
