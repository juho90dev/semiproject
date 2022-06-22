package com.planner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/planner/saveConfirm.do")
public class PlannerSaveConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PlannerSaveConfirmServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = (String)request.getParameter("userId");
		request.setAttribute("userId", id);
		
		request.getRequestDispatcher("/views/planner/plannerSaveConfirm.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
