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
			#detailFrame{position: relative;top: 50px; left: 20%;height: 700px;}
			#detailFrame ul{width: 800px;}
			#detailFrame ul li{list-style: none;  display: inline;	padding: 0px 10px; border: solid 2px #2637a4;
				font-size: x-large; width: 100px;}
			#contFrame{width: 1000px; height: 400px; border: solid 2px #2637a4;}
			.divChg{display: none;}
			#detailFrame table,tr,td,th{border: solid 1px black;}
		</style>
	</head>
	<body>
		<div id="detailFrame">
			<div id="tabFrame">
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
					<li>찜수 ${storeDetail.store_storeLikeCnt}</li>
				</ul>
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
				<div class="divChg" id="menu">메뉴
				
				</div>
				<div class="divChg" id="loca">
					<div id="map" style="width:100%;height:100%;"></div>
					<p>
						<button onclick="setZoomable(false)">지도 확대/축소 끄기</button>
						<button onclick="setZoomable(true)">지도 확대/축소 켜기</button>
					</p>
				</div>
			</div>
		</div>
	
	


		<c:import url="/WEB-INF/views/review/reviewList.jsp">
			<c:param name="idx" value="${storeDetail.store_idx}"/>
		</c:import>
	</body>
	<script>
	infoDefau();
	
	//정보로 초기화
	function infoDefau() {
		$("#defau").css("background-color","#2637a4");
		$("#defau").css("color","white");
		$("#info").css("display","inline");
	}
	
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
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
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
		}else{
			alert("올바른 명령이 아닙니다.")
		}
		
	}

	</script>
</html>