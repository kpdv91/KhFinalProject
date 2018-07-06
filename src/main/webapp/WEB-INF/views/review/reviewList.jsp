<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
			 #review{
            border: 1px solid black;
            width: 500px;
            height: 250px
        }
        #listTop_R{
            border-bottom: 1px solid black;
            height: 50px;
            line-height: 50px;
        }
        #complain{
            float: right;
            height: 50px;
            width: 150px;
            line-height: 25px;
        }
        tr,td{
				/* border:1px solid black; */
				border-collapse: collapse;
				width: 500px;
				
				margin:0 auto;
        }
        table{
            height: 170px;
    		border-bottom: 1px solid black;
            border-collapse: collapse;
			width: 500px;
			
			margin:0 auto;
        }
        #star{
            text-align: right;
        }
        #hashtag{
            border: 1px solid black;
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
            border: 1px solid black;
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
        #reviewListDiv{
        	border: 1px solid black;
        }
		</style>
	</head>
	<body>
	<div id="reviewListDiv">
	</div>
	
	
	
	</body>
	<script>
	listCall();
	function listCall(){
		$.ajax({
			url:"./reviewList",
			type:"post",
			dataType:"json",
			success:function(d){
				console.log(d.list);
				/* for(var i=0; i<d.list.length; i++){
				printList(d.list);
				} */
			},
			error:function(e){console.log(e);}
		});
	}
	
	
function printList(list){
		
		var content = "";
		list.forEach(function(item){
			content += "<div id='review'>";
			content += "<div id='listTop'>"+ilst.id+"<div id='listTop_R'><a href='#'>신고</a><br/>"+review_likeCnt+"명이 좋아합니다.</div></div>";
			content += "<table><tr><td>"+review_storeName+"</td>";
			content += "<td id='star'>"+review_star+"</td></tr>";
			content += "<tr><td colspan='2'><textarea>"+review_content+"</textarea></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_hash'></td></tr>";
			content += "<tr><td colspan='2' id='reviewList_photo'><td></tr></table>";
			content += "<a href='#' onclick='reply()'>댓글"+review_replyCnt+"개</a></div>";
			content += "<div id='reviewReply'>"+id+"<input type='text' readonly/><br/></div>";
		})
		
		$("reviewListDiv").append(content);
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