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
            
            select#category{width: 100%; height: 100%;}
            span#user_id{text-align: center;}
            input#board_subject{width: 100%; height: 100%;}
            textarea#board_content{resize: none; width: 100%; height: 100%;}
            
            button#exit{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 367px; left: 377px;} 
            button#write{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 367px; left: 432px;}
    
		</style>
	</head>
	<body>
		<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<div id="board">
			<table>
				<tr>
					<th>분류</th>
					<td>
                        <select id="category">
                            <option value="선택하세요" selected>선택하세요</option>
                            <option>공지사항</option>
                            <option>문의사항</option>
                        </select>
                    </td>
					<th>작성자</th>
					<td><span id="user_name"></span></td>
				</tr>
                <tr>
                    <th>제목</th>
                    <td colspan="3"><input type="text" id="board_subject"/></td>
                </tr>
                <tr>
                    <td colspan="4"><textarea rows="15" id="board_content"></textarea></td>
                </tr>
			</table>
            <button id="exit">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="write">글쓰기</button>
		</div>
	</body>
	<script>
		$("#write").click(function () {
			$.ajax({
				
			});
		});
	</script>
</html>