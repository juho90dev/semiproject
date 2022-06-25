<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- 관광지 검색 누르면 나오는 페이지 -->
    
   <section>
    <div id="searchResult">
      <div id="stitle">
      <div class="dropdown-label">
        검색결과
        <span style="font-family: Material Icons;">search</span>
      </div>

      <div id="koreatravel">
		
        <div class="travel1">

          <select name="tema" id="maintema" onchange="change(this)">

            <option value="tematitle"> 테마 선택</option>
            <option value="enviroment"> 자연</option>
            <option value="people"> 인문(문화/예술/역사)</option>
            <option value="course"> 추천코스</option>
            <option value="leport"> 레포츠</option>
            <option value="accommodation"> 숙박</option>
            <option value="showping">쇼핑</option>
            <option value="food">음식 </option>

          </select>
          <select name="sub" id="subtema">
            <option value="subtematitle"> 상세테마 선택</option>



          </select>
        </div>

        <div class="citytravel1">

          <select name="addressDo" id="addressDo" onchange="addressDochange(this)">
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

          </select>
          <select name="addressDogun" id="addressDogun">
            <option value="sigundo">시/군/구</option>
          </select>
        </div>
        <div class="nav">
          <input type="text" id="text" placeholder="관광지 입력">
          <input type="submit" id="search" value="검색">
        </div>
      </div>
      </div>
     <div id="conatainer5">
      <div id = "searresult">
        <div class ="firstimg1">
          <a href="<%=request.getContextPath()%>/views/searchresult/searchresult.jsp"> <img src="<%=request.getContextPath()%>/images/mi.jpg" alt=""></a>  
        </div>
        <div class = "firstimg1title">안녕</div>
      </div>
    </div>
    </div>

    <div id="root">
      <div class="dropdown-label1">
        추천루트
        <span style="font-family: Material Icons;">airport_shuttle</span>
      </div>
      <div class="dropdown">
        <button class="dropbtn">
          <span class="dropbtn_icon">more_horiz</span>
          <span class="dropbtn_content">Select a menu...</span>
          <span class="dropbtn_click"
            style="font-family: Material Icons; font-size : 16px; font-weight: bolder; color : #3b3b3b; float:right;"
            onclick="dropdown()">arrow_drop_down</span>
        </button>
        <div class="dropdown-content">
          <div class="fastfood" onclick="showMenu(this.innerText)">좋아요</div>
          <div class="fastfood" onclick="showMenu(this.innerText)">조회순</div>
        </div>
      </div>
      <div style="overflow:auto; width:80%; height:400px;" class="tbroot">
        <!--  이 부분 overflow : hidden으로 -->

        <table>
          <tr>
            <th class="align-left"> test완료</th>
          </tr>
          <tr>
            <td class="text-ellipsis">너무
              어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
          </tr>
        </table>
        <table>
          <tr>
            <th class="align-left"> test완료</th>
          </tr>
          <tr>
            <td class="text-ellipsis">너무
              어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
          </tr>
        </table>
        <table>
          <tr>
            <th class="align-left"> test완료</th>
          </tr>
          <tr>
            <td class="text-ellipsis">너무
              어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
          </tr>
        </table>
        <table>
          <tr>
            <th class="align-left"> test완료</th>
          </tr>
          <tr>
            <td class="text-ellipsis">너무
              어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻdfasdfafafafsfasdfadfafdaㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ1
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <th class="align-left"> test완료</th>
          </tr>
          <tr>
            <td class="text-ellipsis">너무
              어려움ㅁㄹㅇㅁㄴㅇㄻㄴㄻdfasdfafafafsfasdfadfafdaㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㅁㄴㅇㄻㄴㄻㅇㄻㄴㅇㄻㄴㅇㄻㄻㄴㅇㄻㅇㄻㄴㄻㄹㅇㅁㅇㄻㅇㄻㄴㄹㅇㅁㄴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ1
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <th class="align-left"> test완료</th>
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
    #stitle{
        display: inline-block;
        width: 100%;
        height: 150px;
        border: 1px solid orange;
        
    }
    #conatainer5{
      display: inline-block;
      max-width: 150px;
      max-height : 150px;
      border: 1px solid black;
      margin-top: 20px;
      margin-left: 20px;
     
    }
    #searresult{
      display: inline-block;
      justify-content: center;
      border: 1px solid black;
      max-width: 150px;
      max-height: 150px;

      
    }

    .firstimg1{
      border : 1px solid blue;
      width: 150px;
      height: 120px;
    }

    .firstimg1title{
      border: 1px solid red;
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
      border: 1px solid red;
      width: 300px;
      height: 50px;
      float: left;

    }

    .citytravel1 {
      display: flex;
      justify-content: center;
      border: 1px solid red;
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
      justify-content: center;

      width: 600px;
      height: 50px;
      border: 1px solid black;
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

    .nav>#search {
      display: flex;
      margin-top: 10px;
      font-size: 18px;
      border: none;
      background-color: rgb(93, 182, 93);
      width: 50px;
      height: 30px;
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
      border: 1px solid black;
      width: 90%;
      height: auto;
      border-radius: 15px;
      background-color: gray;
    }


    .material-symbols-sharp {
      font-variation-settings:
        'FILL'0,
        'wght'400,
        'GRAD'0,
        'opsz'48
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
      border: 1px solid black;
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
      border: 1px solid purple;
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

  </script>
  <script>
    // 테마 드롭다운
    let d1;
    function change(e1) {

      const enviroment = ["자연관광지", "관광자원"];
      const people = ["역사관광지", "휴양관광지", "체험관광지", "산업관광지", "건축/조형물", "문화시설", "축제", "공연/행사"];
      const course = ["가족코스", "나홀로코스", "힐링코스", "도보코스", "캠핑코스", "맛코스"];
      const leport = ["레포츠 소개", "육상 레포츠", "수상 레포츠", "항공 레포츠", "복합 스포츠"];
      const accommodation = ["숙박 시설"];
      const showping = ["쇼핑"];
      const food = ["음식점"];

      let target1 = document.getElementById("subtema");
      
      if (e1.value == "tematitle") d1 = tematitle;
      else if (e1.value == "enviroment") d1 = enviroment;
      else if (e1.value == "people") d1 = people;
      else if (e1.value == "course") d1 = course;
      else if (e1.value == "leport") d1 = leport;
      else if (e1.value == "accommodation") d1 = accommodation;
      else if (e1.value == "showping")  d1 = showping;
      else if (e1.value == "food")  d1 = food;

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
  