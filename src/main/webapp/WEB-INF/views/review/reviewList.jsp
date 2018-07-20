<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/js/jquery-1.11.3.min.js"></script>
		<script src="resources/js/star.js"></script>
		<!-- <link rel="stylesheet" type="text/css" href="star.css"> -->
		<title>Insert title here</title>
		<style>
		#reviewListDiv{margin-left: 550px;}
		
		#review{
            border: 2px solid #142e5b;
            width: 500px;
            height: auto;            
        }
        #listTop{
            border-bottom: 2px solid #142e5b;
            height: 50px;
            line-height: 50px;
        }
        #listTop_R{
            float: right;
            height: 50px;
            width: 150px;
            line-height: 25px;
            text-align: right;
            font-size: 13
            px;
        }
       #review_table tr,#review_table td{
				/* border:1px solid black; */
				border-collapse: collapse;
				margin:0 auto;
        }
        #review_table{
            height: 170px;
    		border-bottom: 2px solid #142e5b;
            border-collapse: collapse;
			width: 500px;
			margin:0 auto;
        }
        .starTd{
            text-align: right;
            overflow: hidden;
        }
        #hashtag{
            border: 2px solid black;
            width: 60px;
            height: 25px;
            font-size: 12px;
            text-align: center;
            line-height: 25px;
            float: left;
            margin-left: 5px;
        }
        #review_content{
            border: 0px;
            width: 99%;
            height: 100%;
            resize: none;
        }
        #photo{
           
            width: 60px;
            height: 50px;
            float: left;
            margin-left: 5px;
        }
        .reviewReply{
            border-bottom: 1px solid black;
            border-left: 1px solid black;
            border-right: 1px solid black;
            width: 500px;
            display: none;
        }
        #starDiv{
        	width: 100%;
        	height: 30px;
        }
        #reviewList_hash,#reviewList_photo{
        	width: 600px;
       		height: auto;
       		overflow: hidden;
        }
        #hashtag{
        	border: 2px solid #33aaaaff;
            font-size: 14px;
            width: auto;            
            text-align: center; 
            float: left;
            padding: 0px 5px;
        }
        #storeName_td{
        	font-weight: bold;
        	width: 300px;
        }
        #tableTop{height: 40px;}
        .span{
        	text-decoration: none;
        	color: black;
        	font-size: 13px;
        	cursor: pointer;
        }
        .span:hover{	color: red;}
        .bigPhoto{
        	width: 505px;
        	height: 250px;
        	background-color: white;
        	display: none;
        }
        
        
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
    display: inline-block;
    vertical-align:middle;
    background:url('resources/img/star/grade_img.png')no-repeat;
}
.star-input{
    display:inline-block; 
    white-space:nowrap;
    width:225px;height:40px;
   line-height:30px; padding-top: 5px;
}
.star-input>.input{
    display:inline-block;
    width:150px;height:28px;
    background-size:150px;
    white-space:nowrap;
    overflow:hidden;
    position: relative;
}
.star-input>.input>input{
    position:absolute;
    width:1px;height:1px;
    opacity:0;
}
star-input>.input.focus{
    outline:1px dotted #ddd;
}
.star-input>.input>label{
    width:30px;height:0;
    padding:28px 0 0 0;
    overflow: hidden;
    float:left;
    cursor: pointer;
    position: absolute;
    top: 0;left: 0;
}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
    background-size: 150px;
    background-position: 0 bottom;
}
.star-input>.input>label:hover~label{
    background-image: none;
}
.star-input>.input>label[for="p0.5"]{width:15px;z-index:10;}
.star-input>.input>label[for="p1.0"]{width:30px;z-index:9;}
.star-input>.input>label[for="p1.5"]{width:45px;z-index:8;}
.star-input>.input>label[for="p2.0"]{width:60px;z-index:7;}
.star-input>.input>label[for="p2.5"]{width:75px;z-index:6;}
.star-input>.input>label[for="p3.0"]{width:90px;z-index:5;}
.star-input>.input>label[for="p3.5"]{width:105px;z-index:4;}
.star-input>.input>label[for="p4.0"]{width:120px;z-index:3;}
.star-input>.input>label[for="p4.5"]{width:135px;z-index:2;}
.star-input>.input>label[for="p5.0"]{width:150px;z-index:1;}
.star-input>output{
    display:inline-block;
    width:60px; font-size:18px;
    text-align:right; 
    vertical-align:middle;
}

