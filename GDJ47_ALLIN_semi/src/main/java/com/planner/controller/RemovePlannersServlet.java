package com.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.planner.model.service.PlannerService;

//plannerProfile > MY PLAN > 플랜 삭제 時
@WebServlet("/planner/removePlanners.do")
public class RemovePlannersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemovePlannersServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 사용자가 선택한 플래너(들)의 ID를 가져옴
		String plannerId = request.getParameter("plannerId");
		System.out.println(plannerId);

		// JSON.stringify(배열), 로서 문자열 형태의 데이터를 controller로 가져왔으므로 parsing작업 필요함
		int ckIndex = plannerId.indexOf("]");
		System.out.println("인덱스 : " + ckIndex);
		plannerId = plannerId.substring(1, ckIndex);
		System.out.println(plannerId);

		String[] temp = plannerId.split(",");
		List<String> planners = new ArrayList();

		
		  for (String p : temp) { 
			  System.out.println("확인 : " + p); 
			  p = p.replace("\"","");
		  
			  System.out.println("따옴표 제거 확인 : "+p);
			  planners.add(p);
		  }

		  for (String planner : planners) {
			System.out.println("플래너 잘 가져왔니? "+planner);
		  	}
		  
		  
		  //TODO 0626) PLAN테이블 생성 時, FOREIGN KEY에 대해 ON DELETE CASCADE설정을 못 함
		  //FOREIGN KEY 삭제 -> 재설정 시 ON DELETE CASCADE 제약 조건도 추가...하고 싶었으나 실패
		  //미봉책으로는 일단, "자식 테이블"에서 삭제 -> "부모 테이블"에서 삭제...하는 식으로 진행함
		  int res = new PlannerService().removePlans(planners);
		  //int res = new PlannerService().removePlanners(planners);
		  
		  if(res>0) { 
			  
			  System.out.println("삭제 완료!"); 
			  Gson gson = new Gson();
			  gson.toJson(planners, response.getWriter());
			  
		  } else System.out.println("삭제 실패!");
		  
		  
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
