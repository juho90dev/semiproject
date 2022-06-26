<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.board.model.vo.Board" %>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Board> boards=(List<Board>)request.getAttribute("boards");
%>
<div id="joinInfoArea">
	<table class="table">
		<caption>표 제목</caption>{
		<%if(login!=null) {%>
<%-- 		<tr>
			<td colspan="6" style="text-align:right">
				<button class="button button4" onclick="location.assign('<%=request.getContextPath()%>/boardWrite.do')">
					글 작성
				</button>
			</td>
		</tr> --%>
		<%} %>
		<tr>
			<th></th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자 아이디</th>
			<th>신고 아이디</th>
			<th>신고 내용</th>
			<th>등록일</th>
			<th></th>
			<th></th>	  
		</tr>
	<tbody>
				
				<%if(boards.isEmpty()){%>
       			<tr>
       				<td colspan="11"><h3>조회된 내용이 없습니다.</h3></td>
       			</tr>
       			<%} else  {
	       			for(Board b : boards){%>
					<tr>
					<td></td>
					<td><%=b.getBoardNum()%></td>
					<td>
						<a href="<%=request.getContextPath()%>/boardContent.do?no=<%=b.getBoardNum()%>">
						<%=b.getTitle() %>
					</td>
					<td><%=b.getMemberId() %></td>
					<td><%=b.getPlannerId() %></td>
					<td><%=b.getContent() %></td>
					<td><%=b.getBoardDate() %></td>
					<td></td>
					<td></td>
					</tr>
					<%} 
	       		 }%> 
				</tbody>
				</table> 
		</div>




<style>
	.button {
		background-color: white;
		border: 1px solid gray;
		color: black;
		padding: 10;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		-webkit-transition-duration: 0.4s; 
		transition-duration: 0.4s;
		cursor: pointer;
	}
	button4 {
		background-color: white;
		color: black;
		border: 2px solid #e7e7e7;
	}
	.button4:hover {background-color: #e7e7e7;}
		.outer{
		width:100%;
		min-width : 1000px;
		/* background: rgb(248, 249, 250); */
		box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 4px 0px;
		margin:auto;
		margin-top : 70px;
		margin-bottom : 70px;
	}
	
	#joinForm {
		margin: auto;
		padding: 10px;
		text-align:center;
	}
	

	.table {
      border-collapse: collapse;
      border-top: 3px solid rgb(77, 78, 79);
	  text-align:center;
		margin: auto;
		padding: 10px;
    }  
    .table th {
      color: rgba(0, 0, 0, 0.861);
      background: #dadada46;
      text-align: center;
    }

    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}

	.button {
	  text-align:right;
    }  

	.likeabutton {
    text-decoration: none; 
    font: menu;
    display: inline-block; 
    padding: 2px 8px;
    background: ButtonFace; 
    color: ButtonText;
    border-style: solid; 
    border-width: 2px;
    border-color: ButtonHighlight ButtonShadow ButtonShadow ButtonHighlight;
	}
	
	.likeabutton:active {
    border-color: ButtonShadow ButtonHighlight ButtonHighlight ButtonShadow;
	}


	
</style>


<%@ include file="/views/common/footer.jsp"%>