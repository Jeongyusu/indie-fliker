<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<div class="container l_main_margin_bottom">
		<div class="container l_movie_list_title">
			<p class="l_list_title">BEST 영화</p>
			<br>
			<p class="l_list_comment">실시간 펀딩 영화 랭킹</p>
		</div>
		<div id="l_main" class="row row-cols-xl-4">
			<c:forEach var="ranker" items="${onAirTotalDTO.onAirMovieRankingDTOs}" varStatus="status">
				<div class="col l_ranking_card" style="max-width: 250px;">
					<div class="card l_main_card" style="border: none;">
						<div class="l_movie_image">
							<figure class="l_front">
								<img src="${ranker.movieThumbnail}" class="card-img" alt="...">
							</figure>
							<div class="l_overlay_button l_back">
								<a href="/fund/funding/${ranker.fundingId}"><button class="btn btn-outline-success l_button">예매하기</button></a>
							</div>
						</div>
						<div class="l_percent l_mint l_strong">${ranker.fundingRate}% 달성</div>
						<div class="l_movie_online_title">
							<img src="" class="l_grade_img">
							<div class="l_title">${ranker.movieName}</div>
							<input type="hidden" value="${ranker.runningGrade}" class="grade">
						</div>
						<div class="l_period">상영 : ${ranker.period()}</div>
						<div class="l_content">${ranker.synopsis}</div>
						<div class="l_production">${ranker.production}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<hr class="l_hr">
	<!-- 영화 목록 (20개씩 비동기로 받아올 예정) -->
	<div class="container l_main_margin_bottom">
		<div class="container l_movie_list_title">
			<p class="l_list_title">취향 맞춤 독립영화</p>
			<br>
			<p class="l_list_comment">다양한 독립영화를 즐겨보세요</p>
		</div>
		<div id="data-container" class="row row-cols-xl-4">
			<c:forEach var="funding" items="${onAirTotalDTO.onAirMovieDTOs}" varStatus="status">
				<div class="col my-4 l_movie_card_form">
					<div class="card l_main_card">
						<div class="l_movie_image">
							<figure class="l_front">
								<img src="${funding.movieThumbnail}" class="card-img" alt="...">
							</figure>
							<div class="l_overlay_button l_back">
								<a href="/fund/funding/${funding.fundingId}"><button class="btn btn-outline-success l_button">예매하기</button></a>
							</div>
						</div>
						<div class="l_percent l_mint l_strong">${funding.fundingRate}% 달성</div>
						<div class="l_movie_online_title">
							<img src="" class="l_grade_img">
							<div class="l_title">${funding.movieName}</div>
							<input type="hidden" value="${funding.runningGrade}" class="grade">
						</div>
						<div class="l_period">상영 : ${funding.period()}</div>
						<div class="l_content">${funding.synopsis}</div>
						<div class="l_production">${funding.production}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="container l_up_container">
		<div class="alert alert-success" role="alert">
			영화의 매력을 경험하고 싶다면... <a href="#" class="alert-link">지금 상영중인 인기영화</a>를
			놓치지 마세요!
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<script type="module" src="/js/jys/on_pagination.js"></script>
	<%@ include file="../layout/footer.jsp" %>
