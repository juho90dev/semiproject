<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


 <p align="center">
        <font size="4" color="blue">
           <b> 플랜요청서 </b></font>
    </p>
    <hr>
    <form action="" method="post">
        <table width="650" height="350" border="1" cellpadding="5" align="center">
            <tr>
                <td> 신청인 아이디 </td>
                <td id="request"><%=login.getUserId()%></td>
            </tr>
            <tr>
                <td> 플래너아이디</td>
                <td><%=request.getAttribute("plannerId") %></td>
            </tr>
            <tr>
                <td> 테마 </td>
                <td> <select size="1" name="job">
                       <option selected> 테마 선택 </option>"
                       <option> 맛집 </option>
                       <option> 액티비티 </option>
                       <option> 유적지 </option>
                       <option> 힐링 </option>
                       <option> 자연 </option>
                       <option> 자유여행 </option>
                    </select></td>
            </tr>
            <tr>
                <td> 첫날 </td>
                <td><p><input type="date"></p>&nbsp;</td>
            </tr>
            <tr>
                <td> 마지막날 </td>
                <td><p><input type="date"></p>&nbsp;</td>
            </tr>
            <tr>
                <td> 교통수단 </td>
                <td>
                    <input type="checkbox" name="trans" value="car">자동차&nbsp;&nbsp;
                    <input type="checkbox" name="trans" value="bus">버스&nbsp;&nbsp;
                    <input type="checkbox" name="trans" value="train">기차&nbsp;&nbsp;
                    <input type="checkbox" name="trans" value="walk">도보&nbsp;&nbsp;
               	</td>
            </tr>
            <tr>
                <td> 요청 상세 내용 </td>
                <td> <textarea rows="7" cols="60" name="intro" placeholer="요청 내용"> </textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="등록하기">&nbsp;&nbsp;
                    <input type="reset" value="취소하기"></td>
            </tr>
        </table>
    </form>
    <script>
    	
    </script>


<%@ include file="/views/common/footer.jsp"%>