package com.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.review.model.service.ReviewService;
import com.review.model.vo.Review;

/**
 * Servlet implementation class SearchResult
 */
@WebServlet("/infoResult.do")
public class SearchNextServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchNextServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String title = request.getParameter("title");
		request.setAttribute("title",title);
		String address = request.getParameter("address");
		request.setAttribute("address", address);
		
		String firstImage=request.getParameter("firstImage");
		request.setAttribute("firstImage", firstImage);
		
		/*
		 * String mapx=request.getParameter("mapx"); int mapx1 = Integer.parseInt(mapx);
		 * request.setAttribute("mapx1", mapx1);
		 */
		/*
		 * String mapy = request.getParameter("mapy"); int mapy1 =
		 * Integer.parseInt(mapy); request.setAttribute("mapy1", mapy1);
		 * System.out.println(firstImage);
		 */
		
		String path = request.getRequestURL()+"";
		
		path = path.substring(0, path.lastIndexOf("/"));
		List<Review> list = new ReviewService().reviewList();
		request.setAttribute("list",list);
		request.getRequestDispatcher("/views/search/infoResult.jsp").forward(request, response);
		
		//path+"/infoResult.jsp?firstImage"+firstImage+"&title="+title
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
