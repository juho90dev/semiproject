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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</head>
<div style="text-align:center; font-weight: bold; 
font-size: 2.0em;
line-height: 1.0em">
		
        
        저희 사이트는 영리사이트가 아니며 모든 이용료는 공익 재단에 기부될 예정입니다.<br>
		기부금 100원
<button onclick="iamport();"><%=m.getUserId()%>님 기부금 결제</button>

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