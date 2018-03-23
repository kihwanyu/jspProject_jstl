package com.kh.jsp.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jsp.board.model.vo.Attachment;
import com.kh.jsp.board.model.vo.Board;
import com.kh.jsp.member.model.dao.MemberDao;
import static com.kh.jsp.common.JDBCTemplet.*;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName = MemberDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		//페이징처리 전
		//Statement stmt = null;
		
		//페이징처리 후
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			//페이징처리 전
			/*stmt = con.createStatement();
			rset = stmt.executeQuery(query);*/
			
			//페이징처리 후
			pstmt = con.prepareStatement(query);
			
			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setBid(rset.getInt("bid"));
				b.setbType(rset.getInt("btype"));
				b.setBno(rset.getInt("bno"));
				b.setCategory(rset.getString("cname"));
				b.setbTitle(rset.getString("btitle"));
				b.setbContent(rset.getString("bcontent"));
				b.setbWriter(rset.getString("nick_name"));
				b.setbCount(rset.getInt("bcount"));
				b.setRefBid(rset.getInt("ref_bid"));
				b.setRefRefBid(rset.getInt("ref_ref_bid"));
				b.setReply_level(rset.getInt("reply_level"));
				b.setbDate(rset.getDate("bdate"));
				b.setStatus(rset.getString("status"));
				
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

	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(b.getCategory()));
			pstmt.setString(2, b.getbTitle());
			pstmt.setString(3, b.getbContent());
			pstmt.setInt(4, Integer.parseInt(b.getbWriter()));
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
				
				b.setBid(rset.getInt("bid"));
				b.setbType(rset.getInt("btype"));
				b.setBno(rset.getInt("bid"));
				b.setCategory(rset.getString("cname"));
				b.setbTitle(rset.getString("btitle"));
				b.setbContent(rset.getString("bcontent"));
				b.setbWriter(rset.getString("nick_name"));
				b.setbCount(rset.getInt("bcount"));
				b.setRefBid(rset.getInt("ref_bid"));
				b.setRefRefBid(rset.getInt("ref_ref_bid"));
				b.setReply_level(rset.getInt("reply_level"));
				b.setbDate(rset.getDate("bdate"));
				b.setStatus(rset.getString("status"));
			}
			
			System.out.println(b);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public int insertThumbnailContent(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertThumb");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, Integer.parseInt(b.getbWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				bid = rset.getInt("currval");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return bid;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getBid());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				
				int level = 0;
				if(i == 0) level = 0;
				else level = 1;
				
				pstmt.setInt(5, level);
				
				result += pstmt.executeUpdate();
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectThumbnailList(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectThumbnailMap");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("bid", rset.getInt("bid"));
				hmap.put("bno", rset.getInt("bno"));
				hmap.put("btitle", rset.getString("btitle"));
				hmap.put("bcontent", rset.getString("bcontent"));
				hmap.put("bwriter", rset.getString("nick_name"));
				hmap.put("bcount", rset.getInt("bcount"));
				hmap.put("bdate", rset.getDate("bdate"));
				hmap.put("fid", rset.getInt("fid"));
				hmap.put("originName", rset.getString("origin_name"));
				hmap.put("changeName", rset.getString("change_name"));
				hmap.put("filePath", rset.getString("file_path"));
				hmap.put("uploadDate", rset.getDate("upload_date"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return list;
	}

	public HashMap<String, Object> selectThumbnailMap(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Board b = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectThumbnailOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			
			while(rset.next()){
				b = new Board();
				b.setBid(rset.getInt("bid"));
				b.setBno(rset.getInt("bno"));
				b.setbTitle(rset.getString("btitle"));
				b.setbContent(rset.getString("bcontent"));
				b.setbWriter(rset.getString("nick_name"));
				b.setbCount(rset.getInt("bcount"));
				b.setbDate(rset.getDate("bdate"));
				
				at = new Attachment();
				at.setFid(rset.getInt("fid"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				at.setUploadDate(rset.getDate("upload_date"));
				
				list.add(at);
			}
			
			hmap = new HashMap<String, Object>();
			hmap.put("board", b);
			hmap.put("attachment", list);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return hmap;
	}

	public Attachment selectOneAttachment(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Attachment file = null;
		
		String query = prop.getProperty("selectOneAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				file = new Attachment();
				
				file.setFid(rset.getInt("fid"));
				file.setBid(rset.getInt("bid"));
				file.setOriginName(rset.getString("origin_name"));
				file.setChangeName(rset.getString("change_name"));
				file.setFilePath(rset.getString("file_path"));
				file.setUploadDate(rset.getDate("upload_date"));
				file.setFileLevel(rset.getInt("file_level"));
				file.setStatus(rset.getString("status"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return file;
	}
	

}








