<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.review.model.vo.Review, java.util.List" %>
<%
	List<Review> list = (List<Review>)request.getAttribute("review");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=705b81233756fa3f99e7c61bf323dd7e&libraries=services"></script>
 <div id="container1">
        <div class="title5"><%=request.getAttribute("title") %></div>
        <div class="address1"><%=request.getAttribute("address") %> </div>
        <div id="main-content">
            <div>
              <input type="checkbox" id="checkbox" />
              <label for="checkbox">
                <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                  <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                    <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" fill="#AAB8C2"/>
                    <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5"/>
          
                    <g id="grp7" opacity="0" transform="translate(7 6)">
                      <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2"/>
                      <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2"/>
                    </g>
          
                    <g id="grp6" opacity="0" transform="translate(0 28)">
                      <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2"/>
                      <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2"/>
                    </g>
          
                    <g id="grp3" opacity="0" transform="translate(52 28)">
                      <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2"/>
                      <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2"/>
                    </g>
          
                    <g id="grp2" opacity="0" transform="translate(44 6)">
                      <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2"/>
                      <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2"/>
                    </g>
          
                    <g id="grp5" opacity="0" transform="translate(14 50)">
                      <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2"/>
                      <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2"/>
                    </g>
          
                    <g id="grp4" opacity="0" transform="translate(35 50)">
                      <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2"/>
                      <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2"/>
                    </g>
          
                    <g id="grp1" opacity="0" transform="translate(24)">
                      <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2"/>
                      <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2"/>
                    </g>
                  </g>
                </svg>
              </label>
          
              <h1>?????? ??????!</h1>
          
              <a1 target="_blank" href="http://robeen.io"></a>
            </div>
          </div>

        <div class="loaction-img">
            <img src="<%=request.getAttribute("firstImage") %>" alt="" class="img" > 
            
        </div>
    </div>

   
    <div id="container2">
        <div style="overflow:auto; width: 100%; height:500px;" class="tbroot">
            <div class="title1">??????</div>
           <div>
	<div class="map_wrap">
	    <div id="map" style="width:1470px;height:450px;position:relative;overflow:hidden; margin-left : 0px;"></div>
		    <div id="menu_wrap" class="bg_white">
			    <ul id="category">
			        <li id="AT4" data-order="0"> 
			            <span class="category_bg area"></span>
			            ?????????
			        </li>       
			        <li id="CE7" data-order="4"> 
			            <span class="category_bg cafe"></span>
			            ??????
			        </li> 
			        <li id="CS2" data-order="5"> 
			            <span class="category_bg store"></span>
			            
			            ?????????
			        </li>      
			    </ul>
			</div>
		</div>
	</div>
</div>

<script>

// ????????? ???????????? ??? ?????? ????????? ??????????????? ????????? ??????????????????????????????
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // ????????? ??????????????? ????????? ???????????? ????????? 
    markers = [], // ????????? ?????? ???????????????
    currCategory = ''; // ?????? ????????? ??????????????? ????????? ?????? ???????????????

var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ????????? ????????????
        level: 3 // ????????? ?????? ??????
    };  

// ????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var mapContainer = document.getElementById('map'), // ????????? ????????? div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
    level: 3 // ????????? ?????? ??????
};  

//????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//??????-?????? ?????? ????????? ???????????????
	var geocoder = new kakao.maps.services.Geocoder();

			// ????????? ????????? ???????????????
			geocoder.addressSearch('<%=request.getAttribute("address") %>', function(result, status) {

			    // ??????????????? ????????? ??????????????? 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // ??????????????? ?????? ????????? ????????? ???????????????
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // ?????????????????? ????????? ?????? ????????? ???????????????
			        var infowindow = new kakao.maps.InfoWindow({
			            /* content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>' */
			        });
			     /*    infowindow.open(map, marker); */

			        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
			        map.setCenter(coords);
			    } 
			});  


function displayMarker(locPosition, message) {
	// ????????? ???????????????
	var marker = new kakao.maps.Marker({
		map: map,
		position: locPosition
	});
/* 	var iwContent = message, // ?????????????????? ????????? ??????
		iwRemoveable = true;
	// ?????????????????? ???????????????
	var infowindow = new kakao.maps.InfoWindow({
		content : iwContent,
		removable : iwRemoveable
	});
	// ?????????????????? ???????????? ???????????????
	infowindow.open(map, marker) */;
	// ?????? ??????????????? ??????????????? ???????????????
	map.setCenter(locPosition);      
}   
// ?????? ?????? ????????? ???????????????
var ps = new kakao.maps.services.Places(map); 

