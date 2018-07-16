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
    #idresult {
    	font-size: 10px;
    }
    #find {
    	position: 
    }  
	</style>
</head>
<body>
<!-- <form id="findId" name="findId" method="post"> -->
<div>
    <table>
   	     <tr>
            <td>이름 &nbsp&nbsp&nbsp&nbsp : </td>
            <td><input type="text" name="userName" id="userName" placeholder="이름"></td>
         </tr>
         <tr>
            <td>이메일 &nbsp&nbsp: </td>
            <td><input type="email" name="userEmail" id="userEmail" placeholder="이메일"></td>            
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
           <span id="idresult"></span>
           </td>
         </tr>
   </table>
</div>
<!-- </form> -->
</body>
<script>
	
	var msg= "${msg}";
	
	if(msg!=""){
		alert(msg);
	}
	
	var find= "${find}";
	
	var findId = "${sessionScope.findId}";
	
	//var res = findId.replace(findId.length()-1, findId.length()-2, "*" );
	
	/* if(find!=""){
		alert(find);
	} */
	
	
	 $("#find").click(function(){
		 /* $("#idresult").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+find+" 입니다.</h1>")
		 console.log(find); */
		 $("#idresult").empty();
		 //$("#idresult").append("${sessionScope.findId}");
		 
		$.ajax({
			url:"./findId",
			type:"post",
			dataType:"json",
			data:{
				/* "userName" : /* $("#userName").val(),  
				"userEmail" : /* $("#userEmail").val()  */
				userName : $("#userName").val(),
				userEmail : $("#userEmail").val()
			},
			success:function(data){
				//console.log(data);
				//if("${sessionScope.findId}" != null) {
					//console.log("111111");
					//$("#idresult").append("${sessionScope.findId}");
				//}
				//$("#idresult").append("${sessionScope.findId}");
				//console.log("${sessionScope.findId}");
				
				//complain_list(data.list);
			},
			error:function(error){
				console.log(error);
			}
		}); 
		if(findId2 == 0) {
			$("#idresult").append("<h3>"+"회원님의 정보가 일치하지 않습니다.</h3>");
		}
		 if(findId != null) {
			$("#idresult").append("<h3>"+"회원님의 아이디는 "+findId+" 입니다.</h3>");
			console.log(findId);
			//console.log(res);
		} 
		 

		if($("input[name='userName']").val()==""){//아이디
		    alert("이름을 입력해주세요!!");
		    $("input[name='userName']").focus();
		    //return false;
		}else if($("input[name='userEmail']").val()==""){//비밀번호
		   	alert("이메일를 입력해주세요!!");
		   	$("input[name='userEmail']").focus();
		   	//return false;
		}else {
			
			//$("#idresult").append("11111");
			//$("#findId").submit();//submit
		}
	});
 

 
</script>
</html>