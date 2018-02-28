package com.zb.service;



import java.util.List;

import com.zb.entity.Users;

public interface UserService {
	
	/**
	 * 登录
	 * @param uname
	 * @param upwd
	 * @return
	 */
	public Users findUserLogin(String uname,String upwd);
	
	/**
	 * 对用户分页展示，组合查询
	 * @param page
	 * @param rows
	 * @param uname
	 * @return
	 */
	public List<Users> findUserlist(Integer index,Integer size,String uname,String username);
	
	//计算总数
	public Integer findUserCount(String uname,String username);
	
	/**
	 * 新增用户
	 * @param user
	 * @return 
	 */
	public int addUser(Users users);
	
	/**
	 * 更新用户
	 * @param user
	 * @return 
	 */
	public void updateUser(Users users);
	
	/**
	 * 删除用户
	 * @param uid
	 */
	public void delUser(Integer uid);
	
	/**
	 * 根据id查找用户
	 * @param uid
	 * @return
	 */
	public Users findUserByid(Integer uid);
	
	/**
	 * 验证用户名是否存在
	 * @param name
	 * @return
	 */
	public int userNameChecked(String name);
}
