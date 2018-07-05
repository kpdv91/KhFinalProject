<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>띠요옹</title>
		<style>
		</style>
	</head>
	<body>
		<!-- <div id="map" style="width:1000px;height:500px;"></div> -->
		<div id="map"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7f29813d0150c2927c1529f7d432392&libraries=services"></script>
		<script>
			$.getJSON("resources/json/seoul.json", function(geojson) {
				 
			    var data = geojson.features;
			    var coordinates = []; //좌표 저장할 배열
			 
			    $.each(data, function(index,val) {
			        coordinates = val.geometry.coordinates;
			        displayArea(coordinates);
			 
			    })
			})
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.567427, 126.978889), // 지도의 중심좌표
		        level: mapLevel // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			//행정구역 폴리곤
			function displayArea(coordinates) {
				var path = []; //선 그려줄 path
				
				$.each(coordinates[0], function(index, coordinate) {
			        var point = new Object(); 
			        point.x = coordinate[1];
			        point.y = coordinate[0];
			        path.push(new daum.maps.LatLng(coordinate[1], coordinate[0]));
			    })
			    
			 	// 지도에 표시할 선을 생성합니다
				var polyline = new daum.maps.Polyline({
				    path: path, // 선을 구성하는 좌표배열 입니다
				    strokeWeight: 3, // 선의 두께 입니다
				    strokeColor: 'red', // 선의 색깔입니다
				    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				    strokeStyle: 'solid' // 선의 스타일입니다
				});

				// 지도에 선을 표시합니다 
				polyline.setMap(map);  
				/*
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
				geocoder.addressSearch(mapLocation, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				*/
				
			}
		</script>
	</body>
</html>