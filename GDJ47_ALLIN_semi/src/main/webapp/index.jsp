<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- 메인페이지 -->
    <div id= mainvideo>
        <video autoplay loop muted>
             
            <source src="<%=request.getContextPath()%>/videos/mainvideo.mp4" type="video/mp4" >
        </video>
    </div>
 	<style>
        
         video {
         	display:flex;
         	margin-left:25%;
         	margin-top:20px;
         	width: 50%; 
         }
    </style>

<%@ include file="/views/common/footer.jsp"%>