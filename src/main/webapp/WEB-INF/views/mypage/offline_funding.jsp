<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오프라인 상영 내역</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="../../../../css/lsr_style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>

<body>
    <div class="h1 m-5">펀딩한 내역</div>
    <div class="text-center">                 
        <a href="#" class="l_effect_underline" style="border-bottom: 2px solid; padding-bottom: 11px;">오프라인 상영 내역</a>
        <a href="#" class="l_effect_underline">온라인 펀딩 내역</a>
    </div>

    <div class="container">
        <div class="l_movie_card card text-bg-light">
            <div class="row g-0">
                <div class="col-md-4 d-flex align-items-center justify-content-center my-4">
                    <img src="https://dummyimage.com/600x300/000/fff.jpg" class="card-img" alt=""
                        style="width: 12rem; height: 18rem;">
                </div>
                <div class="col-md-5 d-flex align-items-center">
                     <div class="card-body">
                      <div class="h5 card-title">투팅카멘의 진실</div>
                      <div class="p card-text l_mint mb-3">70% 달성</div>
                      <div class="p card-text mb-3">A blade runner must pursue and try to terminate four replicants...
                        A blade runner must pursue and try to terminate four replicants...
                      </div>
                      <div class="p card-text mb-2">결제 일시</div>
                      <div class="p card-text">결제 정보</div>
                    </div>
                  </div>
                <div class="col-md-3 d-flex flex-column align-items-end justify-content-end mb-4">
                  <button class="btn btn-outline-dark mt-2" type="button" style="margin-right: 2.5rem; width: 8rem;">티켓 확인</button>
                  <button class="btn l_mint_button text-white mt-2" type="button" style="margin-right: 2.5rem; width: 8rem;">환불하기</button>
                </div>
            </div>
        </div>
        <div class="l_movie_card card text-bg-light">
          <div class="row g-0">
              <div class="col-md-4 d-flex align-items-center justify-content-center my-4">
                  <img src="https://dummyimage.com/600x300/000/fff.jpg" class="card-img" alt=""
                      style="width: 12rem; height: 18rem;">
              </div>
              <div class="col-md-5 d-flex align-items-center">
                  <div class="card-body">
                      <div class="h5 card-title">투팅카멘의 진실</div>
                      <div class="p card-text l_mint mb-3">70% 달성</div>
                      <div class="p card-text mb-3">A blade runner must pursue and try to terminate four replicants...
                        A blade runner must pursue and try to terminate four replicants...
                      </div>
                      <div class="p card-text mb-2">결제 일시</div>
                      <div class="p card-text">결제 정보</div>
                    </div>
                  </div>
              <div class="col-md-3 d-flex flex-column align-items-end justify-content-end mb-4">
                <button class="btn btn-outline-dark mt-2" type="button" style="margin-right: 2.5rem; width: 8rem;">티켓 확인</button>
                <button class="btn l_mint_button text-white mt-2" type="button" style="margin-right: 2.5rem; width: 8rem;">환불하기</button>
              </div>
          </div>
      </div>

      <nav aria-label="Page navigation ">
        <ul class="pagination justify-content-center" id="l_pagination">
        </ul>
      </nav>

    </div>
    <!-- footer -->
</body>
<script>
  // 현재 페이지와 총 페이지를 서버에서 받을 예정 (jsp로 변경 예정(c:foreach로 돌릴거임))
  const pageInfo = {
      currentPage: 3,
      totalPages: 10
  };

  const pagination = $('#l_pagination');

  for (let i = 1; i <= pageInfo.totalPages; i++) {
      const li = $('<li>').addClass('page-item');
      const a = $('<a>').addClass('page-link').attr('href', '#');

      if (i === pageInfo.currentPage) {
          li.addClass('active');
      }

      a.text(i);
      li.append(a);
      pagination.append(li);
  }  
</script>

</html>