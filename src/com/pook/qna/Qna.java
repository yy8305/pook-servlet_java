package com.pook.qna;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pook.common.DBConnector;

public class Qna extends HttpServlet {
	Connection con;
	PreparedStatement pstmt=null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/qna/qna.jsp");
		dispatcher.forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    request.setCharacterEncoding("utf-8");
	    
		boardSave(request, response);
	}

	public void boardSave(HttpServletRequest request, HttpServletResponse response) {
		int result=0;
		
		String name = request.getParameter("name").toString();
		String phone = request.getParameter("phone").toString();
		String email = request.getParameter("email").toString();
		String title = request.getParameter("title").toString();
		String contents = request.getParameter("contents").toString();
		
		DBConnector connector = new DBConnector();	
		con = connector.DBCon();
		try {
			PrintWriter out = response.getWriter();
			
			String query = "insert into qna (name,phone,email,title,contents,qna_date) values ('"+name+"', '"+phone+"', '"+email+"', '"+title+"', '"+contents+"', SYSDATE())";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				out.println("<script type='text/JavaScript'>");
				out.println("alert('정상 등록되었습니다.');");
				out.println("location.href='/InfoList';");
				out.println("</script>");
			}else {
				out.println("<script type='text/JavaScript'>");
				out.println("alert('등록에 실패하였습니다.');");
				out.println("location.href='/InfoList';");
				out.println("</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			connector.ConnectorClose(con, pstmt);
		}
	}
}
