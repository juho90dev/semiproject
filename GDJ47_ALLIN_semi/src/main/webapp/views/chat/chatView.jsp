<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅방</title>
</head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
   
  $(document).on('click', '.dynamicDiv', function(e) {
	  open("<%=request.getContextPath()%>/accessRoom?roomName="+e.target.innerText,"_blank","width=420,height=460")
  });
  const printChattingRoom=(rooms)=>{
	  console.log(rooms);
	  $("#rooms").html('');
	  rooms.forEach(v=>{
		  $("#rooms").append("<div class='dynamicDiv'>"+v+"</div>");
	  });
  }
  const alramsocket=new WebSocket("ws://localhost:9090<%=request.getContextPath()%>/alram");
  /* class AlramMessage{
	constructor(){
		
	}  
  } */
  alramsocket.onopen=e=>{
	console.log(e);
	
  }
  alramsocket.onmessage=e=>{
	  console.log(e.data);
	  const data=e.data.split('@');
	  console.log(data);
	  switch(data[0]){
	  	case 'room' : printChattingRoom(JSON.parse(data[1]));break;
	  	
	  }  
  }
  function AlramMessage(type,data){
	  this.type=type;
	  this.data=data;
  }
  
  const addDiv = ()=>{
	  	const roomName=prompt('채팅방이름설정');
	  	alramsocket.send('room@'+roomName);
		//$("body").append("<div class='dynamicDiv'>"+roomName+"</div>");
		
  };
   
  
  </script>
   
  </head>
  <body>
  <input type="button" onclick="addDiv()" value="채팅방 생성">
  <div id="rooms">
  </div>
  </body>

  <style type="text/css">
    .dynamicDiv {
        width:170px;
        background-color: #CBE7F4;
        text-align:center;
        font-weight:bold;
        padding: 3px 3px;
        cursor:pointer;
        margin:5px;
        border-radius:.25em;
        border:1px solid #449999;
    }
    </style>
</html>