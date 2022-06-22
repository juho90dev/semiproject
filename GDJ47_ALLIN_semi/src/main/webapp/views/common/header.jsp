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
	<title>ALL IN</title>
</head>

<body>

	<header>

		<nav class="navbar">
			<div class="logo">
				<img class=imgs1 src="<%=request.getContextPath()%>/images/logo.png" alt="">
			</div>
			<div class="title">
				<a href="<%=request.getContextPath()%>"> <img class=imgs2 src="<%=request.getContextPath()%>/images/logo1.png" alt=""></a>
			</div>
			<%if(login==null) {%>
			<div class="btn">
            	<button type="button" class="btn btn-outline-secondary" onclick="location.href='/GDJ47_ALLIN_semi/views/login/login.jsp'">로그인</button>
                <button type="button" class="btn btn-outline-warning" onclick="location.href='/GDJ47_ALLIN_semi/views/login/join.jsp'">회원가입</button>
               
			</div>
           <%} else{%>
           	<div>
           				<tr>
							<td colspan="2">
								<%=login.getUserId() %>님
							</td>
						</tr>
						<tr>
						
						
				<div class="dropdown">
				<td class="dropbtn" >
				<img src="http://weldingsystemmall.co.kr/theme/hmon/img/icon/if_user-ciecle-round-account-person_3209203.png" width="30" height="30">
				</td>
				  <div class="dropdown-content">
				  	<%if(login!=null&&login.getGrade().equals("normal")) {%>
	                	<a onclick="mypagee();" style="cursor:pointer;">마이페이지</a>
	                <%}else{%>
	                	<a onclick="mypage();" style="cursor:pointer;">마이페이지</a>
	                <%}%>
				    <a onclick="logout();" style="cursor:pointer;">로그아웃</a>
				  </div>
				</div>
							<tr>
							<td>
							 <button type="button" class="btn btn-outline-dark" onclick="javascript:openPay()">이용료결제</button>
							</td>
						</tr>
				
			  </div>
						</tr>
			</div>
			<%}%>
			<div class="navbar_menu">
				<nav role="navigation">
					<ul id="main-menu">

						<li><a href="javascript:void(0);" onclick="openPlaces();">관광지</a></li>
						<li><a href="javascript:void(0);" onclick="openPlanCreator();">플랜 크리에이터</a></li>
						<li><a href="javascript:void(0);" onclick="openPlanner();">플랜</a> 
						<!-- <ul id="sub-menu">
                                <li><a href="#" aria-label="subemnu">submenu</a></li>
                               
                            </ul> --></li>
						<li><a href="">게시판</a></li>
						<li><a href="javascript:openWeather()" >날씨예보</a></li>
						<li><a href="">공지사항</a></li>

						

	                <%if(login!=null&&login.getUserId().equals("admin")) {%>
	                <li id="memberManage"><a href="<%=request.getContextPath()%>/memberList.do">관리자</a></li>
	                <li id="memberManage"><a href="<%=request.getContextPath()%>/paid.do">결제</a></li>
	                <%}%>
	             
					</ul>
				</nav>
			</div>

			
			<a href="#" class="navbar_toogleBtn"> <span
				class="material-symbols-outlined"> density_medium</span>
			</a>
		</nav>

	</header>
	
	  <script>
	  	//미결제회원 접근 제한
	  	const openPlanCreator=()=>{
	  		<%if(login!=null&&login.getPay().equals("Y")) {%>
	  		location.href=("<%=request.getContextPath()%>/plannerMember.do");
	  		<%}else {%> 
	  
	  		 alert("사이트 이용을 위해서는 결제를 완료해야합니다. (홈페이지 상단 이용료결제버튼을 눌러 결제페이지로 이동해주세요!)");
	  		
	  		<%}%>
	  	}
	  	const openPlanner=()=>{
	  		<%if(login!=null&&login.getPay().equals("Y")) {%>
	  		location.href=("<%=request.getContextPath()%>/planner/plannerMakerStarter.do");
	  		<%}else {%> 
	  
	  		 alert("사이트 이용을 위해서는 결제를 완료해야합니다. (홈페이지 상단 이용료결제버튼을 눌러 결제페이지로 이동해주세요!)");
	  		
	  		<%}%>
	  		
	  	}
	  	
	  	const openPlaces=()=>{
	  		<%if(login!=null&&login.getPay().equals("Y")) {%>
	  		location.href=("<%=request.getContextPath()%>/search/SearchPage.do");
	  		<%}else {%> 
	  
	  		 alert("사이트 이용을 위해서는 결제를 완료해야합니다. (로그인 후 홈페이지 상단 이용료결제버튼을 눌러 결제페이지로 이동해주세요!)");
	  		
	  		<%}%>
	  		
	  	}
	  
	  
	  	const openWeather=()=>{
	  		window.open("<%=request.getContextPath()%>/weatherstart.do","","_blank");
	  	}
	  
        const toggleBtn = document.querySelector('.material-symbols-outlined');
        const menu = document.querySelector('.navbar_menu');
        toggleBtn.addEventListener('click', () => {
            menu.classList.toggle('active');
            icons.classList.toggle('active');
        })
        
        
                const logout=()=>{
				location.replace("<%=request.getContextPath()%>/logout.do");
				alert("로그아웃 되었습니다.");
			}
        
        
        
            const mypage=()=>{
            	
			location.replace("<%=request.getContextPath()%>/views/mypage/mypage.jsp");
			}
            
            const mypagee=()=>{
            	
			location.replace("<%=request.getContextPath()%>/views/mypage/mypagee.jsp");
			}
        
        
        
        const openPay=()=>{
        	window.open("<%=request.getContextPath()%>/views/pay/pay.jsp");
        }
        
        
        
        
        
    </script>
    
    <style>
    
    	.dropdown {
		  position: relative;
		  display: inline-block;
		}
		
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #f1f1f1;
		  min-width: 160px;
		  z-index: 1;
		}
		
		.dropdown-content a {
		  color: black;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		}
		
		.dropdown-content a:hover {background-color: #ddd;}
		
		.dropdown:hover .dropdown-content {display: block;}
    
    
    
    
    
    
    
    
    
    
    
    	header {
	margin: 0;
	padding: 0;
}

.logo {
	display: inline-block;
	border: 1px solid red;
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
	height: 20%;
	background: linear-gradient(90deg, #051937, #004d7a, #008793, #00bf72, #a8eb12);

	/* overflow-x:hidden; 줄내려가기 2번페이지에서 쓰기 */
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
	border: 1px solid red;
}

.title>a {
	font-size: 30px;
	font-weight: bolder;
	text-align: center;
	color: black;
	text-decoration: none;
	/* 458px */
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
	border: 1px solid black;
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
	padding: 14px 36px;
	border-right: 1px solid rgba(0, 0, 0, 0.15);
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
}

#main-menu>li:nth-child(1)>a {
	border-left: 1px solid rgba(0, 0, 0, 0.15);
}

#sub-menu {
	position: relative;
	background: #182952;
	opacity: 4;
	visibility: hidden;
	transition: all 0.15s ease-in;
}

#sub-menu>li {
	padding: 16px 28px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.15);
}

#sub-menu>li>a {
	color: black;
	text-decoration: none;
}

#main-menu>li:hover #sub-menu {
	opacity: 1;
	visibility: visible;
	background-color: aquamarine;
}

#sub-menu>li>a:hover {
	text-decoration: underline;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.material-symbols-outlined {
	position: absolute;
	right: 15px;
	top: 60px;
	font-size: 40px;
	font-weight: bolder;
	color: greenyellow;
}

@media screen {
	.navbar_menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width: 100%;
		height: 50px;
	}
	@media screen {
		.navbar_menu.active {
			display: inline-block;
		}
	}
}
    </style>