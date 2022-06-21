package com.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.planner.model.service.PlannerService;
import com.planner.model.vo.Planner;
import com.planner.model.vo.PlannerLog;

@WebServlet("/planner/saveLog.do")
public class SaveLogServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private List<PlannerLog> list = new ArrayList();

	public SaveLogServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO DB에 플랜 저장 後, 플랜 저장 완료 페이지로 이동함
		// DB에서 리스트를 가져올지, localStorage를 다시 사용할지 고민 중

		// 1. 플래너 정보 저장하기
		// ------------------------------------------------------------------------------
		
		//사용자 입력 정보 받아오기 > 제목
		String title = request.getParameter("plannerTitle");
		System.out.println("제목 확인 : "+title);
		//사용자 입력 정보 받아오기 > 여행일자, 테마, 지역코드 대분류, 지역코드 소분류
		int days=0;
		String theme = "";
		int area = 0;
		int sigungu = 0;
		
		Cookie[]cookies = request.getCookies();
		
		if(cookies!=null){ //플래너 페이지에서 입력했던 정보 가져오기
			
			for(Cookie c : cookies){
				
				if(c.getName().equals("forOption")){ //여행 일자
					days = Integer.parseInt(c.getValue());				
				}
				
				if(c.getName().equals("forTheme")){ //여행 테마
					theme = c.getValue();
				}

				if(c.getName().equals("forArea")){ //지역코드 > 대분류
					area = Integer.parseInt(c.getValue());				
				}
				
				if(c.getName().equals("forSigungu")){ //지역코드 > 소분류
					sigungu = Integer.parseInt(c.getValue());			
				}
				
			}		
		}
		

		
		//1. "PLANNER"정보 가져오기
		Planner planner = Planner.builder()
					      .userId("abcd") //테스트 테이블인, MEMBER에 있는 아이디를 빌려옴
					      .plannerTitle(title)
					      .travelDays(days)
					      .theme(theme)
					      .areacode(area)
					      .sigungucode(sigungu)
					      .build();
		
		
		
		
		//2. "PLAN"정보 가져오기

		String jsonStr = request.getParameter("planPerDay");
		Gson gson = new Gson();
		PlannerLog[][] plans = gson.fromJson(jsonStr, PlannerLog[][].class);

		int res = 0;

		for (PlannerLog[] plannerLogs : plans) {
			
			for (PlannerLog plannerLogs2 : plannerLogs) {
				System.out.println("저장된 플랜 확인"+plannerLogs2);
			}

		}

		res = new PlannerService().savePlanner(planner,plans);
		
		
		// ------------------------------------------------------------------------------	
		
		
		if (res<=0) {
			System.out.println("플래너 저장 실패!");
		} else {
			System.out.println("플래너 저장 성공!");
		}


		  
		  String msg,loc=""; //TODO msg, loc부분 만들어야 함 if(res>0) { msg = "플랜 저장 성공!";
		  
		  
		   
		  if(res>0) {
			 
			  //"성공 시, 플래너 '완성'페이지로 돌아가기 위해서
			  //1. 플래너 코드를 가져옴
//			  int temp = new PlannerService().selectPlannerNo();
//			  String plannerNo = "PLAN"+temp;
//			  System.out.println("플래너 넘버 확인 : PLAN"+plannerNo);
			  
			  //request.setAttribute("plannerNo", plannerNo);
			  //loc = ""; //"플래너 완성 페이지"로 돌아가기
			  System.out.println("플래너 저장 성공!");
		  
		  } else { 
			  
			  	//msg = "플랜 저장에 실패했습니다. 다시 시도해주세요!"; 
			  	//loc = "/plannermaker.do";
		
		  		System.out.println("플래너 저장 실패!");		  
		  }
		  
		  //
		  //request.setAttribute("msg", msg);
		  //request.getRequestDispatcher("/views/planner/printPlanner.jsp").forward(request, response);;
		 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
