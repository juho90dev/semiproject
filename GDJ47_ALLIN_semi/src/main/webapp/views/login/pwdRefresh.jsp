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
         <div class="auth">
            <a href="<%=request.getContextPath()%>">HOME으로 이동</a>
         </div>
            </div>
            
            
            <script>
        	//비밀번호 확인 작성시 일치/불일치 띄워줌
        	$(()=>{
            	$("#password_2").keyup(e=>{
            		const pwVal=$("#password_").val();
            		const pwCkVal=$(e.target).val();
            		if(pwCkVal.trim().length>4){
            			if(pwCkVal===pwVal){
            				$("#pwresult").text("비밀번호 일치").css("color","#181182");
            			}else{
            				$("#pwresult").text("비밀번호 불일치").css("color","red");
            			}
            		}else{
            			$("#pwresult").text("");
            		}
            	});
        	})
        	
        	
        	
        	
        	//비밀번호 확인 불일치시 초기화
        	$(".input_password2").blur(function(){
        		
        		var p1 = document.getElementById('password_').value;
        	    var p2 = document.getElementById('password_2').value;
        	    
        	    if( p2 == '' || p2 == 'undefined') return;

        	      if( p1 != p2 ) {
        	        $("#password_2").val("");
        			$("#password_2").focus();
        			return false; 
        	      }
        	});
        	
        	
        	

        	//비밀번호 유효성 검사
        	
        		function password_check( password ) {    
        		var exr=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        	    return (password != '' && password != 'undefined' && exr.test(password)); 
        	}
        	

        	$(".input_password").blur(function(){
        	  var password = $(this).val();

        	  // if value is empty then exit
        	  if( password == '' || password == 'undefined') return;

        	  // valid check
        	  if(! password_check( password ) ) {
        	  	//$("#result-check").text('Not valid email.');
        	    //$(this).focus();
        	    //return false;
        		   alert("최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함해야 합니다.");				
        			$("#password_").val("");
        			$("#password_").focus();
        		   return false; 
        	  }
        	});
        	
        	
        	
        	
        	
        	
        	
            </script>
            
            
</body>
</html>