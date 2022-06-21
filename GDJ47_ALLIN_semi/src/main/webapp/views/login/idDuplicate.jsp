<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result=(boolean)request.getAttribute("result");
	String userId=request.getParameter("userId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#checkId-container{
		text-align:center;
		padding-top:50px;
	}
	span#duplicated{
		color:red;
		font-weight:bolder;
	}
</style>
</head>
<body>
	<div id="checkId-container">
		<%if(result) {%>
			<!--[<span><%=userId %></span>]는 사용가능합니다.	-->
			멋진 아이디네요!
			<br><br>
			<button type="button" >닫기</button>
		<%} else{%>
			<!--[<span id="duplicated"><%=userId %></span>]는 사용중입니다.	-->
			이미 사용중입니다!
			<br><br>
			<!-- 아이디 재입력창 구성 -->
			<form action="<%=request.getContextPath() %>//idDuplicate.do" method="post">
				<input type="text" name="userId" id="userId">
				<input type="submit" value="중복검사" >
			</form>
		<%} %>
	</div>
	<script>
		const btn=document.querySelector("[type=button]");
		console.log(btn);
		btn.addEventListener("click",(e)=>{
			opener.enrollMemberFrm.userId.value='<%=userId%>';
			opener.enrollMemberFrm.password.focus();
			close();
		});
	</script>
</body>
</html>