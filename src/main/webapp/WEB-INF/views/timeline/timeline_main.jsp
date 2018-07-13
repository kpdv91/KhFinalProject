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
			
			#content{margin-left : 100px;position: relative; width: 800px;height: auto;left : 350px;}
			hr{margin-top:200px;}
			#review{border: 2px solid #142e5b;width: 650px;height: 250px}
			#listTop{border-bottom: 2px solid #142e5b;height: 50px;line-height: 50px;}
	        #listTop_C{position :absolute;margin-left:5px;}
	        #listTop_R{float: right;height: 50px;width: 150px;line-height: 25px;}
	        #reply_div{position :absolute;margin-top:170px;}
	        .review_tabletr{border-collapse: collapse;margin:0 auto;}
	        #review_table{position :absolute;height: 170px;border-bottom: 2px solid #142e5b;border-collapse: collapse;width: 650px;margin-top:1px;}
	        #star{text-align: right;}
	        #hashtag{border: 2px solid black;width: 60px;height: 25px;font-size: 12px;text-align: center;line-height: 25px;float: left;margin-left: 5px;}
	        textarea{border: 0px;width: 99%;height: 100%;resize: none;}
	        #photo{width: 60px;height: 50px;float: left;margin-left: 5px;}
	        #reviewReply{border-bottom: 1px solid black;border-left: 1px solid black;border-right: 1px solid black;width: 650px;display: none;}
	        #starDiv{width: 100%;height: 30px;}
	        #reviewList_hash,#reviewList_photo{width: 600px;height: auto;overflow: hidden;}
	        #hashtag{border: 2px solid #33aaaaff;font-size: 14px;width: auto;text-align: center;float: left;padding: 0px 5px;}
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
	var replyClick = 1;
	var userid = "${sessionScope.loginId}";
	var page = "";
	var str = "";
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
		$.ajax({
			url:"./timelinprofile",
			type:"post",
			data:{
				id : "${id}"
			},
			dataType:"json",
			success:function(d){
				console.log(d.profile);
				$("#profileim").attr("src",'resources/upload/'+d.profile);
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
		list.forEach(function(item){
				console.log(item.review_replyCnt);
				content += "<div id='review'><input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
				content += "<div id='listTop'><div id='listTop_C'>"+item.id+"</div><div id='listTop_R'><br/>"+item.review_likeCnt+"명이 좋아합니다.</div></div>";
				content += "<div id='table_div'><table id='review_table'><tr class='review_tabletr'><td id='storeName_td' class='review_tabletr'>"+item.review_storeName+"</td>";
				content += "<td id='star'></td></tr>";			
				content += "<tr class='review_tabletr'><td class='review_tabletr' colspan='2'><textarea id='review_text' readonly>"+item.review_content+"</textarea></td></tr>";
				content += "<tr class='review_tabletr'><td class='review_tabletr' colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
				content += "<tr class='review_tabletr'><td class='review_tabletr' colspan='2' id='reviewList_photo"+item.review_idx+"'><td></tr></table></div>";
				content += "<div id='reply_div'><a id='"+item.review_idx+"' href='#' onclick='reply(id)'>댓글"+item.review_replyCnt+"개</a></div></div>";
				content += "<div id='reviewReply'>댓글이 없습니다<br/></div><br/></div>";			
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
				//console.log(item.review_replyCnt);
				content += "<div id='review'><input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
				content += "<div id='listTop'><div id='listTop_C'>"+item.id+"</div><div id='listTop_R'><br/>"+item.review_likeCnt+"명이 좋아합니다.</div></div>";
				content += "<div id='table_div'><table id='review_table'><tr class='review_tabletr'><td id='storeName_td' class='review_tabletr'>"+item.review_storeName+"</td>";
				content += "<td id='star'></td></tr>";			
				content += "<tr class='review_tabletr'><td class='review_tabletr' colspan='2'><textarea id='review_text' readonly>"+item.review_content+"</textarea></td></tr>";
				content += "<tr class='review_tabletr'><td class='review_tabletr' colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
				content += "<tr class='review_tabletr'><td class='review_tabletr' colspan='2' id='reviewList_photo"+item.review_idx+"'><td></tr></table></div>";
				content += "<div id='reply_div'><a id='a"+item.review_idx+"' href='#' onclick='reply("+item.review_idx+")'>댓글"+item.review_replyCnt+"개</a></div></div>";
				content += "<div class='ddd' id='reviewReply"+item.review_idx+"'><br/></div><br/></div>";			
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
					console.log(d);
					
					replylist(d.replylist,idx);
				},
				error:function(e){
					console.log(e);
				}
			});
		}),function(){
			$("#reviewReply"+idx).css("display","none");
		}
		/* replyClick *= -1;
		if(replyClick == -1){
			$("#reviewReply").css("display","block");
			$.ajax({
				url:"./timelinereviewreply",
				type:"post",
				data:{
					idx : idx
				},
				dataType:"json",
				success:function(d){
					console.log(d);
					replylist(d.replylist,idx);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else{
			$("#reviewReply").css("display","none");
		} */
	}
	 function replylist(list,idx){
		var reply = "";
		reply += "<div id='reply'><table  id='reply_table'>";
		list.forEach(function(item){
			var date = new Date(item.revreply_date);
			reply +="<tr id='reply_table"+item.revreply_idx+"'>";
			reply +="<td><img id='reply_img' src='resources/upload/"+item.revreply_profile+"'/></td>";
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
					console.log(d)
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
		 console.log("delete"+idx);
		 $.ajax({
				url:"./reply_delete",
				type:"post",
				dataType:"json",
				data:{
					revreply_idx:idx
				},
				success:function(d){
					console.log(d)
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
			},
			error:function(e){console.log(e);}
		});	 
	}
	
	function printHash(hash,elem){
		var tag="";
		hash.forEach(function(item){
			tag += "<div id='hashtag'>#"+item.hash_tag+"</div>";
		});
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
			page = "reviewlist"
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
			page = "likereview"
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
				page = "timeline_reply"
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
				page = "resources/timelinehtml/complainList.html"
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
				page = "resources/timelinehtml/store_regist_list.html"
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
		}else if(page=="likereview"){
			 $.ajax({
				url:"./timelinelikereview",
				type:"post",
				data:{
					id : "${id}"
				},
				dataType:"json",
				success:function(d){
					console.log(d.list);
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
					console.log(d.list);
					revreplyList(d.list);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(page == "resources/timelinehtml/complainList.html"){
			$.ajax({
				url:"./complainList",
				type:"post",
				dataType:"json",
				success:function(data){
					console.log(data);
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
					console.log(data);
					store_regist_list(data.list);
				},
				error:function(error){
					console.log(error);
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
	
		//신고리스트
		function complain_list(list) {
			var content = "";		
			list.forEach(function(item, idx){
				content +="<tr>";
				content +="<td>"+item.id+"</td>";
				content +="<td>"+item.complain_type+"</td>";
				content +="<td>"+item.complain_id+"</td>";
				content +="<td>"+item.complain_cate+"</td>";
				var date = new Date(item.complain_date);			
				content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
				content +="<td><button id='complain_move' onclick='complain_move("+item.review_idx+", "+item.revReply_idx+")'>보 기</button></td>";
				content += "</tr>";			
			});		
			$("#complail_tbody").empty();
			$("#complail_tbody").append(content);//내용 붙이기
		}
		
		function complain_move(rev_idx, revReply_idx) {
			console.log("클릭");
			console.log(rev_idx, revReply_idx);
			var myWin= window.open("./comp_review_moveWin?rev_idx="+rev_idx+
					"&revReply_idx="+revReply_idx,"신고리뷰페이지","width=500,height=500");
			/* $.ajax({
				url:"./reviewList",
				type:"post",
				data:{
					rev_idx : rev_idx,
					revReply_idx : revReply_idx
				},
				dataType:"json",
				success:function(data){
					console.log(data);		
				},
				error:function(error){
					console.log(error);
				}
			}); */
			
			
		}
		
		
		//가게 등록 리스트
		function store_regist_list(list) {
			var content = "";		
			list.forEach(function(item, idx){
				if(item.store_regist == 0){
					content +="<tr>";
					content +="<td>"+item.store_name+"</td>";
					content +="<td>"+item.store_ceo+"</td>";
					content +="<td>"+item.store_addr+"</td>";
					var date = new Date(item.store_revDate);			
					content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
					content +="<td><button id='store_regist_move'>보 기</button></td>";
					content +="<td><button id='store_regist_yes'>승인</button> / <button id='store_regist_no'>취소</button></td>";
					content += "</tr>";		
				}	
			});		
			$("#store_tbody").empty();
			$("#store_tbody").append(content);//내용 붙이기
		}
	</script>
</html>