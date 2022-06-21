<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

	<div class="box1">
        <div class="box2">
            <h3>planner Id</h3>
            <div class="image"><img class="image" src="잠만보.jpeg" width='300' height='300'></div>
            <br><br>
            <br>
            <br>
            <br><br>
            <hr>
            <h4>자기소개</h4>
            <br>한줄 소개 
            <hr>
            <br><h4>MY PLAN</h4>
            <br>여기에는 플랜루트 
        </div>    
    </div>
    <style>
        div {
    display:inline-block;
  }



.day {
    position:fixed;
    background-color:rgb(133, 195, 236);
    top:0px;
    width:1000px;
    height:30pt;
    font-size: 15pt;
}

.box1 {
    position:relative;
    top:30pt;
    left:0px;
    margin-bottom : 10px;
    width:1000px;
    height:1200px;
    font-size: 15pt;
    font-weight: normal;
    /* background-color:rgb(204, 219, 252); */
    

}

.box1 .box2 {
    position:absolute;
    top:100pt;
    left:0px;
    width:915px;
    height:900px;
    font-size: 15pt;
    font-weight:lighter;
    background-color:white;
    padding:20px;
    margin:20px;

    
}

body {
    text-align:center;
}


.image{
    border-radius: 35%;
}

    </style>

<%@ include file="/views/common/footer.jsp"%>