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
         <header>join</header>
        <form name="enrollMemberFrm" action="<%=request.getContextPath() %>/joinEnd.do" method="post" 
        onsubmit="return fn_enrollmemberValidate();" >
      
 <!-- 			<form name="enrollMemberFrm" onsubmit="return fn_enrollmemberValidate();" > -->
        

            <div class="input-field">
               <input type="text" required name="userId" id="userId_" class="input_id">
               <font id="checkId" size="2"></font>
               <label>회원 아이디(5글자 이상)</label>
            </div>
	        <!--<div class="input-field">
               <input type="button" style="cursor:pointer;" value="아이디 중복 확인" onclick="fn_idDuplicate();" >
            </div>
            -->
            <div class="input-field">
               <input type="email" required name="email" id="email" class="input-check-email">
               <font id="checkEmail" size="2"></font>
               <label>회원가입 이메일</label>
            </div>
 
           <!-- <div class="input-field">
               <input type="button" style="cursor:pointer;" value="이메일 중복 확인" onclick="fn_EmailDuplicate();">
            </div>
            -->
            <div class="input-field">
               <input type="password" required name="password" id="password_" class="input_password">
               <label>회원 비밀번호(8글자 이상)</label>
            </div>
            <div class="input-field">
               <input type="password" required id="password_2" class="input_password2" ><br>
					<span id="pwresult"></span>
               <label>비밀번호 확인(8글자 이상)</label>
            </div>
            <div class="input-field">
               <input type="text" required name="phone" id="phone" class="input_phone">
               <label>전화번호</label>
            </div>
            
        <h5>관심지역</h5> <br>
         <div class="citytravel1">
       <!--시/도-->
        <select name="addressDo1" id="addressDo" onchange="addressDochange(this)">
          <option value="sigun">시/도 선택</option>
          <option value="seoul">서울</option>
          <option value="inchoen">인천</option>
          <option value="gyeanggi">경기도</option>
          <option value="gangwondo">강원도</option>
          <option value="chungbuk">충청북도</option>
          <option value="chungnam">충청남도</option>
          <option value="daejoen">대전</option>
          <option value="sejong">세종</option>
          <option value="gungbuk">경상북도</option>
          <option value="gungnam">경상남도</option>
          <option value="daegu">대구</option>
          <option value="ulsan">울산</option>
          <option value="busan">부산</option>
          <option value="joenbuk">전라북도</option>
          <option value="joennam">전라남도</option>
          <option value="gwangju">광주</option>
          <option value="jeju">제주</option>
        
        <!--시군구-->
        </select>
        <select name="addressDogun" id="addressDogun">
          <option value="sigundo">시/군/구</option>
        </select>
      </div>
      
      
            
            
            
            
            
            
            
            
            <div class="button">
               <div class="inner"></div>
               <button id="submit">LOGIN</button>
            </div>
            
            <div class="auth">

<!-- 
            Or sign with
         	</div>
            <div class="kakao">
 				<a id="btn-kakao-login" href="">
 				<img src="https://www.baekjecc.com/image/login/kakao_login_btn.png"/ width=320px height=50px>
 				</a>
 			</div>
-->


         </form>
		<form name="idDuplicateFrm">
       	<input type="hidden" name="userId">
        </form>
        <form name="emailDuplicateFrm">
       	<input type="hidden" name="email">
        </form>
		
		
		
		<div class="auth">
            <a href="<%=request.getContextPath()%>">HOME 으로 돌아가기</a>
         </div>
		
      </div>
      
      
      
	<script>
	
