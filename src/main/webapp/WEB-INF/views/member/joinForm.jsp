<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>회원정보 수정</title>
		<style>
            table,td,th {
                
            }
            
            div{
                border: solid 2px navy; 
                width: 380px;
                padding: 4%;
                margin-top: 7%;
                /*position: absolute;*/

                /*margin: -150px 0 0 -75px;
                top: 50%;
                left: 40%;      */
    }
			#div1 {
				height : 150px;
				width : 150px;
				float : left;              
			}
            #div2 {
                width: 800px;
                float : left;
            }
			#profile {
				height : 150px;
				width : 150px;
				border : 1px solid black;
				text-align: center;       
			}
            button {
                margin-top: 5px;
                background-color:#088A85;
                color: aliceblue;
            }
            #confirmPw{
                text-align: center;
                font-size: 12px;
                color: red;
            }
		</style>
	</head>
	<body>
		<form action="join" method="post">
		<div id="div1" >
			<div id="profile" style='display:table-cell;vertical-align:middle'/>
				
			</div>
            <!--<div id="pic">-->
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="selPicture">사진찾기</button>
            <!--</div>-->
		</div>
        <div id="div2">
        <table>
        <tr>
            <th>아이디 : </th>
            <td><input type="text" id="userId" name="userId" placeholder="아이디"></td>
            <td><button>중복체크</button></td>
            <td id="idChk">아이디가 중복 되었습니다.</td>
         </tr>
         <tr>
            <th>비밀번호 : </th>
            <td><input type="password" id="userPw" name="userPw" placeholder="비밀번호" ></td>
         </tr>
         <tr>
            <th>비밀번호확인 : </th>
            <td><input type="password" id="userPwChk" name="userPwChk" placeholder="비밀번호확인" onkeyup="chk2()"></td>           
         </tr>
         <tr>
          
            <td id="confirmPw" colspan="2"><span></span></td>           
         </tr>   
         <th>이름 : </th>
            <td><input type="text" id="userName" name="userName" placeholder="이름"></td>
         <tr>
            <th>이메일 : </th>
            <td><input type="email" id="userEmail" name="userEmail" placeholder="이메일"></td>
         </tr>
         <th>핸드폰번호</th>
        <td>
            <input id="hp1" name="hp1" type="text" class="frm_input tel" size="3" maxlength="3" placeholder="01X"/>-
            <input id="hp2" name="hp2" type="text" class="frm_input tel" size="3" maxlength="4" placeholder="XXXX"/>-
            <input id="hp3" name="hp3" type="text" class="frm_input tel" size="3" maxlength="4" placeholder="XXXX"/>
            <button type="button" id="test" onclick="hap()">테스트</button>
        </td>
        <tr>
            <td></td>
            
            <td>
                <button id="cancel" onclick="">취소</button>
                <button id="joinId">가입</button>
            </td>
        </tr>
        </div>
	</table>
	</form>
	</body>
	<script>
		$("#join").click(function () {
			location.href = "./loginForm";
		});
		
		var txt=document.getElementsByTagName("input");
	    var ms=document.querySelector("span");
    
	    function chk2(){
	        //두 인풋의 일치여부 확인	      	  	        
	        var scd=txt[1].value;
	        var thd=txt[2].value;
	        
	        //일치 여부 확인후 출력
	        if(scd==thd){
	            ms.innerHTML="비밀번호가 일치합니다";
	            ms.style.color="green";
	        }else{
	            ms.innerHTML="비밀번호가 일치하지않습니다.";
	            ms.style.color="red";
	        }
	    }
	 
	    function hap(){
	    	var phone = $("#hp1").val()+"-"+$("#hp2").val()+"-"+$("#hp3").val();
	    	console.log(phone);
	    }
	</script>
</html>