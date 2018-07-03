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
        #hashtag{
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
        }
        #photo{
            width: 100px;
            height: 100px;
            border: 1px solid black; 
            float: left;
            margin-right: 16px;
            margin-bottom: 5px;
        }
    </style>
	</head>
	<body>
	<form>
    상호명 : <input type="text"/><button><img src="search.png"></button><br/>
    작성자 : 홍길동<br/>
    별점 : <jsp:include page="star.jsp"></jsp:include><br/>
    내용<br/>
    <textarea></textarea><br/><br/>
    
    해시태그 : <input id="hash" type="text"/><input id="add" type="button" value="추가"/><br/>
    <div id="hashtag">#해시태그</div>
    <div id="hashtag">#해시태그</div>
    <div id="hashtag">#해시태그</div>
    <div id="hashtag">#해시태그</div>
    <div id="hashtag">#해시태그</div>
    <br/><br/><br/>
    
    <input id="reviewPhoto" type="button" value="사진 추가"/><br/><br/>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    <div id="photo">사진</div>
    
    
    
    </form>
	</body>
	<script>

	</script>
</html>