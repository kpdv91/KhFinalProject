<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>		
			table, th{border: 1px solid black;border-top: 1px solid black;border-collapse: collapse;padding: 5px 10px;}
			td{border: 1px solid black;width: 100px;border-collapse: collapse;padding: 5px 10px;}
			#messageid{width: 200px;}
			#messagecontent{height: 200px;}
			#close{position: absolute;left: 300px;}
			#reply{position: absolute;left: 250px;}
		</style>
	</head>
	<body>
		<table>
 	<tr>
 		<td id="messagetype">${name}</td>
 		<td id="messageid">${detail.dm_id}</td>
 	</tr>
 	<tr>
 		<td id="messagecontent" colspan="2">${detail.dm_content}</td>
 	</tr>
 </table>
 <button id="reply">답장</button>
 <button id="close">닫기</button>
	</body>
	<script>	
	if("${name}"=="받는사람"){
		console.log("${name}");
		$("#messageid").html("${detail.id}")
		$("#reply").css("display","none");
	}
	$("#close").click(function(){
		self.close();
	})
	$("#reply").click(function(e){
		self.close();
		var myWin= window.open("./sendMessage","메세지보내기","width=500,height=500");
	})
	</script>
</html>