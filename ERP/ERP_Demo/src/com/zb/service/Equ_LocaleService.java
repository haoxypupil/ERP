package com.zb.service;

import java.util.List;

import com.zb.entity.Equ_Locale;

public interface Equ_LocaleService {
	
	//�����豸����
	public void addEquLocale(Equ_Locale equ_Locale);
	
	//��װ�����³�������
	public void implEquLocale(Equ_Locale equ_Locale);
	
	//���·���ʱ�� ����ʱ�䣬�����ˣ���������
	public void reInEquLocale(Equ_Locale equ_Locale);
					
	//��������
	public void backInEqu(Equ_Locale equ_Locale);
	
	//��ѯ����
	public int elCount(Equ_Locale equ_Locale);
	
	//��ѯ�豸��ת��ʷ�����������豸������¼��
	public List<Equ_Locale> findElByEquCode(Equ_Locale equ_Locale);
			
	//��ѯ�豸������¼
	public List<Equ_Locale> findElBackByEquCode(Equ_Locale equ_Locale);
}
