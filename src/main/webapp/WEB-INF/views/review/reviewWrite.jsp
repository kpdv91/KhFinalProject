<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>Insert title here</title>
		<style>
        button{
            height: 21px;
            vertical-align: middle;
        }
        #reviewSearch{
            width: 15px;
            height: 15px;
            
        }
        textarea{
            width: 400px;
            height: 200px;
        }
        input[type=button]{
            vertical-align: middle;
            padding: 0px 5px;
            background-color: #33aaaaff;
            color: white;
            border-radius: 7px;
            width: 50px;
            height: 27px;
            outline: 0px;
            border: 0px;
        }
        #write{
        vertical-align: middle;
            padding: 0px 5px;
            background-color: #33aaaaff;
            color: white;
            border-radius: 7px;
            width: 80px;
            height: 27px;
            outline: 0px;
            border: 0px;
        }
        #hash{
            margin-right: 5px;
        }
        .hashTag{
            border: 2px solid #33aaaaff;
            font-size: 14px;
            width: auto;            
            text-align: center; 
            float: left;
            margin-left: 20px;
            margin-top: 10px;
            padding-left: 10px;
        }
        form{
            text-align: center;
            margin: 0 auto;
            width: 600px;
            
        }
        #reviewPhoto{
            width: 80px;
            margin-top: 20px;
            margin-right: 315px;
        }
       
        #userName{
        	height: 30px;
        	border: 0px;
        	font-size: 15px;
        }
       .div{
       	height: 100px;
       }
       #tag,#editable{
       	width: 600px;
       	height: auto;
       	overflow: hidden;
       }
       #imgDiv{
       	float: left; 
       	margin-left: 20px;
       }
       /* #editable{
       	width: 600px;
       	height: auto;
       	overflow: hidden;
       } */
       .hashDel{
       	width: 20px;
       	background-color: #33aaaaff;
        outline: 0px;
        border: 0px;
        color: white;
        float:right;
        text-align: center;
        font-size: 15px;
        margin-left: 10px;
       }
       #userId{
       	border: 0px;
       	font-size: 15px;
       }
       #searchList{
		width: 250px;
		height: 400px; 
		background-color: rgba(46,100,254,0.7);
		margin-top:-42px;     
		margin-left: 401px;
		z-index: 2;
		position: absolute;
		display: none;
		text-align: left;
       }
       #formDiv{
       position: relative;
       	z-index: 1;
       }
       #mapDiv{
       	width: 400px;
		height: 400px;
		background-color: orange;
		margin-top:-42px;  
		margin-left:2px;   
		z-index: 2;
		position: absolute;
		display: none;
       }
       #listClose{
       	width: 25px;
       	float: right;
       	border-radius: 0px;
       }
       .store_list{
       	color: black;
       	text-decoration: none;
       	line-height: 2.0;
       	font-weight: 550;
       	margin-left: 10px;
       }
       .store_list:hover {
		color: #33aaaaff;
	   }
	   .store_addr{
	    color: black;
       	text-decoration: none;
       	font-size: 12px;
       	margin-left: 10px;
	   }
	   #map{
	   	width: 400px;
		height: 400px;
	   }
    </style>
    <script>
    	var mapLevel=7;
    	var mapLocation="서울특별시 동대문구 외대역동로 101";
    </script>
	</head>
	<body>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	
	<br/><br/><br/>
	<form id="sendForm" action="reviewWrite" method="post">
	
	
<!-- <input type="button" value="asd" onclick="relayout()"/>
<input type="button" value="mapdiv" onclick="mapdiv()"/>
<input type="button" value="크기" onclick="resizeMap()"/> -->

	<div id ="formDiv">
	작성자 : <input id="userId" name="id" type="text" value="관리자" readonly/><br/><br/>
    상호명 : <input id="review_storeName" type="text" name="review_storeName"/><button type="button" id="search"><img id="reviewSearch" src="resources/img/search.png"></button><br/><br/><br/>
   
    <div id="searchList">
    	
    	
    </div>
    <div id="mapDiv">
    	 <c:import url="/WEB-INF/views/include/common/map.jsp"/>
    	 