//????????? idle ???????????? ???????????????
kakao.maps.event.addListener(map, 'idle', searchPlaces);

//????????? ??????????????? ????????? ????????? css class??? ??????????????? 
contentNode.className = 'placeinfo_wrap';

//????????? ??????????????? ????????? ????????? mousedown, touchstart ???????????? ???????????????
//?????? ????????? ???????????? ???????????? ????????? ????????? ???????????? kakao.maps.event.preventMap ???????????? ??????????????? 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

//????????? ???????????? ???????????? ???????????????
placeOverlay.setContent(contentNode);  

//??? ??????????????? ?????? ???????????? ???????????????
addCategoryClickEvent();

//??????????????? ????????? ???????????? ???????????? ???????????????
function addEventHandle(target, type, callback) {
 if (target.addEventListener) {
     target.addEventListener(type, callback);
 } else {
     target.attachEvent('on' + type, callback);
 }
}

//???????????? ????????? ???????????? ???????????????
function searchPlaces() {
 if (!currCategory) {
     return;
 }
 
 // ????????? ??????????????? ???????????? 
 placeOverlay.setMap(null);

 // ????????? ???????????? ?????? ????????? ???????????????
 removeMarker();
 
 ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

//??????????????? ???????????? ??? ???????????? ???????????? ?????????
function placesSearchCB(data, status, pagination) {
 if (status === kakao.maps.services.Status.OK) {

     // ??????????????? ????????? ??????????????? ????????? ????????? ???????????????
     displayPlaces(data);
 } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
     // ??????????????? ???????????? ????????? ????????? ????????? ????????? ????????? ?????????

 } else if (status === kakao.maps.services.Status.ERROR) {
     // ????????? ?????? ??????????????? ????????? ?????? ?????? ????????? ????????? ????????? ????????? ????????? ?????????
     
 }
}

//????????? ????????? ???????????? ???????????????
function displayPlaces(places) {

 // ????????? ??????????????? ???????????? ????????? ???????????????
 // ??? ????????? ??????????????? ?????????????????? ????????? ??????????????? ???????????????
 var order = document.getElementById(currCategory).getAttribute('data-order');

 

 for ( var i=0; i<places.length; i++ ) {

         // ????????? ???????????? ????????? ???????????????
         var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

         // ????????? ???????????? ????????? ?????? ?????? ???
         // ??????????????? ??????????????? ?????? ???????????? ???????????????
         (function(marker, place) {
             kakao.maps.event.addListener(marker, 'click', function() {
                 displayPlaceInfo(place);
             });
         })(marker, places[i]);
 }
}

//????????? ???????????? ?????? ?????? ????????? ???????????? ???????????????
function addMarker(position, order) {
 var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ?????? ????????? url, ??????????????? ???????????? ?????????
     imageSize = new kakao.maps.Size(27, 28),  // ?????? ???????????? ??????
     imgOptions =  {
         spriteSize : new kakao.maps.Size(72, 208), // ??????????????? ???????????? ??????
         spriteOrigin : new kakao.maps.Point(46, (order*36)), // ??????????????? ????????? ??? ????????? ????????? ????????? ??????
         offset: new kakao.maps.Point(11, 28) // ?????? ????????? ???????????? ????????? ???????????? ??????
     },
     markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
         marker = new kakao.maps.Marker({
         position: position, // ????????? ??????
         image: markerImage 
     });

 marker.setMap(map); // ?????? ?????? ????????? ???????????????
 markers.push(marker);  // ????????? ????????? ????????? ???????????????

 return marker;
}

//?????? ?????? ???????????? ?????? ????????? ?????? ???????????????
function removeMarker() {
 for ( var i = 0; i < markers.length; i++ ) {
     markers[i].setMap(null);
 }   
 markers = [];
}

//????????? ????????? ?????? ?????? ??????????????? ????????? ??????????????? ???????????? ???????????????
function displayPlaceInfo (place) {
 var content = '<div class="placeinfo">' +
                 '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

 if (place.road_address_name) {
     content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                 '  <span class="jibun" title="' + place.address_name + '">(?????? : ' + place.address_name + ')</span>';
 }  else {
     content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
 }                

 content += '    <span class="tel">' + place.phone + '</span>' + 
             '</div>' + 
             '<div class="after"></div>';

 contentNode.innerHTML = content;
 placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
 placeOverlay.setMap(map);  
}


