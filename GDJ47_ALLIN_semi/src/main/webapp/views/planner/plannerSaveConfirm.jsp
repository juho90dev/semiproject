<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String userId = (String)request.getAttribute("userId");
		

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 저장확인</title>
</head>
<body>
	
	<div id="deleteCheck">
		<p><%=userId%>님, 플래너 작성을 완료했습니다</p>
	</div>
	<div id="deleteBtn">
		<button onclick="ckPlanner();">플래너 확인하기</button>
		<button onclick="backToMain();">메인으로 돌아가기</button>
	</div>
	<script>
	
		const ckPlanner = ()=>{
			
			opener.location.replace("<%=request.getContextPath()%>"); //사이트 메인화면으로 이동함
			close(); //창 닫기
						
		}
	
	</script>
	
	
</body>
</html>