<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7f29813d0150c2927c1529f7d432392&libraries=services"></script>
		
		<title>가게 등록</title>
		<style>
		table,tr,td,th{
			border: solid 1px black;
		}
		#regist{
			position: relative;
			width:800px;
			top: 50px;
			left: 25%;
		}
		</style>
	</head>
	<body>
		<div id="regist">
			<h3>맛집 등록 요청</h3>
			<table>
				<tr>
					<th>대표사진</th>
					<td>
						<form id="registForm" action="./photoUpload" method="post" enctype="multipart/form-data" style="margin:0px">
							<input type="file" id="sPhoto" name="store_photo" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
							<input type="button" onclick="storeD()" value="초기화">
						</form>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div id="sPhotoShow"></div>
					</td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name="store_name" placeholder="상호명"/></td>
				</tr>
				<tr>
					<th>대표자</th>
					<td><input type="text" name="store_ceo" placeholder="대표자"/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="store_phone_H"/>-
						<input type="text" name="store_phone_B"/>-
						<input type="text" name="store_phone_T"/>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="store_addr" id="address" placeholder="주소" readonly="readonly">
						<input type="button" onclick="searchAddr()" value="주소 검색"><br>
						<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					</td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td>
						<input type="text" name="store_addr_D" placeholder="상세 주소">
					</td>
				</tr>
				<tr>
					<th>음식 종류</th>
					<td><input type="text" name="store_food" placeholder="ex) 한식, 퓨전, 고기집"/></td>
				</tr>
				<tr>
					<th>예상 예산(2인기준)</th>
					<td><input type="text" name="store_price" placeholder="ex) 45000"/>원</td>
				</tr>
				<tr>
					<th>영업 시간</th>
					<td><input type="text" name="store_time" placeholder="ex) 평일, 토요일: 11:00~20:00/일요일, 공휴일:09:00~18:00"/></td>
				</tr>
				<tr>
					<th>휴무일</th>
					<td><input type="text" name="store_rest" placeholder="ex) 매달 셋째주 일요일"/></td>
				</tr>
				<tr>
					<th>해시 태그</th>
					<td>
						<input type="text" id="tag" name="store_tag" placeholder="ex) 줄서는맛집"/>
						<input type="button" onclick="tagAdd()" value="추가">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div id="tags">
						</div>
					</td>
				</tr>
				<tr>
					<th>메뉴판 사진</th>
					<td>
						<input type="button" onclick="menuPhotoUp()" value="사진 추가">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div id="editable"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" onclick="storeRegist()" value="등록 요청">
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script>
	var upload = document.getElementById('sPhoto');
	var holder = document.getElementById('sPhotoShow');
	storeD();
	
	//대표사진 변화시 func
	upload.onchange = function (e) {
		e.preventDefault();
		console.log("사진 변화");
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
		}finally{
			//대표 사진 업로드
			var formData = new FormData($("#registForm")[0]);
	        $.ajax({
	            type : 'post',
	            url : 'photoUpload',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(data) {},
	            error : function(error) {
	                console.log(error);
	                console.log(error.status);
	            }
	        });
		}
	return false;
	};
	
	//대표사진 디폴트
	function storeD() {
		$("#sPhoto").val("");
		holder.innerHTML = '<img alt="기본사진"'
		+'src="resources/img/store/storeD.jpg" width="400" height="270">';
		
		$.ajax({
			url:"./photoDel",
			type:"get",
			success:function(data){
				console.log(data);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	//메뉴사진 업로드 창
	function menuPhotoUp() {
		var myWin = window.open("./menuPhotoForm","메뉴판 사진 추가","width=400, height=100");
	}
	
	//메뉴 사진 삭제
	function menuDel(elem) {
		var fileName = elem.id.split("/")[3];
		console.log(fileName);
		$.ajax({
			url:"./menuDel",
			type:"get",
			data:{"fileName":fileName},
			success:function(data){
				console.log(data);
				if(data.success>0){
					$(elem).parent().remove();
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

	//주소찾기
    function searchAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
             
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                if(fullAddr.substring(0, 2)!="서울"){
            		console.log(fullAddr);
            		alert("서울 지역만 입력해주세요.");
            	}else{
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("address").value = fullAddr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                	
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
            }
        }).open();
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
			//"<img alt='x이미지' src='resources/img/store/delImg.jpg' width='15' height='15' onclick='tagDel(this)'>"
			else{
				$("#tags").append("<div>"
						+"<input type='text' class='tag' readonly='readonly' value='"+hTag+"'>"
						+"<input type='button' value='-' onclick='tagDel(this)'>"
						+"</div>");
				console.log(tagList);
			}
		}
		$("#tag").val("");
	}
	
	//해쉬태그 지우기
	function tagDel(e){
		hTag=$(e).prev().val();
		$(e).parent().remove();
		tagList.splice(tagList.indexOf(hTag),1);
	}
	
	//등록요청
    function storeRegist() {
		var store_phone="";
		var store_addr="";
		store_phone = $("input[name='store_phone_H']").val()+"-"
		+$("input[name='store_phone_B']").val()+"-"+$("input[name='store_phone_T']").val();
		store_addr = $("input[name='store_addr']").val()+" "+$("input[name='store_addr_D']").val()
		if(false){
			alert("");
		}else{
			console.log(tagList);
			$.ajax({
				url:"./storeRegist",
				type:"get",
				data:{
					"tagList":tagList,
					"store_name":$("input[name='store_name']").val(),
					"store_ceo":$("input[name='store_ceo']").val(),
					"store_phone":store_phone,
					"store_addr":store_addr,
					"store_food":$("input[name='store_food']").val(),
					"store_price":$("input[name='store_price']").val(),
					"store_time":$("input[name='store_time']").val(),
					"store_rest":$("input[name='store_rest']").val(),
					"store_tag":$("input[name='store_tag']").val()
					},
				success:function(data){
					console.log(data);
					alert(" 등록 성공");
					
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
	}
    
    </script>
</html>