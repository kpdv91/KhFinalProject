<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
            div#board{position: relative; top: 100px; left: 400px; border: 1px solid black; width: 500px; height: 500px;}
            table, th, td{border: 1px solid black; border-collapse: collapse;}
            table{position: absolute; top: 60px; left: 10px;}
            th{width: 117px; height: 30px; background-color: lightskyblue;}
            td{width: 116px; height: 30px; text-align: center;}
            
            input#board_category{width: 100%; height: 100%;}
            span#user_id{text-align: center;}
            input#board_subject{width: 100%; height: 100%;}
            textarea#board_content{resize: none; width: 100%; height: 100%;}
            
            button#delete{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 367px; left: 377px;} 
            button#update{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 367px; left: 432px;}
    	
    	
    		/* 댓글 CSS */
    		#boardReply_write{position: absolute; top: 525px; left: 408px;}
    		#boardReply_content{resize: none;}       
    		
    		#boardReply_list{position: absolute; top: 625px; left: 408px;}
		</style>
	</head>
	<body>
		<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<div id="board">
			<table>
				<tr>
					<th>분류</th>
					<td>
                        ${dto.board_cate }
                    </td>
					<th>작성자</th>
					<td>
						<span id="user_name">${dto.id }</span>
					</td>
					<th>작성날짜</th>
					<td>
						<span id="board_date">${dto.board_date }</span>
					</td>
				</tr>
                <tr>
                    <th>제목</th>
                    <td colspan="5">${dto.board_subject }</td>
                </tr>
                <tr>
                    <td colspan="6"><textarea rows="15" id="board_content" readonly="readonly">${dto.board_content }</textarea></td>
                </tr>
			</table>
			<!-- <button id="">목록</button> -->
			<c:if test="${sessionScope.loginId == dto.id}">
	            <button id="delete">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button id="update" onclick="update()">수정</button>   
            </c:if>
		</div>

		<c:if test="${dto.board_cate == '문의사항'">
			<div id="boardReply_write">    
				<table> 
					<tr>
						<input type="hidden" id="board_idx" value="${dto.board_idx }"/>
						<input type="hidden" id="board_id" value="${sessionScope.loginId }"/>
						<td>
							<div>${sessionScope.loginId }</div>
						</td>
						
						<td>
							<div>
								<textarea id="boardReply_content" rows="4" cols="70"></textarea>
							</div>
						</td>
						
						<td>
							<div>
								<button id="replyWrite">댓글등록</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:if>

		<div id="boardReply_list">
			<table>
				<thead id="reply">
					
				</thead>
			</table>
		</div>
	</body>
	<script>
		function update() {
			location.href="updateForm?idx="+${dto.board_idx};
		}
		//댓글 리스트
		$(document).ready(function () {
			$.ajax({
				type : "post",
				url : "./boardReplyList",
				data : { idx : $("#board_idx").val() },
				dataType : "json",
				success : function (data) {
					reply(data.list);
				},
				error : function (error) { console.log(error); }
			});
		});
		
		//댓글 리스트 메소드
		function reply(list) {
			console.log(list); 
			var content = "";
			list.forEach(function(item, idx) {
				var date = new Date(item.boardReply_date);
				content += "<tr>";
				content += "<td><div>"+item.id+"<br/>"+date.toLocaleDateString("ko-KR")+"</div</td>";
				content += "<td><div id='reply_content1'>"+item.boardReply_content+"</div>"+
					"<div><textarea id='reply_content2' style='display:none;'>"+
					item.boardReply_content+"</textarea></div></td>";
				if(${sessionScope.loginId != "관리자"}){    
					content += "</tr>";         
				}else{     
					content += "<td><div><button id='replyUpdate'>수정</button>"+
						"<button id='replySave' style='display:none;'>저장</button>"+
						"<button id=replyDelete>삭제</button></div</td>";
					content += "</tr>";
				}    
			});   
			
			$("#reply").empty();
			$("#reply").append(content); 
			
			//댓글 수정
			$("#replyUpdate").click(function () {
				$("#replyUpdate").css("display","none");
				$("#replySave").css("display","");
				$("#reply_content1").css("display","none");
				$("#reply_content2").css("display","");
			});
			
			$("#replySave").click(function () {
				console.log($("#reply_content2").val());
				$.ajax({ 
					type : "post",
					url : "./boardReplyUpdate",
					data : {
						board_idx : list[0].board_idx,
						boardReply_idx : list[0].boardReply_idx,
						boardReply_content : $("#reply_content2").val()
					},  
					dataType : "json",
					success : function (data) {
						if(data.success > 0){
							$("#replyUpdate").css("display","");
							$("#replySave").css("display","none");
							$("#reply_content1").css("display","");
							$("#reply_content2").css("display","none");
						}
					location.href="boardDetail?idx="+$("#board_idx").val();  
					},
					error : function (error) {
						console.log(error); 
					}
				});
			});
			
			//댓글 삭제
			$("#replyDelete").click(function () {
				$.ajax({
					type : "post",
					url : "./boardReplyDelete",
					data : {
						board_idx : list[0].boardReply_idx,
						boardReply_idx : list[0].board_idx
					},
					dataType : "json",
					success : function (data) {
						if(data.success > 0){
							alert("삭제 성공");
						}else{
							alert("삭제 실패"); 
						}
						location.href="boardDetail?idx="+$("#board_idx").val();
					},
					error : function (error) { console.log(error); }
				});
			}); 
		}  
		  
		//댓글 작성
		$("#replyWrite").click(function () {
			$.ajax({
				type : "post",
				url : "./boardReplyWrite",
				data : {
					idx : $("#board_idx").val(),
					id : $("#board_id").val(),
					boardReply_content : $("#boardReply_content").val()
				},
				dataType : "json",
				success : function (data) {
					console.log(data.replyCnt);
					if(data.replyCnt > 0){
						alert("댓글 작성 안됨");
					}else{
						if(data.success > 0){
							alert("댓글 작성 성공");
						}
					}
					location.href="boardDetail?idx="+$("#board_idx").val();
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
		
		//게시판삭제
		var idx = ${dto.board_idx};
		$("#delete").click(function () {
			$.ajax({
				type : "post",
				url : "./boardDelete",
				data : {
					idx : idx
				},
				dataType : "json",
				success : function (data) {
					if(data.success>0){
						console.log(data.success);
						alert("삭제 성공");
						location.href="./boardListPage";
					}else{
						alert("삭제 실패");
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
		
	</script>
</html>