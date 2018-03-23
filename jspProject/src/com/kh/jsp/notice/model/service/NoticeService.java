package com.kh.jsp.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.notice.model.dao.NoticeDao;
import com.kh.jsp.notice.model.vo.Notice;
import static com.kh.jsp.common.JDBCTemplet.*;

public class NoticeService {

	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		return list;
	}

	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public Notice selectOne(String num) {
		Connection con = getConnection();
		
		Notice n = new NoticeDao().selectOne(con, num);
		
		if(n != null){
			int result = new NoticeDao().updateCount(con, n.getNno());
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return n;
	}

	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	public ArrayList<Notice> deleteNotice(int nno) {
		Connection con = getConnection();
		ArrayList<Notice> list = null;
		
		int result = new NoticeDao().deleteNotice(con, nno);
		
		if(result > 0){
			commit(con);
			list = new NoticeDao().selectList(con);
		}else{
			rollback(con);
		}
		
		
		return list;
	}

}







