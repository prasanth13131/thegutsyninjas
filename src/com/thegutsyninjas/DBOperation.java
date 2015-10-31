package com.thegutsyninjas;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	public String getRequestOfCustomerID(String custid){
		String reqid = null;
		Connection conn = SQLManager.openConnection();
		try {
			Statement st = conn.createStatement(); 
			ResultSet res = st.executeQuery("SELECT REQUEST_ID FROM REQUEST WHERE IS_ACCEPTED='N' AND CUSTOMER_ID='"+custid+"'"); 
			while (res.next()) { 
				reqid = res.getString("REQUEST_ID");
				System.out.println("Req ID: "+ reqid);
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
	
	public int getRequestId(){
		int id = 0;
		Connection conn = SQLManager.openConnection();
		try {

			Statement st = conn.createStatement(); 
			ResultSet res = st.executeQuery("SELECT MAX(REQUEST_ID)+1 FROM REQUEST"); 
			while (res.next()) { 
				id = res.getInt(1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
		return id;
	}
	
	public int insertRequest(String custId,String expertIn,String _lat,String _long){
	
		int reqId = getRequestId();
		Connection conn = SQLManager.openConnection();
		try {
			Statement st = conn.createStatement(); 
			String sql="INSERT INTO REQUEST(REQUEST_ID,CUSTOMER_ID,EXPERT_IN,CUSTOMER_LAT,CUSTOMER_LONG)VALUES("+reqId+","+custId+",'"+expertIn+"','"+_lat+"','"+_long+"')";
			boolean res = st.execute(sql);
			System.out.println("request inserted : "+res);
		} catch (Exception e) {
			e.printStackTrace();
			reqId=0;
			
		}finally{
			SQLManager.closeConnection(conn);
		}
		
		return reqId;
	}
	
	public int getActiveCustomersCount(String engid){
		int id = 0;
		Connection conn = SQLManager.openConnection();
		try {

			Statement st = conn.createStatement(); 
			ResultSet res = st.executeQuery("SELECT COUNT(CUSTOMER_ID) FROM REQUEST WHERE IS_ACCEPTED='A' AND ENGINEER_ID='"+engid+"'"); 
			while (res.next()) { 
				id = res.getInt(1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
		return id;
	}
	public int getQueueCustomersCount(String engid){
		int id = 0;
		Connection conn = SQLManager.openConnection();
		try {

			Statement st = conn.createStatement(); 
			ResultSet res = st.executeQuery("SELECT COUNT(CUSTOMER_ID) FROM REQUEST WHERE IS_ACCEPTED='Y' AND ENGINEER_ID='"+engid+"'"); 
			while (res.next()) { 
				id = res.getInt(1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
		return id;
	}
	public int getNewCustomersCount(String engid){
		int id = 0;
		Connection conn = SQLManager.openConnection();
		try {

			Statement st = conn.createStatement(); 
			ResultSet res = st.executeQuery("SELECT COUNT(CUSTOMER_ID) FROM REQUEST WHERE IS_ACCEPTED='N'"); 
			while (res.next()) { 
				id = res.getInt(1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
		return id;
	}
	
	public void updateEngPosition(String eid,String lat,String longi){
		Connection conn = SQLManager.openConnection();
		try {
			String query="UPDATE ENGINEER SET LATITUDE=? , LONGITUDE=? WHERE RECORD_ID=?";
			PreparedStatement preparedStmt = conn.prepareStatement(query); 
	     
		      preparedStmt.setString(1, lat);
		      preparedStmt.setString(2, longi);
		      preparedStmt.setString(3, longi);
		      
		      System.out.println(preparedStmt.executeUpdate());

			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
	}
	
	public void clearRequestTable(){
		Connection conn = SQLManager.openConnection();
		try {

			Statement st = conn.createStatement(); 
			boolean res = st.execute("DELETE FROM REQUEST"); 
			System.out.println("Delete Status: "+res);
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
	}
	
	public void updateRequestStatus(String reqid, String status){
		Connection conn = SQLManager.openConnection();
		try {
			String query="UPDATE REQUEST SET IS_ACCEPTED=? WHERE REQUEST_ID=?";
			PreparedStatement preparedStmt = conn.prepareStatement(query); 
	     
		      preparedStmt.setString(1, status);
		      preparedStmt.setString(2, reqid);
		      
		      
		      System.out.println(preparedStmt.executeUpdate());
		      
		      
//			Statement st = conn.createStatement(); 
//			boolean res = st.execute("UPDATE REQUEST SET IS_ACCEPTED='"+status+"' WHERE REQUEST_ID='"+reqid+"'"); 
//			System.out.println("Customer Update Status: "+res);
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
	}
	
	public void updateRequestStatus(String reqid, String status, String eid){
		Connection conn = SQLManager.openConnection();
		try {
			String query="UPDATE REQUEST SET IS_ACCEPTED=?, ENGINEER_ID=? WHERE REQUEST_ID=?";
			PreparedStatement preparedStmt = conn.prepareStatement(query); 
	     
		      preparedStmt.setString(1, status);
		      preparedStmt.setString(2, eid);
		      preparedStmt.setString(3, reqid);
		      
		      
		      System.out.println(preparedStmt.executeUpdate());
		      
		      
//			Statement st = conn.createStatement(); 
//			boolean res = st.execute("UPDATE REQUEST SET IS_ACCEPTED='"+status+"' WHERE REQUEST_ID='"+reqid+"'"); 
//			System.out.println("Customer Update Status: "+res);
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			SQLManager.closeConnection(conn);
		}
	}
	
}
