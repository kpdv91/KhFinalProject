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
                /* border: solid 2px navy;  */  
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
            /* button {
                margin-top: 5px;
                background-color:#088A85;
                color: aliceblue;
            } */
            #confirmPw{
                text-align: center;
                font-size: 12px;
                color: red;
            }
            input[type=button] { 
       			background-color: #33aaaaff;
        		color: white;
            	border: 0px;
            	/* outline: 0px; */
    		} 
            
            
		</style>
	</head>
	<body>
		<form action="join" id="join" method="post">
		<div id="div1" >
			<div id="profile" name="profile">
				<img alt="noprofile" src="resources/img/member/noprofile.jpg" height=150px width=150px>
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
            <td><input type="text" id="userId" name="userId" placeholder="아이디" onchange="chgId()"></td>
            <td><input id="overlay" type="button" value="중복체크"/></td>
         </tr>
         <tr>
            <th>비밀번호 : </th>
            <td><input type="password" id="userPw" name="userPw" onkeyup="chgPw()" placeholder="비밀번호" ></td>
         </tr>
         <tr>
            <th>비밀번호확인 : </th>
            <td><input type="password" id="userPwChk" name="userPwChk" placeholder="비밀번호확인" onkeyup="chgPw()"></td>           
         </tr>
         <tr>          
            <td id="confirmPw" colspan="2"><span></span></td>           
         </tr>   
         <th>이름 : </th>
            <td><input type="text" id="userName" name="userName" placeholder="이름"></td>
         <tr>
            <th>이메일 : </th>
            <td><input type="email" id="userEmail" name="userEmail" placeholder="이메일" onchange="chgMail()"></td>
            <td><input id="overlayMail" type="button" value="중복체크"/></td>
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
                <input id="cancel" type="button" onclick="location.href='main'" value="취소"/>
                <input id="joinId" type="button" value="가입"/>
            </td>
        </tr>
        </div>
	</table>
	</form>
	</body>
	<script>
	
	
    // 중복확인과 회원가입 아작스 사용하기 위해 url,data를 선언
    var url;
    var data;
    
    var chkSum = 0;//ID 중복확인 클릭시 1, 중복확인 후 값 바뀔시 0
    var chkMail = 0;//Email 중복확인 클릭시 1, 중복확인 후 값 바뀔시 0
    var idVal=0;//ID 중복확인 체크해주는 값
    var pwVal=0;//PW 중복확인 체크해주는 값
    var mailVal=0;//Email 중복확인 체크해주는 값
       
	var imgLen = $("#profile img").length;
	     
    function chgId(){//ID 중복확인 후, ID의 값이 변경되면 실행.
    	idVal=0;
    }
    
    function chgMail(){//Mail 중복확인 후, Mail의 값이 변경되면 실행.
    	mailVal=0;
    }
      
    //ID 중복 확인
    $("#overlay").click(function(){
        data ={};
        data.id = $("#userId").val();
        ajaxCall("./rest/overlay",data);
        
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
                if(reqUrl=="./rest/overlay"){
                    if(d.use == "Y"){
                        chkSum ++;
                        alert("사용 가능한 아이디 입니다.");
                        idVal=1;
                    }else{
                        alert("누군가가 사용 하고 있는 아이디 입니다.");
                        $("#userId").val("");
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
    
  //Email 중복 확인
    $("#overlayMail").click(function(){
        data ={};
        data.email = $("#userEmail").val();
        ajaxCallMail("./rest/overlayMail",data);
        
    });   
    
    //ajax 실행
    function ajaxCallMail(reqUrl, reqData){
        $.ajax({
            url:reqUrl,
            type:'get',
            dataType:'json',
            data: reqData,
            success:function(d){
                console.log(d);
                if(reqUrl=="./rest/overlayMail"){
                    if(d.use == "Y"){
                        chkMail ++;
                        alert("사용 가능한 이메일 입니다.");
                        mailVal=1;
                    }else{
                        alert("누군가가 사용 하고 있는 이메일 입니다.");
                        $("#userEmail").val("");
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
  

	function chkVal(){

		 //console.log($("#profile"));
		 console.log(document.getElementById('profile').innerHTML);
		 /* console.log(imgLen);
		 console.log("나len",$("#profile img").length);
		 console.log("가",$("#profile").val());
		 console.log("나",$("#profile").value);
		 console.log("다",$("div #profile").innerHTML);
		 console.log("다",$("div #profile").val); */
		 /* console.log("ID 중복체크테스트", idVal);
		 console.log("PW 중복체크테스트", pwVal); 
		 console.log("체크체크많다",pwVal); */ 
	 }
	

	var idReg = /^[A-za-z0-9]{5,20}/g; //ID 정규식
	
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //이메일 정규식

	var pwChkVal=0;
	
	//회원 가입 클릭시
	$("#joinId").click(function(){
       	
		if($("input[name='userId']").val()==""){//아이디
	        alert("아이디를 입력해주세요!!");
	        $("input[name='userId']").focus();
        }else if($("input[name='userPw']").val()==""){//비밀번호
        	alert("비밀번호를 입력해주세요!!");
        	$("input[name='userPw']").focus();
        }else if($("input[name='userPwChk']").val()==""){//비밀번호
        	alert("비밀번호확인을 입력해주세요!!");
        	$("input[name='userPwChk']").focus();	
        /* }else if($("#profile img").length==0){//사진
        	alert("프로필 사진을 등록해주세요!!"); */
        }else if($("input[name='userName']").val()==""){//이름
        	alert("이름을 입력해주세요!!");
            $("input[name='userName']").focus();
        }else if($("input[name='userEmail']").val()==""){//이메일
        	alert("이메일을 입력해주세요!!");
            $("input[name='userEmail']").focus();
        }else if($("#hp1").val()==""){//핸드폰번호
        	alert("핸드폰번호를 입력해주세요!!");
            $("input[name='hp1']").focus();
        }else if($("#hp2").val()==""){//핸드폰번호
        	alert("핸드폰번호를 입력해주세요!!");
            $("input[name='hp2']").focus(); 
        }else if($("#hp3").val()==""){//핸드폰번호
        	alert("핸드폰번호를 입력해주세요!!");
            $("input[name='hp3']").focus();
        
        }else if($("input[name='userPw']").val().length<8 || $("input[name='userPw']").val().length>16){	//비밀번호 유효성
           	alert("비밀번호는 8~16자를 입력해주세요.");
        }else if(chkSum<1){
        	alert("아이디 중복체크 확인이 필요 합니다.");
        }else if(chkMail<1){
        	alert("이메일 중복체크 확인이 필요 합니다.");
        }else if(idVal<1){
        	alert("아이디값이 변경 되었습니다. 다시 중복체크 확인이 필요 합니다.");
        }else if(mailVal<1){
        	alert("이메일값이 변경 되었습니다. 다시 중복체크 확인이 필요 합니다.");
        }else if(pwChkVal==0){
            alert("비밀번호를 확인 하세요.");
        }else if(pwVal==0){
        	alert("비밀번호값이 변경 되었습니다. 다시 확인 해주세요.");    
        }else if(exptext.test($("input[name='userEmail']").val())==false){//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
    		alert("이메일 형식이 올바르지 않습니다.");
    		return false;
        }else if(!idReg.test( $("input[name='userId']").val() )){	//id 유효성
           	alert("아이디는 5~20자리의 영문자 또는 숫자이어야 합니다.");
           	return false;
        }else{	

			//핸드폰 번호 합치기
	    	var phone = $("#hp1").val()+"-"+$("#hp2").val()+"-"+$("#hp3").val();
		    	console.log("phone", phone);
		    	$("#userPhone").val(phone);//userPhone에 합친 값 넣었음
				$("#join").submit();//submit
				}
			});
	
	
	//파일 업로드
	function FileUp(){
		//fileUpload 새 창을 띄운다.
		var myWin = window.open("./fileUploadForm","파일 업로드","width=500, height=150");
	}
	
	    var ms=document.querySelector("span");
		
	    function chgPw(){
	    	console.log("비교실행");
	        //두 인풋의 일치여부 확인	 
	   	var userPw =$("#userPw").val();
		var userPwChk =$("#userPwChk").val();
	        
	        if(userPw==userPwChk){
	            ms.innerHTML="비밀번호가 일치합니다";
	            ms.style.color="green";
	            pwChkVal=1;
	            pwVal=1;
	        }else{
	            ms.innerHTML="비밀번호가 일치하지않습니다.";
	            ms.style.color="red";	  
	            pwVal=0;
	        }
	    }
	</script>
</html>