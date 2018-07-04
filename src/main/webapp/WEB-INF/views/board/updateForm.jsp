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
            
            button#exit{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 367px; left: 377px;} 
            button#update{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 367px; left: 432px;}
    
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
						<input type="hidden" id="board_idx" value="${dto.board_idx }"/> 
						<span id="user_name">${dto.id }</span>
					</td>
					<th>작성날짜</th>
					<td>
						<span id="board_date">${dto.board_date }</span>
					</td>
				</tr>
                <tr>
                    <th>제목</th>
                    <td colspan="5"><input type="text" id="board_subject" value="${dto.board_subject }"/></td>
                </tr>
                <tr>
                    <td colspan="6"><textarea rows="15" id="board_content">${dto.board_content }</textarea></td>
                </tr>
			</table>
            <button id="exit">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="update">수정</button>
		</div>
	</body>
	<script>
		$("#update").click(function () {
			$.ajax({
				type : "post",
				url : "./boardUpdate",
				data : {
					idx : $("#board_idx").val(),
					/* cate : $("#category").val(), */
					/* id : $("#user_name").html(), */
					subject : $("#board_subject").val(),
					content : $("#board_content").val()
				},
				dataType : "json",
				success : function (data) {
					if(data.success>0){
						console.log(data.success);
						alert("수정 성공");
						location.href="./boardDetail?idx="+data.success;
					}else{
						alert("실패 실패");
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
		
		$("#exit").click(function () {
			history.back();
		});
	</script>
</html>