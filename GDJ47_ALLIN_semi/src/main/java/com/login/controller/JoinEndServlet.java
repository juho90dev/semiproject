package com.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.model.service.LoginService;
import com.login.model.vo.Member;

/**
 * Servlet implementation class JoinEndServlet
 */
@WebServlet("/joinEnd.do")
public class JoinEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//1.클라이언트가 보낸 데이터 받아오기 (name값)
		String userId=request.getParameter("userId");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String city=request.getParameter("addressDo1");
		String country=request.getParameter("addressDogun");
		 
		
		Member l=new Member(userId,email,password,phone,city,country,null,0,null,null,null,null);
		
		
		//2.db랑 연결하기 3.응답할 값 있으면 담기 request.setAttribute("", );
		int result=new LoginService().insertLogin(l);
		
		String msg="",loc="";
		if(result>0) {
			msg="회원가입 성공! 좋은 하루 되세요:D";
			loc="/";
		}else {
			msg="회원가입 실패! 다시 시도해 주세요!";
			loc="/views/login/join.jsp";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		//4.보내기 (어디로 갈건지 정해줌)
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
