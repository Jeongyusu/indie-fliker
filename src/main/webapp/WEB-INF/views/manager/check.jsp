<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../manager/layout/manager_header.jsp" %>

<!--컨테이너1 시작-->
<div class="p_flex_center">
    <div class="p_main">
        <div class="p_container1">
            <div class="p_section1">
                <div class="p_section_title">영화</div>
                <ul class="p_section_ul">
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/funding-ready-list">펀딩 등록 승인</a>
                    </li>
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="/admin/funding/confirm">펀딩 현황 확인</a></li>
                    <li><i class="fa-solid fa-pen p_icon3"></i><a href="/admin/funding-management">펀딩 수정 · 종료</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section2">
                <div class="p_section_title">회원</div>
                <ul class="p_section_ul">
                    <li><i class="fa-solid fa-ticket-simple p_icon1"></i><a href="/admin/invitation">VIP 초청권 발급</a></li>
                    <li><i class="fa-solid fa-user p_icon2"></i><a href="/admin/user-management">일반 회원 관리</a></li>
                    <li><i class="fa-solid fa-user-group p_icon3"></i><a href="/admin/vip-management">VIP 회원 관리</a></li>
                    <li><i class="fa-solid fa-user-group p_icon3"></i><a href="/admin/grade-update">회원 등급 수정</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section3">
                <div class="p_section_title">기간 설정</div>
                <ul class="p_section_ul">
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/movie-open/setting">온라인
                        상영 기간 · 채팅 오픈 설정</a></li>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a
                            href="/admin/funding/off-movie-open/setting">오프라인 상영 기간 설정</a></li>
                </ul>
                <div class="p_line"></div>
            </div>
        </div>
        <!--컨테이너1 끝-->

        <!--컨테이너2 시작-->
        <div class="p_check_container2">
            <div class="p_container_title">
                <h3>펀딩 현황 확인</h3>
            </div>
            <form id="search-form" action="/admin/funding/confirm/search" method="get">
                <div class="p_search">
                    <input type="text" name="keyword" placeholder="검색 하기">
                    <button type="submit" class="p_search_button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <div class="p_fund_form" id="fund_container">
                <c:forEach var="funding" items="${adminFundingProceedingDTOs}" varStatus="status">
                    <div class="p_section1 p_box">
                        <button type="button" style="border: none; background: transparent"
                                data-bs-toggle="modal" data-bs-target="#j_fund_modal" data-id="${funding.fundingId}"
                                data-name="${funding.movieName}">
                            <img src="${funding.movieThumbnail}" alt="영화사진">
                        </button>
                        <div class="p_list">
                            <p class="p_p1">${funding.movieName}</p>
                            <p class="p_p2">감독 : ${funding.director}</p><br>
                            <div class="p_flex">
                                <p class="p_p3">${funding.fundingRate}</p>
                                <p class="p_p4">% 달성</p><br>
                                <p class="p_p5" style="margin-left: 5px">${funding.endDate}</p><br>
                            </div>
                            <div class="p_flex">
                                <p class="p_p6" style="margin-top: 25px">${funding.formatPrice()}</p>
                                <p class="p_p7" style="margin-top: 15px">원 달성</p><br>
                                <p class="p_p8" style="margin-left: 5px">
                                    참여 ${funding.peopleCount}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="modal" id="j_fund_modal">
                <div class="modal-dialog" style="max-width: none; width: 70%">
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
                              border: none;">대체 내용
                            </iframe>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hidden_id">
        </div>
        <div>
            <button id="scrollToTopBtn"><img src="/images/icons/upArrow.gif" class="j_admin_up_button"></button>
        </div>
        <!--컨테이너2 끝-->
    </div>
</div>
<script>

    let currentPage = 2;
    let isLoading = false;
    window.onload = function () {
        console.log("온로드 실행");
        isLoading = false;
    };

    $(window).scroll(function () {
        // 스크롤 이동 시 실행되는 코드
        console.log("제이쿼리 스크롤");
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            // 페이지 하단에 도달했을 때만 추가 데이터 로드
            loadMoreData();
        }

    });


    // fetch로 새로운 데이터 받아오기
    async function fetchFundingList(page) {
        let response = await fetch('/admin/funding/confirm/more-data?page=' + page);
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
                newData.forEach((funding) => {
                    var newElement = '<div class="p_section1 p_box">' +
                        '<button type="button" style="border: none; background: transparent" data-bs-toggle="modal" data-bs-target="#j_fund_modal" data-id="' + funding.fundingId + '" data-name="' + funding.movieName + '">' +
                        '<img src="' + funding.movieThumbnail + '" alt="영화사진">' +
                        '</button>' +
                        '<div class="p_list">' +
                        '<p class="p_p1">' + funding.movieName + '</p>' +
                        '<p class="p_p2">감독:' + funding.director + '</p><br>' +
                        '<div class="p_flex">' +
                        '<p class="p_p3">' + funding.fundingRate + '</p>' +
                        '<p class="p_p4" style="margin-left: 5px">% 달성</p><br>' +
                        '<p class="p_p5">' + funding.endDate + '</p><br>' +
                        '</div>' +
                        '<div class="p_flex">' +
                        '<p class="p_p6" style="margin-top: 25px">' + formatPrice(funding.presentPrice) + '</p>' +
                        '<p class="p_p7" style="margin-top: 15px">원 달성</p><br>' +
                        '<p class="p_p8" style="margin-left: 5px;>참여 ' + funding.peopleCount + '</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                    // Append new content to the container (assumes you have a container with id 'fund_container')
                    $('#fund_container').append(newElement);
                });
                currentPage++;
            } catch (error) {
                console.error('Error fetching data:', error);
            } finally {
                isLoading = false;
            }
        }, 1000);

        var scrollToTopBtn = document.getElementById("scrollToTopBtn");

        window.addEventListener("scroll", function () {
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

    function formatPrice(number) {
        if(number === 0){
            return 0;
        } else {
            const formatter = new Intl.NumberFormat('en-US');
            return formatter.format(number);
        }
    }

    $('#j_fund_modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var title = button.data('name');
        // 모달 팝업에 데이터 집어넣기
        var modal = $(this);
        $('#fund_frame').attr('src', '/admin/funding/detail/' + id);
        $('#modal_title').text(title);
        $('#hidden_id').attr('value', id);
    })


</script>

</body>
</html>