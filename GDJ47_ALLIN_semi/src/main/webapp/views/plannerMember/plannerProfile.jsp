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
<<<<<<< HEAD
				<img class="image" src="" width='300' height='300'>
=======
 				<img class="image" src="잠만보.jpeg" width='300' height='300'> 
>>>>>>> branch 'master' of https://github.com/juho90dev/semiproject.git
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
		</div>
	</div>
</div>
<button id=test>테스트</button>
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
						forTheme.innerText = e.theme;
						forTheme.classList.add("plannerTheme");
						textZone.appendChild(forTitle);
						textZone.appendChild(forTheme);
						
						const img = document.createElement("div"); //"썸네일"은 추후 구현 예정
						img.classList.add("planImg");
						
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
			
			e.addEventListener("click",e=>{ //상세 페이지로 이동
				alert("플랜넘버 : "+plannerNo);
				location.re
			})
			
		}
	

	
	
</script>

<style>

.textZone{

    width: 380px;
    height: 130px;
    border: 1px solid red;
    float: left;

}

.planImg{

    border: 1px solid green;
    border-radius: 5px;
    width: 130px;
    height: 130px;
    float: right;
    margin: 5px;

}

.plannerInfo{
	display:inline-block;
	margin:2px;

}

.plannerZone{

	margin-top : 10px;
	border : 1px solid red;
	width : 800px;
	height : 400px;
	overflow-y:scroll;
	/* background-color:black; */


}

.planner{

	border : 1px solid blue;
	width : 550px;
	height : 150px;
	margin : 10px;
	border-radius : 10px;
	background-color:rgba(255, 255, 255, 0.7);
}

.plannerTitle{

	
	font-size : 20px;

}

.plannerTheme{

	
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