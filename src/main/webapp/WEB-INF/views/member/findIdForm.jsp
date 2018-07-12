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
        left: 40%;      
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
	</style>
</head>
<body>
<form id="findId" action="./findId" method="post">
<div>
    <table>
   	     <tr>
            <td>이름 &nbsp&nbsp&nbsp&nbsp : </td>
            <td><input type="text" name="userName" placeholder="이름"></td>
         </tr>
         <tr>
            <td>이메일 &nbsp&nbsp: </td>
            <td><input type="email" name="userEmail" placeholder="이메일"></td>            
         </tr>
         <tr>
           <td colspan="3">
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp
           <input id="find" type="button" value="찾기">
           </td>
         </tr>
   </table>
</div>
</form>
</body>
<script>
	
	$("#find").click(function(){

		if($("input[name='userName']").val()==""){//아이디
		    alert("이름을 입력해주세요!!");
		    $("input[name='userName']").focus();
		    //return false;
		}else if($("input[name='userEmail']").val()==""){//비밀번호
		   	alert("이메일를 입력해주세요!!");
		   	$("input[name='userEmail']").focus();
		   	//return false;
		}else {
			var msg= "${msg}";
			if(msg!=""){
			alert(msg);
			}
			$("#findId").submit();//submit
		}
	});
 

 
</script>
</html>