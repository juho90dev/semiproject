package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;

/**
 * Servlet implementation class AdminBoardListServlet
 */
@WebServlet("/adminBoardList.do")
public class AdminBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		int numPerpage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerpage=5;
		}
		String id = request.getParameter("memberId");
		
		List<Board> boards = new BoardService().adminBoardList(id, cPage, numPerpage);
		int totalBoard = new BoardService().adminBoardCount();
		int totalPage = (int)Math.ceil((double)totalBoard/numPerpage);
		
		
		int pageBarSize = 5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+= "<span>[이전]</span>";
		}else {
			pageBar+="<a href="+request.getRequestURL()
					+"?cPage="+(pageNo-1)
					+"&numPerpage="+numPerpage+">[이전]<a>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+= "<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href="+request.getRequestURL()
				+"?cPage="+(pageNo)
				+"&numPerpage="+numPerpage+">"+pageNo+"<a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+= "<span>[다음]</span>";
		}else {
			pageBar+="<a href="+request.getRequestURL()
			+"?cPage="+(pageNo)
			+"&numPerpage="+numPerpage+">[다음]<a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("boards", boards);
		request.getRequestDispatcher("views/board/adminBoardList.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