//??? ??????????????? ?????? ???????????? ???????????????
function addCategoryClickEvent() {
 var category = document.getElementById('category'),
     children = category.children;

 for (var i=0; i<children.length; i++) {
     children[i].onclick = onClickCategory;
 }
}

//??????????????? ???????????? ??? ???????????? ???????????????
function onClickCategory() {
 var id = this.id,
     className = this.className;

 placeOverlay.setMap(null);

 if (className === 'on') {
     currCategory = '';
     changeCategoryClass();
     removeMarker();
 } else {
     currCategory = id;
     changeCategoryClass(this);
     searchPlaces();
 }
}

//????????? ?????????????????? ????????? ???????????? ???????????? ???????????????
function changeCategoryClass(el) {
 var category = document.getElementById('category'),
     children = category.children,
     i;

 for ( i=0; i<children.length; i++ ) {
     children[i].className = '';
 }

 if (el) {
     el.className = 'on';
 } 
}  
</script>
<style>

	.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'??????',sans-serif;font-size:12px;}
	.map_wrap {position:relative;width:100%;height:350px;}
	#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
	#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
	#category li.on {background: #eee;}
	#category li:hover {background: #e6fff3;border-left:1px solid #acacac;margin-left: -1px;}
	#category li:last-child{margin-right:0;border-right:0;}
	#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
	#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
	#category li .area {background-position: -10px 0;}
	#category li .mart {background-position: -10px -36px;}
	#category li .pharmacy {background-position: -10px -72px;}
	#category li .oil {background-position: -10px -108px;}
	#category li .cafe {background-position: -10px -144px;}
	#category li .store {background-position: -10px -180px;}
	#category li.on .category_bg {background-position-x:-46px;}
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:349px;}
	.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
	.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
	.placeinfo a, .placeinfo span {display:block;text-overflow: ellipsis;overflow: hidden;}
	.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
	.placeinfo .title {font-weight: bold; font-size:30px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.placeinfo .tel {color:#0f7833;}
	.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

	
	.info-title {
 display: block;
 background: #50627F;
 color: #fff;
 text-align: center;
 height: 24px;
 line-height:22px;
 border-radius:4px;
 padding:0px 10px;
}
</style>
			</script>
            <div id="container3">
                <div class="place-review">?????? ??????</div>
            </div>
            <div id="btn">
                <button type="button" class="btn btn-success" 
                onclick="location.assign('<%=request.getContextPath()%>/createreview.do')">????????????</button>
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

                    <div class="drdw" onclick="showMenu(this.innerText)">?????????</div>
                    <div class="drdw" onclick="showMenu(this.innerText)">?????????</div>

                </div>

            </div>
<%--               <%if(!list.isEmpty()){ 
            for(Review l : list) {%>  --%>
            <div class="img-review">
                <table>
                    <tr class="img-title">
                        <td rowspan="2" class="t-img"><img src="images/mi.jpg" alt="" class="img1"></td>
                        <td> <%-- <%=l.getReviewTitle()%> --%></td>
                    </tr>
                    <tr class = "img-content">
                        <td><<%-- %=l.getReviewContent() %> --%></td>
                      
                    </tr>
                </table>
            </div>
<%--                <%}
            }else {  %> 
            	<div class="resultList">????????? ????????? ????????????.</div>
            	<%} %>  --%>
        </div>


    </div>
    
  
   

    <style>


    body {
  margin: 0;
  padding: 0;
  -webkit-font-smoothing: antialiased;
  font-family: arial;
}

#main-content {
  display: inline-block;
  width: 100px;
  height: 100px;
  background: white;
  align-items: center;
  text-align: center;
  float : right;
  margin-right: 100px;
}

h1 {
  font-size: 14px;
  font-weight: 400;
  margin: 0 0 0 0;
  color: #888888;
}

a {
  font-size: 50px;
  font-weight: bold;
  margin-top: 10px;
  display: inline-block;
  text-decoration: none;
  color: #008A68;
}

svg {
  cursor: pointer;
  overflow: visible;
  width: 60px;
}
svg #heart {
  transform-origin: center;
  animation: animateHeartOut 0.3s linear forwards;
}
svg #main-circ {
  transform-origin: 29.5px 29.5px;  /* 29.5 29.5 */
}

#checkbox {
  display: none;
}

