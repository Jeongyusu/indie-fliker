<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 온라인 오픈 기간 설정 ( playday ) 완료!</title>

    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
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
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/playday">온라인 상영 및 채팅 오픈 설정</a></li>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/playday">오프라인 상영 기간 설정</a></li>
                    <li><i class="fa-solid fa-comment p_icon2"></i><a href="/admin/chatting">채팅방 오픈</a></li>
                    <li><i class="fa-solid fa-note-sticky p_icon3"></i><a href="/admin/review">감상평 관리</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

<%--            <div class="p_section5">--%>
<%--                <i class="fa-solid fa-gear p_icon1"></i>--%>
<%--                <a href="">환경설정</a>--%>
<%--            </div>--%>

        </div>
        <!--컨테이너1 끝-->


        <!--컨테이너2 시작-->
        <div class="p_playday_container2">

            <div class="p_section1">
                <c:forEach var="funding" items="${adminOnlineStreamingDTOs}" varStatus="status">
                    <div class="p_menu1">
                        <img src="${funding.thumbnail}" alt="">
                        <p>${funding.movieName}</p>
                        <button onclick="openMovieSettingModal(${funding.movieId})">온라인 상영 기간 설정</button>
                    </div>
                    <!----------------------------------- 모달 ------------------------------------------------>
                    <!-- 모달 백그라운드 -->
                    <!-- 모달 -->
                </c:forEach>
                <div class="j_custom_streaming_modal" id="j_streaming_modal">
                    <form action="/admin/back-only" method="post">
                        <div id="movie_name_container">
                            <span id="j_movie_name">영화 이름</span>
                        </div>
                        <p> 온라인 상영기간 설정</p><br>
                        <label>온라인 스트리밍 개봉일 설정</label><br>
                        <input type="text" id="release_date_choice" name="onlineReleaseDate" placeholder="날짜 선택"><br>
                        <div id="release_date_container">
                            <input type="text" id="release_date" placeholder="날짜 선택"><br>
                        </div>
                        <label>온라인 스트리밍 종료일 설정</label><br>
                        <input type="text" id="end_date_choice" name="onlineEndDate" placeholder="날짜 선택"><br>
                        <div id="end_date_container">
                            <input type="text" id="end_date" placeholder="날짜 선택"><br>
                        </div>
                        <label>온라인 채팅 오픈 시간 설정</label><br>
                        <input type="text" id="chat_time_choice" name="chatTime" placeholder="날짜 및 시간 선택"><br>
                        <div id="chat_time_container">
                            <input type="text" id="chat_time" placeholder="날짜 및 시간 선택"><br>
                        </div>
                        <button class="j_streaming_close" type="submit">설정 하기</button>
                        <button class="j_streaming_close2" style="background-color: var(--point_05);" type="button" onclick="closeMovieSettingModal()">닫기</button>
                        <input type="hidden" id="funding_end_date">
                    </form>
                </div>
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
        <!--------------------------------- 달력 -------------------------------------------------->
        let firstDay = document.getElementById('release_date_choice');
        let lastDay = document.getElementById('end_date_choice');
        let day = document.getElementById('funding_end_date');

        flatpickr(firstDay, {
            minDate: "today",

            onChange: function (selectedDates, dateStr, instance) {
                firstDay.value = dateStr;
                console.log("firstDay.value :" + firstDay.value);
                // lastDay에 적용
                lastDayFlatpickr.set('minDate', firstDay.value);
                lastDayFlatpickr.set('maxDate', day.value);
            },
        });

        // lastDay를 위한 flatpickr 객체 따로 생성
        let lastDayFlatpickr = flatpickr(lastDay, {
            onChange: function (selectedDates, dateStr, instance) {
                lastDay.value = dateStr;
                console.log("lastDay.value: " + lastDay.value);
            },
        });

        let chatTime = document.getElementById('chat_time_choice');
        flatpickr(chatTime, {
            enableTime: true,
            dateFormat: "Y-m-d H:i",
        });


    // 모달 열기
    async function openMovieSettingModal(id) {
        try{
        document.getElementById('j_streaming_modal').style.display = 'block';
        let response = await fetch(`/admin/movie-open/` + id)
        let responseBody = await response.json();
        console.log("제이슨 변환 완료");
        console.log(responseBody);
        console.log(responseBody.response.onlineReleaseDate);
        if(responseBody.success){

            if(responseBody.response.onlineReleaseDate == null){
                responseBody.response.onlineReleaseDate = '미설정';
            }

            if(responseBody.response.onlineEndDate == null){
                responseBody.response.onlineEndDate = '미설정';
            }

            if(responseBody.response.chatTime == null){
                responseBody.response.chatTime = '미설정';
            }

            let movieNameContainer = document.getElementById('movie_name_container');
            movieNameContainer.innerHTML = '';
            movieNameContainer.innerHTML = `<span id="j_movie_name">` + '[' + responseBody.response.movieName +']'+ `</span>`;

            let child = document.getElementById('release_date');
            child.parentNode.removeChild(child);
            let newInput = document.createElement('input');
            newInput.type = 'text';
            newInput.id = 'release_date';
            newInput.placeholder = '날짜를 선택하세요';
            newInput.value = "기존 설정일 : " + responseBody.response.onlineReleaseDate;
            newInput.disabled = true;
            newInput.className = "j_custom_margin_bottom"
            newInput.style = "width : 180px;"
            let parent = document.getElementById('release_date_container');
            parent.appendChild(newInput);

            let child2 = document.getElementById('end_date');
            child2.parentNode.removeChild(child2);
            let newInput2 = document.createElement('input');
            newInput2.type = 'text';
            newInput2.id = 'end_date';
            newInput2.placeholder = '날짜를 선택하세요';
            newInput2.value = "기존 설정일 : " + responseBody.response.onlineEndDate;
            newInput2.disabled = true;
            newInput2.className = "j_custom_margin_bottom"
            newInput2.style = "width : 180px;"
            let parent2 = document.getElementById('end_date_container');
            parent2.appendChild(newInput2);

            let parent3 = document.getElementById('chat_time_container');
            parent3.innerHTML='';

            let chatTimeString = responseBody.response.chatTime;
            let chatTimeConvert = new Date(chatTimeString);

            // chatTime을 원하는 형식으로 변환
            let formattedChatTime = chatTimeConvert.toLocaleString('ko-KR', {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                hour12: true,
            });

            let newInput3 = document.createElement('input');
            newInput3.type = 'text';
            newInput3.id = 'chat_time';
            newInput3.placeholder = '날짜 및 시간을 선택하세요';
            newInput3.value = "기존 설정 시간 : " + formattedChatTime;
            newInput3.disabled = true;
            newInput3.style = "width : 300px;"
            parent3.appendChild(newInput3);

            document.querySelector("#release_date_choice").value = null;
            document.querySelector("#end_date_choice").value = null;
            document.querySelector("#chat_time_choice").value = null;


            let firstDay = document.getElementById('release_date_choice');
            let lastDay = document.getElementById('end_date_choice');
            let day = document.getElementById('funding_end_date');


            // day.value = responseBody.response.chatTime;

            flatpickr(firstDay, {
                minDate: "today",

                onChange: function (selectedDates, dateStr, instance) {
                    firstDay.value = dateStr;
                    console.log("firstDay.value :" + firstDay.value);
                    // lastDay에 적용
                    lastDayFlatpickr.set('minDate', firstDay.value);
                    lastDayFlatpickr.set('maxDate', day.value);
                },
            });

            // lastDay를 위한 flatpickr 객체 따로 생성
            let lastDayFlatpickr = flatpickr(lastDay, {
                onChange: function (selectedDates, dateStr, instance) {
                    lastDay.value = dateStr;
                    console.log("lastDay.value: " + lastDay.value);
                },
            });

            let chatTime = document.getElementById('chat_time_choice');
            flatpickr(chatTime, {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
            });
        } else {
            throw new Error('요청 실패');
        }
    } catch(error) {
        console.error('에러가 발생했습니다' + error.message);
        alert('에러 발생 :' + error.message);
        }
    }

    // 모달 닫기
    function closeMovieSettingModal(id) {
        document.getElementById('j_streaming_modal').style.display = 'none';

    }









</script>
</body>
</html>