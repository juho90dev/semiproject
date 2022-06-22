package com.planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.planner.model.service.PlannerService;
import com.planner.model.vo.PlannerLog;


@WebServlet("/planner/printPlanEnd.do")
public class PrintPlanEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PrintPlanEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String plannerNo = request.getParameter("pNo"); //PLANNER_NO
		System.out.println(plannerNo);
		
		//1. PLANNER_NO를 기준으로, PLAN테이블에서 플랜들을 가져올 것임
		List<PlannerLog> plans = new PlannerService().printPlans(plannerNo);
		if(plans.isEmpty()) {
			System.out.println("저장된 플랜이 없습니다.");
		} else {
			
			for (PlannerLog p : plans) {
				System.out.println(p);
			}
			
			
			
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
