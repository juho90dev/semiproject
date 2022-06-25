package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.model.service.LoginService;

/**
 * Servlet implementation class pwdCheckServlet
 */
@WebServlet("/pwdCheck.do")
public class pwdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String userPwd=request.getParameter("userPwd");
		
		//만일 한글에 대한 데이터를 전송할때는 인코딩처리, 데이터타입에 대한 설정을 해야한다.
		response.setContentType("text/csv;charset=utf-8");
		
		
		
		PrintWriter out=response.getWriter();
		int pwdCheck=new LoginService().checkPwd(userPwd);
		if(pwdCheck==0) {
			System.out.print("존재하는 패스워드 입니다.");
		}else if(pwdCheck==1) {
			System.out.println("존재하지 않는 패스워드 입니다.");
		}
		
		out.write(pwdCheck+"");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
