<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
	#nav ul li{list-style: none;  display: inline;	padding: 0px 10px;}
	#nav a{text-decoration: none; color: white; }    
	#mainFrame{position: relative;background-color: navy;padding:5px; width:100%; height: 80px;}
	#logoBox{position:absolute;top:10px;left: 10px;}
	#searchBox{position:absolute;top:20px;left: 450px;}
	#menuBox{position:absolute;top:30px;left: 1000px;}	  
	input:-ms-input-placeholder{color:#a8a8a8;}
	input:-webkit-input-placeholder{color:#a8a8a8;}
	input:-moz-input-placeholder{color:#a8a8a8;}            
	#searchBox{ width: 420px; height: 45px; border: 1px solid #1b5ac2; background-color: #ffffff; float:left;}    
	/* #menu{position: absolute; top: 17px; left: 500px;} */
	#nav select{font-size: 16px; width: 110px; padding: 10px; border: 0px; outline: none; }
	#nav input{font-size: 16px; width: 250px; padding: 10px; border: 0px; outline: none; }
	#nav button{width: 50px; height: 100%; border: 0px; background-color: #1b5ac2; outline: none; float: right; color:#ffffff;}
	#profileimg{width: 50px;height : 50px;position:absolute;left:500px;top:1px;}
</style>
<nav id="nav">
	<div id="mainFrame">
		<div id="logoBox">
			<img alt="logo" src="resources/img/logo/logo_cat.png">
		</div>
        <div id="searchBox">
        	<select id="searchMap" name="searchMap">
				<option value="전체" selected="selected" >전체</option>
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강북구">강북구</option>
				<option value="강서구">강서구</option>
				<option value="관악구">관악구</option>
				<option value="광진구">광진구</option>
				<option value="구로구">구로구</option>
				<option value="금천구">금천구</option>
				<option value="노원구">노원구</option>
				<option value="도봉구">도봉구</option>
				<option value="동대문구">동대문구</option>
				<option value="동작구">동작구</option>
				<option value="마포구">마포구</option>
				<option value="서대문구">서대문구</option>
				<option value="서초구">서초구</option>
				<option value="성동구">성동구</option>
				<option value="성북구">성북구</option>
				<option value="송파구">송파구</option>
				<option value="양천구">양천구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
				<option value="은평구">은평구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
				<option value="중랑구">중랑구</option>
			</select>
            <input type="text" id="search_content"/>
            <button type="button" onclick="search()">검색</button>
       	</div>
        <div id="menuBox">
	        <ul>
			<li><a href="./boardListPage">게시판</a></li>
			<c:if test="${ sessionScope.loginId == null}">
				<li><a href="loginForm">로그인</a></li>
				<li><a href="joinForm">회원가입</a></li>
			</c:if>
			<c:if test="${ sessionScope.loginId != null}">
				<li><a href="./couponShopPage">쿠폰샵</a></li>
				<!-- <li><img src="resources/img/member/noprofile.jpg" width="40px" height="40px"/> -->
			</c:if>
			
			</ul>
		</div>
	</div>
</nav>

<script>
	function search(){
		location.href = "./search?search_content=" + $("#search_content").val()+"&searchMap=" + $("#searchMap").val();
	};
	$( document ).ready(function() {
		var loginid="${sessionScope.loginId}";
	    if(loginid != null){
	    	$.ajax({
				url:"./profileimg",
				type:"post",
				data:{
					id : loginid
				},
				dataType:"json",
				success:function(d){
					console.log(d);
					$("#profileimg").attr("src",'resources/upload/'+d.profileimg.profile);
				},
				error:function(e){
					console.log(e);
				}
			});	    
	    	//$("#profileimg").attr("src",'resources/upload/'+data.list[0].place_photo);
	    }
	});
</script>
