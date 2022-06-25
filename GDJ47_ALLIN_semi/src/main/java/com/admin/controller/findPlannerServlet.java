package com.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.adminService;
import com.login.model.vo.Member;

/**
 * Servlet implementation class findPlannerServlet
 */
@WebServlet("/findPlanner.do")
public class findPlannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findPlannerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try{
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerpage=10;
		
		
		List<Member> list=new adminService().selectPlannerList(cPage, numPerpage);//호출하기
		
//		List<Member> list=new adminService().selectMemberList();//호출하기
		
		
		request.setAttribute("list", list);
		
		
		//list를 페이지에 넘여야 하니까 request.setAttribute에 담아줌
		
//		
		//사용자가 원하는 페이지를 요청할 수 있게 페이지바를 만들어보자
		//1. 전체 페이지수
		int totalData=new adminService().selectMemberCount();
		int totalPage=(int)Math.ceil((double)totalData/5);
		
		//2. 출력할 페이지번호의 갯수 정하기
		int pageBarSize=5;
		
		//3. 출력할 페이지번호 시작, 끝 정하기
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		//4. pageBar생성하기
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
					+"/memberList.do?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"<span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/memberList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/memberList.do?cPage="+pageNo+"'>[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/admin/memberList.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
