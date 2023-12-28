<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 펀딩 현황( check ) 완료!</title>
    
    <!-- style.css와 연결 -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

    <div class="p_main">
        <!--탑 시작-->
        <div class="p_top">

            <div class="p_title">
                <div class="p_line"></div>
                <a href=""><h2>IndiFlinker</h2></a>
            </div>

            <form id="search-form" action="/admin/funding/confirm/search" method="get">
                <div class="p_search">
                    <button type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                    <input type="text" name="keyword" placeholder="검색 하기">
                </div>
            </form>

            <div class="p_inform">
                <a href=""><i class="fa-regular fa-bell"></i></a>
            </div>

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
        <div class="p_check_container2">

            <div class="p_title">
                <h3>펀딩 현황 확인</h3>
            </div>

            <c:forEach var="funding" items="${searchResultDTOs}" varStatus="status">
                <div class="p_section1 p_box">
                    <button style="border: none; background: transparent" onclick="openModal(${status.index})"><img src="${funding.movieThumbnail}" alt="영화사진"></button>
                    <div class="p_list">
                        <p class="p_p1">${funding.movieName}</p>
                        <p class="p_p2">디렉터:${funding.director}</p>
                        <div class="p_flex">
                            <p class="p_p3">${funding.fundingRate}</p>
                            <p class="p_p4">% 달성</p>
                            <p class="p_p5">${funding.endDate}</p>
                        </div>
                        <div class="p_flex">
                            <p class="p_p6">${funding.formatPrice()}</p>
                            <p class="p_p7">원 달성</p>
                            <p class="p_p8">${funding.peopleCount}명 달성</p>
                        </div>
                    </div>
                </div>
                <!--모달-->
                <div class="j_custom_modal" id="j_fund_modal${status.index}">
                    <iframe src="/admin/funding/detail/${funding.fundingId}" id="chat_iframe" style=" width: 100%;
   height: 100%;
   border: none;">대체 내용</iframe>
                    <button class="j_close" style="background-color: var(--primary_02);" onclick="closeModal(${status.index})">창 닫기</button>
                </div>
            </c:forEach>


        </div>

        <!--컨테이너2 끝-->
        
        
    </div>
<script>
    // 모달 열기
    function openModal(id) {
        document.getElementById('j_fund_modal'+ id).style.display = 'block';

    }

    // 모달 닫기
    function closeModal(id) {
        document.getElementById('j_fund_modal' + id).style.display = 'none';

    }
</script>

</body>
</html>