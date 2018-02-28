package com.zb.service;



import java.util.List;

import com.zb.entity.Users;

public interface UserService {
	
	/**
	 * ��¼
	 * @param uname
	 * @param upwd
	 * @return
	 */
	public Users findUserLogin(String uname,String upwd);
	
	/**
	 * ���û���ҳչʾ����ϲ�ѯ
	 * @param page
	 * @param rows
	 * @param uname
	 * @return
	 */
	public List<Users> findUserlist(Integer index,Integer size,String uname,String username);
	
	//��������
	public Integer findUserCount(String uname,String username);
	
	/**
	 * �����û�
	 * @param user
	 * @return 
	 */
	public int addUser(Users users);
	
	/**
	 * �����û�
	 * @param user
	 * @return 
	 */
	public void updateUser(Users users);
	
	/**
	 * ɾ���û�
	 * @param uid
	 */
	public void delUser(Integer uid);
	
	/**
	 * ����id�����û�
	 * @param uid
	 * @return
	 */
	public Users findUserByid(Integer uid);
	
	/**
	 * ��֤�û����Ƿ����
	 * @param name
	 * @return
	 */
	public int userNameChecked(String name);
}
