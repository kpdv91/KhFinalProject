<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<title>CAT :: 맛집 SNS</title>
	<style>
	input[type=button]{
            vertical-align: middle;
            padding: 0px 5px;
            background-color: #33aaaaff;
            color: white;
            border-radius: 7px;
            width: 70px;
            height: 27px;
            outline: 0px;
            border: 0px;
       }
       #review_Write{
       		margin-left: 490px;
       }
	</style>
	</head>
	<body>
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		
		<input id="review_Write" type="button" value="리뷰 작성" onclick="reviewWrite()"/><br/><br/>
		<c:import url="/WEB-INF/views/review/reviewList.jsp"/>
	
		<c:import url="/WEB-INF/views/include/main/footer.jsp"/>
	</body>
	


<script>

	function reviewWrite(){
		location.href="./reviewWritePage";
	}


   
</script>
</html>