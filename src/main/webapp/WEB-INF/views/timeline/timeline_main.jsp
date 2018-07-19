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
			#profileim{position: absolute;width: 100px;height: 100px;left: 400px;top: 65px;}
			#timelineuserId{position: absolute;width: 150px;height: 60px;text-align: center;left: 500px;top: 50px;}
			#profile{position: absolute;width: 100%;height: 200px;top:150px;}
			#fallow{background-color: lightgray;border:1px solid black;width: 90px;position: absolute;left: 650px;top: 70px;cursor: pointer;}
			#dm{background-color: lightgray;border:1px solid black;width: 110px;position: absolute;left: 750px;top: 70px;cursor: pointer;}
			#myreview{background-color: darkblue;color : white;border:1px solid black;position: absolute;width:100px;left: 510px;top: 130px;cursor: pointer;}
			#likereview{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 610px;top: 130px;cursor: pointer;}
			#likestore{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 710px;top: 130px;cursor: pointer;}
			#friend{background-color: lightgray;border:1px solid black;position: absolute;width:120px;left: 810px;top: 130px;cursor: pointer;}
			#userdetai{float: left;width: 180px;position:relative;cursor: pointer;}
			#timeline_reply{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#update{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#message{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#coupon{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#point{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#total{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#dm_write{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#store_regist_list{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#complain_list{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}  
			button#complain_move{background-color: #2637a4; color: white; border: none; border-radius: 3px;}
			button#store_regist_move{background-color: #2637a4; color: white; border: none; border-radius: 3px;}
			button#store_regist_yes{background-color: #2637a4; color: white; border: none; border-radius: 3px;}
			button#store_regist_no{background-color: #2637a4; color: white; border: none; border-radius: 3px;}
			
			#content{position: absolute; width: 800px;height: auto;left : 400px;}
			hr{margin-top:200px;}
			
	        #storeName_td{font-weight: bold;}
	        #reply{border: 1px solid #142e5b;height: 50px;width: 650px;height:auto;}
			#reply_img{width: 50px;height: 40px;padding: 5px;}
			#reply_id{font-size: 20px;width: 100px;text-align: center;}
			#reply_content{padding: 5px;width: 240px;text-align: center;}
			#reply_date{padding: 5px;width: 100px;text-align: center;}
			#reply_table{border-bottom:1px solid black;}
			#reply_size{white_space:pre;}
			.reply_btn{width:50px;}
			.reply_clk{display:none;}
			.ddd{display:none;}
			.storeTable{float: left;margin-left:1px; margin-right: 10px;margin-top: 10px;border:1px solid black;width:250px;height:250px;}
			.storeImg{width: 250px;height: 100px;}
			#hashtag{border: 2px solid #33aaaaff;font-size: 14px;width: auto;text-align: center;float: left;padding: 0px 5px;margin-right: 5px;}
			#fallowlist{border: 1px solid #33aaaaff;display:none;position:absolute;left:810px;width:410px;top:154px;background-color:white;z-index:1;}
			.followbtn{border:1px solid lightgray;}
			#follower{background-color:darkblue;color:white;width:50px;}
			#following{width:50px;position:absolute;left:50px;top:0px;}
			.friendprofile{width:60px;height:60px;float:left;}
			.followdiv{width:200px;float:left;padding:1px;}
			
			#review_profile{width:50px;height: 50px;float:left;}
			#reviewListDiv{margin-left: 490px;}
			#review{border: 2px solid #142e5b;width: 500px;height: auto;}
        	#listTop{border-bottom: 2px solid #142e5b;height: 50px;line-height: 50px;}
        	#listTop_R{float: right;height: 50px;width: 150px;line-height: 25px;text-align: right;font-size: 13px;}
       		#review_table tr,#review_table td{border-collapse: collapse;margin:0 auto;}
        	#review_table{height: 170px;border-bottom: 2px solid #142e5b;border-collapse: collapse;width: 500px;margin:0 auto;}
        	.starTd{text-align: right; overflow: hidden;}
	        #hashtag{border: 2px solid black;width: 60px;height: 25px;font-size: 12px;text-align: center;line-height: 25px;float: left;margin-left: 5px;}
	        #review_content{border: 0px;width: 99%;height: 100%;resize: none;}
	        #photo{width: 60px;height: 50px;float: left;margin-left: 5px;}
	        .reviewReply{border-bottom: 1px solid black;border-left: 1px solid black;border-right: 1px solid black;width: 500px;display: none;}
	        #starDiv{width: 100%;height: 30px;}
	        #reviewList_hash,#reviewList_photo{width: 600px;height: auto;overflow: hidden;}
	        #hashtag{border: 2px solid #33aaaaff;font-size: 14px;width: auto;text-align: center;float: left;padding: 0px 5px;}
	        #storeName_td{font-weight: bold;width: 300px;}
	        #tableTop{height: 40px;}
	        .span{text-decoration: none;color: black;font-size: 13px;}
	        .span:hover{color: red;}
		</style>
	</head>
	<body>
		<div id="profile">
		<img id="profileim" src="resources/img/member/noprofile.jpg">		
		<h1 id="timelineuserId">${id}</h1>
			<div id="fallow">팔로우 신청</div>
			<div id="dm">메세지 보내기</div>
			<c:if test="${sessionScope.loginId != '관리자' }">
				<div class="userdetail">
					<div id="myreview"></div>
					<div id="likereview"></div>
					<div id="likestore"></div>
					<div id="friend" onclick="fallowlist()"></div>
				</div>
			</c:if>
			<div id="fallowlist"></div>
		</div>		
		<br/>
		<hr/>
		<br/>
		<div class="userdetail" id="userdetai">
			<c:if test="${sessionScope.loginId == '관리자' }">
				<div id="dm_write">쪽지보내기</div>
				<div id="message">쪽지함</div>
				<div id="store_regist_list">가게 등록 관리</div>
				<div id="complain_list">신고 리스트</div>
			</c:if>
			
			<c:if test="${sessionScope.loginId != '관리자' }">
				<div id="update">회원정보수정</div>
				<div id="timeline_reply">작성한댓글리뷰</div>
				<div id="message">쪽지함</div>
				<div id="coupon">구매한 쿠폰</div>
				<div id="point">포인트내역</div>
				<div id="total">통계</div>
			</c:if>
		</div>
		<div id="content">
			
		</div>
	</body>
	<script>
	console.log("${cate}");
	var replyClick = 1;
	var userid = "${sessionScope.loginId}";
	var page = "";
	var str = "";
	var phone=[];
	var fallowbtn=1;
	$(document).ready(function(){
		if("${cate}"=="팔로우"){
			fallowlist();
		}else if("${cate}"=="메세지"){
			console.log("ddd");
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
	    	$("#timeline_reply").css("background-color","lightgray");
	    	$("#timeline_reply").css("color","black");
	    	$("#store_regist_list").css("background-color","lightgray");	    	
	    	$("#store_regist_list").css("color","black");
	    	$("#complain_list").css("background-color","lightgray");
	    	$("#complain_list").css("color","black");
			$("#content").load(page,function(res, stat) {});
			console.log($("#content"));
	    	ajaxCall(page);	
		}
	});
	
	if(userid==""){
		$("#fallow").css("display","none");
		$("#dm").css("display","none");
		$("#userdetai").css("display","none");
	}
	if(userid=="${id}"){
		$("#fallow").css("display","none");
		$("#dm").css("display","none");
		
	}else{
		$("#userdetai").css("display","none");
		$.ajax({
			url:"./followcheck",
			type:"post",
			data:{
				userid : userid,
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
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
				if("${cate}"=="" || "${cate}"=="팔로우"){
				timelinereview();
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		$.ajax({
			url:"./timelinprofile",
			type:"post",
			data:{
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				//console.log(d.profile);
				if(d.profile==0){
					$("#profileim").attr("src",'resources/img/member/noprofile.jpg');
				}else{
					$("#profileim").attr("src",'resources/upload/'+d.profile);
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	});
	function fallowlist(){
		if(fallowbtn==1){
			console.log(fallowbtn);
			$.ajax({
				url:"./timelinefallowlist",
				type:"post",
				data:{
					id : "${id}"
				},
				dataType:"json",
				success:function(d){
					$("#friend").css("background-color","darkblue");
					$("#friend").css("color","white");
					var content = "<div id='userfallow'>";
					content += "<div class='followbtn' id='follower' onclick='follower()'>팔로워</div><div class='followbtn' id='following' onclick='following()'>팔로잉</div>";
					content += "<div id='followlistdiv'>팔로워 목록이 없습니다</div></div>"
					$("#fallowlist").append(content);
					$("#fallowlist").css('display','block');
					var cont="";
					  for(var i =0;i<d.fallowlist.length;i++){
						 for(var j=0;j<d.fallowlist[i].length;j++){
							 cont += "<div id='followdiv"+d.fallowlist[i][j].id+"' class='followdiv'>";
							 if(d.fallowlist[i][j].profile==0){
								 cont += "<img class='friendprofile' id='img_"+d.fallowlist[i][j].id+"' src='resources/img/member/noprofile.jpg' onclick='usertimeline(id)'/>";
							 }else{
								 cont += "<img class='friendprofile' id='img_"+d.fallowlist[i][j].id+"' src='resources/upload/"+d.fallowlist[i][j].profile+"' onclick='usertimeline(id)'/>";
							 }
							cont += "<p>"+d.fallowlist[i][j].id+"</p>";
							if("${id}"==userid){
							cont += "<button class='fbtn' id='"+d.fallowlist[i][j].id+"' onclick='followck(id)'>팔로우 추가</button>"
							}
							cont += "</div>";	
						 }
						}
					  $("#followlistdiv").empty();
					  $("#followlistdiv").append(cont);
					timelinefallowlist(d);
				},
				error:function(e){
					console.log(e);
				}
			});
			fallowbtn=0;
		}else{
			fallowbtn=1;
			$("#fallowlist").empty();
			$("#friend").css("background-color","lightgray");
			$("#friend").css("color","black");
			$("#fallowlist").css('display','none');
		}
	}
	function usertimeline(e){
		console.log(e);
		var gotime=[];
		gotime = e.split("_");
		console.log(gotime[1]);
		location.href="./timeline?id="+gotime[1];
	}
	function timelinefallowlist(d){		
		  for(var i =0;i<d.fallowing.length;i++){
				 for(var j=0;j<d.fallowing[i].length;j++){
					$("#"+d.fallowing[i][j].id).html("팔로우 취소");
				 }
			}
	}
	function follower(){
		$.ajax({
			url:"./timelinefallowlist",
			type:"post",
			data:{
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				$("#following").css("background-color","lightgray");
				$("#following").css("color","black");
				$("#follower").css("background-color","darkblue");
				$("#follower").css("color","white");
				var cont="";
				  for(var i =0;i<d.fallowlist.length;i++){
					 for(var j=0;j<d.fallowlist[i].length;j++){
						 cont += "<div id='followdiv"+d.fallowlist[i][j].id+"' class='followdiv'>";
						 if(d.fallowlist[i][j].profile==0){
							 cont += "<img class='friendprofile' id='img_"+d.fallowlist[i][j].id+"' src='resources/img/member/noprofile.jpg' onclick='usertimeline(id)'/>";
						 }else{
							 cont += "<img class='friendprofile' id='img_"+d.fallowlist[i][j].id+"' src='resources/upload/"+d.fallowlist[i][j].profile+"' onclick='usertimeline(id)'/>";
						 }
						cont += "<p>"+d.fallowlist[i][j].id+"</p>";
						if("${id}"==userid){
							cont += "<button class='fbtn' id='"+d.fallowlist[i][j].id+"' onclick='followck(id)'>팔로우 추가</button>"
							}
						cont += "</div>";	
					 }
					}
				  $("#followlistdiv").empty();
				  $("#followlistdiv").append(cont);
				timelinefallowlist(d);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	function following(){
		$.ajax({
			url:"./timelinefallowlist",
			type:"post",
			data:{
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				console.log(d);
				$("#follower").css("background-color","lightgray");
				$("#follower").css("color","black");
				$("#following").css("background-color","darkblue");
				$("#following").css("color","white");
				var cont="";
				  for(var i =0;i<d.fallowing.length;i++){
					 for(var j=0;j<d.fallowing[i].length;j++){
						 cont += "<div id='followdiv"+d.fallowing[i][j].id+"' class='followdiv'>";
						 if(d.fallowlist[i][j].profile==0){
							 cont += "<img class='friendprofile' id='img_"+d.fallowing[i][j].id+"' src='resources/img/member/noprofile.jpg' onclick='usertimeline(id)'/>";
						 }else{
							 cont += "<img class='friendprofile' id='img_"+d.fallowing[i][j].id+"' src='resources/upload/"+d.fallowing[i][j].profile+"' onclick='usertimeline(id)'/>";
						 }
						cont += "<p>"+d.fallowing[i][j].id+"</p>";
						if("${id}"==userid){
							cont += "<button class='fbtn' id='"+d.fallowlist[i][j].id+"' onclick='followck(id)'>팔로우 취소</button>"
						}
						cont += "</div>";	
					 }
					}
				  $("#followlistdiv").empty();
				  $("#followlistdiv").append(cont);				
			},
			error:function(e){
				console.log(e);
			}
		});
	};
	function followck(id){
		console.log($("#"+id).html());
		if($("#"+id).html()=="팔로우 추가"){
			$.ajax({
				url:"./followinsert",
				type:"post",
				data:{
					userid : userid,
					id : id
				},
				dataType:"json",
				success:function(d){
					if(d.success>0){
						$("#"+id).html("팔로우 취소");	
					}else{
						alert("팔로우가 안되었습니다.");
					}									
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if($("#"+id).html()=="팔로우 취소"){
			$.ajax({
				url:"./followdelete",
				type:"post",
				data:{
					userid : userid,
					id : id
				},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success>0){
						$("#followdiv"+id).remove();
					}else{
						alert("팔로우 취소가 안되었습니다.");
					}									
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	}
	function timelinereview(){
		$.ajax({
			url:"./timelinereviewlist",
			type:"post",
			data:{
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				console.log(d);
				printList(d.list);
			},
			error:function(e){
				console.log(e);
			}
		});
	};
	function printList(list){
		var content = "";
		list.forEach(function(item){
			content += "<div id='abc'>"
				content += "<div id='review'>"
				//console.log(item.review_profile);
				if(item.review_profile=="resources/upload/0"){
				content += "<img id='review_profile' src='resources/img/member/noprofile.jpg'";
				}else{
				content += "<img id='review_profile' src='"+item.review_profile+"'";
				}
				content += "<input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
				content += "<div id='listTop'>"+item.id+"<div id='listTop_R' class='listTop_R"+item.review_idx+"'>";
				if(userid != "${id}"){
					content += "<img id='reviewLike"+item.review_idx+"' width='30px' height='30px' src='resources/img/reviewLike/reviewLike.png' onclick='likeClick("+item.review_idx+")' />";
				}
				content += "<br/></div></div>";
				content += "<table id='review_table'><tr id='tableTop'><td id='storeName_td'>"+item.review_storeName+"</td>";
				content += "<td id='starTd"+item.review_idx+"' class='starTd'></td></tr>";
				content += "<tr><td colspan='2'><textarea id='review_content' readonly>"+item.review_content+"</textarea></td></tr>";
				content += "<tr><td colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
				content += "<tr><td colspan='2' id='reviewList_photo"+item.review_idx+"'></td></tr><tr id='likeCntTr'><td colspan='2'>"+item.review_likeCnt+"명이 좋아합니다.</td></tr></table>";
				content += "<span id='replySpan' onclick='replySelect("+item.review_idx+")'>댓글"+item.review_replyCnt+"개</span></div>";
				content += "<div class='reviewReply' id='reviewReply"+item.review_idx+"'></div>";	
				content += "<div class='bigPhoto' id='bigPhoto"+item.review_idx+"'></div><br/></div>";		
				idx=item.review_idx;
				hashtag(idx);
		})
		$("#content").empty();
		$("#content").append(content);
	}
	function revreplyList(list){		 
		var content = "";
		list.forEach(function(i){
			i.forEach(function(item){
				content += "<div id='abc'>"
					content += "<div id='review'>"
					//console.log(item.review_profile);
					if(item.review_profile=="resources/upload/0"){
					content += "<img id='review_profile' src='resources/img/member/noprofile.jpg'";
					}else{
					content += "<img id='review_profile' src='"+item.review_profile+"'";
					}
					content += "<input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
					content += "<div id='listTop'>"+item.id+"<div id='listTop_R' class='listTop_R"+item.review_idx+"'>";
					if(userid != "${id}"){
						content += "<img id='reviewLike"+item.review_idx+"' width='30px' height='30px' src='resources/img/reviewLike/reviewLike.png' onclick='likeClick("+item.review_idx+")' />";
					}
					content += "<br/></div></div>";
					content += "<table id='review_table'><tr id='tableTop'><td id='storeName_td'>"+item.review_storeName+"</td>";
					content += "<td id='starTd"+item.review_idx+"' class='starTd'></td></tr>";
					content += "<tr><td colspan='2'><textarea id='review_content' readonly>"+item.review_content+"</textarea></td></tr>";
					content += "<tr><td colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
					content += "<tr><td colspan='2' id='reviewList_photo"+item.review_idx+"'></td></tr><tr id='likeCntTr'><td colspan='2'>"+item.review_likeCnt+"명이 좋아합니다.</td></tr></table>";
					content += "<span id='replySpan' onclick='replySelect("+item.review_idx+")'>댓글"+item.review_replyCnt+"개</span></div>";
					content += "<div class='reviewReply' id='reviewReply"+item.review_idx+"'></div>";	
					content += "<div class='bigPhoto' id='bigPhoto"+item.review_idx+"'></div><br/></div>";		
					idx=item.review_idx;
					hashtag(idx);
			})
		})
		$("#content").empty();
		$("#content").append(content);
	}
	function reply(idx){
		$("#reviewReply"+idx).toggle(500,function(){			
			 $.ajax({
				url:"./timelinereviewreply",
				type:"post",
				data:{
					idx : idx
				},
				dataType:"json",
				success:function(d){
					replylist(d.replylist,idx);
				},
				error:function(e){
					console.log(e);
				}
			});
		}),function(){
			$("#reviewReply"+idx).css("display","none");
		}
	}
	 function replylist(list,idx){
		var reply = "";
		reply += "<div id='reply'><table  id='reply_table'>";
		list.forEach(function(item){
			var date = new Date(item.revreply_date);
			reply +="<tr id='reply_table"+item.revreply_idx+"'>";
			if(item.revreply_profile==0){
				reply +="<td><img id='reply_img' src='resources/img/member/noprofile.jpg'/></td>";
			}else{
				reply +="<td><img id='reply_img' src='resources/upload/"+item.revreply_profile+"'/></td>";
			}
			reply +="<td id='reply_id'>"+item.id+"</td>";
			reply +="<td id='reply_content'><textarea id='reply_textarea"+item.revreply_idx+"' readonly>"+item.revreply_content+"</textarea></td>";
			reply +="<td id='reply_date'>"+date.toLocaleDateString("ko-KR")+"</td>";
			if(item.id==userid){
				reply+="<td class='reply_btn' ><button class='reply_ck' id='reply_update"+item.revreply_idx+"' onclick='reply_updateform("+item.revreply_idx+")'>수정</button></td>";
				reply+="<td class='reply_btn' ><button class='reply_ck' id='reply_delete"+item.revreply_idx+"' onclick='reply_delete("+item.revreply_idx+")'>삭제</button></td>";
				reply+="<td class='reply_btn' ><button class='reply_clk' id='reply_save"+item.revreply_idx+"' onclick='reply_update("+item.revreply_idx+")'>저장</button></td>";
				reply+="<td class='reply_btn' ><button class='reply_clk'  id='reply_cancel"+item.revreply_idx+"' name='"+item.revreply_content+"' onclick='reply_cancel("+item.revreply_idx+",name)'>취소</button></td>";
			}
			reply +="</tr>";			
		})
		reply+="</table></div>";
		$("#reviewReply"+idx).empty();
		$("#reviewReply"+idx).append(reply);
	}
	 function reply_updateform(idx){
		 $("#reply_update"+idx).css("display","none");
		 $("#reply_delete"+idx).css("display","none");
		 $("#reply_save"+idx).css("display","inline-block");
		 $("#reply_cancel"+idx).css("display","inline-block");		 
		 $("#reply_textarea"+idx).removeAttr("readonly");
		 $("#reply_textarea"+idx).focus();
	 }
	 function reply_update(idx){
		 var text=$("#reply_textarea"+idx).val();
		  $.ajax({
				url:"./reply_update",
				type:"post",
				dataType:"json",
				data:{
					revreply_idx:idx,
					content:text
				},
				success:function(d){
					if(d.update>0){
						$("#reply_textarea"+idx).val(text);
						$("#reply_update"+idx).css("display","inline-block");
						$("#reply_delete"+idx).css("display","inline-block");
						$("#reply_save"+idx).css("display","none");
						$("#reply_cancel"+idx).css("display","none");
						$("#reply_textarea"+idx).attr("readonly",true);
					}else{
						alert("수정실패");
						$("#reply_update"+idx).css("display","none");
						 $("#reply_delete"+idx).css("display","none");
						 $("#reply_save"+idx).css("display","inline-block");
						 $("#reply_cancel"+idx).css("display","inline-block");		 
						 $("#reply_textarea"+idx).removeAttr("readonly");
						 $("#reply_textarea"+idx).focus();
					}
				},
				error:function(e){console.log(e);}
			});
	 }
	 function reply_cancel(idx,name){
		$("#reply_update"+idx).css("display","inline-block");
		$("#reply_delete"+idx).css("display","inline-block");
		$("#reply_save"+idx).css("display","none");
		$("#reply_cancel"+idx).css("display","none");
		$("#reply_textarea").attr("readonly",true);
		$("#reply_textarea"+idx).val(name);
	 }
	 function reply_delete(idx){
		 $.ajax({
				url:"./reply_delete",
				type:"post",
				dataType:"json",
				data:{
					revreply_idx:idx
				},
				success:function(d){
					if(d.del>0){
						$("#reply_table"+idx).remove();
					}else{
						alert("삭제실패");
					}
				},
				error:function(e){console.log(e);}
			});
	 }
	function hashtag(elem){
		$.ajax({
			url:"./reviewHashPhoto",
			type:"post",
			dataType:"json",
			data:{"review_idx":elem},
			success:function(d){
				printHash(d.reviewHash,elem);		
				printPhoto(d.reviewPhoto,elem);
				console.log(d.reviewPhoto);
			},
			error:function(e){console.log(e);}
		});
	}
	
	var tag="";
	function printHash(hash,elem){
		tag="";
		hash.forEach(function(item){
			tag += "<div id='hashtag'>#"+item.hash_tag+"</div>";
		});
		$("#reviewList_hash"+elem).append(tag);
	}
	
	var img="";
	function printPhoto(photo,elem){
		var phoSrc ="";
  		var photoArr="";
		img="";
		photo.forEach(function(item){
			phoSrc=item.revPhoto_Photo;
			photoArr=phoSrc.split(".").join('\\.')
			img += "<div onclick='PhotoClick(this,"+elem+")' id='photo'><img id='PhotoImg"+item.revPhoto_Photo+"'  width='60px' height='50px' src='"+item.revPhoto_Photo+"'/></div>";
		})
		$("#reviewList_photo"+elem).append(img);
	}
	function likeClick(idx){
		flag=idx;
		console.log(idx+"/"+userid);
		$.ajax({
			url:"./reviewLike",
			type:"post",
			dataType:"text",
			data:{"review_idx":idx, "loginId":userid},
			success:function(d){
				//console.log(d);
				 if(d == "insert"){
					 $("#reviewLike"+idx).attr("src","resources/img/reviewLike/reviewLike2.png");
				}else if(d == "delete"){
					$("#reviewLike"+idx).attr("src","resources/img/reviewLike/reviewLike.png");
				} 
			},
			error:function(e){console.log(e);}
		});
	}
	$(".userdetail").click(function(e) {
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
	    	$("#timeline_reply").css("background-color","lightgray");
	    	$("#timeline_reply").css("color","black");
	    	$("#store_regist_list").css("background-color","lightgray");	    	
	    	$("#store_regist_list").css("color","black");
	    	$("#complain_list").css("background-color","lightgray");
	    	$("#complain_list").css("color","black");
	    	$("#content").load(page,function(res, stat) {});
	    	console.log($("#content"));
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
	    	$("#timeline_reply").css("background-color","lightgray");
	    	$("#timeline_reply").css("color","black");
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
	    	$("#timeline_reply").css("background-color","lightgray");
	    	$("#timeline_reply").css("color","black");
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
	    	$("#timeline_reply").css("background-color","lightgray");
	    	$("#timeline_reply").css("color","black");
	    	$("#content").load(page,function(res, stat) {});
			ajaxCall(page);
		}else if(e.target.id == "myreview") {
			page = "reviewlist";
			$("#myreview").css("background-color","darkblue");
			$("#myreview").css("color","white");
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
	    	$("#timeline_reply").css("background-color","lightgray");
	    	$("#timeline_reply").css("color","black");
	    	ajaxCall(page);
		}else if(e.target.id == "likereview") {
			page = "likereview";
				$("#likereview").css("background-color","darkblue");
				$("#likereview").css("color","white");
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
		    	$("#myreview").css("background-color","lightgray");
		    	$("#myreview").css("color","black");
		    	$("#likestore").css("background-color","lightgray");
		    	$("#likestore").css("color","black");
		    	$("#timeline_reply").css("background-color","lightgray");
		    	$("#timeline_reply").css("color","black");
		    	ajaxCall(page);
			}else if(e.target.id == "timeline_reply"){
				page = "timeline_reply";
					$("#timeline_reply").css("background-color","darkblue");
					$("#timeline_reply").css("color","white");
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
			    	$("#myreview").css("background-color","lightgray");
			    	$("#myreview").css("color","black");
			    	$("#likestore").css("background-color","lightgray");
			    	$("#likestore").css("color","black");
			    	$("#likereview").css("background-color","lightgray");
			    	$("#likereview").css("color","black");
			    	ajaxCall(page);
			}else if(e.target.id == "complain_list"){
				page = "resources/timelinehtml/complainList.html";
				$("#dm_write").css("background-color","lightgray");
				$("#dm_write").css("color","black");
				$("#message").css("background-color","lightgray");
				$("#message").css("color","black");
				$("#store_regist_list").css("background-color","lightgray");
				$("#store_regist_list").css("color","black");
				$("#complain_list").css("background-color","darkblue");
				$("#complain_list").css("color","white");
				$("#content").load(page,function(res, stat) {});
				ajaxCall(page);
			}else if(e.target.id == "store_regist_list"){
				page = "resources/timelinehtml/store_regist_list.html";
					$("#dm_write").css("background-color","lightgray");
					$("#dm_write").css("color","black");
					$("#message").css("background-color","lightgray");
					$("#message").css("color","black");
					$("#store_regist_list").css("background-color","darkblue");
					$("#store_regist_list").css("color","white");
					$("#complain_list").css("background-color","lightgray");
					$("#complain_list").css("color","black");
					$("#content").load(page,function(res, stat) {});
					ajaxCall(page);
				}else if(e.target.id == "likestore"){
					page = "likestore";
						$("#likestore").css("background-color","darkblue");
						$("#likestore").css("color","white");
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
				    	$("#myreview").css("background-color","lightgray");
				    	$("#myreview").css("color","black");
				    	$("#timeline_reply").css("background-color","lightgray");
				    	$("#timeline_reply").css("color","black");
				    	$("#likereview").css("background-color","lightgray");
				    	$("#likereview").css("color","black");
				    	ajaxCall(page);
				}else if(e.target.id == "total"){
					page = "resources/timelinehtml/statList.html";
					$("#total").css("background-color","darkblue");
					$("#total").css("color","white");
					$("#coupon").css("background-color","lightgray");
					$("#coupon").css("color","black");
			    	$("#message").css("background-color","lightgray");
			    	$("#message").css("color","black");
			    	$("#point").css("background-color","lightgray");
			    	$("#point").css("color","black");
			    	$("#update").css("background-color","lightgray");
			    	$("#update").css("color","black");
			    	$("#myreview").css("background-color","lightgray");
			    	$("#myreview").css("color","black");
			    	$("#likereview").css("background-color","lightgray");
			    	$("#likereview").css("color","black");
			    	$("#likestore").css("background-color","lightgray");
			    	$("#likestore").css("color","black");
			    	$("#timeline_reply").css("background-color","lightgray");
			    	$("#timeline_reply").css("color","black");
			    	$("#content").load(page,function(res, stat) {});
			    	ajaxCall(page)
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
					console.log(d);
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
					printList(d.list);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(page=="likereview"){
			 $.ajax({
				url:"./timelinelikereview",
				type:"post",
				data:{
					id : "${id}"
				},
				dataType:"json",
				success:function(d){
					revreplyList(d.list);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(page=="timeline_reply"){
				$.ajax({
				url:"./timeline_reply",
				type:"post",
				data:{
					id : userid
				},
				dataType:"json",
				success:function(d){
					revreplyList(d.list);
				},
				error:function(e){
					console.log(e);
					$("#content").empty();
					alert("댓글이 없습니다");
				}
			});
		}else if(page == "resources/timelinehtml/complainList.html"){
			$.ajax({
				url:"./complainList",
				type:"post",
				dataType:"json",
				success:function(data){
					complain_list(data.list);
				},
				error:function(error){
					console.log(error);
				}
			});
		}else if(page == "resources/timelinehtml/store_regist_list.html"){
			$.ajax({
				url:"./storeRegistList",
				type:"post",
				dataType:"json",
				success:function(data){
					store_regist_list(data.list);
				},
				error:function(error){
					console.log(error);
				}
			});
		}else if(page == "likestore"){
			$.ajax({
				url:"./timelinelikestore",
				type:"post",
				data:{
					id : "${id}"
				},
				dataType:"json",
				success:function(d){
					likestorelist(d.list,d.list_hash);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(page == "resources/timelinehtml/userupdate.html"){
			$.ajax({
				url:"./timelineuserupdate",
				type:"post",
				data:{
					id : userid
				},
				dataType:"json",
				success:function(d){
					if(d.update.profile!=0){
						$("#updateprofile").empty();
						$("#updateprofile").append("<img id='updateprofilephoto' src='resources/upload/"+d.update.profile+"' height=150px width=150px/>");
						$("#updateprofile").append("<input id='profilename' type='hidden' value='"+d.update.profile+"'/>")
					}
					console.log(d);
					$("#userId").val(userid);
					$("#userName").val(d.update.name);
					$("#userEmail").val(d.update.email);
					phone=d.update.phone.split("-");
					$("#hp1").val(phone[0]);
					$("#hp2").val(phone[1]);
					$("#hp3").val(phone[2]);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(page == "resources/timelinehtml/statList.html"){
			$.ajax({
				url:"./statList",
				type:"get",
				data:{
					id : userid
				},
				dataType:"json",
				success:function(data){
					print_statList(data.storeList);
				},
				error:function(error){
					console.log(error);
				}
			});
		}
	}
	function likestorelist(list,hash){
		var content ="";
		list.forEach(function(i, idx){
			i.forEach(function(item,idx){
				content += "<table class='storeTable'>";
				content += "<tr><td colspan='2'><img class='storeImg' src='resources/upload/store/"+item.store_photo+"' /></td></tr>";
				content += "<tr>";
				content += "<th><a href='#'>"+item.store_name+"</a></th><td rowspan='2'>하트</td></tr>";
				content += "<tr>";
				content += "<th>"+item.store_addr+"</th></tr>";
				content += "<tr><td id='"+item.store_idx+"' colspan='2'>";
				hash.forEach(function(ihash,idx){
					ihash.forEach(function(hash,idx){
						if(item.store_idx==hash.store_idx){
							content += "<div id='hashtag'>#"+hash.hash_tag+"</div>";
						}
					})
				})
				content += "</td></tr></table>";
			})
		})
		$("#content").append(content);
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
	
		//신고리스트
		var flag = false;
		function complain_list(list) {
			var content = "";		
			list.forEach(function(item, idx){
				content +="<tr>";
				content +="<td class='comp_detail1'>"+item.id+"</td>";
				content +="<td class='comp_detail1'>"+item.complain_type+"</td>";
				content +="<td class='comp_detail1'>"+item.complain_id+"</td>";
				content +="<td class='comp_detail1'>"+item.complain_cate+"</td>";
				var date = new Date(item.complain_date);			
				content +="<td class='comp_detail1'>"+date.toLocaleDateString("ko-KR")+"</td>";
				content +="<td><button id='complain_move' onclick='complain_move("+item.review_idx+", "+item.revReply_idx+", \""+item.id+"\", \""+item.complain_id+"\")'>보 기</button></td>";
				content += "</tr>";
				content += "<tr>";
				content +="<td style='display: none;'>신고 내용 : </td>";
				content +="<td style='display: none;' colspan='5'>"+item.complain_content+"</td>";
				content += "</tr>";
			});		
			$("#complail_tbody").empty();
			$("#complail_tbody").append(content);//내용 붙이기
			
			
			$(".comp_detail1").click(function () {
				console.log("클릭");
				if(flag == false){
					$(this).parent().next().children('td').css("display", "");
					flag = true;
				}else{
					$(this).parent().next().children('td').css("display", "none");
					flag = false;
				}
			});
		}
		
		function complain_move(rev_idx, revReply_idx, id, complain_id) {
			console.log("클릭");   
			console.log(rev_idx, revReply_idx, id, complain_id);  
			var myWin= window.open("./comp_review_moveWin?rev_idx="+rev_idx+"&revReply_idx="+revReply_idx+"&id="+id+"&complain_id="+complain_id, "신고 리뷰 페이지","width=500,height=500");		
		}
		
		
		//가게 등록 리스트
		function store_regist_list(list) {
			var content = "";		
			list.forEach(function(item, idx){
				if(item.store_regist == 0){
					var id = new String(item.id);
					content +="<tr>";
					content +="<td>"+item.store_name+"</td>";
					content +="<td>"+item.store_ceo+"</td>";
					content +="<td>"+item.store_addr+"</td>";
					var date = new Date(item.store_revDate);			
					content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
					content +="<td><button id='store_regist_move'>보 기</button></td>";  
		            content +="<td><button id='store_regist_yes' onclick='registYes("+item.store_idx+", \""+item.id+"\")'>승인</button> / "+
		            	"<button id='store_regist_no' onclick='registNo("+item.store_idx+", \""+item.id+"\")'>취소</button></td>";
					content += "</tr>";		
				}	
			});		
			$("#store_tbody").empty();
			$("#store_tbody").append(content);//내용 붙이기

		}
		
		//가게 등록 승인
		function registYes(store_idx, id) {
			console.log(store_idx, id);
			$.ajax({
				url:"./registYes",
				type:"post",
				data:{
					store_idx : store_idx,
					id : id
				},
				dataType:"json",
				success:function(data){
					console.log(data);			
					alert(data.msg);
					location.href="./storeRegistList";
				},
				error:function(error){
					console.log(error);
				}
			});
		}
		
		function registNo(store_idx, id) {
			console.log(store_idx, id);
			var myWin= window.open("./registNoWin?store_idx="+store_idx+
					"&id="+id,"가게 등록 거절","width=500,height=500");	
		}
		
		function selPicturedelete(){
			var photoname =$("#profilename").val();
			console.log(photoname);
			 /* $.ajax({
				url:"./profilephotodelete",
				type:"post",
				data:{
					profilname=photoname
				},
				dataType:"json",
				success:function(d){
					$("#updateprofilephoto").remove();						
				},
				error:function(e){
					console.log(e);
				}
			}); */
		}
		function print_statList(list) {
			var content = "";
			list.forEach(function(item){
				content += "<tr><td>"+item.store_name+"</td>";
				content += "<td><input type='button' value='보기' onclick='moveStat("+item.store_idx+")'></td></tr>";
				
			})
			$("#storeList").append(content);
		}
		function moveStat(idx) {
			location.href="./showStat?store_idx="+idx;			
		}
	</script>
</html>