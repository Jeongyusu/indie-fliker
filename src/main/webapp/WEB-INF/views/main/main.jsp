<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="l_body">
	<!-- header -->
	<div id="l_banner" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="l_banner_item carousel-item active">
				<div class="d-block">
					<div class="p">인디픽커에서 더욱 풍성한 영화 경험을 즐겨보세요!</div>
					<div class="h1">독립영화 펀딩</div>
				</div>
			</div>
			<div class="l_banner_item carousel-item">
				<div class="d-block">
					<div class="p">인디픽커에서 영화를 후원하고 오프라인에서 만나보세요!</div>
					<div class="h1">상영중인 인기영화</div>
				</div>
			</div>
			<div class="l_banner_item carousel-item">
				<div class="d-block">
					<div class="p">진정한 감동을 만나다!</div>
					<div class="h1">그린 아트 시네마</div>
				</div>
			</div>
		</div>
	</div>
	<a href="/user/mypage">마이페이지</a>
	<div class="container">
		<div class="row mt-5 justify-content-center text-center">
			<u><div class="h4 mb-5">
					박스오피스
				</div></u>
			<c:forEach var="funding" items="${onAirTotalDTO.onAirMovieDTOs}">
				<div class="col" style="max-width: 300px;">
					<div class="card l_main_card" style="border: none;">
					
						<div class="l_movie_image">
							<figure class="l_front">
								<img src="${funding.movieThumbnail}" class="card-img" alt="...">
							</figure>
							<div class="l_overlay_button l_back">
								<button class="btn btn-outline-success l_button">예매하기</button>
							</div>
						</div>

						<div class="h4 card-title l_mint mt-3">${funding.fundingRate}% 달성</div>
						<div class="h3 card-text mt-2">${funding.movieName}</div>
						<figcaption class="figure-caption">${funding.production}</figcaption>
					</div>
				</div>
			</c:forEach>


		</div>
	</div>

	<hr style="margin: 5rem;">

	<div class="container">
		<div class="h3">BEST 영화</div>
		<div class="p mb-5">실시간 펀딩 영화 랭킹</div>
		<div class="row">

			<c:forEach var="ranker" items="${onAirTotalDTO.onAirMovieRankingDTOs}" varStatus="status">
				<div class="col" style="max-width: 300px;">
					<div class="card l_main_card" style="border: none;">
						<img
								src="${ranker.movieThumbnail}"
								class="card-img" alt="...">
						<div class="card-img-overlay text-white">
							<div class="h3">${status.index + 1}</div>
						</div>
						<div class="l_overlay_button">
							<button class="btn btn-outline-success">예매하기</button>
						</div>
						<div class="h4 card-title l_mint mt-3">${ranker.fundingRate}% 달성</div>
						<div class="h3 card-text mt-2">${ranker.movieName}</div>
						<figcaption class="figure-caption">${ranker.production}</figcaption>
					</div>
				</div>
			</c:forEach>



		</div>
	</div>

	<div style="margin: 4rem;"></div>

	<div class="container">
		<div class="h3">오프라인 영화 상영관</div>
		<div class="p">펀딩이 성공 시, 오프라인 상영관이 개장됩니다</div>
		<c:forEach var="theater" items="${onAirTotalDTO.theaterListDTOs}">
			<div class="l_movie_card card" style="border: 0px;">
				<div class="row">
					<div
							class="col-md-5 d-flex align-items-center justify-content-center my-4">
						<img
								src="${theater.theaterPic}"
								class="card-img" alt="">
					</div>
					<div class="col-md-6 d-flex align-items-center">
						<div class="card-body">
							<div class="h4 card-title">${theater.theaterName}</div>
							<div class="card-text l_mint mb-4">${theater.theaterAddress}</div>
							<div class="p card-text">${theater.theaterDescription}</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="container">
		<div class="alert alert-success" role="alert">
			영화의 매력을 경험하고 싶다면... <a href="#" class="alert-link">지금 상영중인 인기영화</a>를
			놓치지 마세요!
		</div>
	</div>
	<!-- footer -->
	<%@ include file="../layout/footer.jsp" %>
