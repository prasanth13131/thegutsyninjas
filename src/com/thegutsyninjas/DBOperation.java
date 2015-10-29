package com.thegutsyninjas;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class DBOperation {

	public String getCustomerName(){
		String name = null;
		try {
			Connection conn = SQLManager.openConnection();
			System.out.println("conn  ==>"+conn);
			Statement st = (Statement) conn.createStatement(); 
			System.out.println("st  ==>"+st);
			ResultSet res = st.executeQuery("SELECT FIRST_NAME FROM ENGINEER WHERE ID=1"); 
			System.out.println("res  ==>"+res);
			while (res.next()) { 
				name = res.getString("FIRST_NAME");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
}
