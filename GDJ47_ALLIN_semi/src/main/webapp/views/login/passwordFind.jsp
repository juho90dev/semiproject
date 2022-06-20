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
         <a>가입시 입력하신 이메일을 작성해주세요.</a>
         <form id="loginFrm" action="<%=request.getContextPath() %>/" method="post">
            <div class="input-field">
               <input type="text" required name="email">
               <label>이메일 입력</label>
            </div>
            <div class="button">
               <div class="inner"></div>
               <button>button</button>
            </div>
 
      </div>
</body>
</html>