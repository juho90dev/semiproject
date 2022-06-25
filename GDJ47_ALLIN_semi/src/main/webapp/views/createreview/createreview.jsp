<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

	   <div id="container1">
        <div class="title1">안녕 </div>
        <div class="address">경기 수원시 장안구 영화동 320-2</div>
        <div class="loaction-img1">
            <img src="" alt="" class="img3">
        </div>
    </div>
    <div id="board">
        <div class="title2"> 장소 리뷰 작성하기 </div>
        <form action="" method="post">
            <div class="form-group">
              <label for="title">제목</label>
        <!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
        <!-- required 속성을 설정하면 필수입력 사항이된다. -->
        <!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
              <input type="text" class="form-control1" id="title"
               placeholder="제목 입력(4-100자 이내)"
               maxlength="100" required="required"
               pattern=".{4,100}">
            </div>
            <div class="form-group">
           <label for="content">내용</label>
        <!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
        <!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
            <textarea id="form-control2" placeholder="내용작성(2-1000자이내)"maxlength="1000" required="required"
            pattern=".{4,1000}" ></textarea>
         </div>
            <div class="form-group">
              <label for="writer">작성자</label>
              <input type="text" class="form-control3" id="writer"
               placeholder="작성자(2자-10자)" maxlength="10" required="required"
               pattern=".{2,10}"  name="writer">
            </div>
            <button type="button" class="btn btn-outline-warning">첨부파일</button>
            <button type="submit" class="btn btn-outline-primary">등록</button>
          </form>
        
        
        

    </div>

    <style>
        .btn btn-outline-warning{
            margin-right: 500px;
        }
    #form-control2{
        width: 100%; 
        height: 300px;
    }
    * {
        margin: 0;
        padding: 0;
    }

    #board{
        display: inline-block;
        margin-top: 30px;
        margin-left: 70px;
        margin-bottom: 30px;
        width: 90%;
        border: 1px solid black;
    }


    #container1 {
        display: inline-block;
        margin-top: 30px;
        margin-left: 70px;
        width: 90%;
        height: 450px;
        border: 1px solid black;
    }

    .title1 {
        display: inline-block;
        width: 100%;
        height:20%;
        font-size: 30px;
        color: yellowgreen;
      

    }

    .title2 {
        display: inline-block;
        width: 100%;
        height:20%;
        font-size: 30px;
        color: yellowgreen;
       
    }



   .loaction-img1 {
            display: inline-block;
            margin-top: 10px;
            margin-left: 5%;
            margin-right: 25%;
            width: 50%;
            height: 300px;
       
    }
    .img3{
        display: inline-block;
        width: 100%;
        height: 300px; 
    }

</style>



<%@ include file="/views/common/footer.jsp"%>
