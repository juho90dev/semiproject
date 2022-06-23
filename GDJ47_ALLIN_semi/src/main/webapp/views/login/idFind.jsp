<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	String id=(String)session.getAttribute("id");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/loginForm.css"/>
<title>Insert title here</title>
</head>
<body>
      <div class="container">
         <header>Find ID</header>
         <form id="loginFrm">
         <a>가입시 입력하신 이메일을 작성해주세요.</a>
            <div class="input-field">
               <input type="text" required name="email" id="email" class="input-check-email">
        
               <label>이메일 입력</label>
            </div>
            <div class="button">
               <div class="inner"></div>
               <button type="button" onclick="fn_id();">button</button>
            </div>
            <div>
            <font id="checkEmail" size="2"></font>
            </div>
         </form>
         
        <form name="idFind">
       	<input type="hidden" name="email">
        </form>
 
      </div>
      <script>
     	 const fn_id=()=>{
     		let email=$(".input-check-email").val();// email 입력받은 값
			const url="<%=request.getContextPath()%>/idFind.do";
			$.ajax({
				url: url,
				type : "post",
				data : {email: email},
				success : function(){
					if(result!=""){
						$("#checkEmail").html('당신의 아이디는 '+result);
						$("#checkEmail").attr();
						
					}else if(result=="") {
						$("#checkEmail").html('아이디가 존재하지 않습니다.');
					}
				},
				error : function(request){
					console.log(request);
				}
			})
			
			}
      </script>
	
</body>
</html>