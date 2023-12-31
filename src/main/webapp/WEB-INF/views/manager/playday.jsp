<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../manager/layout/manager_header.jsp" %>

<div class="p_flex_center">
    <div class="p_main">
        <!--컨테이너1 시작-->
        <div class="p_container1">
            <div class="p_section1">
                <div class="p_section_title">영화</div>
                <ul class="p_section_ul">
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/funding-ready-list">펀딩 등록 승인</a></li>
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
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/movie-open/setting">온라인 상영 기간 · 채팅 오픈 설정</a></li>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/off-movie-open/setting">오프라인 상영 기간 설정</a></li>
                </ul>
                <div class="p_line"></div>
            </div>
        </div>
        <!--컨테이너1 끝-->
        <!--컨테이너2 시작-->
        <div class="p_playday_container2">
            <div class="p_container_title">
                <h3>온라인 상영 기간 설정 · 채팅 오픈 시간 설정</h3>
            </div>
            <form id="search-form" action="/admin/movie-open-setting/search" method="get">
                <div class="p_search">
                    <input type="text" name="keyword" placeholder="검색 하기">
                    <button type="submit" class="p_search_button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <div class="p_movie_form" id="j_data_container">
                <c:forEach var="funding" items="${adminOnlineStreamingDTOs}" varStatus="status">
                    <div class="p_movie_card" >
                        <img src="${funding.thumbnail}" alt="">
                        <p class="p_movie_title">${funding.movieName}</p>
                        <button class="p_movie_period_button" onclick="openMovieSettingModal(${funding.movieId})">상영기간·채팅오픈시간 설정</button>
                    </div>
                </c:forEach>
                <!----------------------------------- 모달 ------------------------------------------------>
                <!-- 모달 백그라운드 -->
                <!-- 모달 -->
                <div class="p_modal" id="j_streaming_modal" >
                    <input type="hidden" id="selected_movie_id">
                    <input type="hidden" id="funding_end_date">
                    <div class="p_modal_flex">
                        <div class="p_modal_from">
                            <h2 id="j_movie_name">영화 이름</h2>
                            <p>온라인 상영기간 설정</p><br>
                            <label>온라인 스트리밍 개봉일 설정</label><br>
                            <input type="text" id="release_date_choice" name="onlineReleaseDate" placeholder="날짜 선택"><br>
                            <div id="release_date_container">
                                <input type="text" id="release_date" placeholder="날짜 선택">
                            </div>
                            <label>온라인 스트리밍 종료일 설정</label><br>
                            <input type="text" id="end_date_choice" name="onlineEndDate" placeholder="날짜 선택"><br>
                            <div id="end_date_container">
                                <input type="text" id="end_date" placeholder="날짜 선택">
                            </div>
                            <hr style="margin-bottom: 30px; margin-top: 0">
                            <p>온라인 채팅 오픈 시간 설정</p><br>
                            <input type="text" id="chat_time_choice" name="chatTime" placeholder="날짜 및 시간 선택">
                            <div id="chat_time_container">
                                <input type="text" id="chat_time" placeholder="날짜 및 시간 선택"><br>
                            </div>
                            <div class="p_modal_flex_between" style="margin-top: 12px">
                                <button class="p_submit" type="submit" onclick="saveMovieOpenInfo()">설정 하기</button>
                                <button class="p_close" type="button" onclick="closeMovieSettingModal()">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--컨테이너2 끝-->
        
	</div>
    <div>
        <button id="scrollToTopBtn"><img src="/images/icons/upArrow.gif" class="j_up_button"></button>
    </div>
</div>
    <script>
        <!--------------------------------- 달력 -------------------------------------------------->


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
            let selectedMovieId = document.getElementById('selected_movie_id');
            selectedMovieId.value = responseBody.response.id;

            let movieNameContainer = document.getElementById('j_movie_name');
            movieNameContainer.innerHTML = responseBody.response.movieName;

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
            newInput3.value = "기존 시간 : " + formattedChatTime;
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
                    chatTime.setAttribute('minDate', firstDay.value);
                    chatTime.set('maxDate', day.value);
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

    async function saveMovieOpenInfo () {
            let movieId = document.getElementById('selected_movie_id').value;
            let releaseDate = document.getElementById('release_date_choice').value;
            let endDate = document.getElementById('end_date_choice').value;
            let chatTime = document.getElementById('chat_time_choice').value;

            let response = await fetch(`/admin/movie-open/save`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({id: movieId, onlineReleaseDate: releaseDate, onlineEndDate: endDate,
                    chatTime: chatTime
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

                let parent3 = document.getElementById('chat_time_container');
                parent3.innerHTML='';

                let newInput3 = document.createElement('input');
                newInput3.type = 'text';
                newInput3.id = 'chat_time';
                newInput3.placeholder = '날짜 및 시간을 선택하세요';
                newInput3.value = "기존 설정 시간 : " + chatTime;
                newInput3.disabled = true;
                newInput3.style = "width : 300px;"
                parent3.appendChild(newInput3);
            } else {
                throw new Error(responseBody.error);
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
            let response = await fetch('/admin/funding/online-period-setting/more-data?page=' + page);
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
                        var newElement =
                            '<div class="p_movie_card">' +
                            '<img src="' + funding.thumbnail + '" alt="">' +
                            '<p class="p_movie_title">' + funding.movieName + '</p>' +
                            '<button class="p_movie_period_button" onclick="openMovieSettingModal(' + funding.movieId + ')">상영기간·채팅오픈시간 설정</button>' +
                            '</div>';

                        // Append new content to the container (assumes you have a container with id 'j_data_container')
                        $('#j_data_container').append(newElement);
                    });
                    currentPage++;
                } catch (error) {
                    console.error('Error fetching data:', error);
                } finally {
                    isLoading = false;
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

        function formatPrice(number) {
            const formatter = new Intl.NumberFormat('en-US');
            return formatter.format(number);
        }









</script>
</body>
</html>