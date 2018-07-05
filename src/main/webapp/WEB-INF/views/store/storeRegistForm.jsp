<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>가게 등록</title>
		<style>
		table,tr,td,th{
			border: solid 1px black;
		}
		</style>
	</head>
	<body>
		<div id="regist">
			<form id="registForm" action="storeRegist" method="post" >
			<table>
				<tr>
					<th>대표사진</th>
					<td>
						<input type="file" id="sPhoto" name="store_photo" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
						<input type="button" onclick="storeD()" value="초기화">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="sPhotoShow"></div>
					</td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name="store_name"/></td>
				</tr>
				<tr>
					<th>대표자</th>
					<td><input type="text" name="store_ceo"/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="store_phoneH"/>-
						<input type="text" name="store_phoneB"/>-
						<input type="text" name="store_phoneT"/>
						</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="store_addr"/></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name=""/></td>
				</tr>
				<tr>
					<th>음식 종류</th>
					<td><input type="text" name="store_food"/></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="store_price"/></td>
				</tr>
				<tr>
					<th>영업 시간</th>
					<td><input type="text" name="store_time"/></td>
				</tr>
				<tr>
					<th>휴무일</th>
					<td><input type="text" name="store_rest"/></td>
				</tr>
				<tr>
					<th rowspan="2">해쉬태그</th>
					<td>
						<input type="text" id="tag" name="store_tag"/>
						<input type="button" onclick="tagAdd()" value="추가">
					</td>
				</tr>
				<tr>
					<td>
					<div id="tags">
					</div>
					</td>
				</tr>
				<tr>
					<th rowspan="2">메뉴판 사진</th>
					<td>
						<input type="button" onclick="menuPhotoUp()" value="사진 추가">
					</td>
				</tr>
				<tr>
					<td>
						<!-- div에서 내용을 받아 보여준다 -->
						<div id="editable"></div>
						<!-- 전송은 hidden에 담아서 한다 -->
						<input id="contentForm" type="hidden" name="content"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="save" value="등록 요청">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
	<script>
	var upload = document.getElementById('sPhoto');
	var holder = document.getElementById('sPhotoShow');
	storeD();
	
	//대표사진 변화시 func
	upload.onchange = function (e) {
		e.preventDefault();
		
		var file = upload.files[0],
		reader = new FileReader();
		
		reader.onload = function (event) {
			var img = new Image();
			img.src = event.target.result;

			// note: no onload required since we've got the dataurl...I think! :)
			img.width = 400;
			img.height = 270;
			
			holder.innerHTML = '';
			holder.appendChild(img);
		};
		try{
			reader.readAsDataURL(file);
		}catch (e) {
			storeD();
		}
	return false;
	};
	
	//대표사진 디폴트
	function storeD() {
		$("#sPhoto").val("");
		holder.innerHTML = '<img alt="기본사진"'
		+'src="resources/img/store/storeD.jpg" width="400" height="270">';
	}
	
	var hTag;
	var tagList = [];
	//해쉬 태그 추가
	function tagAdd() {
		hTag = $("#tag").val();
		if(hTag==""){
			alert("태그 내용을 입력해주세요.");
		}else{
			tagList.push(hTag);
			var cnt =0;
			for (var i = 0; i < tagList.length; i++) {
		        if (tagList[i] == hTag) {
		        	cnt++;
		        }
			}
			
			if(tagList.length>=11){
				tagList.pop();
				alert("태그는 최대 10개입니다.");
			}else if(cnt>=2){
				tagList.pop();
				alert("중복되는 태그가 있습니다");
			}
			else{
				$("#tags").append("<div>"
						+"<input type='text' class='tag' readonly='readonly' value='"+hTag+"'>"
						+"<div onclick='tagDel(this)'>X</div>"
						+"</div>");
				console.log(tagList);
			}
		}

	}
	
	//해쉬태그 지우기
	function tagDel(e){
		hTag=$(e).prev().val();
		$(e).parent().remove();
		tagList.splice(tagList.indexOf(hTag),1);
	}
	
	/* var tagList = [];
	function tagAdd() {
		hTag = $("#tag").val();
		tagList.push(hTag);
		if(hTag==""){
			alert("태그 내용을 입력해주세요.");
		}else{
			console.log(tagList);
			$.ajax({
				url:"./hashTagAdd",
				type:"get",
				data:{
					"hTag":hTag,
					"tagList":tagList
					},
				success:function(data){
					console.log(data);
					if(data.max){
						tagList.pop();
						alert("태그는 최대 10개입니다.");
					}else{
						console.log(data.list);
						$("#tags").append("<div>"
								+"<input type='text' class='tag' readonly='readonly' value='"+data.hTag+"'>"
								+"<div onclick='tagDel(this)'>X</div>"
								+"</div>");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
	} */
	
	//메뉴사진 업로드 창
	function menuPhotoUp() {
		var myWin = window.open("./menuPhotoForm","메뉴판 사진 추가","width=400, height=100");
	}
	</script>
</html>