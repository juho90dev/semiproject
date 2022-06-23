<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "com.login.model.vo.Member" %>
<%
	Member login=(Member)session.getAttribute("login");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getParameter("roomName")%></title>
   <style>
        #container {
            width: 400px;
            height: 400px;
            border: 1px solid black;
            background: ivory;
        }
        #chatView {
            height: 90%;
            overflow-y: scroll;
        }
        #chatForm {
            height: 10%;
            border-top: 1px solid black;
            text-align: center;
        }
        #msg {
            width: 80%;
            height: 32px;
            border-radius: 8px;
        }
        #send {
            width: 16%;
            height: 34px;
            border-radius: 50px;
            background: black;
            color: white;
        }
    </style>
</head>
<body>
	<input id="sender" size="30" placeholder="ID를 입력하세요" value ="<%=login.getUserId()%>">
	<input id="receiver" size="10" placeholder="">
	
	
	    <div id="container">
        <div id="chatView">
        </div>
        <div id="chatForm" onsubmit="return false">
            <input type="text" id="msg">
            <input type="submit" id="sendBtn" value="전송"">
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>

		const websocket = new WebSocket("ws://localhost:9090/<%=request.getContextPath()%>/chatting");
		websocket.onopen=e=>{
			websocket.send(new Message("msg"," ",'',<%=request.getParameter("roomName")%>))
		}
		websocket.onmessage=e=>{
			console.log(e);
			/* const message = e.data.split(","); */
			const message = JSON.parse(e.data);
			console.log(message);
			const h2=$("<h2>");
			if(message["receiver"]=="") {
				if(message["sender"]==$("#sender").val()){ 
					h2.css({"text-align" : "right","color":"purple"});
				}else if(message["sender"]=="admin"){
					h2.css({"text-align":"center","color":"red"});
				}else{ 
					h2.css({"text-align" : "left","color" : "aqua"});
				}
	 			h2.text(message["msg"]);
				$("#chatView").append(h2);  
			}else{
				if(message["receiver"]==$("#sender").val()){
					h2.css({"text-align" : "left","color" : "gray"});
		 			h2.text(message["msg"]);
					$("#chatView").append(h2);  
				}
			}
 			

		};
		
		$("#sendBtn").click(e=>{
			const msg = $("#msg").val();
			//websocket.send(msg);
			const sender=$("#sender").val();
			const receiver = $("#receiver").val();
			const msgClass = new Message("msg",sender,receiver,msg,"");
			/* websocket.send(sender+","+receiver+","+msg);  */
			websocket.send(JSON.stringify(msgClass));
		});
		
		function Message(type, sender, receiver, msg, room){
			this.type=type;
			this.sender=sender;
			this.receiver=receiver;
			this.msg=msg;
			this.room=room;
			
		}
		
		
	
	</script>

</body>
</html>