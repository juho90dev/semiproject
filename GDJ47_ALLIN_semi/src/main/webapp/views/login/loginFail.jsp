<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<script>
		alert('로그인 실패\n로그인 페이지 이동합니다.');
		location.href="<%=request.getContextPath()%>/LoginMiddleServlet.do";
		</script>
</body>
</html>