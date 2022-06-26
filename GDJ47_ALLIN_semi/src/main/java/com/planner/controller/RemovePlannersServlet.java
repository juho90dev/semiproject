package com.planner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.planner.model.service.PlannerService;

//plannerProfile > MY PLAN > 플랜 삭제 時
@WebServlet("/planner/removePlanners.do")
public class RemovePlannersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RemovePlannersServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//사용자가 선택한 플래너(들)의 ID를 가져옴
		String plannerId = request.getParameter("plannerId");
		System.out.println(plannerId);
		
		//JSON.stringify(배열), 로서 문자열 형태의 데이터를 controller로 가져왔으므로 parsing작업 필요함
		int ckIndex = plannerId.indexOf("]");
		System.out.println("인덱스 : "+ckIndex);
		plannerId = plannerId.substring(1,ckIndex);
		System.out.println(plannerId);
		
		String[] planners = plannerId.split(",");
		for (String p : planners) {
			System.out.println("확인 : "+p);
		}
		
		int res = new PlannerService().removePlanners(planners);
		
		if(res>0) {
			System.out.println("삭제 완료!");
		} else System.out.println("삭제 실패!");
		 
		 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
