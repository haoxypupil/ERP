package com.zb.service;

import java.util.List;
import com.zb.entity.Role;

public interface RoleService {
	
	
	/**
	 * Ȩ�޹���Ȩ����ϲ�ѯ�ӷ�ҳչʾ���������map��װ
	 * @param map
	 * @return
	 */
	public List<Role> findRolelist(String rolename,int index,int size);
	
	//��������Ŀ��
	public int findRoleCount(String rolename);
	
	
	/**
	 * Ȩ�޹���������ɫ
	 * @param role
	 */
	public void addRole(Role role);
	
	
	/**
	 * Ȩ�޹��� ���༭��ɫ
	 * @param role
	 */
	public void updateRole(Role role);
	
	
	/**
	 * Ȩ�޹��� �� ɾ����ɫ
	 * @param rid
	 */
	public void delRole(Integer rid);
	
	/**
	 * �������ֲ���roleId(�����м����)
	 * @param roleName
	 * @return
	 */
	public void findRoleByRoleName(Role role);
	
	/**
	 * ��֤�û����Ƿ����
	 * @param rolename
	 * @return
	 */
	public Integer nameCheck(String rolename);
	
	/**
	 * ����id����role��Ӧrights
	 * @param rid
	 * @return
	 */
	public Role findRoleById(Integer rid);
}
