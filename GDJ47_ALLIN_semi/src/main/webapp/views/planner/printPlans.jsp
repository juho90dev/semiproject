<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%

	String plannerNo = (String)request.getAttribute("plannerNo");
	System.out.println("플래너 넘버 확인 : "+plannerNo);
	String plannerTitle = (String)request.getAttribute("plannerTitle");
	System.out.println("플래너 제목 확인 : "+plannerTitle);
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/printPlanStyle.css"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a918dc059c0c7fe988d04540ed91f259&libraries=services"></script>	
<div class="container">

	<div class="planTitle"><%=plannerTitle%></div>
	<div class="forOption">
		<!-- PLANNER테이블의 "TRAVEL_DAYS"컬럼 참고 -->
		<select id="selectDays">
		</select>
	</div>
	<div class="detailInfo">
		<div class="forMap">
			<%@include file="/views/planner/mapForPlanPrint.jsp" %> 
		</div>
		<div class="forPlan">
			<div class="planZone">
				<div class="dayTitle">
					<p id="printDay">1</p>
				</div>
				

				<div class="planContainer">
					<!-- ▼ 장소별 정소 정보 카드 출력 예시 -->				
<!-- 	 				<div class="plan">
						<div class="planWords">
							<div class="words" id="placeName">에버랜드</div>
							<div class="words" id="address">주소</div>
							<div class="words" id="memo">메모</div>
							장소의 좌표 정보 (latitude/longitude)
							<div class="hide lat"></div>
							<div class="hide lng"></div>
						</div>
					</div> -->
					<!-- 장소별 정소 정보 카드 출력 예시 ▲-->
				</div>

				
			</div>
		</div>
	</div>
