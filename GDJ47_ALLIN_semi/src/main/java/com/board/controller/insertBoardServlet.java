package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.vo.Board;
import com.board.model.service.BoardService;

/**
 * Servlet implementation class insertBoardServlet
 */
@WebServlet("/insertBoard.do")
public class insertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		String plannerId = request.getParameter("plannerId");
		System.out.println(plannerId);
		String title = request.getParameter("title");
		System.out.println(title);
		String content = request.getParameter("content");
		
		
		
		Board b = Board.builder()
				.memberId(memberId)
				.plannerId(plannerId)
				.title(title)
				.content(content)
				.build();
		
		int result = new BoardService().insertBoard(b);
		
		String msg = "",loc="";
		if(result>0) {
			msg="글 작성 성공!";
			loc="/";
		}else {
			msg="글 작성 실패!";
			loc="/views/board/boardWrite.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("views/common/response.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
