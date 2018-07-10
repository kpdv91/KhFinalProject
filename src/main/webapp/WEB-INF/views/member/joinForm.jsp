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
            <td><input id="overlay" type="button" value="중복체크"/></td>
            
            <!-- <input type="hidden" id="idChk" value="N" />ID체크 했는지, 안했는지. -->
            <!-- 아이디 : <input type="text" name="id" id="insertId" maxlength="30" /><input type="button" value="Id체크" onclick="javascript:chkDupId();" /> -->
            
            <!-- <input type="email" id="email" placeholder="email" /> -->
    		<!-- <input type="button" id="chkid" onclick="chkid()" value="중복확인"> -->
    		
    		<!-- <input type="button" id="chkemail" onclick="chkemail()" value="E-mail 중복확인"> -->

            </td>
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
                <!-- <input type="button" id="chkemail" onclick="location.href='./emailChkForm'" value="E-mail 중복확인"> -->
            </td>
        </tr>
        </div>
	</table>
	</form>
	</body>
	<script>
	
	var chkSum = 0;
    // 중복확인과 회원가입 아작스 사용하기 위해 url,data를 선언
    var url;
    var data;
    //비밀번호 확인
    $("#pwChk").keyup(function(){
        if($("#userPw").val() != $("#pwChk").val()){
            $("#matchMsg").html("일치 하지 않습니다.");
            $("#matchMsg").css("color","red");
        }else{
            $("#matchMsg").html("일치 합니다.");
            $("#matchMsg").css("color","green");
            chkSum ++;
        }
    });
    /*두개의 비밀번호 텍스트 입력값을 가져와 비교한다
    일치 불일치에 따라 아래에 텍스트로 표시되도록 한다.*/
    
   /*  var ChkOverlay = 0; */
    //중복 확인
    $("#overlay").click(function(){
        data ={};
        data.id = $("#userId").val();
        ajaxCall("./rest/overlay",data);
        //ChkOverlay = 1;
    });
    /*중복확인 버튼 클릭시 해당 함수실행
    id값을 id변수에 담고 해당 url를 탄다.*/

/*   //회원가입
    $("#regist").click(function(){
        data={};
        data.id = $("#userId").val();
        data.pw = $("#userPw").val();
        data.name = $("#userName").val();
        data.email = $("#email").val();
        if(chkSum<2){
            alert("중복확인과 비밀번호 확인을 해 주세요!");
        }else{
            ajaxCall("./rest/join", data);
        }            
    }); */
    /*회원가입 버튼 클릭시 해당 함수실행
    회원가입시 필요한 아이디,비밀번호,이름,이메일 값을 가져와 변수에 담는다.
    chkSum은 비밀번호와 중복확인을 하지 않으면 회원가입이 되지 않는다.*/
    
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

    
    
    
    
    
	
/* 	
	var obj={};//초기화	
	obj.type="post";
	obj.dataType="json";
	obj.error=function(e){console.log(e)};

	var overChk = false;//중복체크 값

	$("#overlay").click(function(){			
		obj.url="./overlay";
		obj.data = {id:$("input[name='userId']").val()};			
		obj.success=function(d){
			console.log(d.overlay);
			if(d.overlay==true){
				alert("사용중인 아이디 입니다");
				$("input[name='userId']").val("");
			}else{
				alert("사용가능한 아이디 입니다");
				$("input[name='userId']").css("background-color","yellowgreen");
				overChk = true;
			}
		};			
		console.log(obj);
		ajaxCall(obj);
		
	});
	
	//전달 받은 오브젝트로 ajax 통신 실행
	function ajaxCall(obj){
		$.ajax(obj);
	}	
	 */
	
/* 	function chkemail(){
    	location.href = "./emailChk.jsp";
    } */
	
	
/* 	var data = {}; //data 변수를 배열로 생성합니다.
	  //중복확인 클릭시
	  //jquery에서는 #은 아이디 .은 클래스를 표현합니다. $("#ID명") $(".CLASS명")
	    $("#chkid").click(function () {    // 아이디값이 chkemail인 것을 클릭했을시 function을 실행합니다.
	        data.userId = $("#userId").val();    // data 변수에 email항목을 만듭니다. 그리고 id값이 email의 value값을 대입합니다.
	        data.url = "./idAuth";        // data변수에 url항목을 생성하고 그 값에 emailAuth를 대입합니다.
	        sendServer(data);                // sendServer함수에 data를 담아서 보냅니다.
	    }); */
	
	    //function sendServer(data) {            
	    	/*        
	    	        $.ajax({
	    	            type: "get",                // type에는 "get || post"를 사용할 수 있습니다.
	    	            url : data.url,                // url은 서버에 보내질 url위치를 적어줍니다.
	    	            data : data,                // 서버에 보낼 data를 입력합니다. data : data, 라고 적혀있지만 앞에는 ajax의 형식이고 뒤에는 피라메터 값 입니다.
	    	            dataType: "JSON",            // json을 사용할 것이기에 json을 적어줍니다.
	    	            success: function(success) {
	    	                console.log(success);    // 성공시 서버에서 가져온 값을 콘솔에 보여줍니다.
	    	            },
	    	            error: function(error) {
	    	                console.log(error);        // 실패시 에러값을 보여줍니다.
	    	            }
	    	        
	    	        });
	    	*/
	    /* 	$.ajax({
	            type: "get",
	            url: data.url,
	            data: data,
	            dataType: "JSON",
	            success: function (data) {
	                if(url == "./rest/idAuth"){
	                    if (data.emailChk < 0) {
	                        alert('이미 사용중인 이메일 입니다.');
	                    } else {
	                        alert('사용 가능한 이메일 입니다.');
	                    }                      
	                }
	            },
	            error: function (error) {
	                console.log(error);
	            }
	        });
	    }


	 */
	
	
	
	
	    
	
	

	var pwChkVal=0;
	
	//회원 가입 클릭시
	$("#joinId").click(function(){
       	
		if($("input[name='userId']").val()==""){//아이디
	        alert("아이디를 입력해주세요!!");
	        $("input[name='userId']").focus();
        }else if($("input[name='userPw']").val()==""){//비밀번호
        	alert("비밀번호를 입력해주세요!!");
        	$("input[name='userPw']").focus();
        /* }else if($("#profile").val()==""){//사진
        	alert("프로필 사진을 등록해주세요!!");
            $("#profile").focus(); */
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
            alert("비밀번호를 확인 하세요.");
        /* }else if(ms.style.color="red"){
        	alert("비밀번호가 올바르지 않습니다."); */
        /* }else if(ChkOverlay==0){
        	alert("아이디 중복체크 확인이 필요 합니다."); */
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
		var myWin = window.open("./fileUploadForm","파일 업로드","width=500, height=150");
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