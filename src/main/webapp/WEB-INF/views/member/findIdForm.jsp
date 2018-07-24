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
       /*  border:solid 1px blue;
        background-color: #088A85;
        color: aliceblue; */
        background-color: #33aaaaff;
     	color: white;
        border: 0px;
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
<div>
    <table>
   	     <tr>
            <td>이름 &nbsp&nbsp&nbsp&nbsp : </td>
            <td><input type="text" name="nameSearch" id="nameSearch" placeholder="이름"></td>
         </tr>
         <tr>
            <td>이메일 &nbsp&nbsp: </td>
            <td><input type="email" name="emailSearch" id="emailSearch" placeholder="이메일"></td>            
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
         <tr>
         	<td colspan="3">
         		<span id="idresult"></span>
         	</td>
         </tr>
   </table>
</div>
</body>
<script>

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //이메일 정규식

	
	$(function() {
	    $("#find").click(function() {
	       if($("#nameSearch").val() == ""){
	         $("#nameSearch").focus();
	         alert("이름을 입력해주세요!!");
	      } else if($("#emailSearch").val() == ""){
	         $("#emailSearch").focus();
	         alert("이메일을 입력해주세요!!");
	      }else if(exptext.test($("input[name='emailSearch']").val())==false){//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
	  		alert("이메일 형식이 올바르지 않습니다.");
	  		$("#emailSearch").focus();
	  		return false;
	      } else{
	          var name=  $("#nameSearch").val(); 
	          var email=  $("#emailSearch").val(); 
	          
	       
	            $.ajax({
	               type : 'get',
	               url : "idSearchPage",
	               data : {"name": name, "email": email},                  
	               dataType : "json",   
	               contentType: "application/json; charset=UTF-8",
	                 success : function(data) {
	                   //alert(data.findId);
	                    $("#idresult").empty();
	                	$("#idresult").append(data.findId);
	               },
	               error : function(error) {
	                   //alert("다시 작성해주세요.");
	                   $("#idresult").empty();
	            	   $("#idresult").append("일치하는 정보가 없습니다.");
	               }
	           }); 
	      	}
	    });
	});
	
	
 
</script>
</html>