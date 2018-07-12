<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ID 찾기</title>
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
	
<form id="login" action="login" method="post">
<div>
	
    <table>
   	     <tr>
            <td>아 이 디 &nbsp : </td>
            <td><input type="text" name="id" placeholder="아이디"></td>
            <td rowspan="2"> <input id="loginBtn" type="button" value="로그인"> <!-- <button>로그인</button> --></td>
         </tr>
         <tr>
            <td>비밀번호&nbsp&nbsp: </td>
            <td><input type="password" name="pw" placeholder="비밀번호"></td>            
         </tr>
         <tr>
           <td colspan="3">
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input onclick ="join()" type="button" value="회원가입">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
           <input type="button" onclick ="popupOpen()" value="ID 찾기">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="button" value="PW 찾기">
           </td>
         </tr>
   </table>
   
</div>
</form>
</body>
<script>


	function join() {
		location.href="./joinForm";
	};
	
	function findId() {
		//location.href="./findIdForm";
		
		 /* window.open("./findIdForm","","top=0, left=0, width=800, height=556, directories='no', location=no, menubar=no, resizable=no, status=yes, toolbar=no")  ;
	     
	     window.opener = "nothing";
	     window.open('', '_parent', '');
	     window.close(); */
	};
	
	function popupOpen(){

		var popUrl = "./findIdForm";	//팝업창에 출력될 페이지 URL

		var popOption = "top=0, left=0, width=800, height=556, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);

		}



/* var idReg = /^[a-z]+[a-z0-9]{4,19}$/g;
if( !idReg.test( $("input[name=id]").val() ) ) {
    alert("아이디는 영문자로 시작하는 5~20자 영문자 또는 숫자이어야 합니다.");
    return; 
}  */



/* if(UserPassword.value.length<8) {
    alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
    return false;
  } 
  
   if(!UserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
      alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
    return false;
  }
 
  return true;
} */

//var idReg = /^[a-z0-9]+[a-z0-9]{4,19}$/g;
var idReg = /^[A-za-z0-9]{5,20}/g;


$("#loginBtn").click(function(){
	
	if($("input[name='id']").val()==""){//아이디
        alert("아이디를 입력해주세요!!");
        $("input[name='id']").focus();
        return false;
   }else if($("input[name='pw']").val()==""){//비밀번호
	   	alert("비밀번호를 입력해주세요!!");
	   	$("input[name='pw']").focus();
	   	return false;
   
   }else if($("input[name='pw']").val().length<8 || $("input[name='pw']").val().length>16){	//비밀번호 유효성
   		alert("비밀번호는 8~16자를 입력해주세요.");
   		return false;
   }else if(!idReg.test( $("input[name='id']").val() )){	//id 유효성
  		alert("아이디는 5~20자리의 영문자 또는 숫자이어야 합니다.");
  		return false;
   }else{
	   var msg= "${msg}";
		if(msg!=""){
		alert(msg);
		}
   		$("#login").submit();//submit
   }
});		



</script>
</html>