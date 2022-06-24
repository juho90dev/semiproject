<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
	List<Member> list=(List<Member>)request.getAttribute("list");
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");

//header에 member는 있는데 List라는 자료형은 임포트 한 적이 없다... 그래서 list도 import해줘야 한다.
%>

<%@ include file="/views/common/header.jsp" %>

<style type="text/css">
	section#memberList-container {text-align:center;}	
	section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
	section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
 	div#search-container {margin:0 0 10px 0; padding:3px; }
    div#search-userId{display:inline-block;}
    div#search-email{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
</style>


 <body>
 <br>
<a class=likeabutton href="<%=request.getContextPath()%>/findNormal.do">일반</a>
<a class=likeabutton href="<%=request.getContextPath()%>/findPlanner.do">플래너</a>
<a class=likeabutton href="<%=request.getContextPath()%>/memberList.do">전체</a>

		<div id="joinInfoArea">
				
				<!-- <h4>아이디</h4>
				<span class="input_area"><input type="text" maxlength="13" name="userId" value="" readonly></span> -->
		<section id="memberList-container">
         <div id="search-container">
        	<select id="searchType">
        		<option value="userId" <%=searchType!=null&&searchType.equals("userId")?"selected":"" %>>아이디</option>
        		<option value="email"<%=searchType!=null&&searchType.equals("email")?"selected":"" %>>이메일</option>
        	</select>
        	<div id="search-userId">
        		<form action="<%=request.getContextPath()%>/searchMember.do">
        			<input type="hidden" name="searchType" value="userId" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 아이디를 입력하세요" list="ids">
        			<datalist id="ids">
        			</datalist>
        			<button type="submit">검색</button>
        		</form>
        		<script>
        			$("input[placeholder*=아이디]").keyup(e=>{
        				$.ajax({
        					url:"<%=request.getContextPath()%>",
        					data:{"keyword":e.target.value},
        					success:data=>{
        						$("#ids").html("");
        						/* console.log(data); */
        						data.forEach(v=>{
        							const op=$("<option>").attr("value",v).text(v);
        							$("#ids").append(op);
        						});
        					}
        				});
        			});
        		</script>
        	</div>
        	<div id="search-email">
        		<form action="<%=request.getContextPath()%>/searchMember.do">
        			<input type="hidden" name="searchType" value="email">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 이메일을 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        	</div>

        </div>
<br>

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
				<%if(list==null||list.isEmpty()){ %>
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
				<td>
				<%=m.getGrade()%>&nbsp;
				<%if(m.getGrade().equals("normal")) { %>
				<button onclick="location.replace('<%=request.getContextPath() %>/updateGrade.do?userId=<%=m.getUserId()%>')">승급</button>
				<%}else if(m.getGrade().equals("planner")) {%>
				<button onclick="location.replace('<%=request.getContextPath() %>/downGrade.do?userId=<%=m.getUserId()%>')">강등</button>
				<%} %>
				</td>
				
				<td><%=m.getEnrollDate() %></td>
				<td><%=m.getPay()%></td>
				<td>
				<%if(m.getGrade().equals("normal")||m.getGrade().equals("planner")) {%>
				<a href="<%=request.getContextPath()%>/deleteMember.do?userId=<%=m.getUserId() %>">삭제</a>
				<%} %>
				</td>
				</tr>
       		<%} 
       		 }%>
				</tbody>
				</table> 
		</div>
		
		<div class="container">
					<ul class="pagination justify-content-center">
						<%=request.getAttribute("pageBar") %>
					</ul>
		</div>
		 </section>
		 	<script>
		$(()=>{
			$("#searchType").change(e=>{
				/* alert("type이 변경됨"); */
				const type=$(e.target).val();
				console.log(type);
				$("#search-container>div[id!=search-]").hide();
				$("#search-"+type).css("display","inline-block");
			});
			$("#searchType").change();
		})
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

    div#numPerpage-container{float:right;}
	
</style>




   </body>
    
<%@ include file="/views/common/footer.jsp" %>
