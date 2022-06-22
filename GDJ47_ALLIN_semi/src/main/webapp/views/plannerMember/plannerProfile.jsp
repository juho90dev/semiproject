<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<div class="container">
	<div class="box1">
		<div class="box2">
			<h3><%=request.getAttribute("plannerId") %></h3>
			<div class="image">
				<img class="image" src="" width='300' height='300'>
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
				<div class="planner">
					<div class="plannerInfo">
						<div class="textZone words">
							<h2 class="plannerTitle">플래너 제목</h2>
							<p class="plannerTheme">
								<span style="color: red">테마</span>액티비티
							</p>
						</div>
						<div class="planImg"></div>
					</div>
				</div>

				<div class="planner">
					<div class="plannerInfo">
						<div class="textZone words">
							<h2 class="plannerTitle">플래너 제목</h2>
							<p class="plannerTheme">
								<span style="color: red">테마</span>액티비티
							</p>
						</div>
						<div class="planImg"></div>
					</div>
				</div>

				<div class="planner">
					<div class="plannerInfo">
						<div class="textZone words">
							<h2 class="plannerTitle">플래너 제목</h2>
							<p class="plannerTheme">
								<span style="color: red">테마</span>액티비티
							</p>
						</div>
						<div class="planImg"></div>
					</div>
				</div>

				<div class="planner">
					<div class="plannerInfo">
						<div class="textZone words">
							<h2 class="plannerTitle">플래너 제목</h2>
							<p class="plannerTheme">
								<span style="color: red">테마</span>액티비티
							</p>
						</div>
						<div class="planImg"></div>
					</div>
				</div>



			</div>


			<hr>

		</div>
	</div>
</div>

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


}

.planner{

	border : 1px solid blue;
	width : 550px;
	height : 150px;
	margin : 10px;
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