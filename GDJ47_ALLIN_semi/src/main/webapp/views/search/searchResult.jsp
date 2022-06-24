<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.search.model.vo.Search"%>
<!--import 자바 리스트와 패키시+클래스명으로 적어야한다. ;를 끝에다가 표시해서는 안된다 쓰게되면 500에러가 발생하게 됨  -->
<% List<Search> s = (List<Search>)request.getAttribute("information");%>

<!-- 관광지 검색 누르면 나오는 페이지 -->


<section>
	<div id="searchResult">
		<div id="stitle">
			<div class="dropdown-label">
				검색결과 <span style="font-family: Material Icons;">search</span>
			</div>

			<div id="koreatravel">

				<form id="search" 
					action="<%=request.getContextPath()%>/searchPage.do" method="post">
					<div class="travel1">

						<select name="maintema" id="maintema" onchange="change(this)">

							<option value="tematitle">테마 선택</option>
							<option value="자연">자연</option>
							<option value="인문">인문(문화/예술/역사)</option>
							<option value="추천코스">추천코스</option>
							<option value="레포츠">레포츠</option>
							<option value="숙박">숙박</option>
							<option value="쇼핑">쇼핑</option>
							<option value="음식">음식</option>

						</select> <select name="subtema" id="subtema">
							<option value="subtematitle">상세테마 선택</option>
						</select>
					</div>

					<div class="citytravel1">

						<select name="addressDo" id="addressDo"
							onchange="addressDochange(this)">
							<option value="sigun">시/도 선택</option>
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="대전">대전</option>
							<option value="세종">세종</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
							<option value="부산">부산</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="광주">광주</option>
							<option value="제주">제주</option>

						</select> <select name="addressDogun" id="addressDogun">
							<option value="sigundo">시/군/구</option>
						</select>
						<input type="submit" value="검색">
					</div>
					<div class="nav">
						<!-- <input type="text" id="text" placeholder="관광지 입력">  -->
						

						
						
					</div>
				</form>
			</div>
		</div>
	<%if(s!=null&&!s.isEmpty()){ 
		for(Search s1 : s){%>
		<div id="searresult">
			<div class="firstimg1">
				<a href="<%=request.getContextPath()%>/views/searchresult/searchresult.jsp">
					<img src="<%=s1.getFirstImage()%>" alt="">
				</a>
			</div>
			<div class="firstimg1title"> <%=s1.getTitle()%> </div>
		</div>
		<%	} 
		}else{%>
		
       		<div><h3>조회된결과가 없습니다!</h3></div>
       	
       	<%}%>
       
	</div>

	<div id="root">
		<div class="dropdown-label1">
			추천루트 <span style="font-family: Material Icons;">airport_shuttle</span>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				<span class="dropbtn_icon">more_horiz</span> <span
					class="dropbtn_content">Select a menu...</span> <span
					class="dropbtn_click"
					style="font-family: Material Icons; font-size: 16px; font-weight: bolder; color: #3b3b3b; float: right;"
					onclick="dropdown()">arrow_drop_down</span>
			</button>
			<div class="dropdown-content">
				<div class="fastfood" onclick="showMenu(this.innerText)">좋아요</div>
				<div class="fastfood" onclick="showMenu(this.innerText)">조회순</div>
			</div>
		</div>
		<div style="overflow: auto; width: 80%; height: 400px;" class="tbroot">
			<!--  이 부분 overflow : hidden으로 -->

			<table>
				<tr>
					<th class="align-left">test완료</th>
				</tr>
				<tr>
					<td class="text-ellipsis">너무
						어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
				</tr>
			</table>
			<table>
				<tr>
					<th class="align-left">test완료</th>
				</tr>
				<tr>
					<td class="text-ellipsis">너무
						어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
				</tr>
			</table>
			<table>
				<tr>
					<th class="align-left">test완료</th>
				</tr>
				<tr>
					<td class="text-ellipsis">너무
						어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
				</tr>
			</table>
			<table>
				<tr>
					<th class="align-left">test완료</th>
				</tr>
				<tr>
					<td class="text-ellipsis">너무
						어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻdfasdfafafafsfasdfadfafdaㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ1
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<th class="align-left">test완료</th>
				</tr>
				<tr>
					<td class="text-ellipsis">너무
						어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻdfasdfafafafsfasdfadfafdaㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ1
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<th class="align-left">test완료</th>
				</tr>
				<tr>
					<td class="text-ellipsis">너무
						어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻdfasdfafafafsfasdfadfafdaㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ1
					</td>
				</tr>
			</table>

		</div>
	</div>
</section>



<style>
#stitle {
	display: inline-block;
	width: 100%;
	height: 150px;
	
}

#searresult {
	display: inline-block;
	justify-content: center;
	border: 1px solid black;
	margin-top: 40px;
	margin-left: 20px;
	max-width: 300px;
	max-height: 300px;
}

.firstimg1 {
	display : flex;
	overflow:hidden;
	align-items: center;
    justify-content: center;
	border: 1px solid blue;
	width: 300px;
	height: 250px;

}

