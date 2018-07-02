<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#nav{ background-color: navy; padding:5px; width:100%; height: 100px;}
	#nav ul li{list-style: none;  display: inline;}
	#nav a{text-decoration: none; color: white; }    
	#logo{float:left;}    
	input:-ms-input-placeholder{color:#a8a8a8;}
	input:-webkit-input-placeholder{color:#a8a8a8;}
	input:-moz-input-placeholder{color:#a8a8a8;}
                
	#search{ width: 400px; height: 40px; border: 1px solid #1b5ac2; background-color: #ffffff; float:left;}    
	/* #menu{position: absolute; top: 17px; left: 500px;} */
	
	#nav input{font-size: 16px; width: 325px; padding: 10px; border: 0px; outline: none; }
	#nav button{width: 50px; height: 100%; border: 0px; background-color: #1b5ac2; outline: none; float: right; color:#ffffff;}
</style>
<nav id="nav">
	<ul>
		<li id="logo"><img alt="logo" src="resources/img/logo/logo_cat.png"></li>
		<li>
            <div id="search">
                <input type="text"/>
                <button>검색</button>
        	</div>
        </li>
		<li><a href="#">게시판</a></li>
		<c:if test="${ sessionScope.user == null}">
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</c:if>
	</ul>
</nav>
