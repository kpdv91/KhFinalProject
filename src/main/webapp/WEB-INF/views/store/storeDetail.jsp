<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7f29813d0150c2927c1529f7d432392&libraries=services"></script>
		<title>맛집 상세보기</title>
		<style>
			/* h1{color: #2637a4;} */
			#detailFrame{position: relative;top: 50px; left: 20%;height: 600px;}
			#detailFrame ul{width: 800px;}
			#detailFrame ul li{list-style: none;  display: inline;	padding: 0px 10px; border: solid 2px #2637a4;
				font-size: x-large; width: 100px;}
			#contFrame{width: 1000px; height: 400px; border: solid 2px #2637a4;}
			.divChg{display: none;}
			#detailFrame table,#detailFrame tr,#detailFrame td,#detailFrame th{border: solid 1px black;}
		</style>
	</head>
	<body>
		<div id="detailFrame">
			<div id="tabFrame">
				<c:if test="${sessionScope.loginId == '관리자' }">
					<button id="back" onclick="backBtn()">뒤로가기</button>
				</c:if>
				<ul>
					<li class="tab" id="defau" onclick="divSnH(this)">정보</li>
					<li class="tab" onclick="divSnH(this)">메뉴</li>
					<li class="tab" onclick="divSnH(this)">위치</li>
				</ul>
			</div>
			<div id="infoFrame">
				<span id="title">${storeDetail.store_name}</span>
				<ul>
					<li>별점 ${storeDetail.store_star}</li>
					<li>조회 ${storeDetail.store_bHit}</li>
					<li>리뷰 ${storeDetail.store_revCnt}</li>
					<li id="likeCnt">찜수 ${storeDetail.store_storeLikeCnt}</li>
				</ul>
				<input type="button" id="storeLike" value="찜" onclick="storeLike()">
			</div>
			<div id="contFrame">
				<div class="divChg" id="info">
					<table style="float: left;">
						<tr>
							<th>주소</th>
							<td>
								<span>${storeDetail.store_addr}</span>
							</td>
						</tr>
						<tr>
							<th>음식 종류</th>
							<td>
								<span>${storeDetail.store_food}</span>
							</td>
						</tr>
						<tr>
							<th>예상 예산(2인기준)</th>
							<td>
								<span>${storeDetail.store_price}원</span>
							</td>
						</tr>
						<tr>
							<th>영업 시간</th>
							<td>
								<span>${storeDetail.store_time}</span>
							</td>
						</tr>
						<tr>
							<th>휴무일</th>
							<td>
								<span>${storeDetail.store_rest}</span>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<span>${storeDetail.store_phone}</span>
							</td>
						</tr>
						<tr>
							<th>해시 태그</th>
							<td>
								<c:forEach items="${storeHash}" var="tag">
									<span>#${tag.hash_tag}</span>
								</c:forEach>
							</td>
						</tr>
					</table>
					<img src="resources/upload/store/${storeDetail.store_photo}"  width="400" height="270"/>
				</div>
				<div class="divChg" id="menu">
					<div>
						<input type="hidden" id="currMenuSrc" value="">
						<input type="button" onclick="nextPreMenu(0)" value="<">
						<img id="menuD" alt="menu1" src="resources/upload/store/${storeMenuD}" width="200" height="200">
						<input type="button" onclick="nextPreMenu(1)" value=">">
					</div>
					<c:set var="i" value="1"/>
					<c:forEach items="${storeMenu}" var="menu">
						<img alt="메뉴" id="menu${i}" src="resources/upload/store/${menu}" width="50" height="50" onclick="menuShow(this)">
						<c:set var="i" value="${i+1}"/>
					</c:forEach>
				</div>
				<div class="divChg" id="loca">
					<div id="map" style="width:100%;height:100%;"></div>
					<p>
						<button onclick="setZoomable(true)">지도 확대/축소 켜기</button>
						<button onclick="setZoomable(false)">지도 확대/축소 끄기</button>
					</p>
				</div>
			</div>
		</div>
	
	

		<br><br><br><br>
		<c:import url="/WEB-INF/views/review/reviewList.jsp">
			<c:param name="idx" value="${storeDetail.store_idx}"/>
		</c:import>
	</body>
	<script>
	//뒤로가기 버튼 클릭이벤트
	function backBtn() {
		history.back();
	}
	
	var id="";
	var likeChk=0;
	infoDefau();
	storeLikeChk();
	
	//정보로 초기화
	function infoDefau() {
		$("#defau").css("background-color","#2637a4");
		$("#defau").css("color","white");
		$("#info").css("display","inline");
	}
	
	var mapContaine;
	var map;
	//선택에 따라 정보,메뉴,위치 보기
	function divSnH(e) {
		$(".tab").css("background-color","white");
		$(".tab").css("color","black");
		$(e).css("background-color","#2637a4");
		$(e).css("color","white");
		
		$(".divChg").css("display","none");
		if($(e).html()=="정보"){
			$("#info").css("display","inline");
		}else if($(e).html()=="메뉴"){
			$("#menu").css("display","inline");
		}else if($(e).html()=="위치"){
			$("#loca").css("display","inline");
			
			mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		        
		    };  

			// 지도를 생성합니다    
			map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${storeDetail.store_addr}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${storeDetail.store_name}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
			map.setZoomable(false);
		}else{
			alert("올바른 명령이 아닙니다.")
		}
		
	}
	
	// 버튼 클릭에 따라 지도 확대, 축소 기능을 막거나 풀고 싶은 경우에는 map.setZoomable 함수를 사용합니다
	function setZoomable(zoomable) {
	    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
	    map.setZoomable(zoomable);    
	}
	
	//메뉴판 선택
	function menuShow(e) {
		$("#menuD").attr("src",$(e).attr("src"));
		$("#menuD").attr("alt",$(e).attr("id"));
	}
	
	//이전 , 다음 메뉴판
	var currMenu="";
	var currMenuNum=0;
	var menuSize = ${storeMenu.size()};
	function nextPreMenu(pm) {
		currMenu = $("#menuD").attr("alt");
		currMenuNum = parseInt(currMenu[4]);
		if(pm==1){
			if(currMenuNum<menuSize){
				currMenuNum += 1;
			}else{
				currMenuNum = 1;
			}
		}else{
			if(currMenuNum>1){
				currMenuNum -= 1;
			}else{
				currMenuNum = menuSize;
			}
		}
		currMenu = "menu"+currMenuNum;
		$("#menuD").attr("alt",currMenu);
		$("#menuD").attr("src",$("#"+currMenu).attr("src"))
	}
	
	//찜 확인
	function storeLikeChk() {    
		$.ajax({  
			url:"./storeLikeChk",
			type:"get",
			data:{
				"store_idx":${storeDetail.store_idx}
			},
			success:function(data){
				id=data.loginId;
				if(data.likeChk==1){
					$("#storeLike").css("background-color","red");
					likeChk=1;
				}else{
					$("#storeLike").css("background-color","#2637a4");
					likeChk=0;
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	//찜하기
	function storeLike() {
		if(id==null){
			alert("로그인이 필요한 서비스입니다.");
		}else{
			$.ajax({
				url:"./storeLike",
				type:"get",
				data:{
					"store_idx":${storeDetail.store_idx}
				},
				success:function(data){
					alert(data.msg);
					storeLikeChk();
					$("#likeCnt").html("찜수 "+data.likeCnt);
					
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
	}


	</script>
</html>