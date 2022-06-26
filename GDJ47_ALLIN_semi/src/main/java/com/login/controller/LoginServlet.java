package com.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.model.service.LoginService;
import com.login.model.vo.Member;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet",urlPatterns={"/login.do"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String password=request.getParameter("password");
		System.out.println(password);
		String grade="";
		
		//DB에 login 계정 login테이블에 userId, password가 일치하는 데이터 있는지 확인
		//있으면 그 데이터를 가져오고 없으면 null
		Member l=new LoginService().searchLogin(userId,password);
		System.out.println(l);
		//로그인 처리하기  이때 로그인이 안되면 null, 로그인이 되면 null이 아님.
		//null이면 로그인 페이지로 다시 이동, null이 아니면 홈 화면으로 이동..이때 로그인이 유지된 상태여야 한다.
		
		
		if(l!=null) {
			//유지할 수 있는 데이터로 저장해야 한다. context와 session이 있는데 context는 서버가 내려갈때 닫히므로 HttpSession을 사용하도록 한다.
			//HTTPSession 에 데이터를 저장...?
			HttpSession session=request.getSession();
			session.setAttribute("login", l);
		//어디에 응답해줄지 처리 해줘야 한다. requestDispatcher나 sendRedirect를 이용한다. 이 경우 response.sendRedirect를 이용한다.
			response.sendRedirect(request.getContextPath());
		}else {
			
		response.sendRedirect("/GDJ47_ALLIN_semi/views/login/loginFail.jsp");
		}
		
		
			}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
