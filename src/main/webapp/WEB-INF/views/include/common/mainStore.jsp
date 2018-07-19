<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
			#searchPage{
				width:1100px;
				height: 500px;
				margin-bottom: 50px;
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
				margin: 10px;
			}
			.storeImg{
				width: 250px;
				height: 250px;
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
		<div id="searchPage"></div>
	
		<input id="mainStore" type="hidden" value="<c:out value="${param.mainStore}"/>">
	</body>
	<script>
		tableSort("리뷰 최신 순","");
		function tableSort(val, search_content) {
			$.ajax({
				url : "./searchSort",
				data : {data : val,search_content : search_content,mainStore:$("#mainStore").val()},
				success : function(data) {
 					console.log(data.list);
					console.log(data.list_hash);
					$("#searchPage").empty();
					storePrintList(data.list, data.list_hash);
				},
				error : function(e) {
					console.log(e)
				}
			});
		}
		
		//가게 리스트 출력
		function storePrintList(list,list_hash){		 
			var content = "";
			list.forEach(function(item,index){
				content += "<table class='storeTable' style='cursor:pointer;' onclick=location.href='storeDetail?store_idx="+item.store_idx+"'>";
				content += "<tr><td colspan='3'><img class='storeImg' src='resources/upload/store/"+item.store_photo+"' /></td></tr>";
				content += "<tr><td>상호명</td>";
				content += "<th><a href='#'>"+item.store_name+"</a></th><td rowspan='2'>하트</td></tr>";
				content += "<tr><td>주소</td>";
				content += "<th>"+item.store_addr+"</th></tr>";
				content += "<tr><td id='"+item.store_idx+"' colspan='3'>";
				
				list_hash[index].forEach(function(item){
					content += "<div id='hashtag'>#"+item.hash_tag+"</div>";
				});
				
				content += "</td></tr></table>";
			});
			$("#searchPage").append(content);
		}
	</script>
</html>