.firstimg1title {
	width : 200px;
	text-align : center;
}

#koreatravel {
	display: inline-block;
	justify-content: center;
	border: 1px solid black;
	height: 100px;
	margin-top: 15px;
	margin-left: 150px;
	border-radius: 15px;
	border: 1px solid pink;
}

.travel1 {
	display: flex;
	justify-content: center;
	width: 300px;
	height: 50px;
	float: left;
}

.citytravel1 {
	display: flex;
	justify-content: center;

	width: 300px;
	height: 50px;
}

#maintema {
	display: flex;
	width: 100px;
	height: 30px;
	margin-top: 10px;
	margin-right: 20px;
	margin-left: 10px;
	text-align: center;
}

#subtema {
	display: flex;
	width: 180px;
	height: 30px;
	margin-top: 10px;
	margin-right: 20px;
	text-align: center;
}

#addressDo {
	display: flex;
	width: 100px;
	height: 30px;
	margin-top: 10px;
	margin-right: 20px;
	text-align: center;
}

#addressDogun {
	display: flex;
	width: 100px;
	height: 30px;
	margin-top: 10px;
	margin-right: 20px;
	text-align: center;
}

.nav {
	display: flex;
	width: 600px;
	height: 50px;

}

.nav>#text {
	display: flex;
	margin-top: 10px;
	width: 500px;
	/* 검색창 사이즈 조절 */
	height: 30px;
	font-size: 18px;
	border: none;
	border-bottom: 3px solid rgb(93, 182, 93);
}

#search {
	display: flex;
	margin-top: 10px;
	font-size: 18px;
	border: none;
	padding-top : 10px;
	width: 600px;
	height: 5px;
	border-radius: 15px;
	color: #fff;
	cursor: pointer;
}

.img {
	margin: 15px;
}

#imgWord {
	text-align: center;
}

#searchImg {
	margin-left: 320px;
	border: 1px solid red;
	width: 180px;
	display: inline-block;
}

.align-left {
	text-align: left;
}

.text-ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	max-width: 200px;
}

.tbroot {
	margin-left: 20%;
}

.tbroot>table {
	margin-top: 20px;

	width: 90%;
	height: auto;
	border-radius: 15px;
	background-color: gray;
}

.material-symbols-sharp {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.material-symbols-sharp {
	display: inline-block;
	margin-left: 20px;
	margin-top: -5px;
	font-size: 40px;
	font-weight: bolder;
	color: black;
}

#searchResult {
	/* border-top: 3px solid gray;   */
	display: inline-block;
	border: 1px solid black;
	width: 100%;
	height: 700px;
	margin-top: 20px;
}

#root {
	/* border-top: 3px solid gray;   */
	
	width: 100%;
	height: 500px;
	margin-top: 20px;
}

h1 {
	display: inline-block;
	padding-left: 50px;
	padding-top: -30px;
	font-size: 30px;
}

#place {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.field {
	display: inline-block;
	text-align: center;
	background-color: whitesmoke;
	width: 600px;
	height: 100px;
	border-radius: 15px;
}

#korea {
	display: inline-block;
	margin-right: 50px;
	border: 1px solid blue;
}

.dropdown-label {
	display: flex;
	width: 215px;
	height: 60px;
	font-size: 40px;
	margin: 10px;
	font-weight: bold;
	color: rgb(50, 50, 50);
	margin-top: 20px;
	margin-right: 10px;
	margin-left: 80px;
	float: left;
}

.dropdown-label1 {
	font-size: 40px;
	margin: 10px;
	font-weight: bold;
	color: rgb(50, 50, 50);
	margin-top: 20px;
	margin-right: 70px;
	padding-left: 80px;
}

.dropdown {
	display: inline-block;
	float: left;
}

.dropbtn_icon {
	font-family: 'Material Icons';
}

.dropbtn {
	display: block;
	border: 2px solid rgb(94, 94, 94);
	border-radius: 4px;
	background-color: #fcfcfc;
	font-weight: 400;
	color: rgb(124, 124, 124);
	padding: 12px;
	width: 240px;
	text-align: left;
	cursor: pointer;
	font-size: 12px;
	z-index: 1;
	position: relative;
}

.dropdown-content {
	display: none;
	font-weight: 400;
	background-color: #fcfcfc;
	width: 240px;
	border-radius: 8px;
	height: 80px;
	overflow: scroll;
	box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}

.dropdown-content::-webkit-scrollbar {
	width: 5px;
	height: 10px;
}

.dropdown-content::-webkit-scrollbar-thumb {
	border-radius: 2px;
	background-color: rgb(194, 194, 194)
}

