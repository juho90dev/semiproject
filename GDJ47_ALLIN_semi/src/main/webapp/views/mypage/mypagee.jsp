<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.model.vo.Member" %>
<%
Member m=(Member)session.getAttribute("login");
%> 
    
    
    <body>
  <div class="outer">
		<div id="joinInfoArea">
		<a href="<%=request.getContextPath() %>">이전 페이지로 이동</a>
			<form id="joinForm" action="<%=request.getContextPath() %>/updateMemberr.do" method="post" onsubmit="return validate();">
				<h1>정보 수정</h1>
				
				<h4>아이디</h4>
				<span class="input_area"><input type="text" maxlength="13" name="userId" value="<%=m.getUserId()%>" readonly></span>

        <h4>이메일</h4>
				<span class="input_area"><input type="email" name="email" value="<%=m.getEmail()%>" readonly></span>
				
				<h4>비밀번호</h4>
				<span class="input_area"><input type="password" maxlength="15" name="userPwd" value="<%=m.getPassword()%>" readonly></span>
				<button id="pwdUpdateBtn" type="button">비밀번호 변경</button>

        <h4>전화번호</h4>
				<span class="input_area"><input type="tel" maxlength="11" name="phone"
										placeholder="(-없이)01012345678" value="<%=m.getPhone()%>"></span>
								
		<h4>관심지역</h4>
          <div class="citytravel1">
          <!--시/도-->
           <select name="addressDo1" id="addressDo" onchange="addressDochange(this)" value="<%=m.getCity()%>">
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
         
       
										
				

				
				<div class="btnArea">
					<button id="joinBtn">수정하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		function validate(){
			return true;
		}


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
    		   
    		   
    		   
    		   
    	document.getElementById("addressDo").value="<%=m.getCity()%>";   

    	document.getElementById("addressDogun").value="<%=m.getCountry()%>"; 
    	
    	document.getElementById("introduce").value="<%=m.getIntroduce()%>";
    	
    	document.getElementById("image").value="<%=m.getImage()%>";
    	
    	
    	
    	
    		   

	</script>



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




   </body>