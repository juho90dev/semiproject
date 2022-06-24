package com.plannerMember.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.request.model.service.RequestService;
import com.request.model.vo.RequestPlan;

/**
 * Servlet implementation class OrderRegisterServlet
 */
@WebServlet("/orderRegister.do")
public class OrderRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서블릿구동!");
		
		int orderNum = (int)(Math.random()*1000);
		String id=request.getParameter("memberId");
		String plannerId=request.getParameter("plannerId");
		String content=request.getParameter("content");
		String startDay=request.getParameter("startDay");
		String endDay=request.getParameter("endDay");
		String[] transport=request.getParameterValues("transport");
		String[] theme=request.getParameterValues("theme");
		//String approval = "";
		//String requestPay= "";
		System.out.println("전체데이터테스트출력");
		System.out.println(id);
		System.out.println(plannerId);
		System.out.println(startDay);
		System.out.println(endDay);
		System.out.println(content);
		System.out.println(String.join(",", transport));
		System.out.println(String.join(",", theme));
		
		RequestPlan rp = new RequestPlan(orderNum, id, plannerId, content, startDay, endDay, String.join(",", transport), String.join(",", theme), null, null);
		
		int result = new RequestService().insertRequest(rp);
		
		List<RequestPlan> list=new RequestService().selectRequestList(id);
		request.setAttribute("list", list);
		System.out.println(result);
		
		//3.출력할 화면 선택
		
	
		request.getRequestDispatcher("request.getContextPath()/customerpage.do?memberId=id").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
