<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="l_body">
  <div class="l_dday_banner">
    온라인 개봉 예정 작품
  </div>

<!-- 영화 목록 (20개씩 비동기로 받아올 예정) -->
  <div class="container l_main_margin_bottom" style="margin-bottom: 20px">
    <div class="container l_movie_list_title">
      <p class="l_list_title">취향 맞춤 독립영화</p>
      <br>
      <p class="l_list_comment">다양한 독립영화를 즐겨보세요</p>
    </div>
    <div id="data-container" class="row row-cols-xl-5">
      <c:forEach var="dday" items="${onDDayMovieDTOs}" >
        <div class="col my-4 l_movie_card_form">
          <div class="card l_movie_card">
            <a href="/fund/funding/${dday.fundingId}"><img src="${dday.movieThumbnail}" class="card-img" alt="..."></a>
          </div>
          <div class="l_percent l_mint l_strong">${dday.fundingRate}% 달성</div>
          <div class="l_title">${dday.movieName}</div>
          <div class="l_content">${dday.synopsis}</div>
          <div class="l_production">${dday.production}</div>
        </div>
      </c:forEach>
    </div>
  </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
      <script type="module" src="/js/jys/pagination.js"></script>

    <%@ include file="../layout/footer.jsp" %>
