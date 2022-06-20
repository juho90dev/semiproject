<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
	List<Member> list=(List<Member>)request.getAttribute("list");

//header에 member는 있는데 List라는 자료형은 임포트 한 적이 없다... 그래서 list도 import해줘야 한다.
%>
<%@ include file="/views/common/header.jsp" %>

 <body>
  <div class="outer">
		<div id="joinInfoArea">
			<form id="joinForm" action="" method="post" onsubmit="return validate();">
				
				<!-- <h4>아이디</h4>
				<span class="input_area"><input type="text" maxlength="13" name="userId" value="" readonly></span> -->

					<table class="table">
					  <caption>표 제목</caption>
					  <tr>
					  <th>아이디</th>
					  <th>이메일</th>
					  <th>휴대폰번호</th>
					  <th>관심 시/도</th>
					  <th>관심 시/군/구</th>
					  <th>이미지</th>
					  <th>평점</th>
					  <th>등급</th>
					  <th>가입일</th>
					  <th>결제 가능</th>
					  <th>회원삭제</th>
					  </tr>
					 <!-- <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
					  <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>-->
					  
				
				<!-- <div class="btnArea">
					<button id="joinBtn">수정하기</button>
				</div>-->
				<tbody>
				<%if(list.isEmpty()){ %>
       			<tr>
       				<td colspan="11"><h3>조회된결과가 없습니다!</h3></td>
       			</tr>
       		<%}else{
       			for(Member m : list){%>
				<tr>
				<td><%=m.getUserId() %></td>
				<td><%=m.getEmail() %></td>
				<td><%=m.getPhone() %></td>
				<td><%=m.getCity() %></td>
				<td><%=m.getCountry() %></td>
				<td><%=m.getImage() %></td>
				<td><%=m.getAvgscore() %></td>
				<td><%=m.getGrade() %></td>
				<td><%=m.getEnrollDate() %></td>
				<td><%=m.getPay()%></td>
				<td><a href="<%=request.getContextPath()%>/deleteMember.do?userId=<%=m.getUserId() %>">탈퇴</a></td>
				</tr>
       		<%	} 
       		 }%>
				</tbody>
				</table> 
			</form>
		</div>
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
	}
	
	#joinForm h1 {
		text-align:center;
	}
	
	
	.btnArea {
		text-align:center;
		padding : 70px;
	}
	
	button {
		width : 100px;
		height : 35px;
		border : 0px;
		color:white;
		background:#282A35;
		margin : 5px;
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
    .table th, .table td {
      padding: 10px;
      border: 1px solid #dadada92;
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





	
</style>




   </body>
    
<%@ include file="/views/common/footer.jsp" %>