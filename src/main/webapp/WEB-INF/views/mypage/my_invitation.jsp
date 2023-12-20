<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>

</head>
<body>

<main>
	<div class="n_custom_fluid">
		<div class="row justify-content-center">
			<c:forEach var="invitation" items="${myInvitationLists}">
			<div id="n_reservation_ticket">
				<div class="n_movie_img">
					<img src="/images/logo/IndieFliker.png">
				</div>
				<div class="n_reservation_detail">
					<span id="n_comment"><p>VIP 초청권이 도착했습니다!</p></span>
					<div class="n_detail">
					   <span>
						   <p class="n_title">· 영화 제목</p>
						   <p>${invitation.movieName}</p>
					   </span>
					   <span>
						   <p class="n_title">· 극장 이름</p>
						   <p>${invitation.theaterName}</p>
					   </span>
					   <span>
						   <p class="n_title">· 극장 주소</p>
						   <p>${invitation.theaterAddress}</p>
					   </span>
					   <span>
						   <p class="n_title">· 상영 날짜/시간</p>
						   <p>${invitation.movieTime}</p>
					   </span>
					</div>
				</div>
				<div class="n_reservation_number">
					<span><p id="n_title">초청권 코드 번호</p></span>
					<span><p id="n_number">${invitation.invitationCode}</p></span>
				</div>
			</div>
			</c:forEach>

			<div id="n_attention_comment">
				<p>· 관람안내</p>
				<p class="n_comment">- 구매하신 예매권은 온라인 상영관에서 언제든지 관람이 가능합니다.</p>
				<p class="n_comment">- 관람 기간은 <strong>총 4일</strong>이며, <strong>온라인 상영 기간 내</strong>에 관람이 가능합니다.</p>
				<p class="n_comment">- 관람 시작 기준은 구매 시점이며, 이후 4일이 지나면 자동으로 관람이 종료됩니다.</p>
			</div>
		</div>
	</div>
</main>
<!-- footer -->
<%@ include file="../layout/footer.jsp" %>

</body>
</html>
