package com.thegutsyninjas;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBOperation {

	public String getCustomerName(){
		String name = null;
		Connection conn = SQLManager.openConnection();
		try {
			System.out.println("conn  ==>"+conn);
			Statement st = conn.createStatement(); 
			System.out.println("st  ==>"+st);
			ResultSet res = st.executeQuery("SELECT FIRST_NAME FROM ENGINEER WHERE ID=1"); 
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
}
