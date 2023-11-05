package com.semi.board.model.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.oreilly.servlet.MultipartRequest;
import com.semi.board.model.vo.Board;
import com.semi.common.model.vo.Attachment;
import com.semi.common.model.vo.PageInfo;

public class BoardDao{
	private Properties prop = new Properties();
	
	public BoardDao() {		//기본생성자
		String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	
	public int selectListCount(Connection conn) {

		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println(listCount);
		return listCount;
		
		
	}
	
	public ArrayList<Board> selectThumbnailList(Connection conn, PageInfo pi){
		Board b = null;
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//System.out.println(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			//System.out.println(startRow);
			//System.out.println(endRow);
			rset = pstmt.executeQuery();
			//System.out.println(rset);
			//System.out.println(rset.next());
			while(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setCreateDate(  rset.getString("create_date"));
				b.setCount(	rset.getInt("count"));
				b.setAmount(rset.getInt("amount"));
				b.setTitleImg(  rset.getString("TITLE_IMG"));
				
				list.add(b);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectNotBuyListCount(Connection conn) {

		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotBuyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(listCount);
		return listCount;
		
		
	}
	public ArrayList<Board> selectMyBoardList (Connection conn, PageInfo pi){
		//select 문 => ResultSet(여러행) => ArrayList<Board>
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			/**
			 * currentPage : 1 => 1 ~ 10
			 * currentPage : 2 => 11~ 20
			 * currentPage : 3 => 21 ~30
			 * 시작값 : (currentPage - 1) * boardLimit + 1
			 * 끝값 : 시작값 + boardLimit - 1
			 */
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(
							rset.getInt("BOARD_NO"),
							rset.getString("BOARD_TITLE"),
							rset.getString("USER_ID"),
							rset.getString("CREATE_DATE"),
							rset.getInt("COUNT"),
							rset.getInt("AMOUNT"),
							rset.getString("sale_yn"),
							rset.getString("TITLE_IMG")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public ArrayList<Board> selectBoardList(Connection conn, int boardWriter){
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("selectBoardList");
		
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardWriter);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Board(rset.getInt("board_no"),
										rset.getString("board_title"),
										rset.getString("board_content"),
										rset.getString("user_id"),
										rset.getString("create_date"),
										rset.getInt("count"),
										rset.getString("status"),
										rset.getInt("amount"),
										rset.getString("title_img"),
										rset.getString("address")
							));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Board> selectSellBoardList(Connection conn, int boardWriter){
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("selectSellBoardList");
		
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardWriter);
	
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Board(rset.getInt("board_no"),
										rset.getString("board_title"),
										rset.getInt("amount"),
										rset.getString("title_img"),
										rset.getString("address")
							));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertBoard(Connection conn, Board b) {
	      int result = 0;
	      
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("insertBoard");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, b.getBoardTitle());
	         pstmt.setInt(2, b.getAmount());

	         pstmt.setString(3, b.getBoardContent());
	         pstmt.setInt(4, Integer.parseInt(b.getBoardWriter()));

	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      return result;
	      
	   }
	
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
	      int result = 0;
	      
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("insertAttachmentList");
	      
	         System.out.println(list);
	         try {
	            
	            for (Attachment at : list) {
	               pstmt = conn.prepareStatement(sql);
	               pstmt.setString(1, at.getOriginName());
	               pstmt.setString(2, at.getChangeName());
	               pstmt.setString(3, at.getFilePath());
	               pstmt.setInt(4, at.getFileLevel());
	               
	               result = pstmt.executeUpdate();
	            }
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(pstmt);
	         }
	         
	      return result;
	   }
	
	public ArrayList<Board> selectAllBoardList(Connection conn, PageInfo pi) {
	      Board b = null;
	      ArrayList<Board> list = new ArrayList<>();
	      
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectAllBoardList");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         //System.out.println(sql);
	         
	         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	         int endRow = startRow + pi.getBoardLimit() -1;
	         
	         pstmt.setInt(1, startRow);
	         pstmt.setInt(2, endRow);
	         //System.out.println(startRow);
	         //System.out.println(endRow);
	         rset = pstmt.executeQuery();
	         //System.out.println(rset);
	         //System.out.println(rset.next());
	         while(rset.next()) {
	            b = new Board();
	            b.setBoardNo(rset.getInt("board_no"));
	            b.setBoardTitle(rset.getString("board_title"));
	            b.setCreateDate(  rset.getString("create_date"));
	            b.setCount(   rset.getInt("count"));
	            b.setAmount(rset.getInt("amount"));
	            b.setTitleImg(  rset.getString("TITLE_IMG"));
	            
	            list.add(b);
	         }
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      //System.out.println(list.size());
	      
	      return list;
	   }
	
	public int selectBoardListCount(Connection conn) {

	      int boardListCount = 0;
	      
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectBoardListCount");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rset = pstmt.executeQuery();
	         
	         if (rset.next()) {
	            boardListCount = rset.getInt("count");
	         }
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      //System.out.println(listCount);
	      return boardListCount;
	      
	      
	   }
	
	public int insertMemberImage(Connection conn, int userNo, MultipartRequest multiRequest ) {
		 int result = 0;
	      
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("insertMemberImage");
	      
	     
	         try {
	               pstmt = conn.prepareStatement(sql);
	               pstmt.setString(1, multiRequest.getOriginalFileName("file"));
	               pstmt.setString(2, multiRequest.getFilesystemName("key"));
	               pstmt.setInt(4, userNo);
	               
	               result = pstmt.executeUpdate();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(pstmt);
	         }
	         
	      return result;
	}
	
	
	public ArrayList<Board> ajaxSelectMyBoardList(Connection conn, int boardWriter){
	      Board b = null;
	      ArrayList<Board> list = new ArrayList<>();
	      
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("ajaxSelectMyBoardList");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, boardWriter);
	         
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            b = new Board();
	            b.setBoardNo(rset.getInt("board_no"));
	            b.setBoardTitle(rset.getString("board_title"));
	            b.setCreateDate(  rset.getString("create_date"));
	            b.setCount(   rset.getInt("count"));
	            b.setAmount(rset.getInt("amount"));
	            b.setAddress(rset.getString("address"));
	            b.setTitleImg(  rset.getString("TITLE_IMG"));
	            
	            list.add(b);
	         }
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	}
	
	
	
	public ArrayList<Board> ajaxSelectMyAllBoardList(Connection conn, int boardWriter){
	      Board b = null;
	      ArrayList<Board> list = new ArrayList<>();
	      
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("ajaxSelectMyAllBoardList");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, boardWriter);
	         
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            b = new Board();
	            b.setBoardNo(rset.getInt("board_no"));
	            b.setBoardTitle(rset.getString("board_title"));
	            b.setCreateDate(  rset.getString("create_date"));
	            b.setCount(   rset.getInt("count"));
	            b.setAmount(rset.getInt("amount"));
	            b.setAddress(rset.getString("address"));
	            b.setTitleImg(  rset.getString("TITLE_IMG"));
	            
	            list.add(b);
	         }
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	}
	
}
