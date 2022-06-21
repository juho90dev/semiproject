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
	<div>
	<p>*일 2회(06:00,18:00)회 생성 되며 최근 24시간 자료만 제공<br>출처: 기상청 중기육상예보</p>
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
    <button title="중기육상예보는 조회일로부터 +3일 ~ +10일 사이의 기상정보만 조회가능" onclick="checkLongWeather();">날씨</button>
	</div>
	<div id=result></div>
	
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
	</script>
	
	
</body>
</html>