<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>		
			#profileimg{position: absolute;width: 100px;height: 100px;left: 400px;top: 65px;			}
			#timelineuserId{position: absolute;width: 150px;height: 60px;text-align: center;left: 500px;top: 50px;}
			#profile{position: absolute;width: 100%;height: 200px;top:100px;}
			#fallow{background-color: lightgray;border:1px solid black;width: 90px;position: absolute;left: 650px;top: 70px;}
			#dm{background-color: lightgray;border:1px solid black;width: 110px;position: absolute;left: 750px;top: 70px;}
			#review{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 510px;top: 130px;}
			#likereview{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 610px;top: 130px;}
			#likestore{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 710px;top: 130px;}
			#friend{background-color: lightgray;border:1px solid black;position: absolute;width:120px;left: 810px;top: 130px;}
			#userdetai{float: left;width: 180px;position:relative;}
			#update{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#message{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#cupon{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#point{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#total{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#content{float: left;margin-left: 100px;position: relative; width: 800px;;height: auto;}
			hr{margin-top:200px;}
		</style>
	</head>
	<body>
		<div id="profile">
		<img id="profileimg" src="resources/img/member/noprofile.jpg">		
		<h1 id="timelineuserId">홍길동</h1>
			<div id="fallow">팔로우 신청</div>
			<div id="dm">메세지 보내기</div>
			<div class="userdetail">
				<div id="review">리뷰 40</div>
				<div id="likereview">좋아요 40</div>
				<div id="likestore">찜한가게 40</div>
				<div id="friend">팔로우 목록 40</div>
			</div>
		</div>		
		<br/>
		<hr/>
		<br/>
		<div class="userdetail" id="userdetai">
			<div id="update">회원정보수정</div>
			<div id="message">쪽지함</div>
			<div id="cupon">구매한 쿠폰</div>
			<div id="point">포인트내역</div>
			<div id="total">통계</div>
		</div>
		<div id="content">
			
		</div>
	</body>
	<script>
	var userid = "${sessionScope.userId}";
	console.log(userid);
	$(".userdetail").click(function(e) {
		console.log("상세정보");
		//var p_no=${place_no};
		var page = "";
		console.log(e.target.id);
		$(this).css("background-color","darkblue");
		$(this).css("color","white");
		
		if(e.target.id == "message") {
			page = "resources/timelinehtml/messagebox.html";
			$("#message").css("background-color","darkblue");
			$("#message").css("color","white");
			$("#update").css("background-color","lightgray");
			$("#update").css("color","black");
	    	$("#cupon").css("background-color","lightgray");
	    	$("#cupon").css("color","black");
	    	$("#point").css("background-color","lightgray");
	    	$("#point").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#review").css("background-color","lightgray");
	    	$("#review").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
		} else if(e.target.id == "cupon") {
			page = "resources/timelinehtml/cuponbox.html";
			$("#cupon").css("background-color","darkblue");
			$("#cupon").css("color","white");
			$("#update").css("background-color","lightgray");
			$("#update").css("color","black");
	    	$("#message").css("background-color","lightgray");
	    	$("#message").css("color","black");
	    	$("#point").css("background-color","lightgray");
	    	$("#point").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#review").css("background-color","lightgray");
	    	$("#review").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
		} else if(e.target.id == "point"){
			page = "resources/timelinehtml/pointbox.html";
			$("#point").css("background-color","darkblue");
			$("#point").css("color","white");
			$("#update").css("background-color","lightgray");
			$("#update").css("color","black");
	    	$("#message").css("background-color","lightgray");
	    	$("#message").css("color","black");
	    	$("#cupon").css("background-color","lightgray");
	    	$("#cupon").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#review").css("background-color","lightgray");
	    	$("#review").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
		}else if(e.target.id == "update") {
			page = "resources/timelinehtml/userupdate.html";
			$("#update").css("background-color","darkblue");
			$("#update").css("color","white");
			$("#cupon").css("background-color","lightgray");
			$("#cupon").css("color","black");
	    	$("#message").css("background-color","lightgray");
	    	$("#message").css("color","black");
	    	$("#point").css("background-color","lightgray");
	    	$("#point").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#review").css("background-color","lightgray");
	    	$("#review").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
		}			
		$("#content").load(page,function(res, stat) {  /* $("#area").html(res) */  });
		if(page=="resources/timelinehtml/messagebox.html"){
			$.ajax({
				url:"./receivelist",
				type:"get",
				data:{
					id : userid
				},
				dataType:"json",
				success:function(d){
					receivelist(d.list);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	});
	function send(){
		$("#send").css("background-color","darkblue");
		$("#send").css("color","white");
		$("#receive").css("background-color","lightgray");
		$("#receive").css("color","black");
		$("#sendorreceive").html("받는사람");
		$.ajax({
			url:"./sendlist",
			type:"get",
			data:{
				id : userid
			},
			dataType:"json",
			success:function(d){
				sendlist(d.list);
			},
			error:function(e){
				console.log(e);
			}
		});
	};
	function receive(){
		$("#receive").css("background-color","darkblue");
		$("#receive").css("color","white");
		$("#send").css("background-color","lightgray");
		$("#send").css("color","black");
		$("#sendorreceive").html("보낸사람");
		$.ajax({
			url:"./receivelist",
			type:"get",
			data:{
				id : userid
			},
			dataType:"json",
			success:function(d){
				receivelist(d.list);
			},
			error:function(e){
				console.log(e);
			}
		});
	};
	function receivelist(list){
		var content = "";		
		list.forEach(function(item, idx){
			content += "<tr>"
			content +="<td>"+item.dm_id+"</td>"
			content +="<td><a href='/dmdetail?idx"+item.dm_idx+"'>"+item.dm_content+"</a></td>"
			var date = new Date(item.dm_date);			
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content += "</tr>"			
		});		
		$("#list").empty();
		$("#list").append(content);//내용 붙이기
	}
	function sendlist(list){
		var content = "";		
		list.forEach(function(item, idx){
			content += "<tr>"
			content +="<td>"+item.id+"</td>"
			content +="<td><a href='/dmdetail?idx"+item.dm_idx+"'>"+item.dm_content+"</a></td>"
			var date = new Date(item.dm_date);	
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content += "</tr>"			
		});
		$("#list").empty();
		$("#list").append(content);//내용 붙이기
	}
	$("#dm").click(function(e){
		var myWin= window.open("./sendMessage","메세지보내기","width=500,height=500");
	})
	</script>
</html>