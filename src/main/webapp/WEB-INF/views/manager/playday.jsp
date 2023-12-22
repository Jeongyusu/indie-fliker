<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 온라인 오픈 기간 설정 ( playday ) 완료!</title>
    
    <!-- style.css와 연결 -->
    <link rel="stylesheet" href="/css/style.css">
    
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>

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
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="">영화 등록 허가</a></li>
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="">펀딩 현황 확인</a></li>
                    <li><i class="fa-solid fa-pen p_icon3"></i><a href="">펀딩 등록 / 삭제</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section3">
                <h3>회원</h3>
                <ul>
                    <li><i class="fa-solid fa-ticket-simple p_icon1"></i><a href=""><a href="">VIP 초청권 발급</a></li>
                    <li><i class="fa-solid fa-user p_icon2"></i><a href=""><a href="">회원 관리</a></li>
                    <li><i class="fa-solid fa-user-group p_icon3"></i><a href=""><a href="">회원 관리</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section4">
                <h3>온라인 상영 가능 영화</h3>
                <ul>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="">온라인 오픈 기간 설정</a></li>
                    <li><i class="fa-solid fa-comment p_icon2"></i><a href="">채팅방 오픈</a></li>
                    <li><i class="fa-solid fa-note-sticky p_icon3"></i><a href="">감상평 관리</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section5">
                <i class="fa-solid fa-gear p_icon1"></i>
                <a href="">환경설정</a>
            </div>

        </div>
        <!--컨테이너1 끝-->



        <!--컨테이너2 시작-->
        <div class="p_playday_container2">

            <div class="p_section1">
                <c:forEach var="funding" items="${adminOnlineStreamingDTOs}" varStatus="status">
                    <div class="p_menu1">
                        <img src="${funding.thumbnail}" alt="">
                        <p>${funding.movieName}</p>
                        <button onclick="openModal(${status.index})">온라인 상영 기간 설정</button>
                    </div>
                    <!----------------------------------- 모달 ------------------------------------------------>
                    <!-- 모달 백그라운드 -->
                    <!-- 모달 -->
                    <div class="j_custom_streaming_modal" id="j_streaming_modal${status.index}">
                        <form action="/" method="post">
                            <span>[${funding.movieName}]</span>
                            <p> 온라인 상영기간 설정</p>
                            <input type="hidden" id="userId" name="userId" value ="">
                            <label>온라인 스트리밍 개봉일 선택</label><br>
                            <input type="text" id="release_date${status.index}" name="movieTime" placeholder="날짜 및 시간 선택" onclick="setPeriod(${status.index})"><br>
                            <label>온라인 스트리밍 종료일 선택</label><br>
                            <input type="text" id="end_date${status.index}" name="movieTime" placeholder="날짜 및 시간 선택"><br>
                            <label>영화 제목</label><br>
                            <input type="text" id="movieName" name="movieName" placeholder="영화 제목 입력"><br>
                            <label>극장 이름</label><br>
                            <input type="text" id="theaterName" name="theaterName" placeholder="극장 이름 입력"><br>
                            <label>극장 주소</label><br>
                            <input type="text" id="theaterAddress" name="theaterAddress" placeholder="극장 주소 입력"><br>
                            <button class="submit" type="submit">발급 하기</button>
                        </form>
                    </div>
                </c:forEach>
            </div>


        </div>
        <!--컨테이너2 끝-->

        <div class="p_playday_bottom">
            <nav aria-label="...">
                <ul class="pagination">
                <li class="page-item disabled">
                    <a class="page-link previous" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <li class="page-item paging">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item active paging" aria-current="page" style="color:#01DFD7;">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item paging">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item paging">
                    <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item paging">
                    <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                    <a class="page-link next" href="#">Next</a>
                </li>
                </ul>
            </nav>  
        </div>
        
	</div>
<script>
    // 모달 열기
    function openModal(id) {
        document.getElementById('j_streaming_modal'+ id).style.display = 'block';

    }

    // 모달 닫기
    function closeModal(id) {
        document.getElementById('j_streaming_modal' + id).style.display = 'none';

    }

    <!--------------------------------- 달력 -------------------------------------------------->
    function setPeriod (id){
        let firstDay = document.getElementById('release_date' + id);
        let lastDay = document.getElementById('end_date' + id);
        let limitDay = document.getElementById('limitDay');
        let day = "";

        flatpickr(firstDay, {
            minDate: "today",

            onChange: function (selectedDates, dateStr, instance) {
                firstDay.value = dateStr;
                console.log("firstDay.value :" + firstDay.value);

                day = getPlusOneYearDate(dateStr);

                // lastDay에 적용
                lastDayFlatpickr.set('minDate', firstDay.value);
                lastDayFlatpickr.set('maxDate', day);
                allDayFlatpickr.set('minDate', firstDay.value);
            },
        });

        // lastDay를 위한 flatpickr 객체 따로 생성
        let lastDayFlatpickr = flatpickr(lastDay, {
            onChange: function (selectedDates, dateStr, instance) {
                lastDay.value = dateStr;
                console.log("lastDay.value: " + lastDay.value);
                allDayFlatpickr.set('maxDate', lastDay.value);

            },
        });

        let allDayFlatpickr = flatpickr(limitDay, {
            locale: 'ko',
        });


    }



</script>
</body>
</html>