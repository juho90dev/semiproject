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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a918dc059c0c7fe988d04540ed91f259&libraries=services"></script>	
<div class="container">

	<div class="planTitle"><%=plannerTitle%></div>
	<hr>
	<div class="forOption">
		<p class="optGuide">일자별 플랜을 확인해보세요</p>
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
					<p id="printDay"></p>
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
	<hr>
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
 	let positions = [];
 	let forLine = [];
 	let addrTemp = "";

 	(()=>{
 		//alert("안녕?");
 		
 		//"PLAN테이블 관련"
 		$.ajax({ //1일치에 해당하는 데이터를 받아와 화면에 출력할 것임
 			
 			url:"<%=request.getContextPath()%>/planner/printPlanEnd.do",
 			data:{plannerNo:"<%=plannerNo%>"},
 			dataType:"json",
 			
 			success:plans=>{ //데이터 불러오기 성공 시 로직
 				
 				console.log(plans); //데이터를 잘 불러왔는지 확인
			
 				//1. 기본 값 출력
 				//1-1. select > 전체 여행 일자 만큼 option태그 생성하기
 				const totalDay = plans[plans.length-1].day;
 				console.log("전체 여행 일자 : ",totalDay);
 				let cnt = 1;
 				for(let i=0;i<totalDay;i++){
 					const option = document.createElement("option");
 					option.innerText = cnt++;
 					selectDays.appendChild(option);				
 				}
 				
 				//1-2. 화면 최초 접속 시 > 기본 값 출력 : 1일차
 				let dayOneArr = [];
 				
 				plans.forEach(e=>{
 					
 					if(e.day==1){
 						
 						dayOneArr.push(e);
 						console.log(dayOneArr);
 						planContainer.innerHTML = "";
 						printDay.innerText = "";
 						printDay.innerHTML += "<span style='font-weight:500'>Day </span>"+1;
 										
 					}					
 				});
 				
 				
				dayOneArr.forEach(e=>{ //1일차 출력						
					printPlans(e);	
					
				}); 
				
				mapStarter(dayOneArr,positions,forLine);
				
				
				
 				//-------------------------------------------------------------------------------

 				//1-3. 옵션 변경 시, 해당 일자로 저장된 플랜 정보 출력
				let planArr = []; //선택 일자를 배열에 저장함
				//var positions = []; //TODO 유의할 것! 여기서 선언 시, 정보를 불러올 수 없음!
				
				selectDays.addEventListener("change",e=>{
					
					//초기화 ---------------------------------------------
					planContainer.innerHTML = ""; //플랜 영역 비우기
					const ckDays = e.target.value;
					planArr.length=0; //일자 배열 초기화
					positions.length=0; //마커 배열 초기화
					forLine.length=0;
					//---------------------------------------------------
					
 					plans.forEach(e=>{ //전체 여행일자 순회
 							
 						if(e.day==ckDays){	//전체 여행일자 中, 사용자가 선택한 날짜를 지정함
 							
 							printDay.innerText = "";
 							printDay.innerHTML += "<span style='font-weight:500'>Day </span>"+e.day;
 							//printDay.innerText = e.day;											
 							//printDay.innerText += "Day "+e.day; //일자 출력하기	 							
 							planArr.push(e); //특정 일자의 내용만, 객체배열로 저장함
 							//console.log(ckDays,"의 플랜 : ", planArr, "길이 확인", planArr.length); //일자 확인
 							//planContainer.innerHTML = ""; //플랜 영역 비우기
 							
 						} 						
 					});
 					
 					
					planArr.forEach(a=>{ //일자별 정보 출력 메소드 실행
						
						
						printPlans(a);
					
					});	

					mapStarter(planArr,positions,forLine);
 					
				});		
 			},
	 			error:(r,d)=>{ //데이터 불러오기 실패 시 에러 확인
	 				
	 				console.log(r);
	 				console.log(d);
	 				alert("데이터 불러오기 실패. 다시 시도해주세요");
	 			}			
 		});
		
 	})();
 	
 	//var positions = [];
 	function printPlans(e){ //일자별 상세 플랜 출력 관련 공용 메소드

			//장소 카드 생성하기 > 
			//※ 구조 : (부모-자식 노드)planZone > plan > planWords > (형제노드) placeName[, address], memo
		    const createPlan = document.createElement("div");
			createPlan.classList.add("plan");
			moveMap(createPlan,e.latitude,e.longitude);
			const createPlanWords = document.createElement("div");
			createPlanWords.classList.add("planWords"); 
			createPlan.appendChild(createPlanWords);
			
			//카드 내용 구성하기
			const createName = document.createElement("div"); //장소명
			createName.classList.add("words");
			createName.id="placeName";
			createName.innerText = e.placeName;
			createPlanWords.appendChild(createName);
			
  			const createAddress = document.createElement("div"); //주소
			createAddress.classList.add("words");
			createAddress.id="address";		
			createPlanWords.appendChild(createAddress);
			getAddress(e.latitude,e.longitude,createAddress);
			
			const createMemo = document.createElement("div"); //메모
			createMemo.classList.add("words");
			createMemo.id="memo";
			createMemo.innerText = e.memo!=null?e.memo:""; 							
			createPlanWords.appendChild(createMemo);
			
			//좌표 정보 저장하기
			const createLat = document.createElement("div"); //위도, latitude
			createLat.classList.add("hide");
			createLat.classList.add("lat");
			createLat.innerText=e.latitude;
			const createLng = document.createElement("div"); //경도, longitude
			createLng.classList.add("hide");
			createLng.classList.add=("lng");
			createLng.innerText=e.longitude;
			createPlanWords.appendChild(createLat);
			createPlanWords.appendChild(createLng);
			
		    createPlan.appendChild(createPlanWords);
			planContainer.appendChild(createPlan);
 		
 			//좌표 관련 객체 생성 및 배열에 보관하기
			positions.push({title:e.placeName,latlng: new kakao.maps.LatLng(e.latitude,e.longitude)});
			forLine.push(new kakao.maps.LatLng(e.latitude,e.longitude));
			
			//"좌표"를 기준으로 주소 정보를 받아올 수 있음
			
			
						
 	}
 	
 	//지도 > 마커 출력 관련 메소드 만듦
 	//1. 사용자가 설정한 장소를 기준으로 지도 출력하기
 	function mapStarter(daysArr,posArr,lineArr){
 		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	     mapOption = { 
	        center: new kakao.maps.LatLng(daysArr[0].latitude,daysArr[0].longitude), // 지도의 중심좌표 (첫 번째 저장한 장소)
	        level: 5 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		//마커 생성 관련 ----------------------------------------------------------
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		for (var i = 0; i < posArr.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: posArr[i].latlng, // 마커를 표시할 위치
		        title : posArr[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		
		//선 생성 관련 --------------------------------------------------------------
		var polyline = new kakao.maps.Polyline({
		    path: forLine, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FFAE00', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid', // 선의 스타일입니다
			endArrow:true
		});

		// 지도에 선을 표시합니다 
		polyline.setMap(map); 
		


 	}
 	
 	
	function panTo(lat,lng){
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var moveLatLon = new kakao.maps.LatLng(lat,lng);
		map.panTo(moveLatLon);
		
		//마커 생성 관련
		var markerPosition  = new kakao.maps.LatLng(lat, lng); 
 		// 마커를 생성합니다
 		thisMarker = new kakao.maps.Marker({
 		    position: markerPosition
 		});
		
		thisMarker.setMap(map);
		
	}
	
	
	
 	function moveMap(card,latitude,longitude){ //플랜에 mouserover 시, 해당 장소로 지도를 이동시킴
 		
 		var thisMarker = "";
 		
     	card.addEventListener("mouseover",card=>{

    		const lat = latitude;
    		const lng = longitude;
			panTo(lat,lng);
			
			console.dir(card.target);
			card.target.style.color="red";
			
    	});	
     	
     	card.addEventListener("mouseout",card=>{
     		card.target.style.color="";
     		//TODO 0623) 본래의 지도로 원상복귀해야 함 -> mapStarter()메소드에서 dayArr로 구현하면 될 수도...
     	})
 	}
 	

		function getAddress(lat,lng,addressTag){ //카드에 "주소" 정보 추가
		
		    let geocoder = new kakao.maps.services.Geocoder();
		    let coord = new kakao.maps.LatLng(lat, lng);
		    
		    let callback = function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            console.log(result);
		            addrTemp = result[0]['address']['address_name'];
		            console.log(addrTemp);
		            addressTag.innerText = addrTemp;
		            
		        }
		    };

		    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
  
		} 
		

		

 	

 	


	
 
 </script>