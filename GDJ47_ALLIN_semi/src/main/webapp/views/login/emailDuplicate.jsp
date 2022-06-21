<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result=(boolean)request.getAttribute("result");
	String email=request.getParameter("email");
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
			멋진 이메일이네요!
			<br><br>
			<button type="button" >닫기</button>
		<%} else{%>
			이미 가입하셨습니다.
			<br><br>
			<!-- 아이디 재입력창 구성 -->
			<form action="<%=request.getContextPath() %>/emailDuplicate.do" method="post">
				<input type="text" name="email" id="email">
				<input type="submit" value="중복검사" >
			</form>
		<%} %>
	</div>
	 <script>
		const btn=document.querySelector("[type=button]");
		console.log(btn);
		btn.addEventListener("click",(e)=>{
			opener.enrollMemberFrm.email.value='<%=email%>';
			close();
		});
	</script>
</body>
</html>