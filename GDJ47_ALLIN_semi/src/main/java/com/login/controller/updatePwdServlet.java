package com.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.model.service.LoginService;
import com.login.model.vo.Member;

/**
 * Servlet implementation class updatePassword
 */
@WebServlet( name="updatePwdServlet",urlPatterns={"/updatePwd.do"})
//name="updatePwdServlet",urlPatterns={"/updatePwd.do"}
public class updatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=request.getParameter("userId");
		String oriPw=request.getParameter("password");
		String newPw=request.getParameter("password_new");
		//현재 비밀번호가 맞는지 확인
		Member l=new LoginService().searchLogin(userId,oriPw);
		System.out.println(l);
		String msg="",loc="";
		if(l!=null) {
			//현재비밀번호가 맞음
			//새비밀번호로 변경
			int result=new LoginService().updatePassword(userId,newPw);
			if(result>0) {
				msg="비밀번호 변경을 완료했습니다.";
				//메세지출력 후 새창닫기
				String script="opener.location.replace('"+request.getContextPath()+"/logout.do');close();";
				request.setAttribute("script",script);
			}else {
				msg="비밀번호 변경을 실패했습니다.";
				loc="/updatePwdMiddle.do?userId="+userId;
			}
		}else {
			//현재비밀번호 맞지않음.
			//경고메세지출력 후 패스워드변경페이지로 이동
			msg="현재비밀번호가 일치하지 않습니다";
			loc="/updatePwdMiddle.do?userId="+userId;
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/response.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
