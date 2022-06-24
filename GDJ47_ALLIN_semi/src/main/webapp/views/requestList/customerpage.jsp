<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@
page import="com.request.model.vo.RequestPlan"
%>
<%
List <RequestPlan> list=(List<RequestPlan>)request.getAttribute("list");
%> 
    

<%@ include file="/views/common/header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
 <body>
 <br>

		<div id="joinInfoArea">

					<table class="table">
					  <caption>표 제목</caption>
					  <tr>
					  <th>주문번호</th>
					  <th>플랜크리에이터</th>
					  <th>여행시작일</th>
					  <th>여행종료일</th>
					  <th>교통수단</th>
					  <th>관광테마</th>
					  <th>내용</th>
					  <th>수락여부</th>
					  <th>결제여부</th>
					  <th>요청삭제</th>
					  </tr>
					 <!-- <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
					  <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>-->
					  
				
				<!-- <div class="btnArea">
					<button id="joinBtn">수정하기</button>
				</div>-->
				<tbody>
				<%if(list.isEmpty()){ %>
       			<tr>
       				<td colspan="11"><h3>조회된결과가 없습니다!</h3></td>
       			</tr>
       		<%}else{
       			for(RequestPlan rp : list){%>
					<tr>
					<td><%=rp.getOrderNum() %></td>
					<td><%=rp.getPlannerId() %></td>
					<td><%=rp.getStartDay() %></td>
					<td><%=rp.getEndDay() %></td>
					<td><%=rp.getTransport() %></td>
					<td><%=rp.getTheme() %></td>
					<td><%=rp.getContent() %></td>
					<td><%=rp.getApproval()%></td>
					
					
					<td><%=rp.getRequestPay() %>&nbsp;
					<%if(rp.getRequestPay().equals("N")) {%>
						<button onclick="payRequest(<%=rp.getOrderNum()%>)">결제하기(결제금액:100원)</button>
					<%}else {%>
						<button onclick="payAlert();">결제완료</button>
					<%} %>
					</td>
					<td>
					<button onclick="deleteRequest(<%=rp.getOrderNum()%>)">삭제</button>
					</td>
					</tr>
				<%} %>
			<%} %>
				</tbody>
				</table> 
		</div>

<script>
		
		let name="<%=login.getUserId()%>";
		console.log(name);
		//console.log(id);
		//console.log(email);

	const deleteRequest=(orderNum)=>{
		if(confirm("해당 주문을 삭제하시겠습니까?")){
			$.ajax({
				url: "<%=request.getContextPath()%>/deleteRequest.do",
				data:{"orderNum":orderNum},
				success: data=()=>{
					alert("주문삭제완료!");
					location.reload();
				}
			});
		}else{
			
		}
	}

	const payRequest=(orderNum)=> {
		console.log(orderNum);
		
		if(confirm("결제를 진행하시겠습니까?")){
			
			(function iamport(){
    	    	
				//가맹점 식별코드
				IMP.init('imp05587091');
				IMP.request_pay({
				    pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : "이용료",
				    amount : 100, //실제 결제되는 가격
				    buyer_name : name
				    
				}, function(rsp) {
					console.log(rsp);
				    if ( rsp.success ) {
				    	var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				       	
				        $.ajax({
				        	url: "<%=request.getContextPath()%>/payUpdate.do",
				        	data:{"orderNum":orderNum},
				        	success: data=()=>{
								location.reload();
				        		
				        	}
				        });
				  
				        
				    } else {
				    	 var msg = '결제에 실패하였습니다.';
				         msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				});
			})();
	
			
		}else{
			
		} 
	}
	
	const payAlert=()=>{
		alert("이미 결제가 완료되었습니다!");
	}
	
	
</script>


<style>
		.outer{
		width:100%;
		min-width : 1000px;
		/* background: rgb(248, 249, 250); */
		box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 4px 0px;
		margin:auto;
		margin-top : 70px;
		margin-bottom : 70px;
	}
	
	#joinForm {
		margin: auto;
		padding: 10px;
		text-align:center;
	}
	

	.table {
      border-collapse: collapse;
      border-top: 3px solid rgb(77, 78, 79);
	  text-align:center;
		margin: auto;
		padding: 10px;
    }  
    .table th {
      color: rgba(0, 0, 0, 0.861);
      background: #dadada46;
      text-align: center;
    }

    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}

	.button {
	  text-align:right;
    }  

	.likeabutton {
    text-decoration: none; 
    font: menu;
    display: inline-block; 
    padding: 2px 8px;
    background: ButtonFace; 
    color: ButtonText;
    border-style: solid; 
    border-width: 2px;
    border-color: ButtonHighlight ButtonShadow ButtonShadow ButtonHighlight;
	}
	
	.likeabutton:active {
    border-color: ButtonShadow ButtonHighlight ButtonHighlight ButtonShadow;
	}


	
</style>




   </body>
    
<%@ include file="/views/common/footer.jsp" %>