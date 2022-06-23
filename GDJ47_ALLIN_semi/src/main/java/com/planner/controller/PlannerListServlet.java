package com.planner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//"플래너 목록"페이지로 이동시켜주는 서블릿
@WebServlet("/planner/plannerList.do")
public class PlannerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PlannerListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = (String)request.getParameter("userId");
		System.out.println("ID확인 : "+id);
		request.setAttribute("userId", id);
		request.getRequestDispatcher("/views/planner/plannerList.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
