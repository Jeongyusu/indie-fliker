<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../manager/layout/manager_header.jsp" %>

    <!--컨테이너1 시작-->
<div class="p_flex_center">
    <div class="p_main">
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
        <div class="p_register_container2">
            <div class="p_container_title" style="margin-bottom: 30px">
                <h3>펀딩 등록 승인</h3>
            </div>
            <form id="search-form" action="/admin/funding-ready-list/search" method="get">
                <div class="p_search">
                    <input type="text" name="keyword" placeholder="검색 하기">
                    <button type="submit" class="p_search_button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <div class="p_movie_form" id="movie_container">
                <c:forEach var="fundingReady" items="${searchResultDTOs}" varStatus="status">
                    <div class="p_movie_card">
                        <img src="${fundingReady.thumbnail}" alt="영화 사진">
                        <p class="p_movie_title">${fundingReady.movieName}</p>
                        <p class="p_movie_director">감독 : ${fundingReady.director}</p>
                        <button type="button" class="p_movie_card_button" data-bs-toggle="modal" data-bs-target="#j_fund_modal" data-id="${fundingReady.fundingReadyId}"
                                data-name="${fundingReady.movieName}">
                            영화 등록 하기
                        </button>
                    </div>
                </c:forEach>
            </div>
            <div class="modal" id="j_fund_modal">
                <div class="modal-dialog" style="max-width: none; width: 70%" >
                    <input type="hidden" id="original">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" id="modal_title">Modal Heading</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <iframe id="fund_frame" style="width: 100%; height: 100%;
                                  border: none;">대체 내용</iframe>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" id="auth_button" onclick="AuthorizationFunding()">등록 승인</button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hidden_id">
        </div>
    </div>
</div>


<script>

    async function AuthorizationFunding(){
        let fundingId = document.getElementById('hidden_id').value;
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


    $('#j_fund_modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var title = button.data('name');
        // 모달 팝업에 데이터 집어넣기
        var modal = $(this);
        $('#fund_frame').attr('src', '/funding-ready/' + id);
        $('#modal_title').text(title);
        $('#hidden_id').attr('value', id);
    })


</script>