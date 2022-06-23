package com.login.controller;

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
 * Servlet implementation class memberList
 */
@WebServlet("/memberList.do")
public class memberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberListServlet() {
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
		int numPerpage=5;
		
		
		List<Member> list=new adminService().selectMemberList(cPage, numPerpage);//호출하기
		
//		List<Member> list=new adminService().selectMemberList();//호출하기
		
		
		request.setAttribute("list", list);
		
		
		//list를 페이지에 넘여야 하니까 request.setAttribute에 담아줌
		
		request.getRequestDispatcher("/views/admin/memberList.jsp").forward(request,response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	6yyyyyyyyyyyyyy */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


