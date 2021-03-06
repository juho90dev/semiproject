package com.login.controller;

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
 * Servlet implementation class pwdRefreshServlet
 */
@WebServlet("/pwdRefresh.do")
public class pwdRefreshServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwdRefreshServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//클라이언트가 보낸 userId, password값 가져오기
		String userId=request.getParameter("userId");
		String email=request.getParameter("email");
		
		//db에 연결하기
		Member l=new LoginService().checkPassword(userId, email);
		System.out.println(l);
		
		String msg="",loc="";
		
		if(l!=null) {
			msg="회원정보가 일치 합니다. 비밀번호를 변경하세요!";
			loc="/pwdInitialMiddle.do";
//			response.sendRedirect("/GDJ47_ALLIN_semi/pwdInitial.do");
			
		}else {
			msg="회원정보가 일치하지 않습니다.";
			loc="/pwdInitialMiddle.do";
//			response.sendRedirect("/GDJ47_ALLIN_semi/pwdFindMiddle.do");
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
