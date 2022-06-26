<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%

	String userId = (String)request.getAttribute("plannerId");

%>


<div class="container">
	<div class="box1">
		<div class="box2">
			<h3><%=request.getAttribute("plannerId") %></h3>
			<div class="image">


 				<img class="image" src="잠만보.jpeg" width='300' height='300'> 

			</div>
			<br>
			<br> <br> <br> <br>
			<br>
			<hr>
			<h4>자기소개</h4>
			<br>한줄 소개
			<hr>
			<br>
			<h4>MY PLAN</h4>
			<br>
			<!-- 여기에는 플랜루트 -->
			<!-- "div#plannerZone"에, "class名, planner"들이 카드 형태로 생성돼 누적될 예정입니다 -->
			<div class="plannerZone">
			
				<!-- planner카드 예시 -->
<!-- 				<div class="planner">
					<div class="plannerInfo">
						<div class="textZone words">
							<h2 class="plannerTitle">플래너 제목</h2>
							<p class="plannerTheme">액티비티</p>
						</div>
						<div class="planImg"></div>
					</div>
				</div> -->
			</div>


			<hr>
			<div class="sourceContainer">
				<p id="iconSource">Icon Attribution : https://www.iconfinder.com/Chanut-is </p>
			</div>
		</div>
	</div>
</div>

<script>


		//플래너 작성자 ID를 기준으로, 작성한 플래너들의 목록을 표출함
		const plannerZone = document.querySelector(".plannerZone");
		console.log(plannerZone);
		

		(()=>{
			
			
	 		$.ajax({
				

				url:"<%=request.getContextPath()%>/planner/printPlannerList.do",
				data:{userId:"<%=userId%>"}, //본 아이디가 SQL의 식별 기준이 됨
				dataType:"json",
				success: (data)=>{
	
					console.log(data);
					
					data.forEach(e=>{
						
						console.log("데이터 제목 : ", e.plannerTitle);
						
						//plannerZone에, 카드 생성하기
						const planner = document.createElement("div");
						planner.classList.add("planner");
						
						printPlan(planner, e.plannerNo);
						const plannerInfo = document.createElement("div");
						planner.classList.add("plannerInfo");
						
						const textZone = document.createElement("div");
						textZone.classList.add("textZone");
						textZone.classList.add("words");
						const forTitle = document.createElement("h2");
						forTitle.innerText = e.plannerTitle;
						forTitle.classList.add("plannerTitle");
						const forTheme = document.createElement("p");
						//forTheme.innerText = e.theme;
						forTheme.innerHTML = "<span style='font-weight:600'>테마 | </span>"+e.theme;
						forTheme.classList.add("plannerTheme");
						textZone.appendChild(forTitle);
						textZone.appendChild(forTheme);
						
						const img = document.createElement("div"); //"썸네일"은 추후 구현 예정
						//0625) 임시 방편 : 썸네일 대신, 테마별 "아이콘"으로 대표 이미지를 표시함
						img.classList.add("planImg");
						
						switch(e.theme){
						
						case '맛집' : img.innerHTML = "<img src='<%=request.getContextPath()%>/images/themeIcons/forFood.png' width='80' height='80' style='padding:5px;'/>";break;
						case '액티비티' : img.innerHTML = "<img src='<%=request.getContextPath()%>/images/themeIcons/forActivity.png' width='80' height='80' style='padding:5px;'/>";break;
						case '자연' : img.innerHTML = "<img src='<%=request.getContextPath()%>/images/themeIcons/forNature.png' width='80' height='80' style='padding:5px;'/>";break;
						case '힐링' : img.innerHTML = "<img src='<%=request.getContextPath()%>/images/themeIcons/forHealing.png' width='80' height='80' style='padding:5px;'/>";break;
						case '유적지' : img.innerHTML = "<img src='<%=request.getContextPath()%>/images/themeIcons/forHistoricSite.png' width='80' height='80' style='padding:5px;'/>";break;
						case '자유여행' : img.innerHTML = "<img src='<%=request.getContextPath()%>/images/themeIcons/forFreedom.png' width='80' height='80' style='padding:5px;'/>";break;
						
						}
						
						plannerInfo.appendChild(textZone);
						plannerInfo.appendChild(img);
						planner.appendChild(plannerInfo);						
						plannerZone.appendChild(planner);
						
					});
	
				},
				error:(r,d)=>{
					console.log(r);
					console.log(d);
					
					const warn = document.createElement("h3");
					warn.innerText = "플랜이 없습니다";
					plannerZone.appendChild(warn);
				}
				
			});
			
			
		})();


		function printPlan(e, plannerNo){
			
			e.addEventListener("click",e=>{ //플래너 "상세 페이지"로 이동
				//alert("플랜넘버 : "+plannerNo);
				location.assign("<%=request.getContextPath()%>/planner/printPlan.do?pNo="+plannerNo);
			})
			
		}
	

	
	
</script>

<style>

.textZone{

	width: 380px;
    height: 100%;
/*     border: 1px solid red; */
    float: left;

}

.planImg{

/*     border: 1px solid green; */
    border-radius: 5px;
    width: 80px;
    height: 80px;
    float: right;
    margin: 5px;

}

.plannerInfo{
	display:inline-block;
	margin:2px;

}

.plannerZone{

	margin-top : 10px;
	/* border : 1px solid red; */
	width : 800px;
	height : 400px;
	overflow-y:scroll;
	/* background-color:black; */

}

.plannerZone::-webkit-scrollbar{
	display:none;
	
}

.planner{

	width: 523px;
    height: 90px;
    margin: 10px;
    border-radius: 10px;
    background-color: #e9e9e9;
}

.plannerTitle{

    font-size: 23px;
    margin-top: 10px;
    margin-left: 10px;
    font-weight: 600;

}

.plannerTheme{

	margin-top: 0;
    margin-bottom: 1rem;
    text-align: right;
    margin-right: 15px;
    font-size: 15px;
	
}


p#iconSource{

	text-align: left;
    font-size: 13px;
    margin-top: -6px;
    margin-left: 547px;

}

.sourceContainer{
	display : flex;
}


.words{

	margin:5px;
	text-align:left;

}


div {
	display: inline-block;
}

.day {
	position: fixed;
	background-color: rgb(133, 195, 236);
	top: 0px;
	width: 1000px;
	height: 30pt;
	font-size: 15pt;
}

.box1 {
	position: relative;
	top: 30pt;
	left: 0px;
	margin-bottom: 10px;
	width: 1000px;
	height: 1200px;
	font-size: 15pt;
	font-weight: normal;
	/* background-color:rgb(204, 219, 252); */
}

.box1 .box2 {
	position: absolute;
	top: 100pt;
	left: 0px;
	width: 915px;
	height: 900px;
	font-size: 15pt;
	font-weight: lighter;
	background-color: white;
	padding: 20px;
	margin: 20px;
}

body {
	text-align: center;
}

.image {
	border-radius: 35%;
}
</style>

<%-- <%@ include file="/views/common/footer.jsp"%>  --%>