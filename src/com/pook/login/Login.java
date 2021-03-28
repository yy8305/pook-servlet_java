package com.pook.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pook.common.DBConnector;

public class Login extends HttpServlet {
	Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login/login.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id").toString();
		String pwd = request.getParameter("pwd").toString();
		
		DBConnector connector = new DBConnector();	
		con = connector.DBCon();
		try {
			PrintWriter out = response.getWriter();
			
			String query = "select * from user where USER_ID='"+id+"' and USER_PASS=PASSWORD('"+pwd+"')";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user_id", id);
                
				out.println("<script type='text/JavaScript'>");
				out.println("alert('로그인에 성공하였습니다.');");
				out.println("location.href='/Main';");
				out.println("</script>");
			}else {
				out.println("<script type='text/JavaScript'>");
				out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.');");
				out.println("location.href='/login';");
				out.println("</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			connector.ConnectorClose(con, pstmt);
		}
		
		
	}

}
