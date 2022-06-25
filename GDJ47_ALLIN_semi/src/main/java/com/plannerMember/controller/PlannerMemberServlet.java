package com.plannerMember.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.login.model.vo.Member;
import com.plannerMember.service.PlannerMemberService;

/**
 * Servlet implementation class PlannerMemberServlet
 */
@WebServlet("/plannerMember.do")
public class PlannerMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlannerMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String grade = "planner";
//		List<Member> list = new PlannerMemberService().plannerMember(grade);
//		request.setAttribute("list", list);
		
		int cPage;
		try{
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerpage=6;
		List<Member> list = new PlannerMemberService().selectPlannerMemberList(grade,cPage, numPerpage);
		
		
		request.setAttribute("list",list);
		
		
		int totalData = new PlannerMemberService().selectPlannerMemberCount();
		int totalPage=(int)Math.ceil((double)(totalData/numPerpage));
		
		
		int pageBarSize = 5;
		
		
		int pageNo = ((cPage-1) / pageBarSize) * pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		
		String pageBar = "";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/plannerMember.do?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"<span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/plannerMember.do?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/plannerMember.do?cPage="+pageNo+"'>[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		
		
		
		
		request.getRequestDispatcher("views/plannerMember/plannerMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
