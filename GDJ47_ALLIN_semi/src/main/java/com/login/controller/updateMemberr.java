package com.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.model.service.LoginService;
import com.login.model.vo.Member;

/**
 * Servlet implementation class updateMemberr
 */
@WebServlet("/updateMemberr.do")
public class updateMemberr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateMemberr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Member m=new Member();
		m.setUserId(request.getParameter("userId"));
		m.setEmail(request.getParameter("email"));
		m.setPassword(request.getParameter("password"));
		m.setPhone(request.getParameter("phone"));
		m.setCity(request.getParameter("addressDo1"));
		m.setCountry(request.getParameter("addressDogun"));
		
		int result=new LoginService().updateMemberr(m);
		
		String msg="",loc="";
		
		if(result>0) {
			msg="정상적으로 정보가 수정되었습니다";
			//session에 저장된 로인정보도변경
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			loc="/logout.do";
		}else {
			msg="정보수정을 실패했습니다. 다시 시도하세요!";
			loc="/views/mypage/mypagee.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		
		
		RequestDispatcher dispatch =request.getRequestDispatcher("/views/common/response.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
