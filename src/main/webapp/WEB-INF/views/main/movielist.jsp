<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- 배너 object-fit: contain 아니면 cover 고민중 -->
  <div class="banner-container" style="background: linear-gradient(to bottom, #201111, #2b2626);">
    <div class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <c:forEach var="banner" items="${fundingListDTO.banners}" varStatus="status">
          <div class="l_banner_item carousel-item${status.first ? ' active' : ''}">
            <div class="d-block">
              <img src="${banner.bannerPic}" class="card-img" alt="..." style="object-fit: contain; height: 300px;">
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>

  <!-- 영화 목록 (20개씩 비동기로 받아올 예정) -->
  <div class="container l_main_margin_bottom">
    <div class="container l_movie_list_title">
      <p class="l_list_title">취향 맞춤 독립영화</p>
      <br>
      <p class="l_list_comment">독립영화의 매력을 더 깊게 체험하고 쉽게 만나보세요. </p>
    </div>
    <div id="data-container" class="row row-cols-xl-5">
      <c:forEach var="funding" items="${fundingListDTO.fundingDTOs}">
        <div class="col my-4 l_movie_card_form">
          <div class="card l_movie_card j_paging">
            <a href="/fund/funding/${funding.fundingId}"><img src="${funding.movieThumbnail}" class="card-img" alt="..."></a>
          </div>
          <div class="l_percent l_mint l_strong">${funding.fundingRate}% 달성</div>
          <div class="l_title">${funding.movieName}</div>
          <div class="l_content">${funding.synopsis}</div>
          <div class="l_production">${funding.production}</div>
        </div>
      </c:forEach>
    </div>
  </div>

  <div>
    <button id="scrollToTopBtn"><img src="/images/icons/upArrow.gif" class="j_up_button"></button>
  </div>
  <script type="module" src="/js/jys/pagination.js"></script>
    <%@ include file="../layout/footer.jsp" %>
