<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#nav ul li{list-style: none;  display: inline;	padding: 0px 10px;}
	#nav a{text-decoration: none; color: white; }    
	#mainFrame{
		position: relative;
		background-color: navy; 
		padding:5px; width:100%; height: 80px;
	}
	#logoBox{
		position:absolute;
		top:10px;
		left: 10px;
	}
	#searchBox{
		position:absolute;
		top:20px;
		left: 450px;
	}
	#menuBox{
		position:absolute;
		top:30px;
		left: 1000px;
	}
	  
	input:-ms-input-placeholder{color:#a8a8a8;}
	input:-webkit-input-placeholder{color:#a8a8a8;}
	input:-moz-input-placeholder{color:#a8a8a8;}
                
	#searchBox{ width: 400px; height: 40px; border: 1px solid #1b5ac2; background-color: #ffffff; float:left;}    
	/* #menu{position: absolute; top: 17px; left: 500px;} */
	
	#nav input{font-size: 16px; width: 325px; padding: 10px; border: 0px; outline: none; }
	#nav button{width: 50px; height: 100%; border: 0px; background-color: #1b5ac2; outline: none; float: right; color:#ffffff;}
</style>
<nav id="nav">
	<div id="mainFrame">
		<div id="logoBox">
			<img alt="logo" src="resources/img/logo/logo_cat.png">
		</div>
        <div id="searchBox">
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
<<<<<<< HEAD

=======
<script>
	function search(){
		location.href = "./search?search_content=" + $("#search_content").val();
	}
</script>
>>>>>>> 82028e90c7c6e4434b55a04b12eb7e52adde7ec7
