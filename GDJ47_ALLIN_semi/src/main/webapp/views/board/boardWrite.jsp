<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<form action="<%=request.getContextPath()%>/insertBoard.do" method="post" >
	<table width="650" height="350" border="1" cellpadding="5" align="center">
		<tr></tr>
		<br><br>
		<tr>
			<td> 작성자 아이디 </td>
            <td><input type="text" name="memberId" value="<%=login.getUserId()%>" readonly></td>
        </tr>
		<tr>
			<td> 신고 아이디</td>
			<td><input type="text" name="plannerId" value="" placeholder = "신고할 아이디"></td>
		</tr>
		<tr>
			<td> 제목 </td>
			<td><input id="text" name="title" placeholder="제목을 작성해주세요">&nbsp;</td>
		</tr>
		<tr>
			<td> 신고 내용 </td>
			<td> <textarea id="content" rows="7" cols="60" name="content" id="p6"> </textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록하기" >&nbsp;&nbsp;
				<input type="reset" value="재설정" onclick="fmReset();">&nbsp;&nbsp;
				<input type="button" value="취소하기" onclick="location.assign('<%=request.getContextPath()%>')">
			</td>
            </tr>
	</table>
</form>

<%@ include file="/views/common/footer.jsp"%>