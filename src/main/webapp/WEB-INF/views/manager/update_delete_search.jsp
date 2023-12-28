<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 펀딩 수정 / 종료</title>
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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

        <form id="search-form" action="/admin/funding-management/search" method="get">
            <div class="p_search">
                <button type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <input type="text" name="keyword" placeholder="검색 하기">
            </div>
        </form>
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
            <h3>기간 설정</h3>
            <ul>
                <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/movie-open/setting">온라인 상영 기간 설정/채팅 오픈 시간 설정</a></li>
                <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/off-movie-open/setting">오프라인 상영 기간 설정</a></li>
            </ul>
            <div class="p_line"></div>
        </div>

    </div>
    <!--컨테이너2 시작-->
    <div class="p_update_delete_container2">
        <div class="j_font_style">
            <h3>펀딩 수정 / 종료</h3>
        </div>
        <div class="p_section1" id="j_data_container">
            <c:forEach var="funding" items="${searchResultDTOs}" varStatus="status">
                <div class="p_menu1">
                    <img src="${funding.movieThumbnail}">
                    <p>${funding.movieName}</p>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#j_fund_modal"
                            data-id="${funding.fundingId}" data-name="${funding.movieName}">
                        펀딩 수정
                    </button>
                    <button class="p_button2" onclick="updateById()">펀딩 종료</button>
                </div>
            </c:forEach>
        </div>
        <!-- 모달 창 시작-->
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
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="hidden_id">
        <!-- 모달 끝-->
        <!--컨테이너2 끝-->

    </div>
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
        $('#fund_frame').attr('src', '/admin/funding/' + id + '/updateForm');
        $('#modal_title').text(title);
        $('#hidden_id').attr('value', id);
    });


    async function updateById() {
        // 확인 창 띄우기
        const userConfirmed = window.confirm('정말로 삭제하시겠습니까?');
        let fundingId = document.getElementById('hidden_id').value;

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