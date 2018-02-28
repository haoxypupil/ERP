package com.zb.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

public class CSVBean {
	
	/**
	 * ����.CSV
	 * @param file    csv�ļ�(·��+�ļ���)��csv�ļ������ڻ��Զ�����
	 * @param dataList  ����
	 * @return
	 */
	public static boolean exportCsv(File file,List<String> dataList){
		boolean isSuccess = false;
		
		FileOutputStream out = null;
		OutputStreamWriter osw = null;
		BufferedWriter bw = null;
		
		
		try {
			out = new FileOutputStream(file);
			osw = new OutputStreamWriter(out);
			bw = new BufferedWriter(osw);
			if(dataList !=null &&!dataList.isEmpty()){
				for(String data : dataList){
					bw.append(data).append("\r");	
				}
			}
			isSuccess = true;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			isSuccess = false;
		}finally{
				if(bw !=null){
					try {
						bw.close();
						bw=null;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				}
				if(osw !=null){
					try {
						osw.close();
						osw = null;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(out !=null){
					try {
						out.close();
						out = null;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				}
		}
		
		return isSuccess;
	}
	
	public static List<String> importCsv(File file){
			List<String> dataList = new ArrayList<String>();
			
			BufferedReader br = null;
			
			try {
				br = new BufferedReader(new FileReader(file));
				String line = "";
				while((line = br.readLine()) !=null){
						dataList.add(line);
				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(br !=null){
					try {
						br.close();
						br = null;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			return dataList;
	}
}
