<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div class="outer">
	<div id="joinInfoArea">
    <form id="joinForm" action="<%=request.getContextPath()%>/updatePwd.do" method="post" onsubmit="return validate();">
    <h4>현재 비밀번호</h4>
    <span class="input_area">
    <input type="password" required maxlength="15" name="password" class="input_pwd" >
    </span>
    <br><br>
    <font id="checkPwd" size="3"></font><br>
    <h4>새 비밀번호</h4>
    <span class="input_area">
    <input type="password" required name="password_new" id="password_" class="input_password">
    </span>
    <br><br>
    <h4>비밀번호 확인</h4>
    <span class="input_area">
    <input type="password" required id="password_2" class="input_password2" >
    </span>
    <br><br>
    <span id="pwresult"></span>
    <br>
    <br>
    <input id="pwdUpdateBtn" type="submit" value="변경"/>
    <input type="hidden" name="userId" value="<%=request.getParameter("userId") %>"/>
    </form>
    </div>
    </div>




	<script>
		$('.input_pwd').focusout(function(){
			let userPwd=$(".input_pwd").val();// input_pwd에 입력되는 값
			const url="<%=request.getContextPath()%>/pwdCheck.do";
			$.ajax({
				url: url,
				type : "post",
				data : {userPwd: userPwd},
				dataType : 'json',
				success : function(result){
					if(result){
						$("#checkPwd").html('비밀번호 확인 실패');
						$("#checkPwd").attr('color','red');
					}else{
						$("#checkPwd").html('비밀번호 확인 완료');
						$("#checkPwd").attr('color','green');
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			})
			
		})
		
		
		
		
		
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
<style>
	.outer{
		width:60%;
		min-width : 650px;
		/*background: rgb(248, 249, 250);*/
		box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 4px 0px;
		margin:auto;
		margin-top : 70px;
		margin-bottom : 70px;
	}
	
	#joinForm {
		width : 400px;
		margin: auto;
		padding: 10px;
	}
	
	#joinForm h1 {
		text-align:center;
	}
	

	.input_area {
	    border: solid 1px #dadada;
	    padding : 10px 10px 14px 10px;
	    background : white;
	}
	

	.input_area input:not([type=checkbox]) {
		width : 250px;
		height : 30px;
		border: 0px;
	}
	
	.btnArea {
		text-align:center;
		padding : 70px;
	}
	
	button {
		width : 100px;
		height : 35px;
		border : 0px;
		color:white;
		background:#282A35;
		margin : 5px;
	}
</style>
</html>