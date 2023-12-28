<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>

<body class="l_body">
	<div class="k_my_main">
		<div class="k_my_group">
			<div class="k_left_my">
				<img class="k_profile" src="${userInfo.pic}" alt="My Image">
				<p class="k_m_name">${userInfo.username} 님</p>
				<div class="k_user_grade">
					<c:choose>
						<c:when test="${userInfo.grade == 'NORMAL'}">
							<p class="k_grade_normal">${userInfo.grade}</p>
						</c:when>
						<c:otherwise>
							<p class="k_grade_vip">${userInfo.grade}</p>
						</c:otherwise>
					</c:choose>
				</div>
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
				<div>
					<a href="/user/logout"><button class="k_m_logout">로그아웃</button></a>
				</div>
			</div>

			<div class="k_update_login-container">
				<div class="k_invite-container">
					<div class="k_i_group_invite">
						<div class="k_i_flex">
							<img src="/images/icons/ticket.png" class="k_icon_img">
							<a href="/invitation/my-invitation">나의 초청권 현황</a>
						</div>
						<span><a class="l_mint">${invitationCount}</a> 장</span>
					</div>
					<div class="k_i_group_list">
						<div class="k_i_column">
							<a href="/payment/on-payment">온라인 펀딩</a>
							<span>${orderCountDTO.onlineCount}</span>
						</div>
						<div class="k_i_column">
							<a href="/payment/off-payment">오프라인 상영</a>
							<span>${orderCountDTO.offlineCount}</span>
						</div>
						<div class="k_i_column">
							<a href="">찜한 목록</a>
							<span>${scrabCount}</span>
						</div>
					</div>

				</div>
				<button class="k_see_movie">인디픽터에서
					<br>
					<div class="k_font_weight_bold"><a href="/fund/main">온라인 상영 시작한 영화 보러가기</a></div>
				</button>
				<div>
					<div class="k_c_center">나의 활동</div>
						<div class="k_only_flex">
							<button class="k_c_center_list"><a href="/scrab/my-likelist">
								<div class="k_i_flex">
									<img src="/images/icons/heart.png" class="k_icon_img">
									<p>찜한 목록</p>
								</div>
							</a></button>
							<button class="k_c_center_list"><a href="">
								<div class="k_i_flex">
									<img src="/images/icons/movie2.png" class="k_icon_img">
									<p>개봉한 영화</p>
								</div>
							</a></button>
						</div>
					<hr class="k_m_hr">
				</div>
				<div>
					<div class="k_c_center">고객 센터</div>
					<div class="k_only_flex">
						<button class="k_c_center_list"><a href="/question/user">
							<div class="k_i_flex">
								<img src="/images/icons/question.png" class="k_icon_img">
								<p>자주 묻는 질문</p>
							</div>
						</a></button>
						<button class="k_c_center_list"><a href="/notice/paging">
							<div class="k_i_flex">
								<img src="/images/icons/announcement.png" class="k_icon_img">
								<p>공지사항</p>
							</div>
						</a></button>
					</div>
					<hr class="k_m_hr">
					<div class="k_only_flex">
						<button class="k_c_center_list"><a href="/user/profile">
							<div class="k_i_flex">
								<img src="/images/icons/modify.png" class="k_icon_img">
								<p>회원 정보 수정</p>
							</div>
						</a></button>
						<button class="k_c_center_list" onclick="openModal()">
							<div class="k_i_flex">
								<img src="/images/icons/modify.png" class="k_icon_img">
								<p>회원 탈퇴</p>
							</div>
						</button>
					</div>
					<hr class="k_m_hr">
				</div>
			</div>
			<!------------------------------------- 모달 창 ------------------------------------------->
			<!-- 모달 백그라운드 -->
			<div class="k_isWithdrawal_modal_background" id="modalBackground" onclick="closeModal()"></div>
			<div class="k_isWithdrawal_modal" id="myModal">
				<h2>정말 탈퇴하겠습니까?</h2>
				<button class="close" onclick="closeModal()">취소</button>
				<a href="/user/isWithdrawal">탈퇴</a>
			</div>
		</div>
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
