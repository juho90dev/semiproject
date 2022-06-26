<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ckRemovePlannerStyle.css"/>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>플래너 삭제</title>
</head>
<body>

	<div class="container">
		<div class="ckContainer">
			<p>선택하신 플래너를 삭제하시겠습니까?</p>
			<div class="btnContainer">
				<button id="yesBtn" onclick="fn_delete();">예</button>
				<button id="noBtn" onclick="fn_close();">아니오</button>
			</div>
		</div>
	</div>

<script>

	const fn_delete = ()=>{ //"예" 버튼 클릭 시
		
		const deleteTargets = opener.document.querySelectorAll(".deleteTarget");
		console.log("/////삭제 대상/////", deleteTargets);
		let targetArr = [];
		
		deleteTargets.forEach(e=>{
			
			if(e.checked==true){
				
				targetArr.push(e.value);
			}
		
		});
		
			$.ajax({
				
				url:"<%=request.getContextPath()%>/planner/removePlanners.do",
				type:"post",
				
				data:{plannerId:JSON.stringify(targetArr)},
				
				success:(data)=>{
					console.log(data);
				},
				error:(r,d)=>{
					console.log(r);
					console.log(d);
					
				}
		
			}); 
		
		//console.log("////////////", targetArr);
		
	}

	const fn_close = ()=>{ //"아니오" 버튼 클릭 시
		
			const deleteTargets = opener.document.querySelectorAll(".deleteTarget");
			console.log("//////////", deleteTargets);
			deleteTargets.forEach(e=>{
				if(e.checked==true){
					e.checked=false;
				}
			});
		
			close();
	}

</script>
</body>
</html>