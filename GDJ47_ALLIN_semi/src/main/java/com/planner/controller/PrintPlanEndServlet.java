package com.planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.planner.model.service.PlannerService;
import com.planner.model.vo.PlannerLog;

//printPlans.jsp에서 요청한 특정 PLANNER_NO의 상세 PLAN을 확인할 수 있는 서블릿
@WebServlet("/planner/printPlanEnd.do")
public class PrintPlanEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PrintPlanEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String plannerNo = request.getParameter("plannerNo"); //PLANNER_NO
		System.out.println("서블릿에서 확인 : "+plannerNo);
		
		//1. PLANNER_NO를 기준으로, PLAN테이블에서 플랜들을 가져올 것임
		List<PlannerLog> plans = new PlannerService().printPlans(plannerNo);
		
		if(plans.isEmpty()) {
			System.out.println("저장된 플랜이 없습니다.");
		} else {
			
			System.out.println("플랜 불러오기 성공!");
			
			for (PlannerLog p : plans) {
				System.out.println(p); //플랜 확인
				
			}
			
			Gson gson = new Gson();
			response.setContentType("application/json;charset=utf-8");
			gson.toJson(plans, response.getWriter());
				
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
