package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Role;

public interface RoleMapper {
	
	/**
	 * ��¼��
	 * @param rid
	 * @return
	 */
	public Role getRoleInfo(int rid);
	
	
	/**
	 * Ȩ�޹���Ȩ����ϲ�ѯ�ӷ�ҳչʾ���������map��װ
	 * @param map
	 * @return
	 */
	public List<Role> findRolelist(Map<String,Object> map);
	
	//��������Ŀ��
	public int findRoleCount(Map<String,Object> map);
	
	
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
	public Integer findRoleByRoleName(String rolename);
	
	/**
	 * ����id����role��Ӧrights
	 * @param rid
	 * @return
	 */
	public Role findRoleById(Integer rid);
	
	/**
	 * ��֤�û��� �Ƿ����
	 * @param rolename
	 * @return
	 */
	public Integer nameCheck(String rolename);
}
