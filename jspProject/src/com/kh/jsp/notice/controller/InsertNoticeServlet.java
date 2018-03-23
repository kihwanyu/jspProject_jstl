package com.kh.jsp.notice.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.notice.model.service.NoticeService;
import com.kh.jsp.notice.model.vo.Notice;

/**
 * Servlet implementation class InsertNoticeServlet
 */
@WebServlet("/insert.no")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라메터 꺼내기
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String uno = request.getParameter("uno");
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		
		System.out.println(title);
		System.out.println(writer);
		System.out.println(uno);
		System.out.println(date);
		System.out.println(content);
		
		java.sql.Date nDate = null;
		
		if(date != ""){
			String[] dateArr = date.split("-");
			int[] drr = new int[dateArr.length];
			
			for(int i = 0; i < dateArr.length; i++){
				drr[i] = Integer.parseInt(dateArr[i]);
			}
			int year = drr[0];
			int month = drr[1]-1;
			int day = drr[2];
			
			nDate = new java.sql.Date(
					new GregorianCalendar(
							year, month, day).getTimeInMillis());
			
		}else{
			nDate = new java.sql.Date(
					new GregorianCalendar().getTimeInMillis());
			
		}
		
		//notice객체 생성
		Notice n = new Notice();
		
		//setter로 notice 객체에 값 변경
		n.setnTitle(title);
		n.setnWriter(uno);
		n.setnDate(nDate);
		n.setnContent(content);
		
		//서비스 호출
		int result = new NoticeService().insertNotice(n);
		
		//뷰 페이지 연결
		String page = "";
		if(result > 0){
			page = "views/notice/noticeList.jsp";
			request.setAttribute("list", new NoticeService().selectList());
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 등록 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
