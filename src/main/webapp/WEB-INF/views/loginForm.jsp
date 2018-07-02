<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style>
	table,th,td{
		border : 1px solid black;
		border-collapse: collapse;
	}
	</style>
</head>
<body>
<table>
   	     <tr>
            <th>아이디 : </th>
            <td><input type="text" id="userId" placeholder="아이디"></td>
            <td rowspan="2"><input id="loginBtn" type="button" value="로그인"></td>
         </tr>
         <tr>
            <th>비밀번호 : </th>
            <td><input type="password" id="userPw" placeholder="비밀번호"></td>            
         </tr>
         <tr>
           <td colspan="3">
           <input onclick ="join()" type="button" value="회원가입">
           <input type="button" value="ID/PW 찾기">
           </td>
         </tr>
   </table>
</body>
<script>
function join() {
	location.href="JoinForm.html";
};
$("#loginBtn").click(function(){
	console.log("클릭");
	//키와 값으로 복수개가 들어간다.
	//type: [post|get], url: 어디로 보낼 것인가? 
	//data: 어떤 파라메터와 값?, dataType: [json|xml|text|html|jsonp]
	//success: 성공시 할 일, error: 실패시 할 일
	$.ajax({
		type:"post",
		url:"./login",
		data:{
			id:$("#userId").val(),
			pw:$("#userPw").val()
		},
		dataType:"json",
		success:function(data){//인자 값은 서버에서 주는 메시지
			console.log(data);
			if(data.success){
				alert("로그인에 성공 했습니다.");	
				location.href="main.html";
			}else{
				alert("로그인에 실패 했습니다.");
			}
		},
		error:function(err){//인자 값은 서버에서 주는 에러 메시지
			console.log(err)
		}
	});
});
</script>
</html>