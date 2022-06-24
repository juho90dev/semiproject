<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.login.model.vo.Member" %>
	<%
		Member login=(Member)session.getAttribute("login");
	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/HeaderStyle.css"/> --%>
	
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>

<body>

	<header>

		<nav class="navbar">
			<div class="logo">
				<img class=imgs1 src="<%=request.getContextPath()%>/images/logo.png" alt="">
			</div>
			<div class="title">
				<a href=""> <img class=imgs2 src="<%=request.getContextPath()%>/images/logo1.png" alt=""></a>
			</div>

			<div class="btn">
				<button type="button" class="btn btn-outline-secondary">로그인</button>
				<button type="button" class="btn btn-outline-warning">회원가입</button>
			</div>
			<div class="navbar_menu">
				<nav role="navigation">
					<ul id="main-menu">

						<li><a href="<%=request.getContextPath()%>/views/search/searchpage.jsp">관광지</a></li>
						<li><a href="">플랜 크리에이터</a></li>
						<li><a href="">플랜</a> </li>
						<li><a href="">게시판</a></li>
						<li><a href="javascript:openWeather()" >날씨예보</a></li>
						<li><a href="">공지사항</a></li>
						<li><a href="">관리자</a></li>
						
					</ul>
				</nav>
			</div>
		</nav>

	</header>
	
	
    
    <style>
    	header {
	margin: 0;
	padding: 0;
}

.logo {
	display: inline-block;
	
	max-width: 150px;
	max-height: 150px;
	margin-top: 10px;
	margin-right: 300px;
	margin-bottom: 10px;
}

.navbar {
	display: flex;
	justify-content: center;
	width: 100%;
	height: 200px;
	background: linear-gradient(90deg, #051937, #004d7a, #008793, #00bf72, #a8eb12);


}

body {
	margin: 0;
}

.title {
	display: flex;
	text-align: center;
	margin-right: 300px;
	width: 300px;
	height: 70px;

}

.title>a {
	font-size: 30px;
	font-weight: bolder;
	text-align: center;
	color: black;
	text-decoration: none;
	
}

.imgs1 {
	display: inline-block;
	max-width: 140px;
	max-height: 150px;
	border-radius: 30px;
}

.imgs2 {
	display: inline-block;
	width: 300px;
	height: 70px;
	
}

nav {
	width: 100%;
	display: flex;
	justify-content: center;
	position: relative;
	background: linear-gradient(90deg, #051937, #004d7a, #008793, #00bf72, #a8eb12);
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

#main-menu>li {
	float: left;
	position: relative;
}

#main-menu>li>a {
	font-size: 0.85rem;
	color: rgba(255, 255, 255, 0.85);
	text-align: center;
	text-decoration: none;
	letter-spacing: 0.05em;
	display: flex;
	padding: 10px 36px;
	border-right: 1px solid rgba(0, 0, 0, 0.15);
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
}


    </style>