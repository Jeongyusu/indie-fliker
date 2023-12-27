<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>

<body class="_body">
	<div class="k_left_my">
		<img class="k_profile" src="${userInfo.pic}" alt="My Image">
		<p class="k_m_name">${userInfo.username} 님</p>
		<p class="k_grade">${userInfo.grade}</p>
		<hr class="k_left_my_hr">

		<c:choose>
			<c:when test="${kakaoLoginUser.id == userInfo.id}">
				<div class="kakao_login">
					<img class="kakao_profile" src="/images/kakao/kakao_profile.png">
					<span>카카오 간편 로그인 중</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="nomral_login">
					<img class="nomral_profile" src="/images/kakao/normal_login.png">
					<span>일반 로그인 중</span>
				</div>
			</c:otherwise>
		</c:choose>

		<a href="/user/logout"><button class="k_m_logout">로그아웃</button></a>
	</div>

	<div class="k_update_login-container">
		<div class="k_invite-container">
			<div class="k_i_group">
				<a href="/invitation/my-invitation">나의 초청권 현황</a>
				<span>${invitationCount} 개</span>
				<a href="/payment/on-payment">온라인 펀딩</a>
				<span>0 개</span>
				<a href="/payment/off-payment">오프라인 상영</a>
				<span>0 개</span>
				<a href="">찜한 목록</a>
				<span>0 개</span>
			</div>

		</div>
		<button class="k_see_movie">인디픽터에서
			<div class="k_font_weight_bold"><a href="/fund/main">온라인 상영 시작한 영화 보러가기</a></div>
		</button>
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
