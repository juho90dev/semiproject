<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/loginForm.css"/>
</head>
 <body>
      <div class="container">
         <header>Login</header>

         <form id="loginFrm" action="<%=request.getContextPath() %>/login.do" method="post">
            <div class="input-field">
               <input type="text" required name="userId" id="userId">
               <label>아이디 입력</label>
            </div>
            <div class="input-field">
               <input class="pswrd" type="password" required name="password" id="password">
               <span class="show">SHOW</span>
               <label>비밀번호 입력</label>
            </div>
            <div class="button">
               <div class="inner"></div>
               <button>LOGIN</button>
            </div>

            </form>

	<a href="<%=request.getContextPath() %>/idFindMiddle.do">아이디 찾기</a> | <a href="<%=request.getContextPath() %>/pwdFindMiddle.do">비밀번호 찾기</a>
	<!-- 	<a href="/GDJ47_ALLIN_semi/views/login/idFind.jsp">아이디 찾기</a> | <a href="/GDJ47_ALLIN_semi/views/login/passwordFind.jsp">비밀번호 찾기</a> -->
         
         <div class="auth">
            <a href="<%=request.getContextPath()%>">GO BACK HOME</a>
         </div>
<!--       
		<div class="links">
            <div class="facebook">
               <i class="fab fa-facebook-square"><span>Facebook</span></i>
            </div>
            <div class="google">
               <i class="fab fa-google-plus-square"><span>Google</span></i>
            </div>
         </div>
 --> 
 		<div class="links">
 <!-- 			<div class="kakao">
 				<a id="btn-kakao-login" href="">
 				<img src="https://www.baekjecc.com/image/login/kakao_login_btn.png"/ width=320px height=50px>
 				</a>
 			</div>
 	-->
 		
 		</div>
         <div class="signup">
            회원이 아니라면 <a href="<%=request.getContextPath()%>/JoinEndMiddleServlet.do">지금 가입하세요</a>
            <!--             회원이 아니라면 <a href="/GDJ47_ALLIN_semi/views/login/join.jsp">지금 가입하세요</a> -->
         </div>
         
      </div>
      
      <script>
         var input = document.querySelector('.pswrd');
         var show = document.querySelector('.show');
         show.addEventListener('click', active);
         function active(){
           if(input.type === "password"){
             input.type = "text";
             show.style.color = "#1DA1F2";
             show.textContent = "HIDE";
           }else{
             input.type = "password";
             show.textContent = "SHOW";
             show.style.color = "#111";
           }
         }
      </script>
   </body>
</html>