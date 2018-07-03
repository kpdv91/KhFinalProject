<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>가게 등록</title>
		<style></style>
	</head>
	<body>
		<div id="regist">
			<form id="sendForm" action="write" method="post" >
			<table>
				<tr>
					<th>대표사진</th>
					<td>
						<input type="button" onclick="fileUp()" value="사진 업로드">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 사진 보여주는 공간 -->
						<div id="editable" contenteditable="true"></div>
						<!-- 사진 전송은 하는 인풋 -->
						<input id="contentForm" type="hidden" name="content"/>
					</td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>대표자</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>우편 번호</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>음식 종류</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>영업 시간</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>휴무일</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>해쉬태그</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>메뉴판 사진</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="save" value="등록 요청">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
	<script>

	</script>
</html>