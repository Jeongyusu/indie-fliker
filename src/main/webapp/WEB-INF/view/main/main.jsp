<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

  <div id="l_banner" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="l_banner_item carousel-item active">
        <div class="d-block">
          <p>인디픽커에서 영화를 후원하고 오프라인에서 만나보세요!</p>
          <div class="h1">이거 되나</div>
        </div>
      </div>
      <div class="l_banner_item carousel-item">
        <div class="d-block">
          <p>인디픽커에서 영화를 후원하고 오프라인에서 만나보세요!</p>
          <div class="h1">상영중인 인기영화</div>
        </div>
      </div>
      <div class="l_banner_item carousel-item">
        <div class="d-block">
          <p>이거 되나</p>
          <div class="h1">asdfasdfasdf</div>
        </div>
      </div>
    </div>
  </div>

  <!-- 인기 영화 4선 (예매가능 박스오피스) -->
  <div class="container">
  <div class="row mt-5" style="justify-content: center;">
    <div class="col" style="max-width: 300px;">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
        <div class="card-img-overlay text-white">
          <div class="h3">1</div>
        </div>
      </div>
     <div class="card-title h4 l_mint mt-3 text-center">500% 달성</div>
     <div class="card-text h3 mt-2 text-center">[아이다]</div>
    </div>
    <div class="col" style="max-width: 300px;">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
        <div class="card-img-overlay text-white">
          <div class="h3">2</div>
        </div>
      </div>
      <div class="card-title h4 l_mint mt-3 text-center">500% 달성</div>
      <div class="card-text h3 mt-2 text-center">[아이다]</div>
    </div>
    <div class="col" style="max-width: 300px;">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
        <div class="card-img-overlay text-white">
          <div class="h3">3</div>
        </div>
      </div>
      <div class="card-title h4 l_mint mt-3 text-center">500% 달성</div>
      <div class="card-text h3 mt-2 text-center">[아이다]</div>
    </div>
    <div class="col" style="max-width: 300px;">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
        <div class="card-img-overlay text-white">
          <div class="h3">4</div>
        </div>
      </div>
      <div class="card-title h4 l_mint mt-3 text-center">500% 달성</div>
      <div class="card-text h3 mt-2 text-center">[아이다]</div>
    </div>
  </div>
</div>

<hr style="margin: 3rem;">
<!-- 영화 목록 -->
<div class="container">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
    
    <div class="col my-4">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
      </div>
      <div class="card-title h4 l_mint mt-3">75% 달성</div>
      <div class="card-text h5 mt-2">[아이다]</div>
      <div class="card-text p mt-2">Quos, magni minus. Consectetur error sed quae magnam ut id mollitia ullam.</div>
    </div>
    <div class="col my-4">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
      </div>
      <div class="card-title h4 l_mint mt-3">75% 달성</div>
      <div class="card-text h5 mt-2">[아이다]</div>
      <div class="card-text p mt-2">Quos, magni minus. Consectetur error sed quae magnam ut id mollitia ullam.</div>
    </div>
    <div class="col my-4">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
      </div>
      <div class="card-title h4 l_mint mt-3">75% 달성</div>
      <div class="card-text h5 mt-2">[아이다]</div>
      <div class="card-text p mt-2">Quos, magni minus. Consectetur error sed quae magnam ut id mollitia ullam.</div>
    </div>
    <div class="col my-4">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
      </div>
      <div class="card-title h4 l_mint mt-3">75% 달성</div>
      <div class="card-text h5 mt-2">[아이다]</div>
      <div class="card-text p mt-2">Quos, magni minus. Consectetur error sed quae magnam ut id mollitia ullam.</div>
    </div>
    <div class="col my-4">
      <div class="card">
        <img src="https://dummyimage.com/160x230/000/fff.jpg" class="card-img" alt="...">
      </div>
      <div class="card-title h4 l_mint mt-3">75% 달성</div>
      <div class="card-text h5 mt-2">[아이다]</div>
      <div class="card-text p mt-2">Quos, magni minus. Consectetur error sed quae magnam ut id mollitia ullam.</div>
    </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  
  <%@ include file="/WEB-INF/view/layout/footer.jsp" %>

