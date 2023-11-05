package com.semi.board.model.service;


import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.model.dao.BoardDao;
import com.semi.board.model.vo.Board;
import com.semi.common.model.vo.Attachment;
import com.semi.common.model.vo.PageInfo;

public class BoardService {
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThumbnailList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectNotBuyListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectMyBoardList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectMyBoardList(conn ,pi);
		
		close(conn);
		return list;
	}
	public ArrayList<Board> selectBoardList(int boardWriter){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectBoardList(conn,boardWriter);
		close(conn);
		return list;
	}
	public ArrayList<Board> selectSellBoardList(int boardWriter){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectSellBoardList(conn,boardWriter);
		close(conn);
		return list;
	}

	public int insertBoard(Board b, ArrayList<Attachment> list) {
	      Connection conn = getConnection();
	      
	      int result1 = new BoardDao().insertBoard(conn, b);
	      int result2 = new BoardDao().insertAttachmentList(conn, list);
	      
	      
	      System.out.println(result1);
	      System.out.println(result2);
	      if (result1 > 0 && result2 > 0) {
	         commit(conn);
	      } else {
	         rollback(conn);
	      }
	      
	      close(conn);
	      
	      return result1 * result2;
	   }
	
	public ArrayList<Board> selectAllBoardList(PageInfo pi){
	      Connection conn = getConnection();
	      
	      ArrayList<Board> list = new BoardDao().selectAllBoardList(conn, pi);
	      
	      close(conn);
	      System.out.println(list);
	      return list;
	   }
	
	  public int selectBoardListCount() {
	      Connection conn = getConnection();
	      
	      int boardListCount = new BoardDao().selectBoardListCount(conn);
	      
	      close(conn);
	      
	      return boardListCount;
	   }
	  
	  public ArrayList<Board> ajaxSelectMyBoardList(int boardWriter){
	      Connection conn = getConnection();
	      
	      ArrayList<Board> list = new BoardDao().ajaxSelectMyBoardList(conn, boardWriter);
	      
	      close(conn);

	      return list;
	  }
	  
	  
	  public ArrayList<Board> ajaxSelectMyAllBoardList(int boardWriter){
	      Connection conn = getConnection();
	      
	      ArrayList<Board> list = new BoardDao().ajaxSelectMyAllBoardList(conn, boardWriter);
	      
	      close(conn);

	      return list;
	  }
	  
	   
}
