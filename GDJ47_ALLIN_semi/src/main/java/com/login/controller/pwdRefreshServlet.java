package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		PrintWriter out=response.getWriter();
		
		//db에 연결하기
		Member l=new LoginService().checkPassword(userId, email);
		System.out.println(l);
		String check="";
		if(l!=null) {
			check="있다";
		}
		out.write(check==null?"":check);
		
		System.out.println(check);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
