<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Member> list=(List<Member>)request.getAttribute("list");
%>
<div id="joinInfoArea">
				
				<!-- <h4>아이디</h4>
				<span class="input_area"><input type="text" maxlength="13" name="userId" value="" readonly></span> -->

					<table class="table">
					  <caption>표 제목</caption>
					  <tr>
					  <th></th>
					  <th></th>
					  <th>작성자 아이디</th>
					  <th>신고 아이디</th>
					  <th>제목</th>
					  <th>신고 내용</th>
					  <th>등록일</th>
					  <th></th>
					  <th></th>
					  
					  </tr>
				<tbody>
  <%--      		<%if(list.isEmpty()) { %>
       			<tr>
       				<td colspan="11"><h3>조회된결과가 없습니다!</h3></td>
       			</tr>
       			<%} else {
	       			for(Member m : list){%>
					<tr>
					<td></td>
					<td></td>
					<td><%=m.getUserId() %></td>
					<td><%=m.getUserId() %></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
					<%} 
	       		 }%> --%>
				</tbody>
				</table> 
		</div>




<style>
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