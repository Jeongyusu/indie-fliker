<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="l_body">

<main>
	<div class="n_custom_fluid">
		<div class="container l_movie_list_title">
			<p class="l_list_title">VIP 초청권</p>
			<br>
			<p class="l_list_comment">VIP 회원을 위한 시사회 초청권</p>
		</div>
		<div class="row justify-content-center">
			<c:forEach var="invitation" items="${myInvitationPagingLists}">
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

			<div>
				<c:choose>
					<%-- 현재 페이지가 1페이지이면 이전 글자만 보여줌 --%>
					<c:when test="${paging.page <= 1}">
						<a>[이전]</a>
					</c:when>

					<c:otherwise>
						<%-- 이전을 누르면 컨트롤러에 현재 페이지보다 1 작은 페이지로 요청 --%>
						<a href="/invitation/my-invitation?page=${paging.page-1}">[이전]</a>
					</c:otherwise>
				</c:choose>

				<%-- 자바로 생각하면 >> for(int i = startPage; i <= endPage; i++) --%>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
					<c:choose>
						<%-- 현재 페이지는 클릭할 필요가 없기 때문에 <span>태그 처리 --%>
						<c:when test="${i eq paging.page}">
							<span>${i}</span>
						</c:when>

						<c:otherwise>
							<%-- 다른 페이지 이동이 필요할때 컨트롤러에 요청 --%>
							<a href="/invitation/my-invitation?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%-- 현재 페이지가 가장 끝 페이지이면 다음이라는 text만 나오게 함 --%>
				<c:choose>
					<c:when test="${paging.page >= paging.maxPage}">
						<a>[다음]</a>
					</c:when>
					<%-- 다음을 누르면 현재 페이지보다 1 큰 페이지로 요청 --%>
					<c:otherwise>
						<a href="/invitation/my-invitation?page=${paging.page+1}">[다음]</a>
					</c:otherwise>
				</c:choose>

			</div>

			<div id="n_attention_comment">
				<p>· 상영안내</p>
				<p class="n_comment">- 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</p>
				<p class="n_comment">- 상영시간 1시간 전까지 취소 가능하며, 갭쳐화면으로는 입장하실 수 없습니다.</p>
			</div>
		</div>
	</div>
</main>
<!-- footer -->
<%@ include file="../layout/footer.jsp" %>
