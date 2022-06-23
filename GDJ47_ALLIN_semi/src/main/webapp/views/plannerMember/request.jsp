<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<p align="center">
	<font size="4" color="blue">
	<b> 플랜요청서 </b></font>
</p>
<hr>
<form action="<%=request.getContextPath()%>/orderRegister.do" method="post" onsubmit="orderSave();" >
	<table width="650" height="350" border="1" cellpadding="5" align="center">
		<tr>
			<td> 신청인아이디 </td>
            <td><input type="text" name="memberId" value="<%=login.getUserId()%>" readonly></td>
        </tr>
		<tr>
			<td> 플래너아이디</td>
			<td><input type="text" name="plannerId" value="<%=request.getAttribute("plannerId")%>" readonly></td>
		</tr>
		<tr>
			<td> 테마 </td>
			<td>
				<input id="t1" type="checkbox" name="theme" value="맛집">맛집&nbsp;&nbsp;
				<input id="t2" type="checkbox" name="theme" value="액티비티">액티비티&nbsp;&nbsp;
				<input id="t3" type="checkbox" name="theme" value="유적지">유적지&nbsp;&nbsp;
				<input id="t4" type="checkbox" name="theme" value="힐링">힐링&nbsp;&nbsp;
				<input id="t5" type="checkbox" name="theme" value="자연">자연&nbsp;&nbsp;
				<input id="t6" type="checkbox" name="theme" value="자유여행">자유여행&nbsp;&nbsp;
			<!-- 	<select size="1" name="job" id="p3">
					<option selected> 테마 선택 </option>"
					<option> 맛집 </option>
					<option> 액티비티 </option>
					<option> 유적지 </option>
					<option> 힐링 </option>
					<option> 자연 </option>
					<option> 자유여행 </option>
			</select> -->
			</td>
		</tr>
		<tr>
			<td> 첫날 </td>
			<td><p><input id="p4" type="date" name="startDay" required></p>&nbsp;</td>
		</tr>
		<tr>
			<td> 마지막날 </td>
			<td><p><input id="p5" type="date" name="endDay" required></p>&nbsp;</td>
		</tr>
		<tr>
			<td> 교통수단 </td>
			<td>
				<input id="trans1" type="checkbox" name="transport" value="자동차">자동차&nbsp;&nbsp;
				<input id="trans2" type="checkbox" name="transport" value="버스">버스&nbsp;&nbsp;
				<input id="trans3" type="checkbox" name="transport" value="기차">기차&nbsp;&nbsp;
				<input id="trans4" type="checkbox" name="transport" value="도보">도보&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td> 요청 상세 내용 </td>
			<td> <textarea id="content" rows="7" cols="60" name="content" placeholer="요청 내용" id="p6"> </textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록하기" >&nbsp;&nbsp;
				<input type="reset" value="재설정" onclick="fmReset();">&nbsp;&nbsp;
				<input type="button" value="취소하기" onclick="location.assign('<%=request.getContextPath()%>/index.jsp')">
			</td>
            </tr>
	</table>
</form>
<script>
	const fmReset=()=>{
		$("#p4").val("");
		$("#p5").val("");
		$("#t1").val("");
		$("#t2").val("");
		$("#t3").val("");
		$("#t4").val("");
		$("#t5").val("");
		$("#t6").val("");
		$("#content").val("");
		$("#trans1").val("");
		$("#trans2").val("");
		$("#trans3").val("");
		$("#trans4").val("");
	}

    
</script>


<%@ include file="/views/common/footer.jsp"%>