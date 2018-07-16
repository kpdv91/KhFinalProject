<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style></style>
	</head>
	<body>
		<input type="hidden" id="store_idx" value="${store_idx }"/>
		받는 사람 : <input type="text" readonly="readonly" id="dm_id" value="${id }"/><br/><br/>
		내용 : <textarea rows="10" cols="7" style="resize: none;" id="dm_content"></textarea>
		<br/><br/>
		<button id="win_exit">닫기</button>
		<button id="dm_write">보내기</button>
		
	</body>
	<script>
		$("#dm_write").click(function () {
			$.ajax({
				url:"./dm_write_regNo",
				type:"post",
				data:{
					store_idx : $("#store_idx").val(),
					id : $("#dm_id").val(),
					dm_content : $("#dm_content").val()
				},
				dataType:"json",
				success:function(data){
					console.log(data);			
					alert(data.msg);
				},
				error:function(error){
					console.log(error);
				}
			});
		});
	</script>
</html>