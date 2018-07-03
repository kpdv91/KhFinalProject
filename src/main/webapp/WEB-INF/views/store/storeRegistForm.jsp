<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>가게 등록</title>
		<style>
		
		</style>
	</head>
	<body>
		<div id="regist">
			<form id="registForm" action="storeRegist" method="post" >
			<table>
				<tr>
					<th>대표사진</th>
					<td>
						<input type="file" id="sPhoto" name="store_photo" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
						<input type="button" onclick="storeD()" value="취소">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="sPhotoShow"></div>
					</td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name="store_name"/></td>
				</tr>
				<tr>
					<th>대표자</th>
					<td><input type="text" name="store_ceo"/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="store_phoneH"/>-
						<input type="text" name="store_phoneB"/>-
						<input type="text" name="store_phoneT"/>
						</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="store_addr"/></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>음식 종류</th>
					<td><input type="text" name="store_food"/></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="store_price"/></td>
				</tr>
				<tr>
					<th>영업 시간</th>
					<td><input type="text" name="store_time"/></td>
				</tr>
				<tr>
					<th>휴무일</th>
					<td><input type="text" name="store_rest"/></td>
				</tr>
				<tr>
					<th>해쉬태그</th>
					<td>
						<input type="text" name="store_tag"/>
						<input type="button" onclick="hashTag()" value="추가">
					</td>
				</tr>
				<tr>
					<div id="tags"></div>
				</tr>
				<tr>
					<th>메뉴판 사진</th>
					<td><input type="text" name="store_menu"/></td>
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
	var upload = document.getElementById('sPhoto');
	var holder = document.getElementById('sPhotoShow');
	storeD();
	
	upload.onchange = function (e) {
		var file = upload.files[0],
		reader = new FileReader();
		
		reader.onload = function (event) {
			var img = new Image();
			img.src = event.target.result;

			// note: no onload required since we've got the dataurl...I think! :)
			img.width = 400;
			img.height = 270;
			
			holder.innerHTML = '';
			holder.appendChild(img);
		};
		try{
			reader.readAsDataURL(file);
		}catch (e) {
			storeD();
		}

	return false;
	};
	
	function storeD() {
		$("#sPhoto").val("");
		holder.innerHTML = '<img alt="기본사진"'
		+'src="resources/img/store/storeD.jpg" width="400" height="270">';
	}
	</script>
</html>