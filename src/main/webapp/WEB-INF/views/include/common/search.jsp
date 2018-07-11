<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>검색</title>
		<style>
			#searchPage{
				width:1010px;
			}
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
				margin-top: 10px;
			}
			.storeImg{
				width: 250px;
				height: 250px;
			}
			#sortSel{
				height: 30px;
				float: right;
				border-radius: 5px;
			}
			#hashtag{
	        	border: 2px solid #33aaaaff;
	            font-size: 14px;
	            width: auto;            
	            text-align: center; 
	            float: left;
	            padding: 0px 5px;
	            margin-right: 5px;
	        }
		</style>
	</head>
	
	<body>
		
		<script>
			var mapLocation = new Array();
			var mapContent = new Array();
			var mapLevel = 9;
			<c:forEach items="${list}" var="sto">
				mapContent.push("${sto.store_name}");
				mapLocation.push("${sto.store_addr}");
			</c:forEach>
		</script>
	
		<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
		<div id="searchPage">
		<c:import url="/WEB-INF/views/include/common/map.jsp"/><br/>
		
		<select id="sortSel" name="sortSel" onchange="sort(this.value)">
			<option value="리뷰 최신 순" selected="selected" >리뷰 최신 순</option>
			<option value="별점 순">별점 순</option>
			<option value="조회수 순">조회수 순</option>
			<option value="리뷰수 순">리뷰수 순</option>
		</select>
		<br/><br/>
		
		<c:forEach items="${list}" var="sto" varStatus="status">
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
					<td colspan="3">
						<c:set var="i" value="${status.index}"/>
						<c:forEach items="${list_hash[i]}" var="hash">
							<div id='hashtag'>#${hash.hash_tag}</div>
						</c:forEach>
					</td>
				</tr>
			</table>
		</c:forEach>
		</div>
	</body>
	<script>
		function sort(val){
			switch (val) {
			case "리뷰 최신 순":
				console.log("1");
				//tableSort(val,content);
				break;
			case "별점 순":
				console.log("2");
				//tableSort(val,content);
				break;
			case "조회수 순":
				console.log("3");
				//tableSort(val,content);
				break;
			case "리뷰수 순":
				console.log("4");
				//tableSort(val,content);
				break;
			}
		}
		
		var content = "<%=request.getParameter("search_content") %>";
		//정렬
		function tableSort(val,content){
			$.ajax({
				url:"./searchSort",
				data:{data:val,content:content},
				success:function(data){
					//console.log(data.list);
					//$("#searchlist").empty();
					//listPrint(data.list);
					/*
					if(data.success == 1){
						//이미지삭제
						$(elem).prev().remove();
						//버튼삭제
						$(elem).remove();
					}
					*/
				},
				error:function(e){
					console.log(e)
				}
			});
		}
	</script>
</html>