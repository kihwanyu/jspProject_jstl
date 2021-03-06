package com.kh.jsp.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jsp.board.model.dao.BoardDao;
import com.kh.jsp.board.model.vo.Attachment;
import com.kh.jsp.board.model.vo.Board;
import static com.kh.jsp.common.JDBCTemplet.*;

public class BoardService {

	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public Board selectOne(int num) {
		Connection con = getConnection();
		Board b = null;
		
		int result = new BoardDao().updateCount(con, num);
		
		if(result > 0){
			commit(con);
			b = new BoardDao().selectOne(con, num);
			
		}else{
			rollback(con);
		}
		
		close(con);
		
		return b;
	}

	public int insertThumb(Board b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new BoardDao().insertThumbnailContent(con, b);
		
		if(result1 > 0){
			int bid = new BoardDao().selectCurrval(con);
			
			for(int i = 0; i < fileList.size(); i++){
				fileList.get(i).setBid(bid);
			}
		}
		
		int result2 = new BoardDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 == fileList.size()){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectThumbnailList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectThumbnailList(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectThumbnailMap(int num) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		int result = new BoardDao().updateCount(con, num);
		
		if(result > 0){
			commit(con);
			hmap = new BoardDao().selectThumbnailMap(con, num);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return hmap;
	}

	public Attachment selectOneServlet(int num) {
		Connection con = getConnection();
		
		Attachment file = new BoardDao().selectOneAttachment(con, num);
		
		close(con);
		
		return file;
	}

}











