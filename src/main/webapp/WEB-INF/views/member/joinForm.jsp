<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>회원가입</title>
		<style>
            table,td,th {
                
            }
            
            div{
                /* border: solid 2px navy;   */
                width: 380px;
                padding: 4%;
                margin-top: 7%;
                /* margin-left: 12%;  */
                /* position: absolute; */

                /* margin: -150px 0 0 -75px 
                top: 50%;
                left: 40%;  */     
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
		<form action="join" id="join" method="post">
		<div id="div1" >
			<div id="profile">
				
			</div>
            <!--<div id="pic">-->
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input type="button" onclick="FileUp()" value="사진찾기"/>
            <!--</div>-->
		</div>
        <div id="div2">
        <table>
        <tr>
            <th>아이디 : </th>
            <td><input type="text" id="userId" name="userId" placeholder="아이디"></td>
            <td><button>중복체크</button></td>
            <td id="idChk"></td>
         </tr>
         <tr>
            <th>비밀번호 : </th>
            <td><input type="password" id="userPw" name="userPw" onkeyup="chk2()" placeholder="비밀번호" ></td>
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
            <input type="hidden" id="userPhone" name="userPhone"/>
        </td>
        <tr>
            <td></td>
            
            <td>
                <input id="cancel" type="button" onclick="location.href='#'" value="취소"/>
                <input id="joinId" type="button" value="가입"/>
            </td>
        </tr>
        </div>
	</table>
	</form>
	</body>
	<script>
	/* 
	function nullChk(){
	
	
	} */
	var pwChkVal=0;
	
	//회원 가입 클릭시
	$("#joinId").click(function(){
        /* else if($("#profile").val()==""){//사진
    	alert("프로필 사진을 등록해주세요!!");
        $("#profile").focus();
        }
     */
		
		if($("input[name='userId']").val()==""){//아이디
	        alert("아이디를 입력해주세요!!");
	        $("input[name='userId']").focus();
        }else if($("input[name='userPw']").val()==""){//비밀번호
        	alert("비밀번호를 입력해주세요!!");
        	$("input[name='userPw']").focus();
        }else if($("input[name='userName']").val()==""){//이름
        	alert("이름을 입력해주세요!!");
            $("input[name='userName']").focus();
        }else if($("input[name='userEmail']").val()==""){//이메일
        	alert("이메일을 입력해주세요!!");
            $("input[name='userEmail']").focus();
        }else if($("#hp1").val()==""||$("#hp2").val()==""||$("#hp3").val()==""){//핸드폰번호
        	alert("핸드폰번호를 입력해주세요!!");
            $("input[name='#hp1']").focus();
        }else if(pwChkVal==0){
            alert("비번확인");
            		
        }else{	

			//핸드폰 번호 합치기
	    	var phone = $("#hp1").val()+"-"+$("#hp2").val()+"-"+$("#hp3").val();
		    	console.log("phone", phone);//나중에 지워도 됨
		    	$("#userPhone").val(phone);//userPhone에 합친 값 넣었음
				$("#join").submit();//submit
		            }
			});
	
	
	//파일 업로드
	function FileUp(){
		//fileUpload 새 창을 띄운다.
		var myWin = window.open("./fileUploadForm","파일 업로드","width=400, height=100");
	}
	
	    var ms=document.querySelector("span");
		
	    function chk2(){
	        //두 인풋의 일치여부 확인	 
	   	var userPw =$("#userPw").val();
		var userPwChk =$("#userPwChk").val();
	        
	        if(userPw==userPwChk){
	            ms.innerHTML="비밀번호가 일치합니다";
	            ms.style.color="green";
	            pwChkVal=1;
	        }else{
	            ms.innerHTML="비밀번호가 일치하지않습니다.";
	            ms.style.color="red";	        	
	        }
	    }
	</script>
</html>