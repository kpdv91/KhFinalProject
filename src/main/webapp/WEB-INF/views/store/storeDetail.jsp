<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/WEB-INF/views/include/main/nav.jsp"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<title>맛집 상세보기</title>
		<style>
			/* h1{color: #2637a4;} */
			#detailFrame ul{width: 800px;}
			#detailFrame ul li{list-style: none;  display: inline;	padding: 0px 10px; border: solid 2px #2637a4;
				font-size: x-large; width: 100px;}
			#contFrame{width: 1000px; height: 400px; border: solid 2px #2637a4;}
			.divChg{display: none;}
		</style>
	</head>
	<body>
		<div id="detailFrame">
			<h1>${storeDetail.store_name}</h1>
			<div id="tabFrame">
				<ul>
					<li class="tab" id="defau" onclick="divSnH(this)">정보</li>
					<li class="tab" onclick="divSnH(this)">메뉴</li>
					<li class="tab" onclick="divSnH(this)">위치</li>
				</ul>
			</div>
			<div id="infoFrame">
				<ul>
					<li>별점 ${storeDetail.store_star}</li>
					<li>조회 ${storeDetail.store_bHit}</li>
					<li>리뷰 ${storeDetail.store_revCnt}</li>
					<li>찜수 ${storeDetail.store_storeLikeCnt}</li>
					<li>찜하기 <img></li>
				</ul>
			</div>
			<div id="contFrame">
				<div class="divChg" id="info">정보
					<table>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" value="${storeDetail.store_phone}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" value="${storeDetail.store_addr}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th>음식 종류</th>
							<td>
								<input type="text" value="${storeDetail.store_food}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th>예상 예산(2인기준)</th>
							<td>
								<input type="text" value="${storeDetail.store_price}" readonly="readonly"/>원
							</td>
						</tr>
						<tr>
							<th>영업 시간</th>
							<td>
								<input type="text" value="${storeDetail.store_time}" readonly="readonly"/>
							</td>
							</td>
						</tr>
						<tr>
							<th>휴무일</th>
							<td><input type="text" value="${storeDetail.store_rest}" readonly="readonly"/></td>
						</tr>
						<tr>
							<th>해시 태그</th>
							<td>
								
							</td>
						</tr>
					</table>
				</div>
				<div class="divChg" id="menu">메뉴</div>
				<div class="divChg" id="loca">위치</div>
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
		}else{
			$("#loca").css("display","inline");
		}
		
	}
	</script>
</html>