package com.kh.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라메터 꺼내오기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String nickName = request.getParameter("nickName");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		String email = request.getParameter("email");
		String zip = request.getParameter("zipCode");
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		String address = zip + "@" + add1 + "@" + add2;
		String[] irr = request.getParameterValues("interest");
		String interest = "";
		
		for(int i = 0; i < irr.length; i++){
			if(i == 0){
				interest += irr[i];
			}else{
				interest += ", " + irr[i];
			}
		}
		//member객체 생성
		Member m = new Member();
		//setter로 값 전달
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setNickName(nickName);
		m.setPhone(phone);
		m.setEmail(email);
		m.setAddress(address);
		m.setInterest(interest);
		//서비스로 전달
		int result = new MemberService().insertMember(m);
		
		//페이지 연결
		String page = "";
		if(result > 0){
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "회원 가입 성공");
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 가입 실패");
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
