<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%@ page import="com.login.model.vo.Member" %>
<%
Member m=(Member)session.getAttribute("login");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<div>
        본 사이트의 모든 서비스를 이용하기 위해서는 10원의 이용료를 지불해야합니다.<br>
        저희 사이트는 영리사이트가 아니며 모든 이용료는 공익 재단에 기부될 예정입니다.<br>
<button onclick="iamport();"><%=m.getUserId()%>이용료 결제</button>
</div>
<body>
    <script>
    let id = "<%=m.getUserId()%>";
    let email="<%=m.getEmail()%>";
    console.log(id);
    console.log(email);
    
    function iamport(){
    	    	
		//가맹점 식별코드
		IMP.init('imp05587091');
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : "이용료",
		    amount : 100, //실제 결제되는 가격
		    buyer_email : email
		    
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		       	
		        $.ajax({
		        	url: "<%=request.getContextPath()%>/pay.do",
		        	data:{"id":id},
		        	success: data=()=>{
		        		
		        		
		        	}
		        });
		       
		        
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
    </script>
 
</body>
</html>