package com.thegutsyninjas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class SQLManager {

	public static Connection openConnection()
	{
		Connection conn = null;
		String url = "jdbc:mysql://sql6.freesqldatabase.com:3306/"; 
		String dbName = "sql694689"; 
		String driver = "com.mysql.jdbc.Driver"; 
		String userName = "sql694689"; 
		String password = "cL2*kD4*"; 
			try { 
				Class.forName(driver).newInstance(); 
				conn = DriverManager.getConnection(url+dbName,userName,password); 
			} catch (Exception e) { 
				e.printStackTrace(); 
			}
			
			return conn;
	}
	
	public static  void closeConnection(Connection conn){
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
