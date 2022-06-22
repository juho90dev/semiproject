<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	
/* 	String id = (String)request.getAttribute("userId");
	if(id!=null){
		System.out.println("JSP에서 ID확인 "+id);
	} else System.out.println("ID 확인 불가"); */

	Member member = (Member)session.getAttribute("login");
	String id = "";
	
	if(member!=null){
		member.getUserId();
	} else System.out.println("확인 불가!");

%>
<body>

	<h1><%=id!=null?id:"없음"%></h1>
	<h2>확인 중</h2>

</body>
</html>