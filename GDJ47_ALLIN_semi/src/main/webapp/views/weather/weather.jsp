<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<head>
<meta charset="UTF-8">
</head>
<body>
<label>날씨</label>
	<!--  <h2>단기예보</h2>
		<div class="citytravel1">

          <select name="addressDo" id="addressDo" onchange="addressDochange(this)">
            <option value="sigun">시/도 선택</option>
            <option value="seoul">서울특별시</option>
            <option value="inchoen">인천광역시</option>
            <option value="gyeanggi">경기도</option>
            <option value="gangwondo">강원도</option>
            <option value="chungbuk">충청북도</option>
            <option value="chungnam">충청남도</option>
            <option value="daejoen">대전광역시</option>
            <option value="sejong">세종특별자치시</option>
            <option value="gungbuk">경상북도</option>
            <option value="gungnam">경상남도</option>
            <option value="daegu">대구광역시</option>
            <option value="ulsan">울산광역시</option>
            <option value="busan">부산광역시</option>
            <option value="joenbuk">전라북도</option>
            <option value="joennam">전라남도</option>
            <option value="gwangju">광주광역시</option>
            <option value="jeju">제주</option>

          </select>
          <select name="addressDogun" id="addressDogun">
            <option value="sigundo">시/군/구</option>
          </select>
          <button onclick="checkShortWeather();">실시간날씨조회</button> 
          <button onclick="checkShortWeather();">실시간날씨조회</button>
        </div>  -->

	<div>
	<h2>중기예보</h2>
	<p>*중기육상예보는 조회일로부터 +3일 ~ +10일 사이의 기상정보만 조회가능<br><br>일 2회(06:00,18:00)회 생성 되며 최근 24시간 자료만 제공<br>출처: 기상청 중기육상예보</p>
	<select class="form-control" id="menu" name="menu" required>
	    <option value="" disabled selected>지역</option>
	    <option value="11B00000">서울, 인천, 경기도</option>
	    <option value="11D10000">강원도영서</option>
	    <option value="11D20000">강원도영동</option>
	    <option value="11C20000">대전, 세종, 충청남도</option>
	    <option value="11C10000">충청북도</option>
	    <option value="11F20000">광주, 전라남도</option>
	    <option value="11F10000">전라북도</option>
	    <option value="11H10000">대구, 경상북도</option>
	    <option value="11H20000">부산, 울산, 경상남도</option>
	    <option value="11G00000">제주도</option>
	</select>
    <button title="중기육상예보는 조회일로부터 +3일 ~ +10일 사이의 기상정보만 조회가능" onclick="checkLongWeather();">기상청 중기예보조회</button>
	</div>
	<div id=result></div>
	<div>
	 <style>
        th{

            border:1px solid black;
        }
        table{
            border:1px solid black;
        }
        td{
            border:1px solid black;
        }
    </style>
	
	<script>
	 // 지역 드롭다운 함수
	 let d;
    function addressDochange(e) {

      const seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
      const inchoen = ["강화군", "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구"];
      const gyeanggi = ["가평군", "고양시덕양구","고양시일산동구","고양시일산서구", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시수정구","성남시중원구","성남시분당구", "수원시장안구","수원시권선구","수원시영통구","수원시팔달구", "시흥시", "안산시상록구","안산시단원구", "안성시", "안양시만안구","안양시동안구", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시처인구","용인시기흥구","용인시수지구", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
      const gangwondo = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];

      const chungbuk = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "진천군", "청원군", "청주시상당구","청주시서원구","청주시흥덕구","청주시청원구", "충주시", "증평군"];
      const chungnam = ["공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시동남구","천안시서북구", "청양군", "태안군", "홍성군", "계룡시"];
      const daejoen = ["대덕구", "동구", "서구", "유성구", "중구"];
      const sejong = ["세종특별자치시"];
      const gungbuk = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시남구","포항시북구"];
      const gungnam = ["거제시", "거창군", "고성군", "김해시", "남해군", "마산시", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "진해시", "창녕군", "창원시의창구", "창원시성산구","창원시마산합포구","창원시마산회원구","창원시진해구", "통영시", "하동군", "함안군", "함양군", "합천군"];

      const daegu = ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
      const ulsan = ["중구", "남구", "동구", "북구", "울주군"];
      const busan = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];

      const joenbuk = ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시완산구","전주시덕진구", "정읍시", "진안군"];
      const joennam = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
      const gwangju = ["광산구", "남구", "동구", "북구", "서구"];

      const jeju = ["서귀포시", "제주시"];

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
	
	const checkShortWeather=()=>{
		
		let addressDo = document.getElementById("addressDo").value;
		if(addressDo!="시/도 선택"){
			 
			if (addressDo == "seoul") addressDo = "서울특별시";
		      else if (addressDo == "inchoen") addressDo = "인천광역시";
		      else if (addressDo == "gyeanggi") addressDo = "경기도";
		      else if (addressDo == "gangwondo") addressDo = "강원도";
		      else if (addressDo == "chungbuk") addressDo = "충청북도";
		      else if (addressDo == "chungnam") addressDo = "충청남도";
		      else if (addressDo == "daejoen")  addressDo = "대전광역시";
		      else if (addressDo== "sejong")  addressDo = "세종특별자치시";
		      else if (addressDo == "gungbuk")  addressDo = "경상북도";
		      else if (addressDo == "gungnam") addressDo = "경상남도";
		      else if (addressDo == "daegu") addressDo = "대구광역시";
		      else if (addressDo == "ulsan") addressDo = "울산광역시";
		      else if (addressDo == "busan") addressDo = "부산광역시";
		      else if (addressDo == "joenbuk") addressDo = "전라북도";
		      else if (addressDo == "joennam") addressDo = "전라남도";
		      else if (addressDo == "gwangju") addressDo = "광주광역시";
		      else if (addressDo == "jeju") addressDo = "제주특별자치도";

			console.log(addressDo);
			let addressDogun = document.getElementById("addressDogun").value;
			console.log(addressDogun);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/publicdata2.do",
				data:{"addressDo":addressDo, "addressDogun":addressDogun},
				success: function(data){
				const weather2=JSON.parse(data);
				console.log(weather2);
				
				}
			});
			
		}else{
			alert("시/도를 선택해주세요!");ㄴ
		}

	}
	
	const display_image=(x)=> {
		let str="";
	    if(x == "맑음"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather01-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "구름많고 비"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "구름많고 눈"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather13-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "구름많고 비/눈"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "구름많고 소나기"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "흐림"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather04-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "구름많고 소나기"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "흐리고 비"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "흐리고 눈"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather13-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "흐리고 비/눈"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "흐리고 소나기"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }else if(x == "구름많음"){
	    	str="<img src=\"https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather04-1024.png\" alt=x width=\"100px\" height=\"100px\">"
	    }
	    	
	    return str;
	}
	
	const checkLongWeather=()=>{
		
		let now = new Date();
		const day3 = new Date(now.setDate(now.getDate() + 3));
		const day4 = new Date(now.setDate(now.getDate() + 1));
		const day5 = new Date(now.setDate(now.getDate() + 1));
		const day6 = new Date(now.setDate(now.getDate() + 1));
		const day7 = new Date(now.setDate(now.getDate() + 1));
		const day8 = new Date(now.setDate(now.getDate() + 1));
		const day9 = new Date(now.setDate(now.getDate() + 1));
		const day10 = new Date(now.setDate(now.getDate() +1));
		
		const d3m3=day3.getMonth()+1
		const d4m4=day4.getMonth()+1
		const d5m5=day5.getMonth()+1
		const d6m6=day6.getMonth()+1
		const d7m7=day7.getMonth()+1
		const d8m8=day8.getMonth()+1
		const d9m9=day9.getMonth()+1
		const d10m10=day10.getMonth()+1
		
		console.log(d3m3);
		
		let regId=document.getElementById("menu");
		
		$.ajax({
			url:"<%=request.getContextPath()%>/publicdata.do",
			
			data:{"regId":regId.value},
			
			success: data=>{
			const weather=JSON.parse(data);
			console.log(weather);
			let w=weather.response.body.items.item[0];
			console.log(w.regId);
			let regId=w.regId;
			
			let table = document.createElement('table');
			let thead = document.createElement('thead');
			let tbody = document.createElement('tbody');

			table.appendChild(thead);
			table.appendChild(tbody);
			
			// Creating and adding data to first row of the table
			let row_1 = document.createElement('tr');
			
			let heading_1 = document.createElement('th');
			heading_1.setAttribute("scope", "col");
			heading_1.setAttribute("rowSpan","2");
			heading_1.innerHTML = "지역";
			
			let heading_2 = document.createElement('th');
			heading_2.setAttribute("scope","col");
			heading_2.setAttribute("colSpan","2");
			heading_2.setAttribute("rowSpan","1");
			heading_2.innerHTML = day3.getFullYear()+"-"+d3m3+"-"+day3.getDate();
			
			let heading_3 = document.createElement('th');
			heading_3.setAttribute("scope","col");
			heading_3.setAttribute("colSpan","2");
			heading_3.setAttribute("rowSpan","1");
			heading_3.innerHTML = day4.getFullYear()+"-"+d4m4+"-"+day4.getDate();
			
			let heading_4 = document.createElement('th');
			heading_4.setAttribute("scope","col");
			heading_4.setAttribute("colSpan","2");
			heading_4.setAttribute("rowSpan","1");
			heading_4.innerHTML = day5.getFullYear()+"-"+d5m5+"-"+day5.getDate();
			
			let heading_5 = document.createElement('th');
			heading_5.setAttribute("scope","col");
			heading_5.setAttribute("colSpan","2");
			heading_5.setAttribute("rowSpan","1");
			heading_5.innerHTML = day6.getFullYear()+"-"+d6m6+"-"+day6.getDate();
			
			let heading_6 = document.createElement('th');
			heading_6.setAttribute("scope","col");
			heading_6.setAttribute("colSpan","2");
			heading_6.setAttribute("rowSpan","1");
			heading_6.innerHTML = day7.getFullYear()+"-"+d7m7+"-"+day7.getDate();
			
			let heading_7 = document.createElement('th');
			heading_7.setAttribute("scope","col");
			heading_7.setAttribute("colSpan","2");
			heading_7.setAttribute("rowSpan","1");
			heading_7.innerHTML = day8.getFullYear()+"-"+d8m8+"-"+day8.getDate();
			
			let heading_8 = document.createElement('th');
			heading_8.setAttribute("scope","col");
			heading_8.setAttribute("colSpan","2");
			heading_8.setAttribute("rowSpan","1");
			heading_8.innerHTML = day9.getFullYear()+"-"+d9m9+"-"+day9.getDate();
			
			let heading_9 = document.createElement('th');
			heading_9.setAttribute("scope","col");
			heading_9.setAttribute("colSpan","2");
			heading_9.setAttribute("rowSpan","1");
			heading_9.innerHTML = day10.getFullYear()+"-"+d10m10+"-"+day10.getDate();
			
			row_1.appendChild(heading_1);
			row_1.appendChild(heading_2);
			row_1.appendChild(heading_3);
			row_1.appendChild(heading_4);
			row_1.appendChild(heading_5);
			row_1.appendChild(heading_6);
			row_1.appendChild(heading_7);
			row_1.appendChild(heading_8);
			row_1.appendChild(heading_9);
			
			thead.appendChild(row_1);
			
			
			//row_2 작성
			let row_2 = document.createElement('tr');
			
			
			let data1 = document.createElement('th');
			data1.setAttribute("scope","col");
			data1.innerHTML="오전";
			let data2 = document.createElement('th');
			data2.setAttribute("scope","col");
			data2.innerHTML="오후";
			
			let data3 = document.createElement('th');
			data3.setAttribute("scope","col");
			data3.innerHTML="오전";
			let data4 = document.createElement('th');
			data4.setAttribute("scope","col");
			data4.innerHTML="오후";
			
			let data5 = document.createElement('th');
			data5.setAttribute("scope","col");
			data5.innerHTML="오전";
			let data6 = document.createElement('th');
			data6.setAttribute("scope","col");
			data6.innerHTML="오후";
			
			let data7 = document.createElement('th');
			data7.setAttribute("scope","col");
			data7.innerHTML="오전";
			
			let data8 = document.createElement('th');
			data8.setAttribute("scope","col");
			data8.innerHTML="오후";
			
			let data9 = document.createElement('th');
			data9.setAttribute("scope","col");
			data9.innerHTML="오전";
			
			let data10 = document.createElement('th');
			data10.setAttribute("scope","col");
			data10.innerHTML="오후";
			
			let data11 = document.createElement('th');
			data11.setAttribute("colSpan","2");
			data11.innerHTML="당일";
			
			let data12 = document.createElement('th');
			data12.setAttribute("colSpan","2");
			data12.innerHTML="당일";
			
			let data13 = document.createElement('th');
			data13.setAttribute("colSpan","2");
			data13.innerHTML="당일";
			
			row_2.appendChild(data1);
			row_2.appendChild(data2);
			row_2.appendChild(data3);
			row_2.appendChild(data4);
			row_2.appendChild(data5);
			row_2.appendChild(data6);
			row_2.appendChild(data7);
			row_2.appendChild(data8);
			row_2.appendChild(data9);
			row_2.appendChild(data10);
			row_2.appendChild(data11);
			row_2.appendChild(data12);
			row_2.appendChild(data13);

			
			thead.appendChild(row_2);
			
			//row_3 작성
			let row_3 = document.createElement('tr');
			
			let row_3_data0 = document.createElement('td');
			row_3_data0.setAttribute("rowSpan","2");
			
			let row_3_data1 = document.createElement('td');
			row_3_data1.innerHTML=display_image(w.wf3Am);
			
			let row_3_data2 = document.createElement('td');
			row_3_data2.innerHTML=display_image(w.wf3Pm);
			
			let row_3_data3 = document.createElement('td');
			row_3_data3.innerHTML=display_image(w.wf4Am);
			
			let row_3_data4 = document.createElement('td');
			row_3_data4.innerHTML=display_image(w.wf4Pm);
			
			let row_3_data5 = document.createElement('td');
			row_3_data5.innerHTML=display_image(w.wf5Am);
			
			let row_3_data6 = document.createElement('td');
			row_3_data6.innerHTML=display_image(w.wf5Pm);
			
			let row_3_data7 = document.createElement('td');
			row_3_data7.innerHTML=display_image(w.wf6Am);
			
			let row_3_data8 = document.createElement('td');
			row_3_data8.innerHTML=display_image(w.wf6Pm);
			
			let row_3_data9 = document.createElement('td');
			row_3_data9.innerHTML=display_image(w.wf7Am);
			
			let row_3_data10 = document.createElement('td');
			row_3_data10.innerHTML=display_image(w.wf7Pm);
			
			let row_3_data11 = document.createElement('td');
			row_3_data11.setAttribute("colSpan","2");
			row_3_data11.innerHTML=display_image(w.wf8);
			
			let row_3_data12 = document.createElement('td');
			row_3_data12.setAttribute("colSpan","2");
			row_3_data12.innerHTML=display_image(w.wf9);
			
			let row_3_data13 = document.createElement('td');
			row_3_data13.setAttribute("colSpan","2");
			row_3_data13.innerHTML=display_image(w.wf10);
			
			row_3.appendChild(row_3_data0);
			row_3.appendChild(row_3_data1);
			row_3.appendChild(row_3_data2);
			row_3.appendChild(row_3_data3);
			row_3.appendChild(row_3_data4);
			row_3.appendChild(row_3_data5);
			row_3.appendChild(row_3_data6);
			row_3.appendChild(row_3_data7);
			row_3.appendChild(row_3_data8);
			row_3.appendChild(row_3_data9);
			row_3.appendChild(row_3_data10);
			row_3.appendChild(row_3_data11);
			row_3.appendChild(row_3_data12);
			row_3.appendChild(row_3_data13);

			
			thead.appendChild(row_3);
			
			/*------------body작성-----------------*/
			let r3 = document.createElement('tr');
			
			let r3d1=document.createElement('td');
			
			
			  switch (regId)
			  {
			    case "11B00000" : regId="서울, 인천, 경기도";	    
			      break;     
			    case "11D10000" : regId="강원도영서"
			      break;
			    case "11D20000" : regId="강원도영동"
			      break;
			    case "11C20000" : regId="대전, 세종, 충청남도"
			      break;
			    case "11C10000" : regId="충청북도"
			      break;
			    case "11F20000" : regId="광주, 전라남도"
			      break;
			    case "11F10000" : regId="전라북도"
			      break;
			    case "11H10000" : regId="대구, 경상북도" 
			      break;
			    case "11H20000" : regId="부산, 울산, 경상남도" 
				  break;
			    case "11G00000" : regId="제주도" 
				  break;
			  }
			r3d1.innerHTML=regId;
			
			let r3d2=document.createElement('td');
			console.log(w.wf3Am);
			//display_image(w.wf3Am);
			r3d2.innerHTML=w.wf3Am+"<br> 강수확률: "+w.rnSt3Am+"%";
			
			let r3d3=document.createElement('td');
			r3d3.innerHTML=w.wf3Pm+"<br> 강수확률: "+w.rnSt3Pm+"%";
			
			let r3d4=document.createElement('td');
			r3d4.innerHTML=w.wf4Am+"<br> 강수확률: "+w.rnSt4Am+"%";
			
			let r3d5=document.createElement('td');
			r3d5.innerHTML=w.wf4Pm+"<br> 강수확률: "+w.rnSt4Pm+"%";
			
			let r3d6=document.createElement('td');
			r3d6.innerHTML=w.wf5Am+"<br> 강수확률: "+w.rnSt5Am+"%";
			
			let r3d7=document.createElement('td');
			r3d7.innerHTML=w.wf5Pm+"<br> 강수확률: "+w.rnSt5Pm+"%";
			
			let r3d8=document.createElement('td');
			r3d8.innerHTML=w.wf6Am+"<br> 강수확률: "+w.rnSt6Am+"%";
			
			let r3d9=document.createElement('td');
			r3d9.innerHTML=w.wf6Pm+"<br> 강수확률: "+w.rnSt6Pm+"%";
			
			let r3d10=document.createElement('td');
			r3d10.innerHTML=w.wf7Am+"<br> 강수확률: "+w.rnSt7Am+"%";
			
			let r3d11=document.createElement('td');
			r3d11.innerHTML=w.wf7Pm+"<br> 강수확률: "+w.rnSt7Pm+"%";
			
			let r3d12=document.createElement('td');
			r3d12.setAttribute("colSpan","2");
			r3d12.innerHTML=w.wf8+"<br> 강수확률: "+w.rnSt8+"%";
			
			let r3d13=document.createElement('td');
			r3d13.setAttribute("colSpan","2");
			r3d13.innerHTML=w.wf9+"<br> 강수확률: "+w.rnSt9+"%";
			
			let r3d14=document.createElement('td');
			r3d14.setAttribute("colSpan","2");
			r3d14.innerHTML=w.wf10+"<br> 강수확률: "+w.rnSt10+"%";
			
			r3.appendChild(r3d1);
			r3.appendChild(r3d2);
			r3.appendChild(r3d3);
			r3.appendChild(r3d4);
			r3.appendChild(r3d5);
			r3.appendChild(r3d6);
			r3.appendChild(r3d7);
			r3.appendChild(r3d8);
			r3.appendChild(r3d9);
			r3.appendChild(r3d10);
			r3.appendChild(r3d11);
			r3.appendChild(r3d12);
			r3.appendChild(r3d13);
			r3.appendChild(r3d14);
			
			tbody.appendChild(r3);
			row_3_data0.setAttribute("rowSpan","2");
			
			
			// Creating and adding data to second row of the table

			
			$("#result").empty();
			document.getElementById("result").appendChild(table);
			document.getElementById("")
			}
		});
	}
	
	const test=()=>{
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'sRfnzN1mNZPaB7%2BM5goGf41P0g%2Bbz6C3KlOWcM7iuyrv9wknEsMIH7ZtCDoOk60pPMeOCuHUzrT4LaqapE6B8w%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
		queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20220624'); /**/
		queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1800'); /**/
		queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
		queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    }
		};

		xhr.send();
	}
	</script>
	
	
</body>
</html>