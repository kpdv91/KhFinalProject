<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
			div{
		        width: 300px;
		        padding: 5%;
		        margin-top: 7%;
		        position: absolute;
		        background-color: #163D7B;    
		        margin: -150px 0 0 -150px;
		        top: 50%;
		        left: 45%;      
		    }
		    table,th,td{
				border-collapse: collapse;
		        padding: 5px;
		        color: aliceblue;
			}
		    input[type=button] { 
		        /* border:solid 1px blue;
		        background-color: #088A85;
		        color: aliceblue; */
		        background-color: #33aaaaff;
     			color: white;
       			border: 0px;
		    }    
		</style>
	</head>
	<body>
		<!-- 아이디 : <input type="text" id="user_id"/>
		이름 : <input type="text" id="user_name"/>
		이메일 : <input type="text" id="user_email"/>  
		<br/><br/>    
		<button id="pwFindBtn">비밀번호 찾기</button>
		<br><br>
		<span id="msg"></span> -->
	<div>
    <table>
         <tr>
            <td>아이디 &nbsp : </td>
            <td><input type="text" id="user_id" placeholder="아이디"></td>
         </tr>   
   	     <tr>
            <td>이름 &nbsp&nbsp&nbsp&nbsp : </td>
            <td><input type="text" id="user_name" placeholder="이름"></td>
         </tr>
         <tr>
            <td>이메일 &nbsp&nbsp: </td>
            <td><input type="email" id="user_email" placeholder="이메일"></td>            
         </tr>
         <tr>
           <td colspan="3">
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp
           <input type="button" id="pwFindBtn" value="찾기">
           <br/><br/>
			<span id="msg"></span>
           </td>
         </tr>
   	</table>
	</div>
	</body>
	<script>
		$("#pwFindBtn").click(function () {
			if($("#user_id").val()==""){  
				$("#msg").html("아이디 입력");
				$("#user_id").focus();
			}else if($("#user_name").val()==""){
				$("#msg").html("이름 입력");
				$("#user_name").focus();
			}else if($("#user_email").val()==""){
				$("#msg").html("이메일 입력");
				$("#user_email").focus();
			}else{
				$.ajax({
					type : "post",
					url : "./pwFind",
					data : {
						id : $("#user_id").val(),
						name : $("#user_name").val(),
						email : $("#user_email").val()  
					},
					dataType : "json",
					success : function (data) {
						console.log(data.msg);
						console.log(data.changeResult);
						if(data.changeResult > 0){
							$("#msg").html(data.msg);
						}else{
							$("#msg").html(data.msg);
						}
					},
					error : function (error) {
						console.log(error);
					}
				});
			}
			
		});
	</script>
</html>