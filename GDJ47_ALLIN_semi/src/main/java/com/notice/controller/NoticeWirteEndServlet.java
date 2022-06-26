package com.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.notice.model.service.NoticeService;
import com.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeWirteEndServlet
 */
@WebServlet("/noticeWriteEnd.do")
public class NoticeWirteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWirteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 데이터와 파일을 저장하기
		//파일업로드 처리하기
		
		//1. 요청방식 먼저확인 -> enctype이 mutipart/form-data방식으로 왔는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 작성오류 [form:enctype] 관리자에게 문의하세요! :(");
			request.setAttribute("loc", "/noticeWrite.do");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
		}else {
			//파일업로드 및 데이터 저장처리하기
			//multipart로 온 데이터를 처리하기
			//cos.jar에서 제공하는 클래스를 이용해서 처리한다.
			//MutipartRequest클래스를 이용!
			
			//1. 파일을 저장할 위치를 가져옴.
			String path=request.getServletContext().getRealPath("/upload/notice/");
			
			//2. 파일을 저장할 크기설정(Max)
			//byte -> MB -> GB -> TB : 1024
			int maxSize=1024*1024*10;//10Mb
			
			//3. 파일의 인코딩설정
			String encoding="UTF-8";
			
			
			//4. 업로드시 파일명 리네임규칙
			DefaultFileRenamePolicy dfp=new DefaultFileRenamePolicy();
			
			//cos.jar에서 제공하는 MultipartRequest클래스를 생성하면 
			//파일은 자동으로 업로드 됨.
			MultipartRequest mr=new MultipartRequest(request,path,maxSize,encoding,dfp);
			
			//데이터 DB에 저장하기
			//클라이언트가 보낸 데이터를 가져오려면 MultipartRequest클래스를 이용
			Notice n=Notice.builder().noticeTitle(mr.getParameter("title"))
					.noticeWriter(mr.getParameter("writer"))
					.noticeContent(mr.getParameter("content"))
					.filePath(mr.getFilesystemName("upfile"))
					.build();
			System.out.println(n);
			
			//DB에 데이터 저장
			int result=new NoticeService().insertNotice(n);
			
			String msg="";
			String loc="";
			if(result>0) {
				msg="공지사항등록완료!";
				loc="/noticeList.do";
			}else {
				msg="공지사항등록실패!";
				loc="/noticeWrite.do";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
