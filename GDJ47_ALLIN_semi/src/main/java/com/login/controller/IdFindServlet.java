package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.model.service.LoginService;
import com.login.model.vo.Member;

/**
 * Servlet implementation class IdFind
 */
@WebServlet("/idFind.do")
public class IdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String email=request.getParameter("email");
		PrintWriter out=response.getWriter();
		
		String id=new LoginService().selectLoginEmail(email);
		
		System.out.println(id+"이다");
		
		//request.setAttribute("result",(id==null?true:false));
		
//		out.write(id==null?"":id);
		out.write(id==null?"":id);
		
//		if(id!=null) {
//			HttpSession session=request.getSession();
//			session.setAttribute("id", id);
//			
//			response.sendRedirect("/SocialProject/views/login/idFind.jsp");
//		}
		
		
//		response.sendRedirect(request.getContextPath()+"/views/")
//		request.getRequestDispatcher("/views/login/emailDuplicate.jsp")
//		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
