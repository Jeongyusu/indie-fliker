<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!--컨테이너2 시작-->
        <div class="p_check_container2">
            <div class="p_container_title">
                <h3>펀딩 현황 확인</h3>
            </div>
            <form id="search-form" action="/admin/funding/confirm/search" method="get">
                <div class="p_search">
                    <input type="text" name="keyword" placeholder="검색 하기">
                    <button type="submit" class="p_search_button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <div class="p_fund_form" id="fund_container">
                <c:forEach var="funding" items="${searchResultDTOs}" varStatus="status">
                <div class="p_section1 p_box">
                    <button style="border: none; background: transparent" onclick="openModal(${status.index})"><img
                            src="${funding.movieThumbnail}" alt="영화사진"></button>
                    <div class="p_list">
                        <p class="p_p1">${funding.movieName}</p>
                        <p class="p_p2">감독 : ${funding.director}</p><br>
                        <div class="p_flex">
                            <p class="p_p3">${funding.fundingRate}</p>
                            <p class="p_p4" style="margin-left: 5px">% 달성</p><br>
                            <p class="p_p5">${funding.endDate}</p><br>
                        </div>
                        <div class="p_flex">
                            <p class="p_p6" style="margin-top: 25px">${funding.formatPrice()}</p>
                            <p class="p_p7" style="margin-top: 15px">원 달성</p><br>
                            <p class="p_p8" style="margin-left: 5px">
                                참여 ${funding.peopleCount}</p>
                        </div>
                    </div>
                </div>
                <!--모달-->
                <div class="modal" id="j_fund_modal">
                    <div class="modal-dialog" style="max-width: none; width: 70%">
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
                                      border: none;">대체 내용
                                </iframe>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="hidden_id">
            </div>
            </c:forEach>
        </div>
    </div>
    <!--컨테이너2 끝-->
</div>

<script>

    function formatPrice(number) {
        const formatter = new Intl.NumberFormat('en-US');
        return formatter.format(number);
    }

    $('#j_fund_modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var title = button.data('name');
        // 모달 팝업에 데이터 집어넣기
        var modal = $(this);
        $('#fund_frame').attr('src', '/admin/funding/detail/' + id);
        $('#modal_title').text(title);
        $('#hidden_id').attr('value', id);
    })


</script>

</body>
</html>