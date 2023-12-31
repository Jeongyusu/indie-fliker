<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <div class="p_playday_container2">
            <div class="p_container_title">
                <h3>오프라인 상영 기간 설정</h3>
            </div>
            <form id="search-form" action="/admin/off-movie-open-setting/search" method="get">
                <div class="p_search">
                    <input type="text" name="keyword" placeholder="검색 하기">
                    <button type="submit" class="p_search_button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <div class="p_movie_form" id="j_data_container">
                <c:forEach var="funding" items="${adminOfflineStreamingDTOs}" varStatus="status">
                    <div class="p_movie_card" >
                        <img src="${funding.thumbnail}" alt="">
                        <p class="p_movie_title">${funding.movieName}</p>
                        <button class="p_movie_period_button" onclick="openMovieSettingModal(${funding.movieId})">오프라인 상영기간 설정</button>
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
                            <p> 오프라인 상영기간 설정</p><br>
                            <label>오프라인 상영 개봉일 설정</label><br>
                            <input type="text" id="release_date_choice" name="offlineReleaseDate" placeholder="날짜 선택"><br>
                            <div id="release_date_container">
                                <input type="text" id="release_date" placeholder="날짜 선택">
                            </div>
                            <label>오프라인 상영 종료일 설정</label><br>
                            <input type="text" id="end_date_choice" name="offlineEndDate" placeholder="날짜 선택"><br>
                            <div id="end_date_container">
                                <input type="text" id="end_date" placeholder="날짜 선택">
                            </div>
                            <hr style="margin-bottom: 30px; margin-top: 0">
                            <label>펀딩 종료일자</label><br>
                            <div id="off_funding_end_container">
                                <input type="text" id="off_funding_end" placeholder="날짜 및 시간 선택">
                            </div>
                            <div class="p_modal_flex_between" style="margin-top: 12px">
                                <button class="p_submit" type="submit" onclick="saveOffMovieOpenInfo()">설정 하기</button>
                                <button class="p_close"  type="button" onclick="closeMovieSettingModal()">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

            let movieNameContainer = document.getElementById('j_movie_name');
            movieNameContainer.innerHTML = responseBody.response.movieName;

            let child = document.getElementById('release_date');
            child.parentNode.removeChild(child);

            let newInput = document.createElement('input');
            newInput.type = 'text';
            newInput.id = 'release_date';
            newInput.placeholder = '날짜를 선택하세요';
            newInput.value = "기존 설정일 : " + responseBody.response.offlineReleaseDate;
            newInput.disabled = true;
            newInput.className = "j_custom_margin_bottom"

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
            let parent2 = document.getElementById('end_date_container');
            parent2.appendChild(newInput2);

            let parent3 = document.getElementById('off_funding_end_container');
            parent3.innerHTML='';

            let newInput3 = document.createElement('input');
            newInput3.type = 'text';
            newInput3.id = 'off_funding_end';
            newInput3.placeholder = '날짜 및 시간을 선택하세요';
            newInput3.value = "펀딩 종료일 : " + responseBody.response.endDate;
            newInput3.disabled = true;
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
                let parent2 = document.getElementById('end_date_container');
                parent2.appendChild(newInput2);



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
            let response = await fetch('/admin/funding/offline-period-setting/more-data?page=' + page);
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
                        var newElement = '<div class="p_movie_card" >' +
                            '<img src="' + funding.thumbnail + '" alt="">' +
                            '<p class="p_movie_title">' + funding.movieName + '</p>' +
                            '<button class="p_movie_period_button" onclick="openMovieSettingModal(' + funding.movieId + ')">오프라인 상영기간 설정</button>' +
                            '</div>';

                        // Append new content to the container with class 'p_section1'
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