<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/loginForm.css"/>
</head>
<body>
  <div class="container">
  <header>비밀번호 변경</header>
     <form name="enrollMemberFrm" action="<%=request.getContextPath() %>/finalPwd.do" method="post" >
            <div class="input-field">
               <input type="text" required name="userId" id="userId_" class="input_id">
               <font id="checkId" size="2"></font>
               <label>회원 아이디(5글자 이상)</label>
            </div>
            <div class="input-field">
               <input type="password" required name="password" id="password_" class="input_password">
               <label>회원 비밀번호(8글자 이상)</label>
            </div>
            <div class="input-field">
               <input type="password" required id="password_2" class="input_password2" ><br>
					<span id="pwresult"></span>
               <label>비밀번호 확인(8글자 이상)</label>
            </div>
            <div class="button">
               <div class="inner"></div>
               <button id="submit">LOGIN</button>
            </div>
            </form>
            </div>
</body>
</html>