</div>


 <%@ include file="/views/common/footer.jsp"%> 
 <script>
 
	//태그 동적 생성 관련 > DOM으로 불러오기
 	let planTitle = document.querySelector(".planTitle"); //플래너 제목
 	console.log(planTitle);
 	let selectDays = document.getElementById("selectDays"); //플랜 날짜
 	let printDay = document.getElementById("printDay"); //특정 일자
 	let planZone = document.querySelector(".planZone"); //장소별 카드가 출력될 영역
 	let planContainer = document.querySelector(".planContainer");
 	

 	(()=>{
 		//alert("안녕?");
 		
 		//"PLAN테이블 관련"
 		$.ajax({ //1일치에 해당하는 데이터를 받아와 화면에 출력할 것임
 			
 			url:"<%=request.getContextPath()%>/planner/printPlanEnd.do",
 			data:{plannerNo:"<%=plannerNo%>"},
 			dataType:"json",
 			
 			success:plans=>{
 				
 				console.log(plans); //데이터를 잘 불러왔는지 확인
 				
 				//1. 기본 값 출력
 				//1-1. select > 전체 여행 일자 만큼 option태그 생성하기
 				//console.log(data.length-1);
 				const totalDay = plans[plans.length-1].day;
 				console.log("전체 여행 일자 : ",totalDay);
 				let cnt = 1;
 				for(let i=0;i<totalDay;i++){
 					const option = document.createElement("option");
 					option.innerText = cnt++;
 					//dayCho(option);
 					selectDays.appendChild(option);				
 				}
 				
 				//1-2. 기본 값 출력 : 1일차
 				let dayOneArr = [];
 				
 				plans.forEach(e=>{
 					
 					if(e.day==1){
 						dayOneArr.push(e);
 						console.log(dayOneArr);
 						planContainer.innerHTML = "";
 						dayOneArr.forEach(e=>{ //1일차 출력
 						
 							printDay.innerText = 1;
 		 					
 		 	 				//장소 카드 생성하기 > 
 		 					//※ 구조 : (부모-자식 노드)planZone > plan > planWords > (형제노드) placeName[, address], memo
 		 					const createPlan = document.createElement("div");
 		 					createPlan.classList.add("plan");
 							const createPlanWords = document.createElement("div");
 							createPlanWords.classList.add("planWords"); 
 							createPlan.appendChild(createPlanWords);
 		 					
 							//카드 내용 구성하기
 							const createName = document.createElement("div"); //장소명
 		 					createName.classList.add("words");
 		 					createName.id="placeName";
 		 					createName.innerText = e.placeName;
 		 					createPlanWords.appendChild(createName);
 		 					
 		/*  				const createAddress = document.createElement("div"); //주소
 		 					createAddress.classList.add("words");
 		 					createAddress.id="address";
 		 					createName.innerText = ""; */
 		 					
   							const createMemo = document.createElement("div"); //메모
 		 					createMemo.classList.add("words");
 		 					createMemo.id="memo";
 		 					createMemo.innerText = e.memo!=null?e.memo:""; 							
 							createPlanWords.appendChild(createMemo);
 							
 							//TODO 좌표 정보 저장 (화면상에는 감춤)
 							const createLat = document.createElement("div"); //위도, latitude
 							const createLng = document.createElement("div"); //경도, longitude
 							
 			 				createPlan.appendChild(createPlanWords);
 		 					planContainer.appendChild(createPlan);
 							
 							
 						});
 						
 					}
 					
 				});
 				
				
 				
 				
 				//-------------------------------------------------------------------------------

 				//1-3. 옵션 변경 시, 해당 일자로 저장된 플랜 정보 출력
				let planArr = [];
				selectDays.addEventListener("change",e=>{
					
					planContainer.innerHTML = ""; //플랜 영역 비우기
					const ckDays = e.target.value;
					planArr.length=0;
					
 					plans.forEach(e=>{ //전체 여행일자 순회
 							
 						if(e.day==ckDays){	//전체 여행일자 中, 사용자가 선택한 날짜를 지정함
 																		
 							printDay.innerText = e.day; //일자 출력하기	 							
 							planArr.push(e); //특정 일자의 내용만, 객체배열로 저장함
 							console.log(ckDays,"의 플랜 : ", planArr, "길이 확인", planArr.length); //일자 확인
 							planContainer.innerHTML = ""; //플랜 영역 비우기
 							
 							planArr.forEach(e=>{
					
 	 							//장소 카드 생성하기 > 
 	 		 					//※ 구조 : (부모-자식 노드)planZone > plan > planWords > (형제노드) placeName[, address], memo
  		  					    const createPlan = document.createElement("div");
 	 		 					createPlan.classList.add("plan");
 	 							const createPlanWords = document.createElement("div");
 	 							createPlanWords.classList.add("planWords"); 
 	 							createPlan.appendChild(createPlanWords);
 	 		 					
 	 							//카드 내용 구성하기
 	 							const createName = document.createElement("div"); //장소명
 	 		 					createName.classList.add("words");
 	 		 					createName.id="placeName";
 	 		 					createName.innerText = e.placeName;
 	 		 					createPlanWords.appendChild(createName);
 	 		 					
 	 		/*  				const createAddress = document.createElement("div"); //주소
 	 		 					createAddress.classList.add("words");
 	 		 					createAddress.id="address";
 	 		 					createName.innerText = ""; */
 	 		 					
 	 		  					const createMemo = document.createElement("div"); //메모
 	 		 					createMemo.classList.add("words");
 	 		 					createMemo.id="memo";
 	 		 					createMemo.innerText = e.memo!=null?e.memo:""; 							
 	 							createPlanWords.appendChild(createMemo);
 	 							
 	 							//TODO 좌표 정보 저장 (화면상에는 감춤)
 	 							const createLat = document.createElement("div"); //위도, latitude
 	 							const createLng = document.createElement("div"); //경도, longitude
 	 							
 	  		 				    createPlan.appendChild(createPlanWords);
 	 		 					planContainer.appendChild(createPlan);
			
 							});
							
 						} 						
 					});
					
					
				});
		
 			},
	 			error:(r,d)=>{
	 				
	 				console.log(r);
	 				console.log(d);
 			
	 			}
 			
 		});
 		
 		
 	})();
 	 		
 	
 
 </script>