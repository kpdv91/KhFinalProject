<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
			div#tableDiv{position: relative; top: 100px; left: 400px; border: 1px solid black; width: 500px; height: 500px;}
			
			table, th, td{border: 1px solid black; border-collapse: collapse;}
			table{position: absolute; top: 60px; left: 10px;}
			th{width: 117px; height: 30px;} 
			button#write{position: absolute; top:20px; left: 422px; width:auto; height: 30px; background-color: lightskyblue; border: none;}  
		</style>
	</head>
	<body>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<div id="tableDiv">
			<table>
				<tr>
					<th>쿠폰이름</th>
					<th>필요한 포인트</th>
					<th>구매</th>
				</tr>
				<tr>
					<td>1000 쿠폰</td>
					<td>1000 point</td>
					<td><button class="btn" id="1000" name="1000 쿠폰">구매</button></td>
				</tr>
				<tr>
					<td>2000 쿠폰</td>
					<td>2000 point</td>
					<td><button class="btn" id="2000">구매</button></td>
				</tr>
				<tr>
					<td>3000 쿠폰</td>
					<td>3000 point</td>
					<td><button class="btn" id="3000">구매</button></td>
				</tr>
			</table>
		</div>
	</body>
	<script>
	
	//printList 구매 버튼 
	$(".btn").click(function (e) {
		console.log($(this).attr("id"));
		console.log($(this).attr("name"));
		/* $.ajax({ 
			type : "post",
			url : "./couponPurchase",
			data : {
				price : $(this).attr("id"),
				name : $(this).attr("name")
			},
			dataType : "json",
			success : function (data) {
				console.log(data);
				
			},
			error : function (error) {
				console.log(error);
			}
		}); */
	});
	
	
	/* $(document).ready(function() {
		$.ajax({
			type : "post",
			url : "./couponShop",
			dataType : "json",
			success : function (data) {
				console.log(data);
				if(data.list != null){
					printList(data.list);
				}
			},
			error : function (error) {
				console.log(error);
			}
		});
	}); */
	
	
	//받아온 리스트
	/* function printList(list) {
		var content = "";
		list.forEach(function(item, idx) {
			content += "<tr>";
			content += "<td>"+item.couponBox_name+"</td>";
			content += "<td>"+item.couponBox_price+"</td>";
			content += "<td><button id='"+item.couponBox_code+"' class='btn'>구매</button></td>";
			content += "</tr>";
		});
		$("#list").empty();
		$("#list").append(content);
		
		console.log($("").attr("id"));   
	} */
	
	

	</script>
</html>