input[type=button]{
            vertical-align: middle;
            padding: 0px 5px;
            background-color: #33aaaaff;
            color: white;
            border-radius: 7px;
            /* width: 70px; */
            height: 28px;
            outline: 0px;
            border: 0px;
       }
       #review_Write{	margin-left: 550px;}
       
       #review_range{
				width: 80px;
				height: 28px;
				border-radius: 5px;
				font-size: 15px;
				text-align-last: center;
				margin-left: 350px;
				border: 2px solid #142e5b;
			}
			#reviewListPro{
				float: left;
				border-radius: 8px;
				overflow: hidden;
			}
			#likeCntTr{height: 30px;}
			#replySpan{
				display: table-cell;
				height: 30px;
				vertical-align: middle;
				cursor: pointer;
			}
			#reply_img{
				width: 30px;
				height: 30px;
			}
			#reply_table{font-size: 13px;}
			.reply_textarea{				
				 resize: none;
				 width: 330px;
				 border-radius: 5px;
			}
			#replyWrite{width: 50px;}
			.reply_ck{
				width: 50px;
				font-size: 12px;
				margin-right: 5px;
				cursor: pointer;
			}
			.reply_ck:hover{color: red;}
			#reply_id{height: 50px;}
			.replyDiv{
				border-bottom: 1px solid #142e5b;
				border-left: 1px solid #142e5b;
				border-right: 1px solid #142e5b;
				width: 500px;
			}
			.reviewLikeImg{cursor: pointer;	}
			.PhotoImg{cursor: pointer;}
			#complain{cursor: pointer;}
		</style>
		
	</head>
	<body>
	<input id="review_Write" type="button" value="리뷰 작성" onclick="reviewWrite()"/>
	<select id="review_range" onchange="range(this.value)">
		  <option value="최신순" selected="selected">최신순</option>
		  <option value="좋아요순">좋아요순</option>
	</select>
	
	<br/><br/>
	
	
	<div id="reviewListDiv">
	</div><br/>
	
	<input id="storeIdx" type="hidden" value="<c:out value="${param.idx} "/>">
	<input id="reviewSearch" type="hidden" value="<c:out value="${param.reviewSearch}"/>">
	
	</body>
	<script>
	var loginId = "${sessionScope.loginId}";
	listCall("최신순");
	function range(value){
		switch (value) {
		case "최신순":
			listCall(value);
			break;
		case "좋아요순":
			listCall(value);
			break;

		default:
			break;
		}
	}
	
	function reviewWrite(){
		location.href="./reviewWritePage";
	}
	
	//리뷰 리스트 ajax
	
	function listCall(elem){
		$.ajax({
			url:"./reviewList",
			type:"post",
			dataType:"json",
			data:{"store_idx":$("#storeIdx").val(),
				"review_search":$("#reviewSearch").val(),
				"range":elem
				},
			success:function(d){
				$("#reviewListDiv").empty();
				//console.log(d.reviewList);
				printList(d.reviewList);
				atagCreate(d.reviewList);
				//hashtag(d.reviewList);
			},
			error:function(e){console.log(e);}
		});
	}
	//리뷰 리스트
	 var idx="";
	var content="";
	function printList(list){		 
		content = "";
		list.forEach(function(item){
			content += "<div id='abc'>"
			content += "<div id='review'><img id='reviewListPro' width='50px' height='50px' src='"+item.review_profile+"'/><input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
			content += "<div id='listTop'>"+item.id+"<div id='listTop_R' class='listTop_R"+item.review_idx+"'><img class='reviewLikeImg' id='reviewLike"+item.review_idx+"' width='30px' height='30px' src='resources/img/reviewLike/reviewLike.png' onclick='likeClick(this,"+item.review_idx+")' /><br/>";
			if(item.id != loginId || loginId == ""){
			content += "<span id='complain' class='span' href='#' onclick='complain(this)'>신고</span>";
			}
			content += "</div></div>";
			content += "<table id='review_table'><tr id='tableTop'><td id='storeName_td'>"+item.review_storeName+"</td>";
			content += "<td id='starTd"+item.review_idx+"' class='starTd'></td></tr>";
			content += "<tr><td colspan='2'><textarea id='review_content' readonly>"+item.review_content+"</textarea></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_photo"+item.review_idx+"'></td></tr><tr id='likeCntTr'><td colspan='2'>"+item.review_likeCnt+"명이 좋아합니다.</td></tr></table>";
			content += "<span id='replySpan' onclick='replySelect("+item.review_idx+")'>댓글"+item.review_replyCnt+"개</span></div>";
			content += "<div class='reviewReply' id='reviewReply"+item.review_idx+"'></div>";	
			content += "<div class='bigPhoto' id='bigPhoto"+item.review_idx+"'></div><br/></div>";
			
			idx=item.review_idx;
			hashtag(idx);//리뷰 해시태그
			starSelect(idx);//리뷰 별점
			
			if(loginId != ""){
			likeSelect(idx);//리뷰 좋아요
			}
			
			replySelect(idx);//댓글
		});
		
		$("#reviewListDiv").append(content);		
		
	} 

	//댓글 리스트
	function replySelect(idx){
		$("#reviewReply"+idx).toggle(100,function(){
			$.ajax({
				url:"./replySelect",
				type:"post",
				dataType:"json",
				data:{"review_idx":idx},
				success:function(d){
					//console.log(d.replySelect);
					//댓글 리스트 출력
					replylist(d.replySelect,idx);
					
				},
				error:function(e){console.log(e);}
			});
		});
	}
	
	var profileSession="${sessionScope.loginProfile }";
	
	//댓글 리스트 출력
	 function replylist(list,idx){
		 console.log("replylist");
			var reply = "";
			reply += "<div class='replyDiv' id='reply'><table  id='reply_table'>";
			if(loginId != ""){			
			reply += "<tr><td><img width='30px' height='30px' src='resources/upload/"+profileSession+"'/></td>";
			reply += "<td id='reply_loginId'>"+loginId+"</td><td><textarea id='reply_textarea"+idx+"' class='reply_textarea'></textarea></td>";
			reply += "<td><input id='replyWrite' type='button' value='작성' onclick='replyWrite(this,"+idx+")'/></td></tr>"
			}
			list.forEach(function(item){
				var date = new Date(item.revreply_date);
				reply +="<tr class='reply_table' id='reply_table"+item.revreply_idx+"'>";
				reply +="<td rowspan='2'><input type='hidden' value='"+item.revreply_idx+"'/><img id='reply_img' src='resources/upload/"+item.revreply_profile+"'/></td>";
				reply +="<td rowspan='2' id='reply_id'>"+item.id+"</td>";
				reply +="<td rowspan='2' id='reply_content'><textarea class='reply_textarea' id='reply_textarea"+item.revreply_idx+"' readonly>"+item.revreply_content+"</textarea></td>";
				reply +="<td id='reply_date'>"+date.toLocaleDateString("ko-KR")+"</td></tr><tr>";
				reply+="<td  class='reply_btn' >";
				if(item.id==loginId){										
					reply+="<span class='reply_ck' id='reply_delete"+item.revreply_idx+"' onclick='reply_delete(this,"+item.revreply_idx+","+idx+")' >삭제</span>";
					reply+="<span class='reply_ck' id='reply_update"+item.revreply_idx+"' onclick='reply_updateform(this,"+item.revreply_idx+","+idx+")' >수정</span>";
					//reply+="<span class='reply_ck' id='reply_save' onclick='reply_update(this,"+item.revreply_idx+")' >저장</span>";					
					
					//reply+="<td class='reply_btn' ><input type='button' class='reply_clk'  id='reply_cancel"+item.revreply_idx+"' name='"+item.revreply_content+"' onclick='reply_cancel("+item.revreply_idx+",name)'>취소</td>";
				}else{
					reply += "<span id='complain' class='span' href='#' onclick='replyComplain(this)'>신고</span>";
				}
				
				reply+="</td>";
				reply +="</tr>";			
			})
			reply+="</table></div>";
			$("#reviewReply"+idx).empty();
			$("#reviewReply"+idx).append(reply);
		}
	 
		//댓글 수정폼
		function reply_updateform(elem,reply_idx,review_idx){
			//console.log($(elem).parent().parent().parent());
			$(elem).parent().append("<span class='reply_ck' id='reply_save"+reply_idx+"' onclick='reply_update(this,"+reply_idx+","+review_idx+")' >저장</span>");
			$(elem).remove();
			$("#reply_textarea"+reply_idx).removeAttr("readonly");
			$("#reply_textarea"+reply_idx).focus();
				
		}
		
		//댓글 수정
		function reply_update(elem,reply_idx,review_idx){
			console.log(idx);
			$.ajax({
				url:"./Revreply_update",
				type:"post",
				dataType:"json",
				data:{"reply_content":$("#reply_textarea"+reply_idx).val(),"reply_idx":reply_idx,"review_idx":review_idx},
				success:function(d){
					console.log(d);	
					if(d > 0){
						$("#reply_textarea"+reply_idx).attr("readonly","true");
						$(elem).parent().append("<span class='reply_ck' id='reply_update"+reply_idx+"' onclick='reply_updateform(this,"+reply_idx+","+review_idx+")' >수정</span>");
						$(elem).remove();
						//$("#reply_save"+reply_idx).css("display","none");
						//$("#reply_update"+reply_idx).css("display","block");
					}
					
				},
				error:function(e){console.log(e);}
			});   
		}
		
		//댓글 삭제
		function reply_delete(elem,reply_idx,review_idx){
			console.log($(elem).parent().parent()[0]);
			   $.ajax({
				url:"./Revreply_delete",
				type:"post",
				dataType:"json",
				data:{"reply_idx":reply_idx,"review_idx":review_idx},
				success:function(d){
					console.log(d);
					 if(d != 0){
						 $(elem).parent().parent().prev()[0].remove();
						 $(elem).parent().parent()[0].remove();
						 
					} 
				},
				error:function(e){console.log(e);}
			});   
		}
	
	 //댓글 작성
	 function replyWrite(elem,idx){
		 var name=$(elem).parents().parents().parents()[4].childNodes[0].childNodes[2].childNodes[0].data;
		 console.log($(elem).parents().parents().parents()[4].childNodes[0].childNodes[2].childNodes[0].data);
		  $.ajax({
				url:"./replyWrite",
				type:"post",
				dataType:"json",
				data:{"review_idx":idx,"loginId":loginId,"reply_content":$("#reply_textarea"+idx).val(),"profile":"resources/upload/"+profileSession,"name":name},
				success:function(d){
					console.log(d);
					replySelect(idx);
				},
				error:function(e){console.log(e);}
			}); 
		 
	 }
	
	//좋아요
	function likeSelect(idx){
		$.ajax({
			url:"./reviewLikeSelect",
			type:"post",
			dataType:"json",
			data:{"loginId":loginId},
			success:function(d){
				//console.log(d);
				for(var i=0; i<d.length; i++){
					$("#reviewLike"+d[i].review_idx).attr("src","resources/img/reviewLike/reviewLike2.png");
				}
			},
			error:function(e){console.log(e);}
		});
	}
	//좋아요 클릭
	function likeClick(elem,idx){
		var name=$(elem).parents()[1].childNodes[0].data;
		flag=idx;
		console.log(idx+"/"+loginId);
		if(loginId == ""){
			alert("로그인이 필요한 서비스 입니다.");
		}else{		
		$.ajax({
			url:"./reviewLike",
			type:"post",
			dataType:"text",
			data:{"review_idx":idx, "loginId":loginId,"name":name},
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
	}
	
	
	/* 
	onmouseout='LikeImg("+item.review_idx+")' onmouseover='LikeImg2("+item.review_idx+")'
	//마우스 아웃
	function LikeImg(idx){
		 	$("#reviewLike"+idx).attr("src","resources/img/reviewLike/reviewLike.png"); 
	}
	//마우스 오버
	function LikeImg2(idx){
			$("#reviewLike"+idx).attr("src","resources/img/reviewLike/reviewLike2.png");
	}  */ 
	
	var aTag = "";
	var idx = "";
	//리뷰 로그인체크 후 수정 삭제 신고 a 태그 띄워줌
	function atagCreate(list){
		aTag = "";
		idx = "";
		list.forEach(function(item){
			aTag = "";
			idx=item.review_idx;
			if(loginId != ""){
			 if(loginId == item.id){	
					aTag += "<span class='span' id='review_update' href='#' onclick='review_update(this,"+idx+")'>수정</span>&nbsp;";
					aTag += "<span class='span' id='review_delete' href='#' onclick='review_delete(this,"+idx+")'>삭제</span>&nbsp;";
				}else if(loginId != item.id){
					//aTag += "<span class='span' onclick='complain(this)'>신고</span>"
					//$("#complain").css("display","none");
				} 
			}
			
			 $(".listTop_R"+idx).append(aTag);
		});		
	}
	
	function review_update(elem,idx){
		location.href="./review_updateForm?review_idx="+idx;
	}
	
	//리뷰 삭제
	function review_delete(elem, idx){
		$.ajax({
			url:"./review_delete",
			type:"post",
			dataType:"json",
			data:{"review_idx":idx},
			success:function(d){

				if(d.success != 0){
					$(elem).parents().parents().parents()[1].remove();
				}
			},
			error:function(e){console.log(e);}
		});
	}
	
	
	//리뷰 별점
	function starSelect(elem){
		$.ajax({
			url:"./review_star",
			type:"post",
			dataType:"json",
			data:{"review_idx":elem},
			success:function(d){
				//console.log(d.reviewStar)
				//console.log(d.reviewStar);
				star_create(d.reviewStar,elem);		
			},
			error:function(e){console.log(e);}
		});	 
	}
	 var starCre = "";
	//리뷰 별점 리스트
	function star_create(star,elem){
		//console.log(star+"/"+elem);
		starCre = "";
		starCre +="<span id='star-input' class='star-input'><span id='input' class='input'>";		
		starCre +="<input id='"+elem+"0.5' type='radio' name='star-input"+elem+"' value='0.5' id='p0.5'><label  id='"+elem+"0.5' for='p0.5'>0.5</label>";
		starCre +="<input id='"+elem+"1' type='radio' name='star-input"+elem+"' value='1' id='p1.0'><label  id='"+elem+"1' for='p1.0'>1.0</label>";
		starCre +="<input id='"+elem+"1.5' type='radio' name='star-input"+elem+"' value='1.5' id='p1.5'><label id='"+elem+"1.5' for='p1.5'>1.5</label>";
		starCre +="<input id='"+elem+"2' type='radio' name='star-input"+elem+"' value='2' id='p2.0'><label id='"+elem+"2' for='p2.0'>2.0</label>";
		starCre +="<input id='"+elem+"2.5' type='radio' name='star-input"+elem+"' value='2.5' id='p2.5'><label id='"+elem+"2.5' for='p2.5'>2.5</label>";
		starCre +="<input id='"+elem+"3' type='radio' name='star-input"+elem+"' value='3' id='p3.0'><label id='"+elem+"3' for='p3.0'>3.0</label>";
		starCre +="<input id='"+elem+"3.5' type='radio' name='star-input"+elem+"' value='3.5' id='p3.5'><label id='"+elem+"3.5' for='p3.5'>3.5</label>";
		starCre +="<input id='"+elem+"4' type='radio' name='star-input"+elem+"' value='4' id='p4.0'><label id='"+elem+"4' for='p4.0'>4.0</label>";
		starCre +="<input id='"+elem+"4.5' type='radio' name='star-input"+elem+"' value='4.5' id='p4.5'><label id='"+elem+"4.5' for='p4.5'>4.5</label>";
		starCre +="<input id='"+elem+"5' type='radio' name='star-input"+elem+"' value='5' id='p5.0'><label id='"+elem+"5' for='p5.0'>5.0</label>";
		starCre +="</span></span>";		
  		$("#starTd"+elem).append(starCre);
  		var id = star+"";
  		var idArr=id.split(".").join('\\.');
  		$("#"+elem+idArr).attr('checked', true);
  		$("#starTd"+elem).css("pointer-events","none");
	} 
	
	//신고하기
	function complain(elem){
		var complain_Id = $(elem).parents()[1].childNodes[0].data;
		var review_idx = $(elem).parents().parents()[1].childNodes[1].value;
		var Win = window.open("./complainPage?complain_Id="+complain_Id+"&idx="+review_idx+"&complain_cate=리뷰","Complain",'height=500,width=500,top=200,left=600');
		//console.log(review_idx);
		//console.log(complain_Id);
	}
	
	//댓글신고할때 idx 값이랑 cate만 바꿔서!
	function replyComplain(elem){
		var reply_idx = $(elem).parents().parents().prev()[0].childNodes[0].childNodes[0].value;
		var complain_Id = $(elem).parents().parents().prev()[0].childNodes[1].childNodes[0].data;
		var Win = window.open("./complainPage?complain_Id="+complain_Id+"&idx="+reply_idx+"&complain_cate=댓글","Complain",'height=500,width=500,top=200,left=600');
	} 
	
	//해시태그,사진
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
	
	//해시태그 리스트
	var tag="";
	function printHash(hash,elem){
		tag="";
		hash.forEach(function(item){
			tag += "<div id='hashtag'>#"+item.hash_tag+"</div>";
		});
		$("#reviewList_hash"+elem).append(tag);
	}
	
	//사진 리스트
	var img="";
	function printPhoto(photo,elem){
		var phoSrc ="";
  		var photoArr;
		img="";
		photo.forEach(function(item){
			phoSrc=item.revPhoto_Photo;
			photoArr=phoSrc.split(".").join('\\.')
			img += "<div onclick='PhotoClick(this,"+elem+")' id='photo'><img class='PhotoImg' id='PhotoImg"+item.revPhoto_Photo+"'  width='60px' height='50px' src='"+item.revPhoto_Photo+"'/></div>";
		})
		$("#reviewList_photo"+elem).append(img);
	}
	

	function PhotoClick(elem, idx){
		$("#bigPhoto"+idx).empty();
		//console.log($(elem).children().attr("src"));
		var pho="";
		$("#bigPhoto"+idx).toggle(500,function(){			
			pho="<img id='BigPho' src='"+$(elem).children().attr("src")+"' width='250px' height='250px'/>";
			$("#bigPhoto"+idx).append(pho);	
		});
	}
		
	/* function reply(idx){
		$("#reviewReply"+idx).toggle(100,function(){
			
		});
	} */
		
	
	</script>
</html>