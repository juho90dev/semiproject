package com.planner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/plannermaker.do")
public class PlannerMakerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PlannerMakerServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//쿠키 사용 後
		//"days"를 유지하고 있어야 함. 화면이 전환될 때도 이가 기준이 되기 때문임
		//"쿠키"를 사용하려고 함. "쿠키"는 HttpSession에 저장되는 시점(=플래너 확정 시점)에 삭제할 것임
		String days = request.getParameter("days");
		Cookie forOption = new Cookie("forOption",days);
		forOption.setMaxAge(24*60*60); //하루 동안 유지함
		response.addCookie(forOption);
		
		//작성자 정의 "테마" 정보를 넘기고자 함
		String theme = request.getParameter("theme");
		Cookie forTheme = new Cookie("forTheme",theme);
		forTheme.setMaxAge(24*60*60);
		response.addCookie(forTheme);
		
		//작성자 정의 "제목" 정보를 넘기고자 함
		//0621 > 공백이 포함되어 있으면 오류 발생함 -> 쿠키(x) RequestDispatcher로 데이터를 넘기고자 함
		//request.getRequestDispatcher()...로 화면 전환 시, 사용자가 작성한 정보(쿠키)가 반영되지 않는 문제를 확인함
		//0624) 타이틀을 HttpServletRequest객체 아닌, "Cookie"에 넣기 위해서 잠시 주석함...▼
		//request.setAttribute("plannerTitle", title);
		
		String temp = request.getParameter("plannerTitle");
		//0624) plannerMain에, sendRedirect()로 이동하지 않으면 쿠키를 반영하지 못하는 문제를 해결!
		//"문자열"에 공백이 포함된 경우, "이스케이프"처리함 
		String title = "";
		if(temp.contains(" ")) {
			title = temp.replace(" ", "%");
		} else title = temp;
		System.out.println("제목 > 이스케이프 처리 확인하기 : "+title);
		
		Cookie forTitle = new Cookie("forTitle",title);
		forTitle.setMaxAge(24*60*60);
		response.addCookie(forTitle);

		//작성자 정의 "주요 방문 지역" 정보를 넘기고자 함
		//1. 지역코드 > 대분류
		String area = request.getParameter("area");
		Cookie forArea = new Cookie("forArea",area);
		forArea.setMaxAge(24*60*60);
		response.addCookie(forArea);
		//2. 지역코드 > 소분류(시/군/구)
		String sigungu = request.getParameter("sigungu");
		Cookie forSigungu = new Cookie("forSigungu",sigungu);
		forSigungu.setMaxAge(24*60*60);
		response.addCookie(forSigungu);
		
		//"타이틀"을 가져가려면, requestDispatcher를 사용하면 되지만, 이 경우엔 cookie를 갱신하지 못함...
		response.sendRedirect(request.getContextPath()+"/views/planner/plannerMain.jsp");
		//사용자가 입력한 타이틀 정보에 포함된 "공백"을, 이스케이프처리 해서 쿠키에 넣은 다음에, 
		//불러올 때는 다시 파싱해서 쓰면 될듯...
		//request.getRequestDispatcher("/views/planner/plannerMain.jsp").forward(request, response);
		//-----------------------------------------------------------------------------------

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
