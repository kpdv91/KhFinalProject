<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>		
			img{position: absolute;width: 100px;height: 100px;left: 400px;top: 65px;			}
			h1{position: absolute;width: 150px;height: 60px;text-align: center;left: 500px;top: 50px;}
			#profile{width: 100%;height: 200px;}
			#fallow{background-color: lightgray;border:1px solid black;width: 90px;position: absolute;left: 650px;top: 70px;}
			#dm{background-color: lightgray;border:1px solid black;width: 110px;position: absolute;left: 750px;top: 70px;}
			#review{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 510px;top: 130px;}
			#likereview{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 610px;top: 130px;}
			#likestore{background-color: lightgray;border:1px solid black;position: absolute;width:100px;left: 710px;top: 130px;}
			#friend{background-color: lightgray;border:1px solid black;position: absolute;width:120px;left: 810px;top: 130px;}
			#userdetail{float: left;width: 180px;}
			#update{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#message{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#cupon{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#point{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#total{background-color: lightgray;border:1px solid black;width:180px;text-align: center;}
			#content{float: left;margin-left: 100px;}
		</style>
	</head>
	<body>
	<div>
		<div id="profile">
		<img src="resources/img/member/noprofile.jpg">		
		<h1 id="userId">홍길동</h1>
			<div id="fallow">팔로우 신청</div>
			<div id="dm">메세지 보내기</div>
			<div id="main">
		<div class="main" id="review">리뷰 40</div>
		<div class="main" id="likereview">좋아요 40</div>
		<div class="main" id="likestore">찜한가게 40</div>
		<div class="main" id="friend">팔로우 목록 40</div>
		</div>
		</div>		
	</div>
		<br/>
		<hr/>
		<br/>
		<div id="userdetail">
			<div id="update">회원정보수정</div>
			<div id="message">쪽지함</div>
			<div id="cupon">구매한 쿠폰</div>
			<div id="point">포인트내역</div>
			<div id="total">통계</div>
		</div>
		<div id="content">
		
		</div>
	</body>
	<script>
	
	</script>
</html>