package com.planner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.planner.model.service.PlannerService;


@WebServlet("/planner/printPlan.do")
public class PrintPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PrintPlanServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String plannerNo = request.getParameter("pNo"); //PLANNER_NO
		System.out.println("선택한 플래너의 넘버 : "+plannerNo);
		
		//플래너 "제목" 알아오기
		String plannerTitle = new PlannerService().selectTitle(plannerNo);
		System.out.println("선택한 플래너의 타이틀 : "+plannerTitle);
		
		//사용자가 선택한 PLANNER의 PLANNER_NO를 기준으로, 해당 PLANNER의 상세 내용(PLAN)을 확인할 수 있다
		request.setAttribute("plannerTitle", plannerTitle);
		request.setAttribute("plannerNo", plannerNo);
		request.getRequestDispatcher("/views/planner/printPlans.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
