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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



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
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/funding-ready-listr">펀딩 등록 승인</a></li>
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
                <h3>온라인 상영 가능 영화</h3>
                <ul>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/movie-open-setting/">온라인 상영 기간 설정/채팅 오픈 시간 설정</a></li>
                    <li><i class="fa-solid fa-comment p_icon2"></i><a href="/admin/off-movie-open-setting/">오프라인 상영 기간 설정</a></li>
                    <li><i class="fa-solid fa-note-sticky p_icon3"></i><a href="/admin/review">감상평 관리</a></li>
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
        <div class="p_check_container2">

            <div class="p_title">
                <h3>펀딩 현황 확인</h3>
            </div>
            <div id="data-container">
            <c:forEach var="funding" items="${adminFundingProceedingDTOs}" varStatus="status">
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
        let response = await fetch('/admin/funding/confirm/more-data?page=${page}');
        let responseBody = await response.json();

        console.log("fetch펀딩 내부 제이슨 변환완료");
        if (responseBody.success) {
            console.log("success 진입");
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
                let container = document.getElementById('data-container');
                const newData = await fetchFundingList(currentPage);
                newData.forEach((funding, index) => {
                    const newElement = document.createElement('div');
                    newElement.classList.add('p_section1', 'p_box');

                    const button = document.createElement('button');
                    button.style.border = 'none';
                    button.style.background = 'transparent';
                    button.addEventListener('click', () => openModal(index));

                    const image = document.createElement('img');
                    image.src = funding.movieThumbnail;
                    image.alt = '영화사진';

                    button.appendChild(image);
                    newElement.appendChild(button);

                    const innerDiv = document.createElement('div');
                    innerDiv.classList.add('p_list');

                    const p1 = document.createElement('p');
                    p1.classList.add('p_p1');
                    p1.textContent = funding.movieName;

                    const p2 = document.createElement('p');
                    p2.classList.add('p_p2');
                    p2.textContent = '디렉터 : ' + funding.director;

                    const pFlex1 = document.createElement('div');
                    pFlex1.classList.add('p_flex');

                    const p3 = document.createElement('p');
                    p3.classList.add('p_p3');
                    p3.textContent = funding.fundingRate;

                    const p4 = document.createElement('p');
                    p4.classList.add('p_p4');
                    p4.textContent = '% 달성';

                    const p5 = document.createElement('p');
                    p5.classList.add('p_p5');
                    p5.textContent = funding.endDate;

                    pFlex1.appendChild(p3);
                    pFlex1.appendChild(p4);
                    pFlex1.appendChild(p5);

                    const pFlex2 = document.createElement('div');
                    pFlex2.classList.add('p_flex');

                    const p6 = document.createElement('p');
                    p6.classList.add('p_p6');
                    p6.textContent = formatPrice(funding.presentPrice);

                    const p7 = document.createElement('p');
                    p7.classList.add('p_p7');
                    p7.textContent = '원 달성';

                    const p8 = document.createElement('p');
                    p8.classList.add('p_p8');
                    p8.textContent = funding.peopleCount + '명 달성';

                    pFlex2.appendChild(p6);
                    pFlex2.appendChild(p7);
                    pFlex2.appendChild(p8);

                    innerDiv.appendChild(p1);
                    innerDiv.appendChild(p2);
                    innerDiv.appendChild(pFlex1);
                    innerDiv.appendChild(pFlex2);

                    newElement.appendChild(innerDiv);

                    // Append the new element to the container
                    container.appendChild(newElement);

                    // const footer = document.querySelector('footer');
                    // document.body.appendChild(footer);
                });

                // 현재 페이지 증가 및 로딩 상태 변경
                currentPage++;
                console.log("-----------현재 페이지 확인----------")
                console.log(currentPage)
            } catch (error) {
                console.error('Error fetching data:', error);
            } finally {
                isLoading = false;
            }
        }, 1000);
    }

    function formatPrice(number) {
        const formatter = new Intl.NumberFormat('en-US');
        return formatter.format(number);
    }

    // var scrollToTopBtn = document.getElementById("scrollToTopBtn");

        // 스크롤 이벤트에 이벤트 리스너 추가
        // window.addEventListener("scroll", function() {
        //     // 현재 스크롤 위치 가져오기
        //     var scrollPosition = window.scrollY;
        //
        //     // 스크롤 위치가 300px 이상이면 버튼 표시, 아니면 숨김
        //     if (scrollPosition > 500) {
        //         scrollToTopBtn.style.display = "block";
        //     } else {
        //         scrollToTopBtn.style.display = "none";
        //     }
        // });

        // 버튼 클릭 시 맨 위로 스크롤하는 함수
    //     function scrollToTop() {
    //         window.scrollTo({
    //             top: 0,
    //             behavior: "smooth" // 부드러운 스크롤 적용
    //         });
    //     }
    //
    //     // 버튼에 클릭 이벤트 리스너 추가
    //     scrollToTopBtn.addEventListener("click", scrollToTop);
    //
    // }


</script>

</body>
</html>