package com.plannerMember.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderRegisterServlet
 */
@WebServlet("/OrderRegister.do")
public class OrderRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서블릿구동!");
		String memberId=request.getParameter("memberId");
		String plannerId=request.getParameter("plannerId");
		String theme=request.getParameter("theme");
		String startDay=request.getParameter("startDay");
		String endDay=request.getParameter("endDay");
		String[] transList=request.getParameterValues("transList");
		String content=request.getParameter("content");
		System.out.println("전체데이터테스트출력");
		System.out.println(memberId);
		System.out.println(plannerId);
		System.out.println(startDay);
		System.out.println(endDay);
		System.out.println(content);
		System.out.println(theme);
		for(int i=0;i<transList.length;i++) {
			System.out.println(transList[i]);
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
