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
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="/admin/funding-info">펀딩 현황 확인</a></li>
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
                <h3>온라인 상영 가능 영화</h3>
                <ul>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/movie-open/setting">온라인 상영 기간 설정/채팅 오픈 시간 설정</a></li>
                    <li><i class="fa-solid fa-comment p_icon2"></i><a href="/admin/funding/off-movie-open/setting">오프라인 상영 기간 설정</a></li>
                    <li><i class="fa-solid fa-note-sticky p_icon3"></i><a href="/admin/review">감상평 관리</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <!-- <div class="p_section5">
                <i class="fa-solid fa-gear p_icon1"></i>
                <a href="">환경설정</a>
            </div> -->

        </div>
        <!--컨테이너1 끝-->



        <!--컨테이너2 시작-->
        <div class="p_register_container2">

            <div class="p_section1">
                <c:forEach var="fundingReady" items="${searchResultDTOs}" varStatus="status">
                    <div class="p_menu1 p_custom_margin_bottom">
                        <img src="${fundingReady.thumbnail}" alt="영화 사진">
                        <p>영화 제목 : ${fundingReady.movieName}</p>
                        <p>영화 감독 : ${fundingReady.director}</p>
                        <button onclick="openModal(${status.index})">영화 등록 하기</button>
                    </div>
                    <!--모달-->
                    <div class="j_custom_modal" id="j_fund_modal${status.index}">
                        <iframe src="/funding-ready/${fundingReady.fundingReadyId}" id="chat_iframe" style=" width: 100%;
   height: 100%;
   border: none;">대체 내용</iframe>
                        <button class="j_close" style="background-color: var(--primary_02);" onclick="closeModal(${status.index})">창 닫기</button>
                        <button class="j_close2" style="margin-bottom: 10px;" onclick="AuthorizationFunding(${fundingReady.fundingReadyId})">등록 승인</button>
                    </div>
                </c:forEach>
            </div>

        </div>
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

        async function AuthorizationFunding(fundingId){
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




</script>