<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List" %>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
%>
<%-- <form class="nav" action="<%=request.getContextPath()%>/">
	<input type="text" id="text" placeholder="관심지역" 입력">
	<input type="submit" id="search" value="검색">
</form> --%>

<div class="container">
<%if(!list.isEmpty()) {
	for(Member m : list) {%>
	<div class="box">
		<div class="image">
			<a href="<%=request.getContextPath()%>/plannerProfile.do"><%=m.getImage()%><img src=""></a>
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
<!-- 	<div class="box">
		<div class="image">
			----  <img src="img2.jpeg" alt="">-
		</div>
		<div class="name_job">Planner_Id</div>
		<div class="rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
            <i class="far fa-star"></i>
		</div>
		<p> PLANNER</p>
		<div class="btns">
            <button>chatting </button>
            <button>request</button>
		</div>
	</div>
             <div class="box">
          <div class="image">
           -- <img src="img3.jpeg" alt="">--
          </div>
          <div class="name_job">Planner_Id</div>
            <div class="rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
          </div>
          <p> PLANNER</p>
          <div class="btns">
            <button>chatting </button>
            <button>request</button>
          </div>
        </div>        <div class="box">
          <div class="image">
           -- <img src="img3.jpeg" alt="">--
          </div>
          <div class="name_job">Planner_Id</div>
            <div class="rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
          </div>
          <p> PLANNER</p>
          <div class="btns">
            <button>chatting </button>
            <button>request</button>
          </div>
        </div>        <div class="box">
          <div class="image">
           -- <img src="img3.jpeg" alt="">--
          </div>
          <div class="name_job">Planner_Id</div>
            <div class="rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
          </div>
          <p> PLANNER</p>
          <div class="btns">
            <button>chatting </button>
            <button>request</button>
          </div>
        </div>        
        <div class="box">
          <div class="image">
           -- <img src="img3.jpeg" alt="">--
          </div>
          <div class="name_job">Planner_Id</div>
            <div class="rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
          </div>
          <p> PLANNER</p>
          <div class="btns">
            <button>chatting </button>
            <button>request</button>
          </div>
        </div>   --> 
</div>

<style>
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