<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>신고</title>
		<style>
		 #comp{
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
			form {
				background-color: #142e5b;
				color: white;
				width: 100%;
				height: 100%;
				padding: 0px;
				text-align: center;
			}
			body{
				overflow-x:hidden; overflow-y:hidden;
			}
			#complain_content{
				width: 400px;
				height: 230px;
				 resize: none;
				 border-radius: 5px;
			}
			#compSelect{
				width: 80px;
				height: 25px;
				border-radius: 5px;
				font-size: 15px;
				text-align-last: center;
			}
			#compID{
				border-radius: 5px;
			}
			
		</style>
	</head>
	<body>
	
	<form action="./complain" method="post" enctype="multipart/form-data">
	<br/><br/><br/>
		신고할 ID : <input id="compID" type="text" value="${complain_Id }"/><br/><br/>
		사유 : &nbsp;&nbsp;
		<select id="compSelect" name="complain_type">
		  <option value="욕설" selected="selected">욕설</option>
		  <option value="광고">광고</option>
		  <option value="음란성">음란성</option>
		</select><br/><br/>
		<textarea id="complain_content" placeholder="신고 내용을 입력해 주세요."></textarea><br/><br/>
		<button id="comp">신고하기</button>
		
	
	</form>

	</body>
	<script>

	</script>
</html>