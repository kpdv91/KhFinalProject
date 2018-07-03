<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
			div#tableDiv{position: relative; top: 100px; left: 400px; border: 1px solid black; width: 500px; height: 500px;}
			
			table, th, td{border: 1px solid black; border-collapse: collapse;}
			table{position: absolute; top: 60px; left: 10px;}
			th{width: 117px; height: 30px;} 
			button#write{position: absolute; top:20px; left: 422px; width:auto; height: 30px; background-color: lightskyblue; border: none;}  
		</style>
	</head>
	<body>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<div id="tableDiv">
			<button id="write">작성하기</button> 
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
			</table>
		</div>
	</body>
	<script>
		$("#write").click(function () {
			location.href="boardWritePage";
		});
	</script>
</html>