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
		받는 사람 : <input type="text" id="user1"/>
		보내는 사람 : <input type="text" readonly="readonly" value="${sessionScope.loginId }" id="user2"/>
		내용 : <textarea rows="10" cols="10" style="resize: none;" id="dm_content"></textarea>
		
		<button id="dm_exit">닫기</button>
		<button id="dm_write">보내기</button>
	</body>
	<script>
		var overlay = false;
		//받는 사람 아이디 있는지 체크
		$("#user1").focusout(function () {
			$.ajax({
				url : "./rest/overlay",
				type : "get",
				data : {
					id : $("#user1").val()
				},
				dataType : "json",
				success : function (data) {
					console.log(data);
					if(data.use != "N"){
						$("#user1").val("");
						alert("아이디X");
					}else{
						overlay = true;
						alert("아이디O");
						$("#dm_content").focus();
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
		
		//쪽지 보내기
		$("#dm_write").click(function () {
			var user1 = $("#user1").val();
			var dm_content = $("#dm_content").val();
			if(user1 == ""){
				alert("유저 아이디 작성");
			}else if(dm_content == ""){
				alert("쪽지 내용 입력")
			}else if(overlay == false){
				alert("받는 사람 아이디 확인")
			}else{
				$.ajax({
					url : "./dm_write",
					type : "get",
					data : {
						user1 : user1,
						user2 : $("#user2").val(),
						dm_content : dm_content
					},
					dataType : "json",
					success : function (data) {
						console.log(data);
						if(data.result > 0){
							alert(data.msg);
						}
					},
					error : function (error) {
						console.log(error);
					}
				});
			}
		});
		
		$("#dm_exit").click(function () {
			self.close();
		});
	</script>
</html>