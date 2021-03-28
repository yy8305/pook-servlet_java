package com.pook.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DBConnector {
	public Connection DBCon() {
		Connection con = null;
		
		String url = "jdbc:mysql://<db host>:<db port>/<db name>?useUnicode=true&characterEncoding=euckr";
		String id = "<db username>";
		String pwd = "<db password>";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, id, pwd);
			if(con == null) {
				System.out.println("JDBC Connection Fail!!");
			}else {
				System.out.println("JDBC Connection Success!!");
				
				return con;
			}
			Statement  stmt = con.createStatement();
			
			stmt.execute("SET CHARACTER SET euckr");
			stmt.execute("set names euckr");  
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void ConnectorClose(Connection con, PreparedStatement pstmt) {
		try {
			if(con == null) {
				System.out.println("접속된 Connection이 없습니다.");
			}else {
				con.close();
				System.out.println("접속된 Connection을 종료 하였습니다.");
			}
			
			if(pstmt == null) {
				System.out.println("접속된 PreparedStatement이 없습니다.");
			}else {
				pstmt.close();
				System.out.println("접속된 PreparedStatement을 종료 하였습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}