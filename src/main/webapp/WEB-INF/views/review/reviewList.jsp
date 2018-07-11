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
            height: 250px
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
        }
        tr,td{
				/* border:1px solid black; */
				border-collapse: collapse;
				
				
				margin:0 auto;
        }
        table{
            height: 170px;
    		border-bottom: 2px solid #142e5b;
            border-collapse: collapse;
			width: 500px;
			
			margin:0 auto;
        }
        #starTd{
            text-align: right;

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
        textarea{
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
    padding:25px;line-height:30px;
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

		</style>
		
	</head>
	<body>
	<div id="reviewListDiv">
	</div><br/>
	
	
	
	</body>
	<script>
	
	listCall();
	function listCall(){
		$.ajax({
			url:"./reviewList",
			type:"post",
			dataType:"json",
			success:function(d){
				console.log(d.reviewList);
				printList(d.reviewList);
				
			},
			error:function(e){console.log(e);}
		});
	}
	
	//starChk(item.review_star);
	
	var idx="";
	function printList(list){		 
		var content = "";
		list.forEach(function(item){
			content += "<div id='review'><input type='hidden' id='review_idx"+item.review_idx+"' value='"+item.review_idx+"'/>";
			content += "<div id='listTop'>"+item.id+"<div id='listTop_R'><a href='#' onclick='complain(this)'>신고</a><br/>명이 좋아합니다.</div></div>";
			content += "<table><tr><td id='storeName_td'>"+item.review_storeName+"</td>";
			content += "<td id='starTd"+item.review_idx+"'></td></tr>";
			content += "<tr><td colspan='2'><textarea readonly>"+item.review_content+"</textarea></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_hash"+item.review_idx+"'></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_photo"+item.review_idx+"'><td></tr></table>";
			content += "<a href='#' onclick='reply()'>댓글"+item.review_replyCnt+"개</a></div>";
			content += "<div id='reviewReply'>"+item.id+"<input type='text' readonly/><br/></div><br/>";
			
			idx=item.review_idx;
			hashtag(idx);
			starSelect(idx);		
			
		});
		
		$("#reviewListDiv").append(content);
	
		/* list.forEach(function(item){
			console.log(item.review_star);
			//$("#"+item.review_idx+"_"+item.review_star).attr('checked', true);
			//starChk(item.review_idx,item.review_star);
			star_create(item.review_idx,item.review_star);
			console.log($("#"+item.review_idx+item.review_star).val());
			$("#"+item.review_idx+item.review_star).attr('checked',true);
		});  */
		
	}
	function starSelect(elem){
		$.ajax({
			url:"./review_star",
			type:"post",
			dataType:"json",
			data:{"review_idx":elem},
			success:function(d){
				console.log(d.reviewStar)
				star_create(d.reviewStar,elem);		
			},
			error:function(e){console.log(e);}
		});	 
	}
	
	function star_create(star,elem){
		console.log(star);
		var aaa = "";
		aaa +="<span id='star-input' class='star-input'><span id='input' class='input'>";		
		aaa +="<input id='"+elem+"0.5' type='radio' name='star-input"+elem+"' value='0.5' id='p0.5'><label  id='"+elem+"0.5' for='p0.5'>0.5</label>";
		aaa +="<input id='"+elem+"1' type='radio' name='star-input"+elem+"' value='1' id='p1.0'><label  id='"+elem+"1' for='p1.0'>1.0</label>";
		aaa +="<input id='"+elem+"1.5' type='radio' name='star-input"+elem+"' value='1.5' id='p1.5'><label id='"+elem+"1.5' for='p1.5'>1.5</label>";
		aaa +="<input id='"+elem+"2' type='radio' name='star-input"+elem+"' value='2' id='p2.0'><label id='"+elem+"2' for='p2.0'>2.0</label>";
		aaa +="<input id='"+elem+"2.5' type='radio' name='star-input"+elem+"' value='2.5' id='p2.5'><label id='"+elem+"2.5' for='p2.5'>2.5</label>";
		aaa +="<input id='"+elem+"3' type='radio' name='star-input"+elem+"' value='3' id='p3.0'><label id='"+elem+"3' for='p3.0'>3.0</label>";
		aaa +="<input id='"+elem+"3.5' type='radio' name='star-input"+elem+"' value='3.5' id='p3.5'><label id='"+elem+"3.5' for='p3.5'>3.5</label>";
		aaa +="<input id='"+elem+"4' type='radio' name='star-input"+elem+"' value='4' id='p4.0'><label id='"+elem+"4' for='p4.0'>4.0</label>";
		aaa +="<input id='"+elem+"4.5' type='radio' name='star-input"+elem+"' value='4.5' id='p4.5'><label id='"+elem+"4.5' for='p4.5'>4.5</label>";
		aaa +="<input id='"+elem+"5' type='radio' name='star-input"+elem+"' value='5' id='p5.0'><label id='"+elem+"5' for='p5.0'>5.0</label>";
		aaa +="</span></span>";
  		//$("input:radio[value='"+elem+"']").attr('checked', true);			
  		console.log($("#"+elem+star).val());
  		$("#starTd"+elem).append(aaa);
  		$("#"+elem+star).attr('checked', true);
	}
	
	 /* function starChk(elem1,elem2){
		 console.log($("#"+elem1+"_"+elem2).val());
		//console.log($("input:radio[value='"+elem+"']"));
		$("#"+elem1+"_"+elem2).attr('checked', true);
		//$("#").attr('checked', true);
	} */
	
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
	
	function hashtag(elem){
		 $.ajax({
			url:"./reviewHashPhoto",
			type:"post",
			dataType:"json",
			data:{"review_idx":elem},
			success:function(d){
				//console.log(d.reviewHash);
				//console.log(d.reviewHash);
				/* console.log(d.reviewPhoto); */
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