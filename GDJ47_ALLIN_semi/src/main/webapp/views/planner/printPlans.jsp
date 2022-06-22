<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/printPlanStyle.css"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a918dc059c0c7fe988d04540ed91f259&libraries=services"></script>
<div class="container">

	<div class="planTitle">제목</div>
	<div class="forOption">
		<select id="selectDays">
			<option>샘플</option>
		</select>
	</div>
	<div class="detailInfo">
		<div class="forMap">
			<%@include file="/views/planner/mapForPlanPrint.jsp" %> 
		</div>
		<div class="forPlan">
			<div class="planZone">
				<div class="plan">
				</div>
			</div>
		</div>
	</div>
</div>


 <%@ include file="/views/common/footer.jsp"%> 