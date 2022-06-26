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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
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
         <!--   <button type="button" class="btn btn-outline-secondary" onclick="location.href='/GDJ47_ALLIN_semi/views/login/login.jsp'">로그인</button>
                <button type="button" class="btn btn-outline-warning" onclick="location.href='/GDJ47_ALLIN_semi/views/login/join.jsp'">회원가입</button> -->
               <button type="button" class="btn btn-outline-secondary" onclick="javascript:login();">로그인</button>
                <button type="button" class="btn btn-outline-warning" onclick="javascript:join();">회원가입</button>
               
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
                      <button type="button" class="btn btn-outline-dark" onclick="javascript:openPay()">기부금결제</button>
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
                  <li><a href="<%=request.getContextPath()%>/boardWrite.do?login.getUserId()">신고게시판</a></li>
                  <li><a href="javascript:openWeather()" >날씨예보</a></li>
                  <li><a href="<%=request.getContextPath()%>/noticeList.do"">공지사항</a></li>

                  

                   <%if(login!=null&&login.getUserId().equals("admin")) {%>
                   <li id="memberManage"><a href="<%=request.getContextPath()%>/memberList.do">관리자</a></li>
                   <%}%>
                
               </ul>
            </nav>
         </div>
      </nav>

   </header>
   
     <script>
        //비회원 접근제한
        const openPlanCreator=()=>{
           <%if(login!=null) {%>
           location.href=("<%=request.getContextPath()%>/plannerMember.do");
           <%}else {%> 
     
            alert("회원전용메뉴입니다. 회원가입 후 로그인해주세요!");
           
           <%}%>
        }
        const openPlanner=()=>{
           <%if(login!=null) {%>
           location.href=("<%=request.getContextPath()%>/planner/plannerMakerStarter.do");
           <%}else {%> 
     
            alert("회원전용메뉴입니다. 회원가입 후 로그인해주세요!");
           
           <%}%>
           
        }
        openPlaces=()=>{
        	location.href=("<%=request.getContextPath()%>/search/SearchPage.do");
            
        };
 
        const openWeather=()=>{
           
           window.open("<%=request.getContextPath()%>/weatherstart.do","","_blank");
        }
     
        const toggleBtn = document.querySelector('.material-symbols-outlined');
        const menu = document.querySelector('.navbar_menu');
        /* toggleBtn.addEventListener('click', () => {
            menu.classList.toggle('active');
            icons.classList.toggle('active');
        }) */
        
        
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
           location.assign("<%=request.getContextPath()%>/views/pay/pay.jsp");
        }
        
        const login=()=>{
        	location.replace("<%=request.getContextPath()%>/LoginMiddleServlet.do");
        }
        
        const join=()=>{
        	location.replace("<%=request.getContextPath()%>/JoinEndMiddleServlet.do");
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
                  
