<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 채팅방 ( chatting ) 완료!</title>

    <!-- style.css와 연결 -->
    <link rel="stylesheet" href="/css/style.css">

    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 달력 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/airbnb.css">

</head>
<body>

    <div class="p_main">
        <!--탑 시작-->
        <div class="p_top">

            <div class="p_title">
                <div class="p_line"></div>
                <a href=""><h2>IndiFlinker</h2></a>
            </div>

            <div class="p_search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="검색 하기">
            </div>

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
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/register">영화 등록 허가</a></li>
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="/admin/check">펀딩 현황 확인</a></li>
                    <li><i class="fa-solid fa-pen p_icon3"></i><a href="/admin/update-delete">펀딩 등록 / 삭제</a></li>
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
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/playday">온라인 오픈 기간 설정</a></li>
                    <li><i class="fa-solid fa-comment p_icon2"></i><a href="/admin/chatting">채팅방 오픈</a></li>
                    <li><i class="fa-solid fa-note-sticky p_icon3"></i><a href="/admin/review">감상평 관리</a></li>
                </ul>
                <div class="p_line"></div>
            </div>
        </div>
        <div class="n_admin_container">
            <c:forEach var="funding" items="${adminOnFundingListDTOs}" varStatus="status">
            <div class="n_menu1">
                <input type="hidden" name="movieId" value="${funding.movieId}">
                <img src="${funding.thumbnail}" alt="">
                <p class="n_on_p1">${funding.movieName}</p>
                <p class="n_on_p2">펀딩 날짜
                    <br>
                    ${funding.formatToReleaseDate()} ~ ${funding.formatToEndDate()}
                </p>
                <div class="n_button">
                    <button type="button" class="btn n_modal_button" data-toggle="modal" data-target="#myModal${funding.movieId}">온라인 등록</button>
                </div>
            </div>
            </c:forEach>
        </div>
	</div>

    <div class="n_modal_container">
        <!-- The Modal -->
        <c:forEach var="date" items="${adminOnFundingListDTOs}">
            <div class="modal" id="myModal${date.movieId}">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <p class="n_admin_modal_title">'${date.movieName}' 온라인 영화 등록</p>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
<%--                        <input type="hidden" value="${date.formatToReleaseDate()}" id="fundStart${date.movieId}">--%>
<%--                        <input type="hidden" value="${date.formatToEndDate()}" id="fundEnd${date.movieId}">--%>
                        <!-- Modal body -->
                        <form action="" method="post">
                            <div class="modal-body n_admin_modal_body">
                                <div>
                                    <div class="n_modal_date">
                                        <span>날짜 선택</span><input type="text" class="n_between_day" placeholder="기간">
                                    </div>
                                    <div class="n_modal_date_detail">
                                        <span>온라인 영화 개봉일 :</span> <input type="text" class="n_first_day" name="onlineReleaseDate" placeholder="시작 날짜">
                                    </div>
                                    <div class="n_modal_date_detail">
                                        <span>온라인 영화 종료일 :</span> <input type="text" class="n_last_day" name="onlineEndDate" placeholder="끝 날짜">
                                    </div>
                                </div>
                                <div class="n_modal_chat">
                                    <span>실시간 채팅 오픈일 & 시간</span>
                                    <input type="text" class="n_chat_day" name="chatTime" placeholder="날짜 및 시간 선택">
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
<%--    <script type="module" src="../../../../js/lsr/chatting.js"></script>--%>
</body>
</html>