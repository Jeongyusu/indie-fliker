<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>마이페이지</title>

	<link href="/css/khy_style.css" rel="stylesheet">


</head>


<body class="k_body">
	<div class="k_left_my">
		<img class="k_profile" src="../../../../resources/static/images/icons/gamst.jpg" alt="My Image">
		<div class="k_m_name">인디인디님 <button class="k_m_button">〉</button></div>
		<a href="/user/profile"><button class="k_m_vip">VIP</button></a>
		<button class="k_m_vip">VIP</button>
		<hr class="k_left_my_hr">
		<button class="k_m_kakao">카카오로 로그인 중</button>
		<button class="k_m_logout">로그아웃</button>
	</div>

	<div class="k_update_login-container">
		<button class="k_couponpack k_m_couponpack">세 번 결제로 VIP 혜택과 쿠폰팩 지급〉</button>
		<div class="k_invite-container">

			<a href="/invitation/my-invitation"><button class="k_invite">나의 초청권 현황 0 장</button></a>

			<div class="k_i_group">
				<span class="k_invite-group" style="margin-left: 20px;">온라인 펀딩
					<span class="k_font_weight_bold">0</span>
				</span>
				<span class="k_invite-group" >오프라인 상영
					<span class="k_font_weight_bold">0</span>
				</span>

				<span class="k_invite-group" style="margin-right: 25px;">찜한 목록
					<span class="k_font_weight_bold">0</span>
				</span>

			</div>

		</div>
		<button class="k_see_movie">인디픽터에서
			<div class="k_font_weight_bold">온라인 상영 시작한 영화 보러가기</div>
		</button>
		<div class="k_my_active">
			나의 활동
		</div>

		<button class="k_like_list">찜한 목록〉</button>

		<hr class="k_m_hr">
		<div class="k_c_center">고객센터</div>
		<div>
			<button class="k_c_center_list"><a href="/question/user">자주 묻는 질문〉</a></button>
			<button class="k_c_center_second_list"><a href="/notice/paging">공지사항〉</a></button>
		</div>
		<hr class="k_m_hr">
		<div>
			<button class="k_c_center_list"><a href="/user/profile">회원 정보 수정〉</a></button>
			<button class="k_c_center_second_list" onclick="openModal()">회원 탈퇴〉</button>
		</div>
		<hr class="k_m_hr">
		<button class="k_c_center_list_set">설정〉</button>
		<hr class="k_m_hr">
	</div>
	<!------------------------------------- 모달 창 ------------------------------------------->
	<!-- 모달 백그라운드 -->
	<div class="k_isWithdrawal_modal_background" id="modalBackground" onclick="closeModal()"></div>
	<div class="k_isWithdrawal_modal" id="myModal">
		<h2>정말 탈퇴하겠습니까?</h2>
		<button class="close" onclick="closeModal()">취소</button>
		<a href="/user/isWithdrawal">탈퇴</a>
	</div>
	<!------------------------------------- 모달 창 ------------------------------------------->
	<!--------------------------------- 모달 버튼 ---------------------------------------------->
	<script>
		// 모달 열기
		function openModal() {
			document.getElementById('myModal').style.display = 'block';
			document.getElementById('modalBackground').style.display = 'block';
		}
		// 모달 닫기
		function closeModal() {
			document.getElementById('myModal').style.display = 'none';
			document.getElementById('modalBackground').style.display = 'none';
		}
	</script>
	<!--------------------------------- 모달 버튼 ---------------------------------------------->


	<%@ include file="../layout/footer.jsp" %>
