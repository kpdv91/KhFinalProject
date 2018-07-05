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
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody id="list">
					
				</tbody>
			</table>
		</div>
	</body>
	<script>
		$("#write").click(function () {
			location.href="boardWritePage";
		});
		
		$(document).ready(function() {
			$.ajax({
				type : "post",
				url : "./boardList",
				dataType : "json",
				success : function (data) {
					console.log(data);
					printList(data.list);
					if(data.list != null){
						printList(data.list);
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
		
		//받아온 리스트
		function printList(list) {
			console.log("리스트 어팬드 여부");
			var content = "";
			list.forEach(function(item, idx) {
				content += "<tr>";
				content += "<td>"+item.board_idx+"</td>";
				content += "<td>"+item.board_cate+"</td>";
				content += "<td>"+item.board_subject+"</td>";
				content += "<td>"+item.id+"</td>";
				var date = new Date(item.board_date);
				content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
				content += "<td><a href='#'>삭제</a></td>";
				content += "</tr>";
			});
			$("#list").empty();
			$("#list").append(content);
		}
	</script>
</html>