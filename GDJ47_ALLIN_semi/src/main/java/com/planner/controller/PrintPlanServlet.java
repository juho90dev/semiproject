package com.planner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PrintPlanServlet
 */
@WebServlet("/planner/printPlan.do")
public class PrintPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PrintPlanServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String plannerNo = request.getParameter("pNo"); //PLANNER_NO
		System.out.println(plannerNo);
		
		request.setAttribute("plannerNo", plannerNo);
		request.getRequestDispatcher("/views/planner/printPlans.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
