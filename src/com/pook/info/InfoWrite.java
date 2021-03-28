package com.pook.info;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pook.common.DBConnector;
import com.pook.vo.BoardVO;

/**
 * Servlet implementation class InfoWrite
 */
public class InfoWrite extends HttpServlet {
	Connection con;
	PreparedStatement pstmt=null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == "" || session.getAttribute("user_id") == null ){
			out.println("<script type='text/JavaScript'>");
			out.println("alert('로그인이 필요한 서비스 입니다.');");
			out.println("location.href='/InfoList';");
			out.println("</script>");
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/info/write.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    request.setCharacterEncoding("utf-8");
	    
		boardSave(request, response);
	}

	public void boardSave(HttpServletRequest request, HttpServletResponse response) {
		int result=0;
		
		String title = request.getParameter("title").toString();
		String contents = request.getParameter("board_contents").toString();
		
		DBConnector connector = new DBConnector();	
		con = connector.DBCon();
		try {
			PrintWriter out = response.getWriter();
			
			String query = "insert into board (gubun,title,contents,write_date) values ('info','"+title+"', '"+contents+"', SYSDATE())";
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
				out.println("alert('글등록에 실패하였습니다.');");
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
