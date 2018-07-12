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
		#reviewListDiv{
			margin-left: 490px;
		}
		
			 #review{
            border: 2px solid #142e5b;
            width: 500px;
            
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
        #reviewReply{
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
        #tableTop{
        	height: 40px;
        }
        .span{
        	text-decoration: none;
        	color: black;
        }
        .span:hover{
        	color: red;
        }
        .bigPhoto{
        	width: 505px;
        	height: 250px;
        	background-color: pink;
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
            width: 70px;
            height: 28px;
            outline: 0px;
            border: 0px;
       }
       #review_Write{
       		margin-left: 490px;
       }
       
       #review_range{
				width: 80px;
				height: 28px;
				border-radius: 5px;
				font-size: 15px;
				text-align-last: center;
				margin-left: 350px;
				border: 2px solid #142e5b;
			}

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
				"range":elem
				},
			success:function(d){
				$("#reviewListDiv").empty();
				console.log(d.reviewList);
				printList(d.reviewList);
				atagCreate(d.reviewList);
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
			content += "<div id='review'><input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
			content += "<div id='listTop'>"+item.id+"<div id='listTop_R' class='listTop_R"+item.review_idx+"'></div></div>";
			content += "<table id='review_table'><tr id='tableTop'><td id='storeName_td'>"+item.review_storeName+"</td>";
			content += "<td id='starTd"+item.review_idx+"' class='starTd'></td></tr>";
			content += "<tr><td colspan='2'><textarea id='review_content' readonly>"+item.review_content+"</textarea></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_photo"+item.review_idx+"'><td></tr></table>";
			content += "<a href='#' onclick='reply()'>댓글"+item.review_replyCnt+"개</a></div>";
			content += "<div id='reviewReply'>"+item.id+"<input type='text' readonly/><br/></div>";	
			content += "<div class='bigPhoto' id='bigPhoto"+item.review_idx+"'></div><br/></div>";
			
			idx=item.review_idx;
			hashtag(idx);//리뷰 해시태그
			starSelect(idx);//리뷰 별점
			
		});
		
		$("#reviewListDiv").append(content);		
	}
	
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
					aTag += "<span class='span' href='#' onclick='complain(this)'>신고</span>"
				} 
			}
			 aTag+="<br/>"+item.review_likeCnt+"명이 좋아합니다.";
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
				console.log(d.reviewStar);
				star_create(d.reviewStar,elem);		
			},
			error:function(e){console.log(e);}
		});	 
	}
	var starCre = "";
	//리뷰 별점 리스트
	function star_create(star,elem){
		//console.log(star);
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
		var review_idx = $(elem).parents().parents()[1].childNodes[0].value;
		var Win = window.open("./complainPage?complain_Id="+complain_Id+"&idx="+review_idx+"&complain_cate=리뷰","Complain",'height=500,width=500,top=200,left=600');
		console.log($(elem).parents().parents()[1].childNodes[0].value);
	}
	
	//댓글신고할때 idx 값이랑 cate만 바꿔서!
	/* function complain(elem){
		var complain_Id = $(elem).parents()[1].childNodes[0].data;
		var review_idx = $(elem).parents().parents()[1].childNodes[0].value;
		var Win = window.open("./complainPage?complain_Id="+complain_Id+"&idx="+review_idx+"&complain_cate=리뷰","Complain",'height=500,width=500,top=200,left=600');
		console.log($(elem).parents().parents()[1].childNodes[0].value);
	} */
	
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
		img="";
		photo.forEach(function(item){
			img += "<div id='photo'><img onclick='PhotoClick("+elem+")' width='60px' height='50px' src='"+item.revPhoto_Photo+"'/></div>";
		})
		$("#reviewList_photo"+elem).append(img);
	}
	
	function PhotoClick(elem){
		console.log(elem);
		$("#bigPhoto"+elem).css("display","block");
		
	}
	
	
	
	
		var replyClick = 1;
		function reply(){			
			replyClick *= -1;
			if(replyClick == -1){
				$("#reviewReply").css("display","block");
			}else{
				$("#reviewReply").css("display","none");
			}						
		}
		
		
	
	</script>
</html>