package com.thegutsyninjas;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;


public class DBOperation {

	public String getCustomerName(){
		String name = null;
		Connection conn = SQLManager.openConnection();
		try {
			System.out.println("conn  ==>"+conn);
			Statement st = conn.createStatement(); 
			System.out.println("st  ==>"+st);
			ResultSet res = st.executeQuery("SELECT FIRST_NAME FROM CUSTOMER WHERE RECORD_ID=1"); 
			System.out.println("res  ==>"+res);
			while (res.next()) { 
				name = res.getString("FIRST_NAME");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			SQLManager.closeConnection(conn);
		}
		return name;
	}
	
	public List<LinkedHashMap<String,String>> getEngineers()

	{
		List<LinkedHashMap<String,String>> engineers=new ArrayList<LinkedHashMap<String,String>>();
		
		Connection conn = SQLManager.openConnection();
		try {
			System.out.println("conn  ==>"+conn);
			Statement st = conn.createStatement(); 
			System.out.println("st  ==>"+st);
			ResultSet res = st.executeQuery("SELECT RECORD_ID,FIRST_NAME,LAST_NAME,EXPERT_IN,LATITUDE,LONGITUDE,STATUS FROM ENGINEER WHERE RECORD_ID=1"); 
			System.out.println("res  ==>"+res);
			LinkedHashMap<String,String> rowdata=new LinkedHashMap<String,String>();
			while (res!=null&&res.next()) { 
				rowdata.put("ID",res.getString("RECORD_ID"));
				rowdata.put("FIRST_NAME",res.getString("FIRST_NAME"));
				rowdata.put("LAST_NAME",res.getString("LAST_NAME"));
				rowdata.put("EXPERT_IN",res.getString("EXPERT_IN"));
				rowdata.put("LATITUDE",res.getString("LATITUDE"));
				rowdata.put("LONGITUDE",res.getString("LONGITUDE"));
				rowdata.put("STATUS",res.getString("STATUS"));
				engineers.add(rowdata);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			SQLManager.closeConnection(conn);
		}
		return engineers;
	}
	
	
	
}
