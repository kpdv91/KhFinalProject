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
                padding: 5%;
                margin-top: 7%;
                /*position: absolute;*/

                /*margin: -150px 0 0 -75px;
                top: 50%;
                left: 40%;      */
    }
			#div1 {
				height : 180px;
				width : 180px;
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
            <td><input type="text" id="userId" placeholder="아이디"></td>
            <td><button>중복체크</button></td>
            <td id="idChk">아이디가 중복 되었습니다.</td>
         </tr>
         <tr>
            <th>비밀번호 : </th>
            <td><input type="password" id="userPw" placeholder="비밀번호"></td>
         </tr>
         <tr>
            <th>비밀번호확인 : </th>
            <td><input type="password" id="userPwChk" placeholder="비밀번호확인"></td>            
         </tr>
         <tr>
            <td id="confirmPw" colspan="2">비밀번호 일치 여부</td>           
         </tr>   
         <th>이름 : </th>
            <td><input type="text" id="userId" placeholder="이름"></td>
         <tr>
            <th>이메일 : </th>
            <td><input type="email" id="userEmail" placeholder="이메일"></td>
         </tr>
         <th>핸드폰번호</th>
        <td>
            <input name="hp1" type="text" class="frm_input tel" size="3" maxlength="3" placeholder="01X"/>-
            <input name="hp2" type="text" class="frm_input tel" size="3" maxlength="4" placeholder="XXXX"/>-
            <input name="hp3" type="text" class="frm_input tel" size="3" maxlength="4" placeholder="XXXX"/>
        </td>
        <tr>
            <td></td>
            
            <td>
                <button id="confirm">취소</button>
                <button id="leave">가입</button>
            </td>
        </tr>
        </div>
	</table>
        <!--<div id="bottom">
            <button id="confirm">취소</button>
            <button id="leave">가입</button>
		</div>-->
	</body>
	<script>

	</script>
</html>