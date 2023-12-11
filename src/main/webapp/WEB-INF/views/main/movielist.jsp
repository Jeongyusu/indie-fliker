<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="l_body">
  <!-- 배너 object-fit: contain 아니면 cover 고민중 -->
  <div class="banner-container" style="background: linear-gradient(to bottom, #201111, #2b2626);">
  <div class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="l_banner_item carousel-item active">
        <div class="d-block">
            <img src="https://img.freepik.com/premium-photo/background-that-emulates-ghibli-studio-style_931878-132658.jpg?w=2000" class="card-img" alt="..." style="object-fit: cover;height: 400px;">
        </div>
      </div>
      <div class="l_banner_item carousel-item">
        <div class="d-block">
            <img src="https://pbs.twimg.com/media/D2jSGe2WwAAymAW.jpg" class="card-img" alt="..." style="object-fit: cover;height: 400px;">
        </div>
      </div>
      <div class="l_banner_item carousel-item">
        <div class="d-block">
            <img src="https://webneel.net/file/images/11-16/8-xmen-movieCrawl-poster-design.preview.jpg" class="card-img" alt="..." style="object-fit: cover;height: 400px;">
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 영화 목록 (20개씩 비동기로 받아올 예정) -->
<div class="container">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">

    <c:forEach var="funding" items="${fundingPlusDTO.moviesByGenreDTOs}" >
      <div class="col my-4">
        <div class="card">
          <img src="${funding.movieThumbnail}" class="card-img" alt="...">
        </div>
        <div class="h4 card-title l_mint mt-3">${funding.fundingRate}</div>
        <div class="h5 card-text mt-2">[${funding.movieName}]</div>
        <div class="card-text mt-2">${funding.synopsis}</div>
        <figcaption class="figure-caption">${funding.production}</figcaption>
      </div>
    </c:forEach>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <%@ include file="../layout/footer.jsp" %>
