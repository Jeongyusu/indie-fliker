<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 등록 허가( register ) 완료!</title>
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/css/style.css" rel="stylesheet">


</head>
<body>

	<div class="p_main">
        <!--탑 시작-->
        <div class="p_top">

            <div class="p_title">
                <div class="p_line"></div>
                <a href=""><h2>IndiFlinker</h2></a>
            </div>

            <form id="search-form" action="/admin/funding-ready-list/search" method="get">
                <div class="p_search">
                    <button type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                    <input type="text" name="keyword" placeholder="검색 하기">
                </div>
            </form>
        </div>
        <!--탑 끝-->

        <!--컨테이너1 시작-->
        <div class="p_container1">

            <div class="p_section1">
                <div class="p_dashboard">
                    <i class="fa-solid fa-table-cells-large"></i>
                    <a href="">대시보드</a>
                </div>
            </div>

            <div class="p_section2">
                <h3>영화</h3>
                <ul>
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/funding-ready-list">펀딩 등록 승인</a></li>
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="/admin/funding/confirm">펀딩 현황 확인</a></li>
                    <li><i class="fa-solid fa-pen p_icon3"></i><a href="/admin/funding-management">펀딩 수정 / 종료</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section3">
                <h3>회원</h3>
                <ul>
                    <li><i class="fa-solid fa-ticket-simple p_icon1"></i><a href="/admin/invitation">VIP 초청권 발급</a></li>
                    <li><i class="fa-solid fa-user p_icon2"></i><a href="/admin/user-management">일반 회원 관리</a></li>
                    <li><i class="fa-solid fa-user-group p_icon3"></i><a href="/admin/vip-management">VIP 회원 관리</a></li>
                    <li><i class="fa-solid fa-user-group p_icon3"></i><a href="/admin/grade-update">회원 등급 수정</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section4">
                <h3>기간 설정</h3>
                <ul>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/movie-open/setting">온라인 상영 기간 설정/채팅 오픈 시간 설정</a></li>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/off-movie-open/setting">오프라인 상영 기간 설정</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

        </div>
        <!--컨테이너1 끝-->



        <!--컨테이너2 시작-->
        <div class="p_register_container2">
            <div class="j_font_style">
                <h3>펀딩 등록 승인</h3>
            </div>
            <div class="p_section1" id="data-container">
                <c:forEach var="fundingReady" items="${fundingReadyDTOs}" varStatus="status">
                    <div class="p_menu1 p_custom_margin_bottom">
                        <img src="${fundingReady.thumbnail}" alt="영화 사진">
                        <p>영화 제목 : ${fundingReady.movieName}</p>
                        <p>영화 감독 : ${fundingReady.director}</p>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#j_fund_modal" data-id="${fundingReady.fundingReadyId}"
                        data-name="${fundingReady.movieName}">
                            영화 등록 하기
                        </button>
                    </div>
                </c:forEach>
            </div>
                <div class="modal" id="j_fund_modal">
                    <div class="modal-dialog" style="max-width: none; width: 70%" >
                        <input type="hidden" id="original">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title" id="modal_title">Modal Heading</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <iframe id="fund_frame" style="width: 100%; height: 100%;
                              border: none;">대체 내용</iframe>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" id="auth_button" onclick="AuthorizationFunding()">등록 승인</button>
                                <button type="button" class="btn btn-danger" style="background-color: #ea6161" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="hidden_id">
            </div>

        </div>
    <div>
        <button id="scrollToTopBtn"><img src="/images/icons/upArrow.gif" class="j_up_button"></button>
    </div>


<script>

        // 모달 열기
        function openModal(id) {
            document.getElementById('j_fund_modal'+ id).style.display = 'block';
            document.getElementById('j_pagination').style.display = 'none';

        }

        // 모달 닫기
        function closeModal(id) {
            document.getElementById('j_fund_modal' + id).style.display = 'none';
            document.getElementById('j_pagination').style.display = 'block';

        }

        async function AuthorizationFunding(){
            let fundingId = document.getElementById('hidden_id').value;
            try {
                let response = await fetch('/admin/funding-ready/save', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({fundingId: fundingId}),
                });
                let responseBody = await response.json();
                if (responseBody.success) {
                    alert("등록 승인 성공");
                    window.location.reload();
                    setTimeout(function() {
                        document.getElementById('j_pagination').style.display = 'block';
                    }, 1000);

                } else {
                    alert(responseBody.error.message);
                }
            } catch (error) {
                console.log("에러 발생" + error.message);
            }
        }

        let currentPage = 2;
        let isLoading = false;
        window.onload = function () {
            console.log("온로드 실행");
            isLoading = false;
        };

        $(window).scroll(function() {
            // 스크롤 이동 시 실행되는 코드
            console.log("제이쿼리 스크롤");
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                // 페이지 하단에 도달했을 때만 추가 데이터 로드
                loadMoreData();
            }

        });



        // fetch로 새로운 데이터 받아오기
        async function fetchFundingList(page) {
            console.log("현재 페이지 확인")
            console.log(page)
            let response = await fetch('/admin/funding/register/more-data?page=' + page);
            let responseBody = await response.json();
            if (responseBody.success) {
                return responseBody.response;
            } else {
                throw new Error(responseBody.error);
            }
        }

        // 마우스 스크롤 감지 후 새로운 데이터를 받아온 후 새로운 요소 생성하기
        function loadMoreData() {

            if (isLoading) {
                return;
            }
            isLoading = true;

            // 로딩 딜레이 주기
            setTimeout(async () => {
                try {
                    const newData = await fetchFundingList(currentPage);

                    // newData를 순회하며 DOM에 추가
                    newData.forEach((data) => {
                        var newElement = '<div class="p_menu1 p_custom_margin_bottom">' +
                            '<img src="' + data.thumbnail + '" alt="영화 사진">' +
                            '<p>영화 제목 : ' + data.movieName + '</p>' +
                            '<p>영화 감독 : ' + data.director + '</p>' +
                            '<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#j_fund_modal" data-id="' + data.fundingReadyId + '" data-name="' + data.movieName + '">' +
                            '영화 등록 하기' +
                            '</button>' +
                            '</div>';

                        // 데이터를 추가할 컨테이너 선택
                        var container = $('#data-container');

                        // 컨테이너에 새로운 요소 추가
                        container.append(newElement);
                    });
                    currentPage++;
                } catch (error) {
                    console.error('Error fetching and rendering data:', error);
                }
            }, 1000);

            var scrollToTopBtn = document.getElementById("scrollToTopBtn");

            window.addEventListener("scroll", function() {
                // 현재 스크롤 위치 가져오기
                var scrollPosition = window.scrollY;

                // 스크롤 위치가 300px 이상이면 버튼 표시, 아니면 숨김
                if (scrollPosition > 500) {
                    scrollToTopBtn.style.display = "block";
                } else {
                    scrollToTopBtn.style.display = "none";
                }
            });

            // 버튼 클릭 시 맨 위로 스크롤하는 함수
            function scrollToTop() {
                window.scrollTo({
                    top: 0,
                    behavior: "smooth" // 부드러운 스크롤 적용
                });
            }

            // 버튼에 클릭 이벤트 리스너 추가
            scrollToTopBtn.addEventListener("click", scrollToTop);
        }

        $('#j_fund_modal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var title = button.data('name');
            // 모달 팝업에 데이터 집어넣기
            var modal = $(this);
            $('#fund_frame').attr('src', '/funding-ready/' + id);
            $('#modal_title').text(title);
            $('#hidden_id').attr('value', id);
        })


</script>