//    $(function(){
//        $('#submit').on("click",function () {//button을 클릭하면 발생되는 함수
        	
        	
//        	let userId=$(".input_id").val();//입력한 아이디값
//        	let email=$("input-check-email").val();//이메일 
  //      	let password=$(".input_password").val();//비밀번호
    //    	let phone=$(".input_phone").val();//휴대전화
      //  	let city=$("#addressDo").val();//관심 도
      //  	let country=$("#addressDogun").val();//관심 시
        
        	
  //  		$.ajax({
  //  			url: url,
    //			type : "post",
   // 			data : {userId: userId},
   // 			dataType : 'json',
   // 			success : function(result){
   // 				if(result==0){
   // 					$("#").html('.');
   // 					$("#").attr('color','red');
   // 				}else{
    //					$("").html('.');
    //					$("").attr('color','green');
    //				}
    //			},
    //			error : function(){
    //				alert("서버요청실패");
    //			}
    //		})
          
    		
     //   });
  //  });
	
	
	
	
	
	
	//아이디 중복
	$('.input_id').focusout(function(){
		let userId=$(".input_id").val();// input_id에 입력되는 값
		const url="<%=request.getContextPath()%>/idCheck.do";
		$.ajax({
			url: url,
			type : "post",
			data : {userId: userId},
			dataType : 'json',
			success : function(result){
				if(result==0){
					$("#checkId").html('사용할 수 없는 아이디 입니다.');
					$("#checkId").attr('color','red');
				}else{
					$("#checkId").html('사용할 수 있는 아이디 입니다.');
					$("#checkId").attr('color','green');
				}
			},
			error : function(){
				alert("서버요청실패");
			}
		})
		
	})
	
	
	
	//이메일 중복
	$('#email').focusout(function(){
		let email=$(".input-check-email").val();
		const url="<%=request.getContextPath()%>/emailCheck.do";
		$.ajax({
			url: url,
			type : "post",
			data : {email: email},
			dataType : 'json',
			success : function(result){
				if(result==0){
					$("#checkEmail").html('사용할 수 없는 이메일 입니다.');
					$("#checkEmail").attr('color','red');
				}else{
					$("#checkEmail").html('사용할 수 있는 이메일 입니다.');
					$("#checkEmail").attr('color','green');
				}
			},
			error : function(){
				alert("서버요청실패");
			}
		})
		
	})
		
	
		const fn_idDuplicate=()=>{
			
			var popupWidth = 300;
			var popupHeight = 200;
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			var popupY= (window.screen.height / 2) - (popupHeight / 2);
			
			const userId=$("#userId_").val().trim();
			if(userId.length<5){
				alert("아이디는 5글자 이상이어야 합니다.");
				$("#userId_").focus();
			}else{
				const url="<%=request.getContextPath()%>/idDuplicate.do";
				const title="idDuplicateFrm";
    			//open("",title,"width=300,height=200");
    			open("",title,'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
    			

    			idDuplicateFrm.userId.value=userId;
    			idDuplicateFrm.method="post";
    			idDuplicateFrm.action=url;
    			idDuplicateFrm.target=title;
    			idDuplicateFrm.submit();
			}
		
		
		
		}
		
		
		const fn_EmailDuplicate=()=>{
			
			var popupWidth = 300;
			var popupHeight = 200;
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			var popupY= (window.screen.height / 2) - (popupHeight / 2);
			
			const email=$("#email").val().trim();
			
				const url="<%=request.getContextPath()%>/emailDuplicate.do";
				const title="emailDuplicateFrm";
    			open("",title,'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
    			

    			emailDuplicateFrm.email.value=email;
    			emailDuplicateFrm.method="post";
    			emailDuplicateFrm.action=url;
    			emailDuplicateFrm.target=title;
    			emailDuplicateFrm.submit();
			

		
		}

	
	
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
	
	

	//회원가입 완료 버튼 누르고 페이지 전환될때 확인 메세지창
	const fn_enrollmemberValidate=()=>{
    		//아이디의 길이 4이상
    		const userId=$("#userId_").val();
    		if(userId.trim().length<5){
    			alert("아이디는 5글자이상으로 작성하세요");
    			$("#userId_").focus();
    			return false;

    		}else if(userId.trim().length>15){
    			alert("아이디는 15글자 이하로 작성하세요");
    			$("#userId_").focus();
    			return false;
    		}
    		
    		//정규식표현
    		const exr=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
    		
    		//password 조건에 대한 알림
    		const password=$("#password_").val();
    		if(password.trim().length<8 || !exr.test(password)){
				alert("최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함해야 합니다.");
				$("#password_2").val("");
				$("#password_").focus();
				return false;
				
    		}else if(password.trim().length>15 || !exr.test(password)){
				alert("비밀번호는 15자 이내로 작성해주세요");
				$("#password_2").val("");
				$("#password_").focus();
				return false;
    		}
    		return true;
    		
    		
    		
    		//대도시 지역 값 입력 확인
    		
    	}
	
	
	
	
	
	// 이메일 유효성 검사
	function email_check( email ) {    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email)); 
	}

	$(".input-check-email").blur(function(){
	  var email = $(this).val();

	  // if value is empty then exit
	  if( email == '' || email == 'undefined') return;

	  // valid check
	  if(! email_check(email) ) {
	  	//$("#result-check").text('Not valid email.');
	    //$(this).focus();
	    //return false;
		   alert("이메일 양식에 맞추어 작성해주세요"); 				
		   $("#email").val("");
			$("#email").focus();
		   return false; 
	  }
	});
	
	

	
	
	// 아이디 유효성 검사
	function id_check( id ) {    
		var idRegExp = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
	    return (id != '' && id != 'undefined' && idRegExp.test(id)); 
	}
	

	$(".input_id").blur(function(){
		  var id = $(this).val();

		  // if value is empty then exit
		  if( id == '' || id == 'undefined') return;

		  // valid check
		  if(! id_check( id ) ) {
		  	//$("#result-check").text('Not valid email.');
		    //$(this).focus();
		    //return false;
			   alert("첫 글자는 영문자이며, 영문 대소문자와 숫자 4~12자리로 입력해야합니다!"); 				
			   $("#userId_").val("");
				$("#userId_").focus();
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
	
	
	//전화번호 유효성 검사
	

		$(".input_phone").blur(function(){
  		const phoneNumber = $(this).val();
		const number= phoneNumber.replace(/-/g, "");
  		
  		// 만약 값이 빈값이면
  		if( number == '' || number == 'undefined') return;

 	 	if(number.length!=11 ) {
 	 	//$("#result-check").text('Not valid email.');
	    //$(this).focus();
 	   //return false;
		   alert("전화번호를 다시 입력해 주세요");
			$("#phone").val("");
			$("#phone").focus();
		   return false; 
		  }
		});
	

	
	
	
	
		   // 지역 드롭다운 함수
	 function addressDochange(e) {
	
	      const seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	      const inchoen = ["강화군", "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구"];
	      const gyeanggi = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
	      const gangwondo = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];
	
	      const chungbuk = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "진천군", "청원군", "청주시", "충주시", "증평군"];
	      const chungnam = ["공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아신시", "예산군", "천안시", "청양군", "태안군", "홍성군", "계룡시"];
	      const daejoen = ["대덕구", "동구", "서구", "유성구", "중구"];
	      const sejong = ["세종특별자치시"];
	      const gungbuk = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
	      const gungnam = ["거제시", "거창군", "고성군", "김해시", "남해군", "마산시", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "진해시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];
	
	      const daegu = ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
	      const ulsan = ["중구", "남구", "동구", "북구", "울주군"];
	      const busan = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
	
	      const joenbuk = ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
	      const joennam = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
	      const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	
	      const jeju = ["남제주군", "북제주군", "서귀포시", "제주시"];
	
	      const target = document.getElementById("addressDogun");
	
	      if (e.value == "seoul") d = seoul;
	      else if (e.value == "inchoen") d = inchoen;
	      else if (e.value == "gyeanggi") d = gyeanggi;
	      else if (e.value == "gangwondo") d = gangwondo;
	      else if (e.value == "chungbuk") d = chungbuk;
	      else if (e.value == "chungnam") d = chungnam;
	      else if (e.value == "daejoen")  d = daejoen;
	      else if (e.value == "sejong")  d = sejong;
	      else if (e.value == "gungbuk")  d = gungbuk;
	      else if (e.value == "gungnam") d = gungnam;
	      else if (e.value == "daegu") d = daegu;
	      else if (e.value == "ulsan") d = ulsan;
	      else if (e.value == "busan") d = busan;
	      else if (e.value == "joenbuk") d = joenbuk;
	      else if (e.value == "joennam") d = joennam;
	      else if (e.value == "gwangju") d = gwangju;
	      else if (e.value == "jeju") d = jeju;
	
	      target.options.length = 0;
	
	      d.forEach(v1=>{
	        let opt = document.createElement("option");
	        opt.value = v1;
	        opt.innerHTML = v1;
	        target.appendChild(opt);
	      });
	    }
		   
		   
		   
		$('.input_id').focusout(function(){
			let userId=$(".input_id").val();// input_id에 입력되는 값
			const url="<%=request.getContextPath()%>/idCheck.do";
			$.ajax({
				url: url,
				type : "post",
				data : {userId: userId},
				dataType : 'json',
				success : function(result){
					if(result==0){
						$("#checkId").html('사용할 수 없는 아이디 입니다.');
						$("#checkId").attr('color','red');
					}else{
						$("#checkId").html('사용할 수 있는 아이디 입니다.');
						$("#checkId").attr('color','green');
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			})
			
		})

	
	
	
	
	
	
	
	
	
	</script>
	
	<style>
		#addressDo,#addressDogun{
		    background-color: white;
		    border: 1px solid #BDBDBD;
		    border-radius: 10px;
		    display: inline-block;
		    font: inherit;
		    line-height: 1.5em;
		    padding: 0.5em 3.5em 0.5em 1em;
		
		margin: 0;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		-webkit-appearance: none;
		-moz-appearance: none;
		
		
		background-image:
		linear-gradient(45deg, transparent 50%, gray 50%),
		linear-gradient(135deg, gray 50%, transparent 50%),
		radial-gradient(#ddd 70%, transparent 72%);
		background-position:
		calc(100% - 20px) calc(1em + 2px),
		calc(100% - 15px) calc(1em + 2px),
		calc(100% - .5em) .5em;
		background-size:
		5px 5px,
		5px 5px,
		1.5em 1.5em;
		background-repeat: no-repeat;
		}
	</style>

   </body>
</html>