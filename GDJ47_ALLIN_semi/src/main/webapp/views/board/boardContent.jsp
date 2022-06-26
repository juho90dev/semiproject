<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
	td {
		text-align: left !important;
	}
</style>

<div id="wrap">
            <style type="text/css">
 * {font size:9pt;}
 p {width: 600px; text-align:right;}
 table thead tr td {background-color:gray;}
 a:LINK {color: #646464;}
 a:ACTIVE {color: #646464;}
 a:HOVER {color: #646464;}

</style>
</head>
<body>
<br>
<table border="1" summary="게시판 상세내용" width="650" height="350" border="1" cellpadding="5" align="center">

 <colgroup>
  <col width = "130px" />
  <col width = "500px" />
 </colgroup>
 
 <tbody>
  <tr>
   <th align="center">글번호</th>
   <td> </td>
  </tr>
  <tr>
   <th align="center">제목</th>
   <td> </td>
  </tr>
  <tr>
   <th align="center">작성자</th>
   <td> </td>
  </tr>
  <tr>
   <td colspan="2" height="200px"> </td>
  </tr>
 </tbody>

<tr>
<td colspan="2" align="center">
 <input type="button" value="목록" onclick="location.assign('<%=request.getContextPath()%>/boardList.do') " />
 <input type="button" value="수정" onclick=" '"/>
 <input type="button" value="삭제" onclick=" "/>
 </td>
 </tr>
</table>
<%@ include file="/views/common/footer.jsp"%>