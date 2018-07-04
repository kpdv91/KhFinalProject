<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
        button{
            height: 21px;
            vertical-align: middle;
        }
        #reviewSearch{
            width: 15px;
            height: 15px;
            
        }
        textarea{
            width: 400px;
            height: 200px;
        }
        input[type=button]{
            vertical-align: middle;
            padding: 0px 5px;
            background-color: #33aaaaff;
            color: white;
            border-radius: 7px;
            width: 50px;
            height: 27px;
            outline: 0px;
            border: 0px;
        }
        #write{
        vertical-align: middle;
            padding: 0px 5px;
            background-color: #33aaaaff;
            color: white;
            border-radius: 7px;
            width: 80px;
            height: 27px;
            outline: 0px;
            border: 0px;
        }
        #hash{
            margin-right: 5px;
        }
        .hashTag{
            border: 2px solid #33aaaaff;
            font-size: 14px;
            width: auto;            
            text-align: center; 
            float: left;
            margin-left: 20px;
            margin-top: 10px;
            padding-left: 10px;
        }
        form{
            text-align: center;
            margin: 0 auto;
            width: 600px;
            
        }
        #reviewPhoto{
            width: 80px;
            margin-top: 20px;
            margin-right: 315px;
        }
       
        #userName{
        	height: 30px;
        	border: 0px;
        	font-size: 15px;
        }
       .div{
       	height: 100px;
       }
       #tag,#editable{
       	width: 600px;
       	height: auto;
       	overflow: hidden;
       }
       #imgDiv{
       	float: left; 
       	margin-left: 20px;
       }
       /* #editable{
       	width: 600px;
       	height: auto;
       	overflow: hidden;
       } */
       .hashDel{
       	width: 20px;
       	background-color: #33aaaaff;
        outline: 0px;
        border: 0px;
        color: white;
        float:right;
        text-align: center;
        font-size: 15px;
        margin-left: 10px;
       }
       #userId{
       	border: 0px;
       	font-size: 15px;
       }
       #searchList{
		width: 250px;
		height: 400px;
		background-color: pink;  
		margin-top:-42px;     
		margin-left: 401px;
		z-index: 2;
		position: absolute;
		display: none;
       }
       #formDiv{
       position: relative;
       	z-index: 1;
       }
       #mapDiv{
       	width: 400px;
		height: 400px;
		background-color: orange;
		margin-top:-42px;  
		margin-left:2px;   
		z-index: 2;
		position: absolute;
		display: none
       }
       #listClose{
       	width: 25px;
       	float: right;
       	border-radius: 0px;
       }
       
    </style>
	</head>
	<body>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<br/><br/><br/>
	<form id="sendForm" action="reviewWrite">

	<div id ="formDiv">
	작성자 : <input id="userId" name="id" type="text" value="${sessionScope.loginId}" readonly/><br/><br/>
    상호명 : <input id="review_storeName" type="text" name="review_storeName"/><button type="button" id="search"><img id="reviewSearch" src="resources/img/search.png"></button><br/><br/><br/>
    <div id="searchList">
    	<a id="list">리스트 자리</a>
    	<input id="listClose" type="button" value="X"/>
    </div>
    <div id="mapDiv">지도 자리</div>
    별점 : <jsp:include page="star.jsp"></jsp:include><br/>
    내용<br/>
    <textarea name="review_content"></textarea><br/><br/>
    
    해시태그 : <input id="hash" type="text"/><input id="add" type="button" value="추가"/><br/>
    
    <div id="tag"></div>
    


	<div id="rePhoto">
    <input id="reviewPhoto" type="button" value="사진 추가" onclick="fileUp()"/><br/><br/>
    <input type="hidden" name="review_photo"/>
    <div id="editable"></div>
    </div><br/><br/>
    <button id="write">작성하기</button>
    </div>
    </form>
	</body>
	<script>
	var loginId = "${sessionScope.loginId}";
	console.log(loginId);
	var div = "";//div 추가 변수
	
	$("#write").click(function(){
		//해시태그 삭제버튼 제거
		
		$("#sendForm").submit();
	});
	
	//해시태그 추가 버튼시 div 생성
	$("#add").click(function(){
		if($("#hash").val() != ""){
		div = "<div class='hashTag' id='hashTag'>#"+$("#hash").val()+
		"<button onclick='hashDel(this)' class='hashDel'>-</button>"+
		"<input type='hidden' name='hash_tag' value='"+$("#hash").val()+"'/></div>";		
		$("#tag").append(div);	
		//hashtagArr[i] = $("#hash").val();
		//i++;
		$("#hash").val("");
		}
		
	});
	
	function hashDel(elem){
		//var sp = elem.id.split("_")[1];
		console.log(elem.parentNode);
		//delete hashtagArr[sp];
		elem.parentNode.remove();
		$(elem).remove();
	}
	
	//사진추가 새창
	function fileUp(){
		//fileUpload 새창을 띄운다.
		var myWin = window.open("./uploadForm","File Upload","width=400, height=100");
		
	}
	
	//사진 삭제시 초기화가 되지 않기 위해 Ajax 사용
	function del(elem){
		var fileName = elem.id.split("/")[2];
		console.log(fileName);
		$.ajax({
			url : "./fileDel",
			type : "get",
			data : {"fileName":fileName},
			success : function(data){
				console.log(data);
				if(data.success == 1){
					//이미지 삭제
					$(elem).prev().prev().remove();
					//버튼 삭제
					$(elem).remove();
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	
	$("#search").click(function(){
		console.log("search click");
		$.ajax({
			url : "./revStoreSearch",
			type : "post",
			data : {"review_storeName":$("#review_storeName").val()},
			success : function(data){
				console.log(data);
				
			},
			error : function(e){
				console.log(e);
			}
		});
		$("#searchList").css("display","block");
	});
	$("#list").click(function(){
		console.log("List Click");
		$("#mapDiv").css("display","block");
	});
	$("#listClose").click(function(){
		console.log("X Click");
		$("#searchList").css("display","none");
		$("#mapDiv").css("display","none");
	});
	</script>
</html>