.dropdown-content div {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content div:hover {
	background-color: rgb(226, 226, 226);
}

.dropdown-content.show {
	display: block;
}
</style>


<script>
    //좋아요/조회순 드롭다운
    window.onload = () => {
      document.querySelector('.dropbtn_click').onclick = () => {
        dropdown();
      }
      document.getElementsByClassName('fastfood').onclick = () => {
        showMenu(value);
      };
      dropdown = () => {
        var v = document.querySelector('.dropdown-content');
        var dropbtn = document.querySelector('.dropbtn')
        v.classList.toggle('show');
        dropbtn.style.borderColor = 'rgb(94, 94, 94)';
      }

      showMenu = (value) => {
        var dropbtn_icon = document.querySelector('.dropbtn_icon');
        var dropbtn_content = document.querySelector('.dropbtn_content');
        var dropbtn_click = document.querySelector('.dropbtn_click');
        var dropbtn = document.querySelector('.dropbtn');

        dropbtn_icon.innerText = '';
        dropbtn_content.innerText = value;
        dropbtn_content.style.color = '#252525';
        dropbtn.style.borderColor = '#3992a8';
      }
    }
    window.onclick = (e) => {
      if (!e.target.matches('.dropbtn_click')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");

        var dropbtn_icon = document.querySelector('.dropbtn_icon');
        var dropbtn_content = document.querySelector('.dropbtn_content');
        var dropbtn_click = document.querySelector('.dropbtn_click');
        var dropbtn = document.querySelector('.dropbtn');

        var i;
        for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
          }
        }
      }
    }
  </script>

<script>
    let d;
    // 지역 드롭다운 함수
    function addressDochange(e) {

      const 서울 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
      const 인천 = ["강화군", "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구"];
      const 경기도 = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
      const 강원도 = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];

      const 충청북도 = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "진천군", "청원군", "청주시", "충주시", "증평군"];
      const 충청남도 = ["공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아신시", "예산군", "천안시", "청양군", "태안군", "홍성군", "계룡시"];
      const 대전 = ["대덕구", "동구", "서구", "유성구", "중구"];
      const 세종 = ["세종특별자치시"];
      const 경상북도 = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
      const 경상남도 = ["거제시", "거창군", "고성군", "김해시", "남해군", "마산시", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "진해시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];

      const 대구 = ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
      const 울산 = ["중구", "남구", "동구", "북구", "울주군"];
      const 부산 = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];

      const 전라북도 = ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
      const 전라남도 = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
      const 광주 = ["광산구", "남구", "동구", "북구", "서구"];

      const 제주 = ["남제주군", "북제주군", "서귀포시", "제주시"];

      const target = document.getElementById("addressDogun");

      if (e.value == "서울") d = 서울;
      else if (e.value == "인천") d = 인천;
      else if (e.value == "경기도") d = 경기도;
      else if (e.value == "강원도") d = 강원도;
      else if (e.value == "충청북도") d = 충청북도;
      else if (e.value == "충청남도") d = 충청남도;
      else if (e.value == "대전")  d = 대전;
      else if (e.value == "세종")  d = 세종;
      else if (e.value == "경상북도")  d = 경상북도;
      else if (e.value == "경상남도") d = 경상남도;
      else if (e.value == "대구") d = 대구;
      else if (e.value == "울산") d = 울산;
      else if (e.value == "부산") d = 부산;
      else if (e.value == "전라북도") d = 전라북도;
      else if (e.value == "전라남도") d = 전라남도;
      else if (e.value == "광주") d = 광주;
      else if (e.value == "제주") d = 제주;

      target.options.length = 0;

      d.forEach(v1=>{
        let opt = document.createElement("option");
        opt.value = v1;
        opt.innerHTML = v1;
        target.appendChild(opt);
      });
    }

  </script>
<script>
    // 테마 드롭다운
    let d1;
    function change(e1) {

      const 자연 = ["자연관광지", "관광자원"];
      const 인문 = ["역사관광지", "휴양관광지", "체험관광지", "산업관광지", "건축/조형물", "문화시설", "축제", "공연/행사"];
      const 추천코스 = ["가족코스", "나홀로코스", "힐링코스", "도보코스", "캠핑코스", "맛코스"];
      const 레포츠 = ["레포츠 소개", "육상 레포츠", "수상 레포츠", "항공 레포츠", "복합 스포츠"];
      const 숙박 = ["숙박 시설"];
      const 쇼핑 = ["쇼핑"];
      const 음식 = ["음식점"];

      let target1 = document.getElementById("subtema");
      
      if (e1.value == "tematitle") d1 = tematitle;
      else if (e1.value == "자연") d1 = 자연;
      else if (e1.value == "인문") d1 = 인문;
      else if (e1.value == "추천코스") d1 = 추천코스;
      else if (e1.value == "레포츠") d1 = 레포츠;
      else if (e1.value == "숙박") d1 = 숙박;
      else if (e1.value == "쇼핑")  d1 = 쇼핑;
      else if (e1.value == "음식")  d1 = 음식;

      target1.options.length = 0;

      d1.forEach(v1=>{
        let opt1 = document.createElement("option");
        opt1.value = v1;
        opt1.innerHTML = v1;
        target1.appendChild(opt1);
      });
    }

  </script>
  
<%@ include file="/views/common/footer.jsp"%>
