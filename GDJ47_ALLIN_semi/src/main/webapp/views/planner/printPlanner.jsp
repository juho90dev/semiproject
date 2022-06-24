<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/savedLogStyle.css"/>



<body>

	<div id="container">
		<div id="plannerHeader">
			<h1 id="plannerTitle"><%=login!=null?login.getUserId():"회원"%>님의 플래너</h1>
			<br>
			<select id="planOption">
				<option>예시</option>
			</select>
			<div id="placeMap"></div>
		
		</div>
	</div>


</body>
</html>