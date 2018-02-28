package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Contract;

public interface ContractMapper {
	
	//��ѯ
	public List<Contract> findContractList(Map<String , Object> map);
	
	public int findContractCount(Map<String , Object> map);
	
	//���
	public void addContract(Contract contract);
	
	//�޸Ŀ�Ʊ�͸��λ
	public void updateUnit(Contract contract);
	
	//��ѯ�ɿ���Ʊ��ͬ��Ϣ
	public List<Contract> findInvoidceList(Map<String , Object> map);
	
	public int findInvoiceCount(Map<String,Object> map);
	
	//�޸Ŀ�Ʊ״̬���п�Ʊ����
	public void updateInvoiceStatus(Contract contract);
	
	//��Ʊ�޸���Ʊ״̬Ϊ0
	public void updateInvoiceStatusTo0(Contract contract);
	
	//��ѯ���տ���Ϣ
	public List<Contract> findCollectionList(Map<String, Object> map);
	
	public int findCollectionCount(Map<String ,Object> map);
	
	//�տ����
	public void updateCollectionStatus(Contract contract);
	
	//��ʱ���µķ���
	public void updateJob(int Mouth);
	
	//��ʱ��
	public List<Contract>  findStatusInfoList(Map<String, Object> map); 
}
