<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<title>파일 업로드</title>
	<style>
	</style>
	</head>
	<body>
		<form id="photoUpload" action="./menuUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="file" onchange="photoUpload()"/>
		</form>
		업로드한 파일 경로 : <span></span>
	</body>
	<script>
	function photoUpload(){
		$("#photoUpload").submit();
	}
	
	var filePath = "${path}";
	$("span").text(filePath);
	
	if(filePath != ""){
		var content = "";//img태그
		var elem = window.opener.document.getElementById("editable");
		content +="<img width='250' src='${path}'/>";
		content +="<input class='delBtn' id='${path}' type='button' value='삭제' onclick='del(this)'/><br>";
		elem.innerHTML += content;
		self.close();
	}
	</script>
</html>