<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
            div#board{width: 500px; height: 350px;}
            table, th, td{border: 1px solid black; border-collapse: collapse;}
            th{width: 100px; height: 30px; background-color: lightskyblue;}
            td{width: 100px; height: 30px;}
            
            select#category{width: 100%; height: 100%;}
            input#board_subject{width: 100%; height: 100%;}
            textarea#board_content{resize: none; width: 100%; height: 100%;}
            
            button#exit{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 310px; left: 315px;}
            button#write{position: absolute; border: none; background-color: lightskyblue; color:black; border-radius: 2px; font-size: 15px; top: 310px; left: 365px;}
    
		</style>
	</head>
	<body>
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
					<td></td>
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

	</script>
</html>