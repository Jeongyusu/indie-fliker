<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인화면</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="../../../../css/lsr_style.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
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

	<div class="container">
		<div class="row mt-5 justify-content-center text-center">
			<u><div class="h4 mb-5">
					박스오피스</a>
				</div></u>
			<div class="col" style="max-width: 300px;">
				<div class="card l_main_card" style="border: none;">
					<img
						src="https://img.megabox.co.kr/SharedImg/2023/11/22/aM1zeiVGySigNObspcjcoH9NaebEPa2f_420.jpg"
						class="card-img" alt="...">
					<div class="card-img-overlay text-white">
						<div class="h3">1</div>
					</div>
					<div class="l_overlay_button">
						<button class="btn btn-outline-success">예매하기</button>
					</div>
					<div class="h4 card-title l_mint mt-3">500% 달성</div>
					<div class="h3 card-text mt-2">[서울의 봄]</div>
					<figcaption class="figure-caption">감독이름</figcaption>
				</div>
			</div>
			<div class="col" style="max-width: 300px;">
				<div class="card l_main_card" style="border: none;">
					<img
						src="https://img.megabox.co.kr/SharedImg/2023/10/25/FXFCIlhJ6JEcTfk8BpVkSWvmf84sSpe9_420.jpg"
						class="card-img" alt="...">
					<div class="card-img-overlay text-white">
						<h3>2</h3>
					</div>
					<div class="l_overlay_button">
						<button class="btn btn-outline-success">예매하기</button>
					</div>
					<div class="h4 card-title l_mint mt-3">500% 달성</div>
					<div class="h3 card-text mt-2">[서울의 봄]</div>
					<figcaption class="figure-caption">감독이름</figcaption>
				</div>
			</div>
			<div class="col" style="max-width: 300px;">
				<div class="card l_main_card" style="border: none;">
					<img
						src="https://img.megabox.co.kr/SharedImg/2023/11/15/OM0860oG9r27Dz8NvMXxZJqydpkEwMdK_420.jpg"
						class="card-img" alt="...">
					<div class="card-img-overlay text-white">
						<h3>3</h3>
					</div>
					<div class="l_overlay_button">
						<button class="btn btn-outline-success">예매하기</button>
					</div>
					<div class="h4 card-title l_mint mt-3">500% 달성</div>
					<div class="h3 card-text mt-2">[서울의 봄]</div>
					<figcaption class="figure-caption">감독이름</figcaption>
				</div>
			</div>
			<div class="col" style="max-width: 300px;">
				<div class="card l_main_card" style="border: none;">
					<img
						src="https://img.megabox.co.kr/SharedImg/2023/11/01/bgAwV6TVs8nZAlfFdCiPsJySiHlp0vRC_420.jpg"
						class="card-img" alt="...">
					<div class="card-img-overlay text-white">
						<h3>4</h3>
					</div>
					<div class="l_overlay_button">
						<button class="btn btn-outline-success">예매하기</button>
					</div>
					<div class="h4 card-title l_mint mt-3">500% 달성</div>
					<!-- 말줄임표는 text-truncate 사이즈가 이상해져서 뺐음-->
					<div class="h3 card-text mt-2">[서울의 봄]</div>
					<figcaption class="figure-caption">감독이름</figcaption>
				</div>
			</div>
		</div>
	</div>

	<hr style="margin: 5rem;">

	<div class="container">
		<div class="h3">BEST 영화</div>
		<div class="p mb-5">실시간 펀딩 영화 랭킹</div>
		<div class="row">
			<div class="col">
				<div class="card l_main_hovcard bg-dark text-white">
					<img src="https://dummyimage.com/800x550/000/fff.jpg"
						class="card-img" alt="Blade Runner">
				</div>
			</div>
			<div class="col">
				<div class="card l_main_hovcard bg-dark text-white">
					<img src="https://dummyimage.com/800x550/000/fff.jpg"
						class="card-img" alt="Blade Runner">
				</div>
			</div>
			<div class="col">
				<div class="card l_main_hovcard bg-dark text-white">
					<img src="https://dummyimage.com/800x550/000/fff.jpg"
						class="card-img" alt="Blade Runner">
				</div>
			</div>
		</div>
	</div>

	<div style="margin: 8rem;"></div>

	<div class="container">
		<div class="h3">오프라인 영화 상영관</div>
		<div class="p">펀딩이 성공 시, 오프라인 상영관이 개장됩니다</div>
		<div class="l_movie_card card" style="border: 0px;">
			<div class="row">
				<div
					class="col-md-5 d-flex align-items-center justify-content-center my-4">
					<img
						src="https://www.ikspiari.com/ko/resource/images/cinema/cinema_pct_stadium01.png"
						class="card-img" alt="">
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<div class="card-body">
						<div class="h4 card-title">그린 아트 시네마</div>
						<div class="card-text l_mint mb-4">부산광역시 부산진구 부전제2동 521-10</div>
						<div class="p card-text">그린 아트 시네마는 오랜 역사를 갖춘 엔터테인먼트의 중심지로,
							그 웅장한 화면과 몰입적인 음향이 여러 세대를 사로잡아왔습니다. 이 강력한 매체는 우리의 감정을 흔들며, 상상력을
							자극하는 동시에 사회적 소통의 장으로서 기능해왔습니다.</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="alert alert-success" role="alert">
			영화의 매력을 경험하고 싶다면... <a href="#" class="alert-link">지금 상영중인 인기영화</a>를
			놓치지 마세요!
		</div>
	</div>
	<!-- footer -->
</body>
</html>