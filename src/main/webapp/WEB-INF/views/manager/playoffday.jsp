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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

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
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/off-movie-open/setting">오프라인 상영 기간 설정</a></li>
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
                <c:forEach var="funding" items="${adminOfflineStreamingDTOs}" varStatus="status">
                    <div class="p_menu1" >
                        <img src="${funding.thumbnail}" alt="">
                        <p>${funding.movieName}</p>
                        <button onclick="openMovieSettingModal(${funding.movieId})">오프라인 상영기간 설정</button>
                    </div>
                </c:forEach>
                <!----------------------------------- 모달 ------------------------------------------------>
                <!-- 모달 백그라운드 -->
                <!-- 모달 -->
                <div class="j_custom_streaming_modal" id="j_streaming_modal" >
                        <input type="hidden" id="selected_movie_id">
                        <input type="hidden" id="funding_end_date">
                        <div id="movie_name_container">
                            <span id="j_movie_name">영화 이름</span>
                        </div>
                        <p> 오프라인 상영기간 설정</p><br>
                        <label>오프라인 상영 개봉일 설정</label><br>
                        <input type="text" id="release_date_choice" name="offlineReleaseDate" placeholder="날짜 선택"><br>
                        <div id="release_date_container">
                            <input type="text" id="release_date" placeholder="날짜 선택"><br>
                        </div>
                        <label>오프라인 상영 종료일 설정</label><br>
                        <input type="text" id="end_date_choice" name="offlineEndDate" placeholder="날짜 선택"><br>
                        <div id="end_date_container">
                            <input type="text" id="end_date" placeholder="날짜 선택"><br>
                        </div>
                        <label>펀딩 종료일자</label><br>
                        <div id="off_funding_end_container">
                            <input type="text" id="off_funding_end" placeholder="날짜 및 시간 선택"><br>
                        </div>
                        <button class="j_streaming_close" type="submit" onclick="saveOffMovieOpenInfo()">설정 하기</button>
                        <button class="j_streaming_close2" style="background-color: var(--point_05);" type="button" onclick="closeMovieSettingModal()">닫기</button>
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


    // 모달 열기
    async function openMovieSettingModal(id) {
        try{
        document.getElementById('j_streaming_modal').style.display = 'block';
        let response = await fetch(`/admin/off-movie-open/` + id)
        let responseBody = await response.json();
        console.log("제이슨 변환 완료");
        console.log(responseBody);
        console.log(responseBody.response.offlineReleaseDate);
        if(responseBody.success){

            if(responseBody.response.offlineReleaseDate == null){
                responseBody.response.offlineReleaseDate = '미설정';
            }

            if(responseBody.response.offlineEndDate == null){
                responseBody.response.offlineEndDate = '미설정';
            }

            if(responseBody.response.endDate == null){
                responseBody.response.endDate = '미설정';
            }
            let selectedMovieId = document.getElementById('selected_movie_id');
            selectedMovieId.value = responseBody.response.id;

            let movieNameContainer = document.getElementById('movie_name_container');
            movieNameContainer.innerHTML = '';
            movieNameContainer.innerHTML = `<span id="j_movie_name">` + '[' + responseBody.response.movieName +']'+ `</span>`;

            let child = document.getElementById('release_date');
            child.parentNode.removeChild(child);
            let newInput = document.createElement('input');
            newInput.type = 'text';
            newInput.id = 'release_date';
            newInput.placeholder = '날짜를 선택하세요';
            newInput.value = "기존 설정일 : " + responseBody.response.offlineReleaseDate;
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
            newInput2.value = "기존 설정일 : " + responseBody.response.offlineEndDate;
            newInput2.disabled = true;
            newInput2.className = "j_custom_margin_bottom"
            newInput2.style = "width : 180px;"
            let parent2 = document.getElementById('end_date_container');
            parent2.appendChild(newInput2);

            let parent3 = document.getElementById('off_funding_end_container');
            parent3.innerHTML='';

            let newInput3 = document.createElement('input');
            newInput3.type = 'text';
            newInput3.id = 'off_funding_end';
            newInput3.placeholder = '날짜 및 시간을 선택하세요';
            newInput3.value = "기존 설정 시간 : " + responseBody.response.endDate;
            newInput3.disabled = true;
            newInput3.style = "width : 250px;"
            parent3.appendChild(newInput3);

            document.querySelector("#release_date_choice").value = null;
            document.querySelector("#end_date_choice").value = null;


            let firstDay = document.getElementById('release_date_choice');
            let lastDay = document.getElementById('end_date_choice');


            // day.value = responseBody.response.chatTime;

            flatpickr(firstDay, {
                minDate: "today",

                onChange: function (selectedDates, dateStr, instance) {
                    firstDay.value = dateStr;
                    console.log("firstDay.value :" + firstDay.value);
                    // lastDay에 적용
                    lastDayFlatpickr.set('minDate', firstDay.value);
                },
            });

            // lastDay를 위한 flatpickr 객체 따로 생성
            let lastDayFlatpickr = flatpickr(lastDay, {
                onChange: function (selectedDates, dateStr, instance) {
                    lastDay.value = dateStr;
                    console.log("lastDay.value: " + lastDay.value);
                },
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

    async function saveOffMovieOpenInfo () {
            let movieId = document.getElementById('selected_movie_id').value;
            let releaseDate = document.getElementById('release_date_choice').value;
            let endDate = document.getElementById('end_date_choice').value;

            let response = await fetch(`/admin/off-movie-open/save`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({id: movieId, offlineReleaseDate: releaseDate, offlineEndDate: endDate
                }),
            });

            console.log("여기까지진입2");
            let responseBody = await response.json();
            console.log("내부 제이슨 변환 완료");
            console.log(responseBody);
            if (responseBody.success) {
                alert("설정 성공");

                let child = document.getElementById('release_date');
                child.parentNode.removeChild(child);
                let newInput = document.createElement('input');
                newInput.type = 'text';
                newInput.id = 'release_date';
                newInput.placeholder = '날짜를 선택하세요';
                newInput.value = "기존 설정일 : " + releaseDate;
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
                newInput2.value = "기존 설정일 : " + endDate;
                newInput2.disabled = true;
                newInput2.className = "j_custom_margin_bottom"
                newInput2.style = "width : 180px;"
                let parent2 = document.getElementById('end_date_container');
                parent2.appendChild(newInput2);



            } else {
                throw new Error(responseBody.error);
            }

    }








</script>
</body>
</html>