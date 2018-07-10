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
			#profileim{position: absolute;width: 100px;height: 100px;left: 400px;top: 65px;			}
			#timelineuserId{position: absolute;width: 150px;height: 60px;text-align: center;left: 500px;top: 50px;}
			#profile{position: absolute;width: 100%;height: 200px;top:100px;}
			#fallow{background-color: lightgray;border:1px solid black;width: 90px;position: absolute;left: 650px;top: 70px;}
			#dm{background-color: lightgray;border:1px solid black;width: 110px;position: absolute;left: 750px;top: 70px;}
			#myreview{background-color: darkblue;color : white;border:1px solid black;position: absolute;width:100px;left: 510px;top: 130px;}
			#likereview{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 610px;top: 130px;}
			#likestore{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 710px;top: 130px;}
			#friend{background-color: lightgray;border:1px solid black;position: absolute;width:120px;left: 810px;top: 130px;}
			#userdetai{float: left;width: 180px;position:relative;}
			#update{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#message{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#coupon{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#point{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#total{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#content{margin-left: 100px;position: relative; width: 800px;height: auto;left : 350px;}
			hr{margin-top:200px;}
			#review{border: 1px solid black;width: 500px;height: 250px}
        	#listTop{border-bottom: 1px solid black;height: 50px;line-height: 50px;}
        	#listTop_R{float: right;height: 50px;width: 150px;line-height: 25px;}
        	.review_table{border-collapse: collapse;margin:0 auto;}
        	.review_list{height: 170px;border-bottom: 1px solid black;border-collapse: collapse;width: 500px;margin:0 auto;}
        	#star{text-align: right;}
        	#hashtag{border: 1px solid black;width: 60px;height: 25px;font-size: 12px;text-align: center;line-height: 25px;float: left;margin-left: 5px;}
        	#reviewList_textarea{border: 0px;width: 99%;height: 100%;resize: none;}
        	#photo{border: 1px solid black;width: 60px;height: 50px;float: left;margin-left: 5px;}
        	#reviewReply{border-bottom: 1px solid black;border-left: 1px solid black;border-right: 1px solid black;width: 500px;display: none;}
        	#starDiv{width: 100%;height: 30px;}
        	#reviewList_hash,#reviewList_photo{width: 600px;height: auto;overflow: hidden;}
        	#hashtag{border: 2px solid #33aaaaff;font-size: 14px;width: auto;text-align: center;float: left;margin-left: 20px;margin-top: 10px;padding-left: 10px;}
		</style>
	</head>
	<body>
		<div id="profile">
		<img id="profileim" src="resources/img/member/noprofile.jpg">		
		<h1 id="timelineuserId">${id}</h1>
			<div id="fallow">팔로우 신청</div>
			<div id="dm">메세지 보내기</div>
			<div class="userdetail">
				<div id="myreview"></div>
				<div id="likereview"></div>
				<div id="likestore"></div>
				<div id="friend"></div>
			</div>
		</div>		
		<br/>
		<hr/>
		<br/>
		<div class="userdetail" id="userdetai">
			<div id="update">회원정보수정</div>
			<div id="message">쪽지함</div>
			<div id="coupon">구매한 쿠폰</div>
			<div id="point">포인트내역</div>
			<div id="total">통계</div>
		</div>
		<div id="content">
			
		</div>
	</body>
	<script>
	var userid = "${sessionScope.loginId}";
	var page = "";
	//console.log(userid);
	//console.log("${id}")
	if(userid==""){
		$("#fallow").css("display","none");
		$("#dm").css("display","none");
	}
	if(userid=="${id}"){
		$("#fallow").css("display","none");
		$("#dm").css("display","none");
	}else{
		$("#userdetai").css("display","none");
		//$("#content").css("left","150px");
		$.ajax({
			url:"./followcheck",
			type:"post",
			data:{
				userid : userid,
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				//console.log(d);
				if(d.id==true){
					$("#fallow").html("팔로우 취소");
				}else{
					$("#fallow").html("팔로우 신청");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	$(document).ready(function(){
		$.ajax({
			url:"./maintimeline",
			type:"post",
			data:{
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				$("#myreview").html("리뷰 "+d.review);
				$("#likereview").html("좋아요 "+d.reviewlike);
				$("#likestore").html("찜한가게 "+d.storelike);
				$("#friend").html("팔로우 목록 "+d.follow);
				timelinereview();
			},
			error:function(e){
				console.log(e);
			}
		});		
	});
	function timelinereview(){
		$.ajax({
			url:"./timelinereviewlist",
			type:"post",
			data:{
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				console.log(d.list);
				printList(d.list);
			},
			error:function(e){
				console.log(e);
			}
		});
	};
	function printList(list){		 
		var content = "";
		/**/
		
		list.forEach(function(item){
			console.log(item.review_replyCnt);
			content += "<div id='review'><input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
			content += "<div id='listTop'>"+item.id+"<div id='listTop_R'><a href='#'>신고</a><br/>명이 좋아합니다.</div></div>";
			content += "<table><tr><td>"+item.review_storeName+"</td>";
			content += "<td id='star'></td></tr>";			
			content += "<tr><td colspan='2'><textarea readonly>"+item.review_content+"</textarea></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_photo"+item.review_idx+"'><td></tr></table>";
			content += "<a href='#' onclick='reply()'>댓글"+item.review_replyCnt+"개</a></div>";
			content += "<div id='reviewReply'>"+item.id+"<input type='text' readonly/><br/></div><br/>";			
			idx=item.review_idx;
			hashtag(idx);
		})
		$("#content").empty();
		$("#content").append(content);
	}
	
	function hashtag(elem){
		 $.ajax({
			url:"./reviewHashPhoto",
			type:"post",
			dataType:"json",
			data:{"review_idx":elem},
			success:function(d){
				//console.log(d.reviewHash);
				//console.log(d.reviewHash);
				console.log(d.reviewPhoto);
				printHash(d.reviewHash,elem);		
				printPhoto(d.reviewPhoto,elem);
			},
			error:function(e){console.log(e);}
		});	 
	}
	
	function printHash(hash,elem){
		var tag="";
		hash.forEach(function(item){
			tag += "<div id='hashtag'>#"+item.hash_tag+"</div>";
		});
		console.log($("#reviewList_hash"));
		$("#reviewList_hash"+elem).append(tag);
	}
	
	function printPhoto(photo,elem){
		var img="";
		photo.forEach(function(item){
			img += "<div id='photo'><img width='60px' height='50px' src='"+item.revPhoto_Photo+"'/></div>";
		})
		$("#reviewList_photo"+elem).append(img);
	}
	$(".userdetail").click(function(e) {
		console.log(e.target.id);
		$(this).css("background-color","darkblue");
		$(this).css("color","white");		
		if(e.target.id == "message") {
			page = "resources/timelinehtml/messagebox.html";
			$("#message").css("background-color","darkblue");
			$("#message").css("color","white");
			$("#update").css("background-color","lightgray");
			$("#update").css("color","black");
	    	$("#coupon").css("background-color","lightgray");
	    	$("#coupon").css("color","black");
	    	$("#point").css("background-color","lightgray");
	    	$("#point").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#myreview").css("background-color","lightgray");
	    	$("#myreview").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
	    	$("#content").load(page,function(res, stat) {});
			ajaxCall(page);
		} else if(e.target.id == "coupon") {
			page = "resources/timelinehtml/couponbox.html";
			$("#coupon").css("background-color","darkblue");
			$("#coupon").css("color","white");
			$("#update").css("background-color","lightgray");
			$("#update").css("color","black");
	    	$("#message").css("background-color","lightgray");
	    	$("#message").css("color","black");
	    	$("#point").css("background-color","lightgray");
	    	$("#point").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#myreview").css("background-color","lightgray");
	    	$("#myreview").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
	    	$("#content").load(page,function(res, stat) {});
			ajaxCall(page);
		} else if(e.target.id == "point"){
			page = "resources/timelinehtml/pointbox.html";
			$("#point").css("background-color","darkblue");
			$("#point").css("color","white");
			$("#update").css("background-color","lightgray");
			$("#update").css("color","black");
	    	$("#message").css("background-color","lightgray");
	    	$("#message").css("color","black");
	    	$("#coupon").css("background-color","lightgray");
	    	$("#coupon").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#myreview").css("background-color","lightgray");
	    	$("#myreview").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
	    	$("#content").load(page,function(res, stat) {});
			ajaxCall(page);
		}else if(e.target.id == "update") {
			page = "resources/timelinehtml/userupdate.html";
			$("#update").css("background-color","darkblue");
			$("#update").css("color","white");
			$("#coupon").css("background-color","lightgray");
			$("#coupon").css("color","black");
	    	$("#message").css("background-color","lightgray");
	    	$("#message").css("color","black");
	    	$("#point").css("background-color","lightgray");
	    	$("#point").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#myreview").css("background-color","lightgray");
	    	$("#myreview").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
	    	$("#content").load(page,function(res, stat) {});
			ajaxCall(page);
		}else if(e.target.id == "myreview") {
			page = "reviewlist"
			$("#update").css("background-color","darkblue");
			$("#update").css("color","white");
			$("#coupon").css("background-color","lightgray");
			$("#coupon").css("color","black");
	    	$("#message").css("background-color","lightgray");
	    	$("#message").css("color","black");
	    	$("#point").css("background-color","lightgray");
	    	$("#point").css("color","black");
	    	$("#total").css("background-color","lightgray");
	    	$("#total").css("color","black");
	    	$("#update").css("background-color","lightgray");
	    	$("#update").css("color","black");
	    	$("#likereview").css("background-color","lightgray");
	    	$("#likereview").css("color","black");
	    	$("#likestore").css("background-color","lightgray");
	    	$("#likestore").css("color","black");
	    	ajaxCall(page);
		}		
	});		
	function ajaxCall(page){
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
		}else if(page=="resources/timelinehtml/pointbox.html"){
			$.ajax({
				url:"./pointlist",
				type:"get",
				data:{
					id : userid
				},
				dataType:"json",
				success:function(d){
					console.log(d);
					pointlist(d);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(page=="resources/timelinehtml/couponbox.html"){
			$.ajax({
				url:"./couponlist",
				type:"get",
				data:{
					id : userid
				},
				dataType:"json",
				success:function(d){
					console.log(d);
					couponlist(d.list);
				},
				error:function(e){
					console.log(e);
				}
			});			
		}else if(page=="reviewlist"){
			$.ajax({
				url:"./timelinereviewlist",
				type:"post",
				data:{
					id : "${id}"
				},
				dataType:"json",
				success:function(d){
					console.log(d.list);
					printList(d.list);
				},
				error:function(e){
					console.log(e);
				}
			});	
		}
	}
	function couponlist(list){
		var content = "";
		list.forEach(function(item, idx){
			content += "<tr>"
			content +="<td>"+item.couponBox_name+"</td>"
			content +="<td>"+item.couponBox_code+"</td>"
			var coupon_use="";
			if(item.couponBox_use==0){
				coupon_use="사용하지 않은 쿠폰"
			}else{
				coupon_use="사용한 쿠폰"
			}
			content +="<td>"+coupon_use+"</td>"
			content += "</tr>"			
		});		
		$("#list").empty();
		$("#list").append(content);//내용 붙이기
	}
	function pointlist(d){
		$("#pointcnt").val(d.memberpoint);
		var content = "";
		d.list.forEach(function(item, idx){
			if(item.pointList_type == "증가"){			
				var plusorminus = '+';
			}else if(item.pointList_type == "감소"){
				var plusorminus = '-';
			}
			content += "<tr>"
			var date = new Date(item.pointList_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content +="<td>"+item.pointList_cate+"</td>"
			content +="<td>"+plusorminus+item.pointList_point+"</td>"
			content += "</tr>"			
		});		
		$("#list").empty();
		$("#list").append(content);//내용 붙이기
	}
	
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
			content +="<td>"+item.id+"</td>"
			content +="<td id='"+item.dm_idx+"' onclick='receivedetail(id)'>"+item.dm_content+"</td>"
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
			content +="<td>"+item.dm_id+"</td>"
			content +="<td id='"+item.dm_idx+"' onclick='senddetail(id)'>"+item.dm_content+"</td>"
			var date = new Date(item.dm_date);	
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content += "</tr>"			
		});
		$("#list").empty();
		$("#list").append(content);//내용 붙이기
	}
	$("#dm").click(function(e){
		var myWin= window.open("./sendMessage?id="+"${id}","메세지보내기","width=500,height=500");
	});
	function receivedetail(e){
		console.log(e);
		var myWin= window.open("./receivedetail?idx="+e,"메세지상세보기","width=500,height=500");
	};	
	function senddetail(e){
		console.log(e);
		var myWin= window.open("./senddetail?idx="+e,"메세지상세보기","width=500,height=500");
	};
	$("#fallow").click(function(e){
		//console.log(e.target.innerHTML);
		if(e.target.innerHTML=="팔로우 신청"){
			$.ajax({
				url:"./followinsert",
				type:"post",
				data:{
					userid : userid,
					id : "${id}"
				},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success>0){
						e.target.innerHTML="팔로우 취소";	
					}else{
						alert("팔로우가 안되었습니다.");
					}									
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(e.target.innerHTML=="팔로우 취소"){
			$.ajax({
				url:"./followdelete",
				type:"post",
				data:{
					userid : userid,
					id : "${id}"
				},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success>0){
						e.target.innerHTML="팔로우 신청";	
					}else{
						alert("팔로우 취소가 안되었습니다.");
					}									
				},
				error:function(e){
					console.log(e);
				}
			});
		}		
	});
	</script>
</html>