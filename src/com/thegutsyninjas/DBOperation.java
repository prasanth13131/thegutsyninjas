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
	
	public List<LinkedHashMap<String,String>> getEngineers(String type)

	{
		List<LinkedHashMap<String,String>> engineers=new ArrayList<LinkedHashMap<String,String>>();
		String query="SELECT RECORD_ID,FIRST_NAME,LAST_NAME,EXPERT_IN,LATITUDE,LONGITUDE,STATUS FROM ENGINEER";
		if(type.equalsIgnoreCase("FIOS"))
		{
			query+=" WHERE EXPERT_IN='FIOS'";
		}
		else if(type.equalsIgnoreCase("TV"))
		{
			query+=" WHERE EXPERT_IN='TV'";
		}
		else if(type.equalsIgnoreCase("VOICE"))
		{
			query+=" WHERE EXPERT_IN='VOICE'";
		}
		else if(type.equalsIgnoreCase("INTE"))
		{
			query+=" WHERE EXPERT_IN='INTE'";
		}
		Connection conn = SQLManager.openConnection();
		try {
			System.out.println("conn  ==>"+conn);
			Statement st = conn.createStatement(); 
			System.out.println("st  ==>"+st);
			System.out.println("Query ==>"+query);
			ResultSet res = st.executeQuery(query); 
			System.out.println("res  ==>"+res);
			
			while (res!=null&&res.next()) { 
				LinkedHashMap<String,String> rowdata=new LinkedHashMap<String,String>();
				rowdata.put("ID",res.getString("RECORD_ID"));
				System.out.println(res.getString("RECORD_ID"));
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
	
	public String getRequest(){
		String reqid = null;
		Connection conn = SQLManager.openConnection();
		try {
			Statement st = conn.createStatement(); 
			ResultSet res = st.executeQuery("SELECT REQUEST_ID FROM REQUEST WHERE IS_ACCEPTED='N'"); 
			while (res.next()) { 
				reqid = res.getString("REQUEST_ID");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			SQLManager.closeConnection(conn);
		}
		return reqid;
	}
	
	public List<LinkedHashMap<String,String>> getCustomers(String type,String id)

	{
		List<LinkedHashMap<String,String>> customers=new ArrayList<LinkedHashMap<String,String>>();
		String query="SELECT REQUEST_ID,CUSTOMER_ID,ENGINEER_ID,IS_ACCEPTED,REQUEST_TIME,EXPERT_IN,CUSTOMER_LAT,CUSTOMER_LONG FROM REQUEST";
		if(type.equalsIgnoreCase("N"))
		{
			query+=" WHERE IS_ACCEPTED='N'";
		}
		else if(type.equalsIgnoreCase("Y"))
		{
			query+=" WHERE IS_ACCEPTED='Y' AND ENGINEER_ID='"+id+"'";
		}
		else if(type.equalsIgnoreCase("A"))
		{
			query+=" WHERE IS_ACCEPTED='A' AND ENGINEER_ID='"+id+"'";
		}
		else if(type.equalsIgnoreCase("C"))
		{
			query+=" WHERE IS_ACCEPTED='C'";
		}
		Connection conn = SQLManager.openConnection();
		try {
			System.out.println("conn  ==>"+conn);
			Statement st = conn.createStatement(); 
			System.out.println("st  ==>"+st);
			System.out.println("Query ==>"+query);
			ResultSet res = st.executeQuery(query); 
			System.out.println("res  ==>"+res);
			
			while (res!=null&&res.next()) { 
				LinkedHashMap<String,String> rowdata=new LinkedHashMap<String,String>();
				rowdata.put("REQUEST_ID",res.getString("REQUEST_ID"));
				System.out.println(res.getString("REQUEST_ID"));
				rowdata.put("CUSTOMER_ID",res.getString("CUSTOMER_ID"));
				rowdata.put("ENGINEER_ID",res.getString("ENGINEER_ID"));
				rowdata.put("IS_ACCEPTED",res.getString("IS_ACCEPTED"));
				rowdata.put("REQUEST_TIME",res.getString("REQUEST_TIME"));
				rowdata.put("EXPERT_IN",res.getString("EXPERT_IN"));
				rowdata.put("CUSTOMER_LAT",res.getString("CUSTOMER_LAT"));
				rowdata.put("CUSTOMER_LONG",res.getString("CUSTOMER_LONG"));
				customers.add(rowdata);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			SQLManager.closeConnection(conn);
		}
		return customers;
	}
	
	
}
