<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style></style>
	</head>
	<body>
		
		<input type="email" id="email" placeholder="email" />
    	<button id="chkemail">중복확인</button>

	</body>
	<script>
	var data = {}; //data 변수를 배열로 생성합니다.
	  //중복확인 클릭시
	  //jquery에서는 #은 아이디 .은 클래스를 표현합니다. $("#ID명") $(".CLASS명")
	    $("#chkemail").click(function () {    // 아이디값이 chkemail인 것을 클릭했을시 function을 실행합니다.
	        data.email = $("#email").val();    // data 변수에 email항목을 만듭니다. 그리고 id값이 email의 value값을 대입합니다.
	        data.url = "./emailAuth";        // data변수에 url항목을 생성하고 그 값에 emailAuth를 대입합니다.
	        sendServer(data);                // sendServer함수에 data를 담아서 보냅니다.
	    });
	 
	    function sendServer(data) {            
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
	        $.ajax({
	            type: "get",
	            url: data.url,
	            data: data,
	            dataType: "JSON",
	            success: function (data) {
	                if(url == "./rest/emailAuth"){
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

	</script>
</html>