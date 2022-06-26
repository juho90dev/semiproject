<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/loginForm.css"/>
<title>Insert title here</title>
</head>
<body>
      <div class="container">
         <header>Find PassWord</header>
         <form id="loginFrm" action="<%=request.getContextPath()%>/pwdRefresh.do" method="post">
            <a>가입한 아이디/이메일을 작성해주세요.</a>
            <div class="input-field">
               <input type="text" required name="userId">
               <label>아이디 입력</label>
            </div>
            <div class="input-field">
               <input type="text" required name="email">
               <label>이메일 입력</label>
            </div>
            <div class="button">
               <div class="inner"></div>
               <button>button</button>
            </div>
         <div class="auth">
            <a href="<%=request.getContextPath()%>">HOME으로 이동</a>
         </div>
 
      </div>
</body>
</html>