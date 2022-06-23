package com.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.planner.model.service.PlannerService;
import com.planner.model.vo.Planner;

//plannerProfile.jsp에 출력될 "플래너 리스트"를 불러올 것임
@WebServlet("/planner/printPlannerList.do")
public class PrintPlannerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PrintPlannerListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String userId = request.getParameter("userId"); //프론트로부터 받아온 회원 아이디
		System.out.println("아이디 : "+userId);
		
		List<Planner> list = new ArrayList(); //해당 아이디로 작성된 PLANNER들을 가져옴
		list = new PlannerService().printList(userId);
		
		if(list.isEmpty()) {
			
			System.out.println("리스트 불러오기 실패!");
		
		} else {
		
			System.out.println("리스트 불러오기 성공!");

			Gson gson = new Gson();
			response.setContentType("application/json;charset=utf-8");
			gson.toJson(list, response.getWriter());
		
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
