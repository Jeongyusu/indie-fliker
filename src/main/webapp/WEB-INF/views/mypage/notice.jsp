<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div class="container l_main_margin_bottom">
		<div class="k_ask_container">
			<h1 class="k_ask_main">공지 사항</h1>
		</div>
		<hr class="k_notice_hr">
		<c:forEach var="notice" items="${noticePagingLists}">
		<div class="k_ask_s_container">
			<div class="k_notice_import">중요</div>
			<div style="margin-top: 20px;">
				<a href="/notice/notice-detail/${notice.id}" class="k_notice_service">[${notice.category}] ${notice.noticeTitle}</a>
			</div>
			<div class="k_notice_time">인디피커 ${notice.formatNoticeDate()}</div>
			<hr class="k_notice_s_hr">
		</div>
		</c:forEach>


		<div class="p_paging p_notice_paging">
			<c:choose>
				<%-- 현재 페이지가 1페이지이면 이전 글자만 보여줌 --%>
				<c:when test="${paging.page <= 1}">
					<a class="p_priveous">이전</a>
				</c:when>
				<c:otherwise>
					<%-- 이전을 누르면 컨트롤러에 현재 페이지보다 1 작은 페이지로 요청 --%>
					<a class="p_priveous" href="/notice/paging?page=${paging.page-1}">이전</a>
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
						<a class="page_number" href="/notice/paging?page=${i}" style="color: #7f7f7f">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%-- 현재 페이지가 가장 끝 페이지이면 다음이라는 text만 나오게 함 --%>
			<c:choose>
				<c:when test="${paging.page >= paging.maxPage}">
					<a class="p_next">다음</a>
				</c:when>
				<%-- 다음을 누르면 현재 페이지보다 1 큰 페이지로 요청 --%>
				<c:otherwise>
					<a class="p_next" href="/notice/paging?page=${paging.page+1}">다음</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


<%@ include file="../layout/footer.jsp" %>