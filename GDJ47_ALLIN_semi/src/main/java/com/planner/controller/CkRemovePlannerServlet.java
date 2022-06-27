package com.planner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//plannerProfile > MY PLAN > "플래너 관리하기" > "플래너 삭제" 관련 재확인 창을 출력할 것
@WebServlet("/planner/ckRemovePlanner.do")
public class CkRemovePlannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CkRemovePlannerServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/planner/ckRemovePlanner.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
