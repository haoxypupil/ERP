package com.zb.service;

import java.util.List;
import java.util.Map;

import com.zb.entity.Contract;

public interface ContractService {

	// ��ѯ
	public List<Contract> findContractList(String conCode, String conName,
			String conTimefrom, String conTimeto, String conLinkman,
			String conCycle, String conUnit, String conInvoice,
			String conPayunit, String conInvoicestatus, String conCollection,
			int index, int size);

	public int findContractCount(String conCode, String conName,
			String conTimefrom, String conTimeto, String conLinkman,
			String conCycle, String conUnit, String conInvoice,
			String conPayunit, String conInvoicestatus, String conCollection);

	// ���
	public void addContract(Contract contract);

	// �޸Ŀ�Ʊ�͸��λ
	public void updateUnit(Contract contract);

	// ��ѯ�ɿ���Ʊ��ͬ��Ϣ
	public List<Contract> findInvoidceList(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit, int index,
			int size);
	
	public int findInvoiceCount(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit);
	
	//�޸Ŀ�Ʊ״̬���п�Ʊ����
	public void updateInvoiceStatus(Contract contract);
	
	//��Ʊ�޸���Ʊ״̬Ϊ0
	public void updateInvoiceStatusTo0(Contract contract);
	
	//��ѯ���տ���Ϣ
	public List<Contract> findCollectionList(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit, int index,
			int size);
	
	public int findCollectionCount(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit);
	
	//�տ����
	public void updateCollectionStatus(Contract contract);

/*
	public void updateJob(int Month);
	*/
	//��ʱ��
	public  List<Contract> findStatusInfoList(int Month); 
	

}
