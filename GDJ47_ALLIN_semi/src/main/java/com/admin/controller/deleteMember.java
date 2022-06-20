package com.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.model.service.LoginService;
import com.login.model.vo.Member;

/**
 * Servlet implementation class memberOutServlet
 */
@WebServlet("/deleteMember.do")
public class deleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		HttpSession session=request.getSession();
//		Member m = (Member)session.getAttribute("member");
		
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Member m=new Member();
		m.setUserId(request.getParameter("userId"));
		int result=new LoginService().DeleteMember(m);
		
		
		String msg="",loc="";
		
		if(result>0) {
			msg="회원정보 삭제 왼료";
			//session에 저장된 로인정보도변경
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			loc="/";
		}else {
			msg="회원정보 삭제 실패!";
			loc="/views/mypage/mypage.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		
		RequestDispatcher dispatch =request.getRequestDispatcher("/views/common/response.jsp");
		dispatch.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
