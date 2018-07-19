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
		<input type="hidden" id="review_idx" value="${rev_idx }"/>
		<input type="hidden" id="reviewReply_idx" value="${revReply_idx }"/>
		<input type="hidden" id="id" value="${id }"/>
		받는 사람 : <input type="text" readonly="readonly" id="dm_complain_id" value="${complain_id }"/><br/><br/>
		내용 : <textarea rows="10" cols="7" style="resize: none;" id="dm_content"></textarea>
		<br/><br/>
		<button id="win_exit">닫기</button>
		<button id="dm_write">보내기</button>
		
	</body>
	<script>
		$("#win_exit").click(function () {
			
		});
	
		$("#dm_write").click(function () {
			$.ajax({
				url:"./dm_write_rev_revRe_del",
				type:"post",
				data:{
					review_idx : $("#review_idx").val(),
					reviewReply_idx : $("#reviewReply_idx").val(),
					id : $("#id").val(),
					complain_id : $("#dm_complain_id").val(),
					dm_content : $("#dm_content").val()
				},
				dataType:"json",
				success:function(data){
					console.log(data.result);
					console.log(data.msg);
					if(data.result > 0){
						alert(data.msg);
						self.close();
					}
				},
				error:function(error){
					console.log(error);
				}
			});
		});
	</script>
</html>