<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
    div{
        border: solid 2px navy;
        width: 380px;
        padding: 5%;
        margin-top: 7%;
        position: absolute;
    
        margin: -150px 0 0 -75px;
        top: 50%;
        left: 40%;      
    }
    table,th,td{
		border-collapse: collapse;
        padding: 5px;     
	}
    #loginBtn{
        background-color: #088A85;
        color: aliceblue;
        padding-top: 21px;
        padding-bottom: 21px;
        padding-left: 10px;
        padding-right: 10px;
    }
    input[type=button] { 
        border:solid 1px blue;
        margin-right: 
    }    
	</style>
</head>
<body>
<div>
    <table>
   	     <tr>
            <td>아 이 디 &nbsp : </td>
            <td><input type="text" id="userId" placeholder="아이디"></td>
            <td rowspan="2"><input id="loginBtn" type="button" value="로그인"></td>
         </tr>
         <tr>
            <td>비밀번호&nbsp&nbsp: </td>
            <td><input type="password" id="userPw" placeholder="비밀번호"></td>            
         </tr>
         <tr>
           <td colspan="3">
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input onclick ="join()" type="button" value="회원가입">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
           <input type="button" value="ID 찾기">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="button" value="PW 찾기">
           </td>
         </tr>
   </table>
</div>
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
				location.href="main.jsp";
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