<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
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
          
              <h1>장소 저장!</h1>
          
              <a1 target="_blank" href="http://robeen.io"></a>
            </div>
          </div>

        <div class="loaction-img">
            <img src="<%=request.getAttribute("firstImage") %>" alt="" class="img" > 
            
        </div>
    </div>

   
    <div id="container2">
        <div style="overflow:auto; width: 100%; height:500px;" class="tbroot">
            <div class="title1">지도</div>
            <div id="map" style="width:100%;height:350px;"></div>


		<%-- 	<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng("<%=(request.getAttribute(mapx)) %>"& "(<%=request.getAttribute(mapy")) %>"), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			        //지도 좌표값 고치기 0625 0032
			    };
			
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			</script> --%>
            <div class="place-title">장소 한줄소개
                <div class="place-content">test</div>
            </div>
            <div id="container3">
                <div class="place-review">장소 리뷰</div>
            </div>
            <div id="btn">
                <button type="button" class="btn btn-success" 
                onclick="location.assign('<%=request.getContextPath()%>/views/createreview/createreview.jsp')">작성하기</button>
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

                    <div class="drdw" onclick="showMenu(this.innerText)">좋아요</div>
                    <div class="drdw" onclick="showMenu(this.innerText)">조회순</div>

                </div>

            </div>
            <div class="img-review">
                <table>
                    <tr class="img-title">
                        <td rowspan="2" class="t-img"><img src="images/mi.jpg" alt="" class="img1"></td>
                        <td>화성이야</td>
                    </tr>
                    <tr class = "img-content">
                        <td>가지마 가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어</td>
                      
                    </tr>
                </table>
            </div>
            <div class="img-review">
                <table>
                    <tr class="img-title">
                        <td rowspan="2" class="t-img"><img src="images/mi.jpg" alt="" class="img1"></td>
                        <td>화성이야</td>
                    </tr>
                    <tr class = "img-content">
                        <td>가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어가지마 가지말라고 왜 가냐고 집에 있어</td>
                      
                    </tr>
                </table>
            </div>
            
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
    