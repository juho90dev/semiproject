<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@
page import="com.request.model.vo.RequestPlan"
%>
<%
List <RequestPlan> list=(List<RequestPlan>)request.getAttribute("list");
%> 
    

<%@ include file="/views/common/header.jsp" %>

 <body>
 <br>

		<div id="joinInfoArea">

					<table class="table">
					  <caption>표 제목</caption>
					  <tr>
					  <th>신청인아이디</th>
					  <th>여행시작일</th>
					  <th>여행종료일</th>
					  <th>교통수단</th>
					  <th>관광테마</th>
					  <th>내용</th>
					  <th>수락여부</th>
					  <th>결제여부</th>
					  <th>요청삭제</th>
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
       			for(RequestPlan rp : list){%>
					<tr>
					<td><%=rp.getMemberId() %></td>
					<td><%=rp.getStartDay() %></td>
					<td><%=rp.getEndDay() %></td>
					<td><%=rp.getTransport() %></td>
					<td><%=rp.getTheme() %></td>
					<td><%=rp.getContent() %></td>
					<td><%=rp.getApproval()%>&nbsp;
					<%if(rp.getApproval().equals("N")) {%>
						<button onclick="acceptRequest();">수락하기</button>
					<%}else {%>
						<button onclick="acceptAlert();">수락완료</button>
					<%} %>
					</td>
					<td><%=rp.getRequestPay() %></td>
					<td>
					<a href="<%=request.getContextPath()%>/deleteRequest.do?memberId=<%=rp.getMemberId()%>">삭제</a>
					</td>
					</tr>
				<%} %>
			<%} %>
				</tbody>
				</table> 
		</div>

<script>
	const acceptRequest=()=>{
		
	}
	
	const acceptAlert=()=>{
		alert("이미 수락이 완료되었습니다!");
	}
	
	
</script>


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




   </body>
    
<%@ include file="/views/common/footer.jsp" %>