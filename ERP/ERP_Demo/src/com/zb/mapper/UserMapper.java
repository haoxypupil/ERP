package com.zb.mapper;

import java.util.List;
import java.util.Map;
import com.zb.entity.Users;	

public interface UserMapper {
	
	//��¼����
	public Users findUserLogin(Map<String, Object> map);
	
	
	/**
	 * ��ѯ�����û�չʾ�ӷ�ҳ
	 * @param map
	 * @return
	 */
	public List<Users> findUserlist(Map<String,Object> map);
	
	//��������Ŀ��
	public int findUserCount(Map<String,Object> map);
	
	
	/**
	 * Ȩ�޹��������û�
	 * @param users
	 */
	public int addUser(Users users);
	
	
	/**
	 * Ȩ�޹��� ���༭�û�
	 * @param users
	 */
	public int updateUser(Users users);
	
	
	/**
	 * Ȩ�޹��� �� ɾ���û�
	 * @param uid  
	 */
	public void delUser(Integer uid);
	
	/**
	 * ����id����
	 * @param uid
	 * @return
	 */
	public Users findUserById(Integer uid);
	
	/**
	 * ��֤�û����Ƿ����
	 * @param name
	 * @return
	 */
	public int userNameChecked(String uname);
}