#checkbox:checked + label svg #heart {
  transform: scale(0.2);
  fill: #E2264D;
  animation: animateHeart 0.3s linear forwards 0.25s;
}
#checkbox:checked + label svg #main-circ {
  transition: all 2s;
  animation: animateCircle 0.3s linear forwards;
  opacity: 1;
}
#checkbox:checked + label svg #grp1 {
  opacity: 1;
  transition: 0.1s all 0.3s;
}
#checkbox:checked + label svg #grp1 #oval1 {
  transform: scale(0) translate(0, -30px);
  transform-origin: 0 0 0;
  transition: 0.5s transform 0.3s;
}
#checkbox:checked + label svg #grp1 #oval2 {
  transform: scale(0) translate(10px, -50px);
  transform-origin: 0 0 0;
  transition: 1.5s transform 0.3s;
}
#checkbox:checked + label svg #grp2 {
  opacity: 1;
  transition: 0.1s all 0.3s;
}
#checkbox:checked + label svg #grp2 #oval1 {
  transform: scale(0) translate(30px, -15px);
  transform-origin: 0 0 0;
  transition: 0.5s transform 0.3s;
}
#checkbox:checked + label svg #grp2 #oval2 {
  transform: scale(0) translate(60px, -15px);
  transform-origin: 0 0 0;
  transition: 1.5s transform 0.3s;
}
#checkbox:checked + label svg #grp3 {
  opacity: 1;
  transition: 0.1s all 0.3s;
}
#checkbox:checked + label svg #grp3 #oval1 {
  transform: scale(0) translate(30px, 0px);
  transform-origin: 0 0 0;
  transition: 0.5s transform 0.3s;
}
#checkbox:checked + label svg #grp3 #oval2 {
  transform: scale(0) translate(60px, 10px);
  transform-origin: 0 0 0;
  transition: 1.5s transform 0.3s;
}
#checkbox:checked + label svg #grp4 {
  opacity: 1;
  transition: 0.1s all 0.3s;
}
#checkbox:checked + label svg #grp4 #oval1 {
  transform: scale(0) translate(30px, 15px);
  transform-origin: 0 0 0;
  transition: 0.5s transform 0.3s;
}
#checkbox:checked + label svg #grp4 #oval2 {
  transform: scale(0) translate(40px, 50px);
  transform-origin: 0 0 0;
  transition: 1.5s transform 0.3s;
}
#checkbox:checked + label svg #grp5 {
  opacity: 1;
  transition: 0.1s all 0.3s;
}
#checkbox:checked + label svg #grp5 #oval1 {
  transform: scale(0) translate(-10px, 20px);
  transform-origin: 0 0 0;
  transition: 0.5s transform 0.3s;
}
#checkbox:checked + label svg #grp5 #oval2 {
  transform: scale(0) translate(-60px, 30px);
  transform-origin: 0 0 0;
  transition: 1.5s transform 0.3s;
}
#checkbox:checked + label svg #grp6 {
  opacity: 1;
  transition: 0.1s all 0.3s;
}
#checkbox:checked + label svg #grp6 #oval1 {
  transform: scale(0) translate(-30px, 0px);
  transform-origin: 0 0 0;
  transition: 0.5s transform 0.3s;
}
#checkbox:checked + label svg #grp6 #oval2 {
  transform: scale(0) translate(-60px, -5px);
  transform-origin: 0 0 0;
  transition: 1.5s transform 0.3s;
}
#checkbox:checked + label svg #grp7 {
  opacity: 1;
  transition: 0.1s all 0.3s;
}
#checkbox:checked + label svg #grp7 #oval1 {
  transform: scale(0) translate(-30px, -15px);
  transform-origin: 0 0 0;
  transition: 0.5s transform 0.3s;
}
#checkbox:checked + label svg #grp7 #oval2 {
  transform: scale(0) translate(-55px, -30px);
  transform-origin: 0 0 0;
  transition: 1.5s transform 0.3s;
}
#checkbox:checked + label svg #grp2 {
  opacity: 1;
  transition: 0.1s opacity 0.3s;
}
#checkbox:checked + label svg #grp3 {
  opacity: 1;
  transition: 0.1s opacity 0.3s;
}
#checkbox:checked + label svg #grp4 {
  opacity: 1;
  transition: 0.1s opacity 0.3s;
}
#checkbox:checked + label svg #grp5 {
  opacity: 1;
  transition: 0.1s opacity 0.3s;
}
#checkbox:checked + label svg #grp6 {
  opacity: 1;
  transition: 0.1s opacity 0.3s;
}
#checkbox:checked + label svg #grp7 {
  opacity: 1;
  transition: 0.1s opacity 0.3s;
}

