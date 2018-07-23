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
<!-- <form id="findId" name="findId" method="post"> -->
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
<!-- </form> -->
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
	
	
	
	
	
	
	
	
	
/* 	var msg= "${msg}";
	
	if(msg!=""){
		alert(msg);
	}
	
	var find= "${find}";
	
	var findId = "${sessionScope.findId}";
	var findId = "${findId}";
	var findId2 = "${findId2}";
	
	var res = findId.replace(findId.length()-1, findId.length()-2, "*" );
	
	if(find!=""){
		alert(find);
	}  */
/* 	
	var chkSum = 0;
    // 중복확인과 회원가입 아작스 사용하기 위해 url,data를 선언
    var url;
    var data;
    var idVal=0;//ID 중복확인 체크해주는 값
    var pwVal=0;//PW 중복확인 체크해주는 값
	
	
	//중복 확인
    $("#find").click(function(){
        data ={};
        data.name = $("#userName").val(),
        data.email = $("#userEmail").val()
        ajaxCall("./rest/findId",data);
        
    });   
    
    //ajax 실행
    function ajaxCall(reqUrl, reqData){
        $.ajax({
            url:reqUrl,
            type:'get',
            dataType:'json',
            data: reqData,
            success:function(d){
                console.log(d);
                console.log(d.test);
                if(reqUrl=="./rest/findId"){
                    if(d.use == "Y"){
                        chkSum ++;
                        alert("사용 가능한 아이디 입니다.");
                        idVal=1;
                    }else{
                        alert("누군가가 사용 하고 있는 아이디 입니다.");
                        //$("#userName").val("");
                    }
                }else{
                    if(d.success == 1){
                        alert("가입에 성공 하였습니다.");
                        location.href="./";
                    }else{
                        alert("가입에 실패 하였습니다. 다시 입력 해 주세요!");
                    }
                }
            },
            error:function(e){
                console.log(e);
            }                
        });            
    }
	 */
	
	



/* 
	
	 $("#find").click(function(){
		 //$("#idresult").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+find+" 입니다.</h1>")
		 //console.log(find);
		 //$("#idresult").empty();
		 //$("#idresult").append("${sessionScope.findId}");
		 //console.log(find);
			

		 
		$.ajax({
			url:"./findId",
			type:"post",
			dataType:"json",
			data:{
				userName : $("#userName").val(),
				userEmail : $("#userEmail").val()
			},
			success:function(data){
				if($("#userName").val().equals("p")) {
					console.log("이름은 p ");
				}
				//$("#idresult").append("<h3>"+"회원님의 아이디는 "+"$(find)"+" 입니다.</h3>");
				
				 if(data.success>0){
					$("#idresult").append("<h3>"+"회원님의 아이디는 "+findId2+" 입니다.</h3>");
					console.log(findId2);
				} else if(findId == 0) {
					$("#idresult").append("<h3>"+"회원님의 정보가 일치하지 않습니다.</h3>");
					console.log(findId)
				} 

				
				
			},
			error:function(error){
				console.log(error);
			}
		}); 
		


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
  */

 
</script>
</html>