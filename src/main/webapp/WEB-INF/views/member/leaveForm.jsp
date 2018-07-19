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
        width: 300px;
        padding: 5%;
        margin-top: 7%;
        position: absolute;
        background-color: #163D7B;
        margin: -150px 0 0 -75px;
        top: 50%;
        left: 30%;      
    }
    table,th,td{
		border-collapse: collapse;
        padding: 5px;
        color: aliceblue;
	}
    input[type=button] { 
        border:solid 1px blue;
        background-color: #088A85;
        color: aliceblue;
    }
    #agree{
        font-size: 13px;
    }
	</style>
</head>
<body>
<form action="leave" id="leave" method="post">
<div>
    <table>
         <tr>
            <td>아이디 &nbsp : </td>
            <td><input type="text" id="userId" name="userId" placeholder="아이디"></td>
         </tr>   
   	     <tr>
            <td>비밀번호 : </td>
            <td><input type="password" id="userPw" name="userPw" placeholder="비밀번호"></td>
         </tr>
         <tr>
            <td id="agree" colspan="2">탈퇴를 원하시면 '동의합니다' 를 작성해주세요.</td>     
         </tr>
         <tr>
            <td colspan="2"><input type="text" id="writeAgree" name="writeAgree"></td>
         </tr>   
         <tr>
           <td colspan="3">
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp
           <input id="leaveId" type="button" value="탈퇴">
           </td>
         </tr>
   </table>
</div>
</form>
</body>
<script>

	var message= "${message}";
	
	if(message!=""){
		alert(message);
	}


	$("#leaveId").click(function(){	
	   	
		if($("input[name='userId']").val()==""){//아이디
	        alert("아이디를 입력해주세요!!");
	        $("input[name='userId']").focus();
	    }else if($("input[name='userPw']").val()==""){//비밀번호
	    	alert("비밀번호를 입력해주세요!!");
	    	$("input[name='userPw']").focus();
	    }else if($("input[name='writeAgree']").val()!="동의합니다"){
	    	alert("동의합니다를 입력해주세요!!");
	    	$("input[name='writeAgree']").focus();
	    }else{
	    	$("#leave").submit();//submit

		}
	});
	    

 
</script>
</html>