@keyframes animateCircle {
  40% {
    transform: scale(10);
    opacity: 1;
    fill: #DD4688;
  }
  55% {
    transform: scale(11);
    opacity: 1;
    fill: #D46ABF;
  }
  65% {
    transform: scale(12);
    opacity: 1;
    fill: #CC8EF5;
  }
  75% {
    transform: scale(13);
    opacity: 1;
    fill: transparent;
    stroke: #CC8EF5;
    stroke-width: 0.5;
  }
  85% {
    transform: scale(17);
    opacity: 1;
    fill: transparent;
    stroke: #CC8EF5;
    stroke-width: 0.2;
  }
  95% {
    transform: scale(18);
    opacity: 1;
    fill: transparent;
    stroke: #CC8EF5;
    stroke-width: 0.1;
  }
  100% {
    transform: scale(19);
    opacity: 1;
    fill: transparent;
    stroke: #CC8EF5;
    stroke-width: 0;
  }
}
@keyframes animateHeart {
  0% {
    transform: scale(0.2);
  }
  40% {
    transform: scale(1.2);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes animateHeartOut {
  0% {
    transform: scale(1.4);
  }
  100% {
    transform: scale(1);
  }
}
  


.img{
	display:flex;
	overflow:hidden;
	align-items: center;
    justify-content: center;
    width :600px;
    height:400px;
}





        .img-content>td{
    overflow:hidden; 
    text-overflow: ellipsis; 
    white-space: nowrap;  
    max-width: 50px;
  }


        .img1{
            border: 1px solid red;
            display: inline-block;
            width: 200px;
            height: 200px
           
        }
        
        tr td{
            border : 1px solid black;
        }
        .t-img{
            
            width: 200px;
            height: 200px;
        }


        .img-title>td{
            text-align: center;
            height: 30px;
        }
        td{
            text-align: left;
        }
        .img-review{
            
            border: 1px solid red;
            margin-top: 10px;
            margin-left: 10px;
            border-radius: 15px;
            width: 80%;
            height: 230px;
            background-color: gray;
            z-index: 1;
        }
        table{
            width: 70%;
            height: 200px;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
            table-layout: fixed;
        }
        
        .dropdown {
            display: inline-block;
            float: right;
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
            height: 40px;
            text-align: left;
            cursor: pointer;
            font-size: 12px;
            z-index: 1;
            position: relative;
            margin-top: 10px;
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



        #btn {
            display: inline-block;

        }




        #container3 {
            display: inline-block;
		
            
        }

        .place-review {
            display: flex;

            font-size: 30px;
            color: yellowgreen;
            width: 200px;
            height: 50px;
            margin-right: 770px;
            margin-top: -2px;

        }

        .place-title {
  
            font-size: 30px;
            color: yellowgreen;
        }

        .place-content {
			
            font-size: 20px;
            color: black;
        }

        .title1 {
            font-size: 30px;
            color: yellowgreen;


        }

        .map {

            display: inline-block;
            width: 100%;
            height: 300px;

        }

        #container2 {
            display: inline-block;
            margin-top: 30px;
            margin-left: 70px;
			border : 1px solid black;
            width: 90%;

        }
        .img6{
            border: 1px solid red;
            display: inline-block;
            width: 1000px;
            height: 400px;
        }
        .loaction-img {
            display: inline-block;
            margin-top: 10px;
            margin-left: 5%;
            margin-right: 5%;
            width: 1000px;
            height: 400px;

            margin-bottom: 10px;
        }

        * {
            margin: 0;
            padding: 0;
        }

        #container1 {
            display: inline-block;
            margin-top: 30px;
            margin-left: 70px;
            width: 90%;
			border : 1px solid black;
        }

        .title5 {
           display: inline-block;
            width: 100%;
            height : 20%;
            font-size: 30px;
            color: yellowgreen;


        }

        .address1 {

            width: 50%;
        }
    </style>

<script>
    window.onload = () => {
        document.querySelector('.dropbtn_click').onclick = () => {
            dropdown();
        }
        document.getElementsByClassName('drdw').onclick = () => {
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





<%@ include file="/views/common/footer.jsp"%>
    