<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List" %>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<%-- <form class="nav" action="<%=request.getContextPath()%>/">
	<input type="text" id="text" placeholder="관심지역" 입력">
	<input type="submit" id="search" value="검색">
</form> --%>
<button class="w-btn w-btn-gra1" type="button" onclick="location.href='<%=request.getContextPath()%>/chatView.do'">
    채팅하기
</button>

<style>


button {
    margin: 20px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}

.w-btn-green {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2 {
    background-color: #519d9e;
    color: #9dc8c8;
}

.w-btn-green-outline {
    border: 3px solid #77af9c;
    color: darkgray;
}

.w-btn-green2-outline {
    border: 3px solid #519d9e;
    color: darkgray;
}

.w-btn-green-outline:hover {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2-outline:hover {
    background-color: #519d9e;
    color: #9dc8c8;
}

.w-btn-brown {
    background-color: #ce6d39;
    color: #ffeee4;
}

.w-btn-brown-outline {
    border: 3px solid #ce6d39;
    color: #b8b8b8;
}

.w-btn-brown-outline:hover {
    background-color: #ce6d39;
    color: #ffeee4;
}

.w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
}

.w-btn-pink {
    background-color: #f199bc;
    color: #d4dfe6;
}

.w-btn-gray {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red {
    background-color: #ff5f2e;
    color: #e1eef6;
}

.w-btn-skin {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
}

.w-btn-pink-outline {
    border: 3px solid #f199bc;
    color: #6e6e6e;
}

.w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}

.w-btn-red-outline {
    border: 3px solid #ff5f2e;
    color: #6e6e6e;
}

.w-btn-skin-outline {
    border: 3px solid #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow-outline {
    border: 3px solid #fce205;
    color: #6e6e6e;
}

.w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
}

.w-btn-pink-outline:hover {
    background-color: #f199bc;
    color: #d4dfe6;
}

.w-btn-gray-outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red-outline:hover {
    background-color: #ff5f2e;
    color: #e1eef6;
}

.w-btn-skin-outline:hover {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow-outline:hover {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}

.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}

.w-btn-gra2 {
    background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    color: white;
}

.w-btn-gra3 {
    background: linear-gradient(
        45deg,
        #ff0000,
        #ff7300,
        #fffb00,
        #48ff00,
        #00ffd5,
        #002bff,
        #7a00ff,
        #ff00c8,
        #ff0000
    );
    color: white;
}
</style>
<section id="memberList-container">
<div class="container">
<%if(!list.isEmpty()) {
	for(Member m : list) {%>
	<div class="box">
		<div class="image">
		<%if(m.getImage()==null) {%>
			<a href="<%=request.getContextPath()%>/plannerProfile.do?plannerId=<%=m.getUserId()%>"><img src="<%=request.getContextPath()%>/images/logo.png"></a>
		<%}else{ %>
			<a href="<%=request.getContextPath()%>/plannerProfile.do?plannerId=<%=m.getUserId()%>"><img src="<%=m.getImage()%>"></a>
		<%} %>
		</div>
		<div class="name_job"><%=m.getUserId()%></div>
		<div class="rating">
			<i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
            <i class="far fa-star"></i>
            <i class="far fa-star"></i>
		</div>
		<p> PLANNER</p>
		<div class="btns">
			<button onclick="location.assign('<%=request.getContextPath()%>/request.do?plannerId=<%=m.getUserId()%>')">request </button>
		</div>

	</div>
		<%	}
	}else{ %>
		<div class="resultList">조회된 결과가 없습니다.</div>
	<%} %>

</div>
</section>

     
               <ul class="pagination justify-content-center">
                  <%=request.getAttribute("pageBar") %>
               </ul>
      

<style>
section#memberList-container {text-align:center;}
.resultList{
	text-align : center;
	font-size: 18px;
}
.nav {
	margin-top : 20px;
	margin-left : 550px;
      display: flex;
      justify-content: center;

      width: 600px;
      height: 50px;
      border: 1px solid black;
    }


    .nav>#text {
      display: flex;
      margin-top: 10px;
      width: 500px;
      /* 검색창 사이즈 조절 */
      height: 30px;
      font-size: 18px;
      border: none;
      border-bottom: 3px solid rgb(93, 182, 93);

    }

    .nav>#search {
    padding-left : 10px;
    text-align : center;
      display: flex;
      margin-top: 14px;
      font-size: 18px;
      border: none;
      background-color: rgb(93, 182, 93);
      width: 50px;
      height: 30px;
      border-radius: 15px;
      color: #fff;
      cursor: pointer;
    }
        *{
  margin: 0px;
  padding: 0px;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
::selection{
  background: #8e44ad;
  color: #fff;
}
html,body{
  height: 100%;
  place-items: center;
}
.container{
  max-width: 1100px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  padding: 20px;
}
.container .box{
  width: calc(33% - 10px);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 20px 30px;
  border-radius: 5px;
}
.box .quote i{
margin-top: 10px;
font-size: 45px;
color: #17c0eb
}
.container .box .image{
  margin: 10px 0;
  height: 150px;
  width: 150px;
  background: white;
  border :1px solid black;
  padding: 3px;
  border-radius: 50%;
}
.box .image img{
  height: 100%;
  width: 100%;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #fff;
}
.box p{
  text-align: justify;
  margin-top: 8px;
  font-size: 16px;
  font-weight: 400;
}
.box .name_job{
  margin: 10px 0 3px 0;
  color: #8e44ad;
  font-size: 18px;
  font-weight: 600;
}
.rating i{
  font-size: 18px;
  color: #8e44ad;
  margin-bottom: 5px;
}
.btns{
  margin-top: 20px;
  margin-bottom: 5px;
  display: flex;
  justify-content: space-between;
  width: 100%;
}
.btns button{
  background: aqua;
  width: 100%;
  padding: 9px 0px;
  outline: none;
  border: 2px solid #8e44ad;
  border-radius: 5px;
  cursor: pointer;
  font-size: 18px;
  font-weight: 400;
  color: #8e44ad;
  transition: all 0.3s linear;
}
.btns button:first-child{
  background: #fff;
  color: #fff
  margin-right: 5px;
}
.btns button:last-child{
  color: #8e44ad;
  margin-left: 5px;
  
}
.btns button:hover{
  background: aqua;
  color: #fff;
}
/* .btns button:first-child:hover{
  background: aqua;
  color: #fff;
}
.btns button:last-child:hover{
  color: #8e44ad;
  background : #fff;
} */
/* @media (max-width:1045px){
  .container .box{
    width: calc(50% - 10px);
    margin-bottom: 20px;
  }
}
@media (max-width:710px){
  .container .box{
    width: 100%;
  }
} */
      </style>
<%@ include file="/views/common/footer.jsp"%>