package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.model.service.LoginService;
import com.login.model.vo.Member;

/**
 * Servlet implementation class idCheckServlet
 */
@WebServlet("/idCheck.do")
public class idCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public idCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String userId=request.getParameter("userId");
		
		//만일 한글에 대한 데이터를 전송할때는 인코딩처리, 데이터타입에 대한 설정을 해야한다.
		response.setContentType("text/csv;charset=utf-8");
		
		
		
		PrintWriter out=response.getWriter();
		int idCheck=new LoginService().checkLoginId(userId);
		if(idCheck==0) {
			System.out.print("이미 존재하는 아이디 입니다.");
		}else if(idCheck==1) {
			System.out.println("사용가능한 아이디 입니다.");
		}
		
		out.write(idCheck+"");
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
