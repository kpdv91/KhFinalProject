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
        img{
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
            height: 25px;
            outline: 0px;
            border: 0px;
        }
        #hash{
            margin-right: 5px;
        }
        .hashTag{
            border: 2px solid #33aaaaff;
            font-size: 14px;
            width: 100px;            
            text-align: center; 
            float: left;
            margin: 5px;
        }
        form{
            text-align: center;
            margin: 0 auto;
            width: 600px;
        }
        #reviewPhoto{
            width: 80px;
            margin-top: 10px;
        }
        #editable{
            width: 100px;
            height: 100px;
            border: 1px solid black; 
            float: left;
            margin-right: 16px;
            margin-bottom: 5px;
        }
        #userName{
        	height: 30px;
        	border: 0px;
        	font-size: 15px;
        }
       .div{
       	height: 100px;
       }
       #tag{
       	width: 600px;
       	height: auto;
       	overflow: hidden;
       }
    </style>
	</head>
	<body>
	<form>
    상호명 : <input type="text"/><button><img src="resources/img/search.png"></button><br/><br/>
    작성자 : <input id="userName" type="text" value="홍길동" readonly/><br/>
    별점 : <jsp:include page="star.jsp"></jsp:include><br/>
    내용<br/>
    <textarea></textarea><br/><br/>
    
    해시태그 : <input id="hash" type="text"/><input id="add" type="button" value="추가"/><br/>
    <div id="tag"></div>


	<div id="rePhoto">
    <input id="reviewPhoto" type="button" value="사진 추가" onclick="fileUp()"/><br/><br/>
    <div id="editable" contenteditable="true"></div>
    </div>
    
    </form>
	</body>
	<script>
	var div = "";//div 추가 변수
	var i=0; 
	var hashtagArr = new Array();//해시태그 내용 담을 배열
	
	//해시태그 추가 버튼시 div 생성
	$("#add").click(function(){
		console.log("click!");
		if($("#hash").val() != ""){
		div = "<div class='hashTag' id='hashtag"+i+"'>#"+$("#hash").val()+"</div>";		
		$("#tag").append(div);	
		hashtagArr[i] = $("#hash").val();
		i++;
		$("#hash").val("");
		}
		console.log(hashtagArr);
		console.log($("#starScore").text());
	});
	
	//사진추가 새창
	function fileUp(){
		//fileUpload 새창을 띄운다.
		var myWin = window.open("./uploadForm","File Upload","width=400, height=100");
		
	}
	</script>
</html>