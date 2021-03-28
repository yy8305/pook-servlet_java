package com.pook.review;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pook.common.DBConnector;
import com.pook.vo.BoardVO;

public class ReviewList extends HttpServlet {
	Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<BoardVO> boardList = getBoardList(request,response);
		request.setAttribute("BoardList", boardList);
		if(request.getParameter("words") != null) {
			request.setAttribute("words", request.getParameter("words").toString());
		}
		if(request.getParameter("conditions") != null) {
			request.setAttribute("conditions", request.getParameter("conditions").toString());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/review/list.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public ArrayList<BoardVO> getBoardList(HttpServletRequest request, HttpServletResponse response){
		
		DBConnector connector = new DBConnector();	
		con = connector.DBCon();
		
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		
		try {
			String query = "select * from board where 1=1 and gubun = 'review'";
			if(request.getParameter("words") != null) {
				if(!request.getParameter("words").toString().equals("")) {
					String words = request.getParameter("words").toString();
					if(request.getParameter("conditions").toString().equals("title")) {
						query += " and title like '%"+words+"%'";
					}else if(request.getParameter("conditions").toString().equals("content")) {
						query += " and contents like '%"+words+"%'";
					}
				}
			}
			query += " order by idx desc";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO boardVo = new BoardVO();
				
				boardVo.setIdx(rs.getInt("idx"));
				boardVo.setGubun(rs.getString("gubun"));
				boardVo.setTitle(rs.getString("title"));
				boardVo.setContents(rs.getString("contents"));
				boardVo.setWrite_date(rs.getDate("write_date"));
				
				boardList.add(boardVo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			connector.ConnectorClose(con, pstmt);
		}
		return boardList;
	}
}
