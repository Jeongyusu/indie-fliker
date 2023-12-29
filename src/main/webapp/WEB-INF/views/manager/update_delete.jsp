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
    <div class="p_update_delete_container2">
        <div class="p_container_title">
            <h3>펀딩 수정 / 종료</h3>
        </div>
        <form id="search-form" action="/admin/funding-management/search" method="get">
            <div class="p_search">
                <input type="text" name="keyword" placeholder="검색 하기">
                <button type="submit" class="p_search_button">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </form>
        <div class="p_fund_update_form" id="fund_update_container">
            <c:forEach var="funding" items="${adminFundingModifyDTOs}" varStatus="status">
                <div class="p_movie_card">
                    <img src="${funding.movieThumbnail}">
                    <p class="p_movie_title">${funding.movieName}</p>
                    <button class="p_movie_update_button" onclick="openModal(${status.index})">펀딩 수정</button>
                    <button class="p_movie_delete_button" onclick="updateById(${funding.fundingId})">펀딩 종료</button>
                </div>
                <!--모달-->
                <div class="j_custom_modal" id="j_fund_modify_modal${status.index}">
                    <iframe src="/admin/funding/${funding.fundingId}/updateForm"
                    id="chat_iframe" style=" width: 100%; height: 100%; border: none;">대체 내용</iframe>
                    <button class="j_close3" style="background-color: var(--primary_02);"
                            onclick="closeModal(${status.index})">창 닫기
                    </button>
                </div>
            </c:forEach>
        </div>
        <!--컨테이너2 끝-->

        <div class="p_update_delete_bottom">
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
</div>
</div>

<script>
    // 모달 열기
    function openModal(id) {
        document.getElementById('j_fund_modify_modal' + id).style.display = 'block';

    }

    // 모달 닫기
    function closeModal(id) {
        document.getElementById('j_fund_modify_modal' + id).style.display = 'none';
        window.location.reload();
    }

    async function updateById(fundingId) {
        // 확인 창 띄우기
        const userConfirmed = window.confirm('정말로 삭제하시겠습니까?');

        // 확인을 누른 경우에만 서버로 통신 시작
        if (userConfirmed) {
            try {
                let response = await fetch('/admin/funding/end', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ fundingId: fundingId }),
                });

                console.log("여기까지 진입2");

                let responseBody = await response.json();
                console.log("내부 제이슨 변환 완료");
                console.log(responseBody);

                console.log(responseBody.success);

                if (responseBody.success) {
                    alert("펀딩 종료 성공");
                    location.reload();
                } else {
                    throw new Error(responseBody.error);
                }
            } catch (error) {
                console.error('에러가 발생했습니다:' + error.message);
                alert('에러 발생 : ' + error.message);
            }
        } else {
            // 사용자가 취소를 누른 경우
            alert('취소되었습니다.');
        }
    }

</script>
</body>
</html>