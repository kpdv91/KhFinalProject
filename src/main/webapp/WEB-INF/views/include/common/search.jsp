<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>검색</title>
		<style>
			#map{
				width:1000px;
				height:500px;
			}
			.storeTable, .storeTable tr, .storeTable td{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 5px 10px;
				text-align: center;
			}
			.storeTable th{
				width: 200px;
				display: inline-block;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
			}
			.storeTable{
				float: left;
				margin-right: 10px;
			}
			.storeImg{
				width: 250px;
				height: 250px;
			}
		</style>
	</head>
	<script>
		var mapLevel = 9;
		var mapLocation = "서울특별시";
	</script>
	<body>
		<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<c:import url="/WEB-INF/views/include/common/map.jsp"/>
		
		<c:forEach items="${list}" var="sto">
			<table class="storeTable">
				<tr>
					<td colspan="3"><img class="storeImg" src="resources/img/search.png" /></td>
				</tr>
				<tr>
					<td>상호명</td>
					<th><a href="#">${sto.store_name}</a></th>
					<td rowspan="2">하트</td>
				</tr>
				<tr>
					<td>주소</td>
					<th>${sto.store_addr}</th>
				</tr>
				<tr>
					<td colspan="3">해시태그</td>
				</tr>
			</table>
		</c:forEach>
	</body>
	<script>
	</script>
</html>