<%-- <jsp:include page="../include/common/map.jsp" />  --%>
    </div>
    <div id="starDIV">
    별점 : <jsp:include page="star.jsp"></jsp:include><br/></div>
    내용<br/>
    <textarea name="review_content"></textarea><br/><br/>
    
    해시태그 : <input id="hash" type="text"/><input id="add" type="button" value="추가"/><br/>
    
    <div id="tag"></div>
    
    
    
	<div id="rePhoto">
    <input id="reviewPhoto" type="button" value="사진 추가" onclick="fileUp()"/><br/><br/>
    <input type="hidden" name="review_photo"/>
    <div id="editable"></div>
    </div><br/><br/>
    <button id="write">작성하기</button>
    </div>
    </form>
     
	</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7f29813d0150c2927c1529f7d432392&libraries=services"></script>
	<script>
	var loginId = "${sessionScope.loginId}";
	console.log(loginId);
	var div = "";//div 추가 변수
	
	$("#write").click(function(){
		//해시태그 삭제버튼 제거
		
		$("#sendForm").submit();
	});
	
	//해시태그 추가 버튼시 div 생성
	$("#add").click(function(){
		if($("#hash").val() != ""){
		div = "<div class='hashTag' id='hashTag'>#"+$("#hash").val()+
		"<button onclick='hashDel(this)' class='hashDel'>-</button>"+
		"<input type='hidden' name='hash_tag' value='"+$("#hash").val()+"'/></div>";		
		$("#tag").append(div);	
		//hashtagArr[i] = $("#hash").val();
		//i++;
		$("#hash").val("");
		}
		
	});
	
	function hashDel(elem){
		//var sp = elem.id.split("_")[1];
		console.log(elem.target);
		console.log(elem.parentNode);
		//delete hashtagArr[sp];
		elem.parentNode.remove();
		$(elem).remove();
	}
	
	//사진추가 새창
	function fileUp(){
		//fileUpload 새창을 띄운다.
		var myWin = window.open("./uploadForm","File Upload","width=400, height=100");
		
	}
	
	//사진 삭제시 초기화가 되지 않기 위해 Ajax 사용
	function del(elem){
		var fileName = elem.id.split("/")[2];
		console.log(fileName);
		$.ajax({
			url : "./fileDel",
			type : "get",
			data : {"fileName":fileName},
			success : function(data){
				console.log(data);
				if(data.success == 1){
					//이미지 삭제
					console.log($(elem).parent().next());
					 $(elem).prev().prev().remove();
					 $(elem).parent().next().remove();
					//버튼 삭제
					$(elem).remove();  
					
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	
	//가게 검색 리스트
	var storeList="";
	var btn="";
	$("#search").click(function(){
		console.log("search click");
		console.log($("#review_storeName").val());
		$("#searchList").empty();
		btn = "<input id='listClose' type='button' value='X'/><br/>";
		$("#searchList").append(btn);
		$.ajax({
			url : "./revStoreSearch",
			data : {"review_storeName":$("#review_storeName").val()},
			success : function(data){
				console.log(data.list.length);
				if(data.list.length == 0){					
					storeList += "<h3>찾으시는 상호명이 없습니다.</h2>";
				}else{
					for(var i=0; i<data.list.length; i++){
						storeList += "<div><a class='store_list' href='#' onclick='mapDiv(this)'>"+data.list[i].store_name+"</a><br/>";
						storeList += "<a class='store_addr' href = '#'>"+data.list[i].store_addr+"</a><hr/></div>";
					}
				}
				$("#searchList").append(storeList);
				storeList = "";
				btn="";
			},
			error : function(e){
				console.log(e);
			}
		});
		$("#starDIV").css("pointer-events", "none");
		$("#searchList").css("display","block");
	});
	
	
	
	
	
	 function mapDiv(elem){
		console.log(elem.parentNode.children[2].text);
		mapLocation=elem.parentNode.children[2].text;
		$("#mapDiv").css("display","block");		
		/* $("#mapDiv").text(elem.parentNode.children[2].text); */
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
		}
		
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
		     // 마커에 클릭이벤트를 등록합니다
		        daum.maps.event.addListener(marker, 'click', function() {
				      $("#review_storeName").val(elem.text);
				      $("#searchList").css("display","none");
						$("#mapDiv").css("display","none");
						$("#starDIV").css("pointer-events", "");
				});
		    } 
		}); 
		console.log(mapLocation);
		function relayout(){
			console.log(map);
			map.relayout();
		}
		
		
		relayout();
	} 
	
	 
	/* function resizeMap() {
        var mapContainer = document.getElementById('map');
        mapContainer.style.width = '650px';
        mapContainer.style.height = '650px'; 
    } */
	/* function mapdiv() {
        $("#mapDiv").css("display","block");
    } */

		$(document).on("click","#listClose",function(){
			console.log("X Click");
			$("#searchList").css("display","none");
			$("#mapDiv").css("display","none");
			$("#starDIV").css("pointer-events", "");
		});
	</script>
</html>