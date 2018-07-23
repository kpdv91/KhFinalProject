<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="./resources/js/zer0boxPaging.js" type="text/javascript"></script>
		<title>Insert title here</title>
		<style>
			div#tableDiv{position: relative; top: 50px; left: 400px; border: 1px solid black; width: 740px; height: 1000px;}    
			 
			table, th, td{border-top: 1px solid black; border-bottom: 1px solid black; border-collapse: collapse;}
			table#board_list_table{position: absolute; top: 60px; left: 10px; border-bottom: none; border-left: none; border-right: none;/*  width: 700px; height: 500px; */}      
			th[name="board_idx"]{width: 50px; height: 50px; background-color: lightskyblue;}
			th[name="board_cate"]{width: 100px; height: 50px; background-color: lightskyblue;}
			th[name="board_subject"]{width: 350px; height: 50px; background-color: lightskyblue;}
			th[name="board_user_name"]{width: 100px; height: 50px; background-color: lightskyblue;}
			th[name="board_date"]{width: 100px; height: 50px; background-color: lightskyblue;}
			td#board_paging{text-align: center; border: none;}
					
			
			button#write{position: absolute; top:570px; left: 644px; width:auto; height: 30px; background-color: lightskyblue; border: none; border-radius: 2px;}
		</style>
	</head>
	<body>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<div id="tableDiv">
			<c:if test="${ sessionScope.loginId != null}">
			<button id="write">작성하기</button> 
			</c:if>
			<table id="board_list_table">
				<thead>
					<tr>
						<th name="board_idx">번호</th>
						<th name="board_cate">분류</th>
						<th name="board_subject">제목</th>
						<th name="board_user_name">작성자</th>
						<th name="board_date">작성날짜</th>
					</tr>
				</thead>
				<tbody id="list">
					
				</tbody>
				<tr>
					<td colspan="5" id="board_paging">
						<div id="board_container"></div>
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script>
		$("#write").click(function () {
			location.href="boardWritePage";
		});
		
		var page = 1;
		$(document).ready(function () {
			listCall(page);	
		});
		
		function listCall(page) {
			$.ajax({
				type : "post",
				url : "./boardList",
				data : { page : page},
				dataType : "json",
				success : function (data) {
					console.log(data);
					if(data.list != null){
						printList(data.list);
						$("#board_container").zer0boxPaging({
			                viewRange : 10,
			                currPage : data.currPage,
			                maxPage : data.range,
			                clickAction : function(e){
			                    listCall($(this).attr('page'));
			                }
			            });
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		}
		
		/* $(document).ready(function() {
			$.ajax({
				type : "post",
				url : "./boardList",
				data : { page : 1},
				dataType : "json",
				success : function (data) {
					console.log(data);
					if(data.list != null){
						printList(data.list);
						$("#container").zer0boxPaging({
			                viewRange : 10,
			                currPage : data.currPage,
			                maxPage : data.range,
			                clickAction : function(e){
			                    console.log($(this).attr('page'));
			                    
			                }
			            });
						
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		}); */
		
		//받아온 리스트
		function printList(list) {
			var content = "";
			list.forEach(function(item, idx) {
				content += "<tr>";
				content += "<td align='center'>"+item.board_idx+"</td>";
				if(item.board_cate == "공지사항"){
					content += "<td style='font-weight:bold;' align='center'>"+item.board_cate+"</td>"; 
				}else{
					content += "<td align='center'>"+item.board_cate+"</td>"; 
				}
				content += "<td align='left'><a href='./boardDetail?idx="+item.board_idx+"'>"+item.board_subject+"</a></td>";
				content += "<td align='center'>"+item.id+"</td>";
				var date = new Date(item.board_date);
				content += "<td align='center'>"+date.toLocaleDateString("ko-KR")+"</td>";
				content += "</tr>";
			});
			$("#list").empty();
			$("#list").append(content);
		}
	</script>
</html>