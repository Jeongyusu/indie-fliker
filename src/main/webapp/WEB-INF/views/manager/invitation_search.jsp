<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../manager/layout/manager_header.jsp" %>


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
        <div class="p_invitation_container2">
            <div class="p_container_title">
                <h3>VIP 초청권 발급</h3>
            </div>
            <form id="search-form" action="/admin/invitation/search" method="get">
                <div class="p_search">
                    <input id=keyword_value type="text" name="keyword" placeholder="검색 하기">
                    <button type="submit" class="p_search_button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <div class="p_invitation_form">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>회원 ID</th>
                            <th>회원 닉네임</th>
                            <th>회원 가입 날짜</th>
                            <th>회원 등급</th>
                            <th>초청권 발급</th>
                        </tr>
                    </thead>
                    <c:forEach var="user" items="${adminInvitationPagingLists}">
                    <c:set var="i" value="${i+1}"/>
                    <tbody>
                        <tr>
                            <td>${i}</td>
                            <td>#${user.userEmail}</td>
                            <td>
                                <div class="p_user_form">
                                    <img src="${user.pic}" alt="">
                                    <span class="p_name1 p_name">${user.username}</span>
                                </div>
                            </td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.createdAt}"/></td>
                            <td>${user.grade}</td>
                            <td><button id="${user.id}" name="${user.id}" onclick="openModal()">발급하기</button></td>
                        </tr>
                    </tbody>
                        <!----------------------------------- 모달 ------------------------------------------------>
                        <!-- 모달 백그라운드 -->
                        <div class="p_modal-background" id="modalBackground" onclick="closeModal()"></div>

                        <!-- 모달 -->
                        <div class="p_modal" id="myModal">
                            <div class="p_modal_flex">
                                <div class="p_in_modal_from">
                                    <h2>초청권 발급</h2>
                                    <input type="hidden" id="userId" name="userId" value ="${user.id}">
                                    <label>날짜 및 시간 선택</label><br>
                                    <input type="text" id="movieTime" name="movieTime" placeholder="날짜 및 시간 선택"><br>
                                    <label>초청권 코드</label><br>
                                    <input type="text" id="invitationCode" name="invitationCode" placeholder="초청권 코드 입력"><br>
                                    <label>영화 제목</label><br>
                                    <input type="text" id="movieName" name="movieName" placeholder="영화 제목 입력"><br>
                                    <label>극장 이름</label><br>
                                    <input type="text" id="theaterName" name="theaterName" placeholder="극장 이름 입력"><br>
                                    <label>극장 주소</label><br>
                                    <input type="text" id="theaterAddress" name="theaterAddress" placeholder="극장 주소 입력"><br>
                                    <div class="p_modal_flex_between">
                                        <button class="p_submit" type="button" onclick="invitation()">발급 하기</button>
                                        <button type="button" class="p_close" onclick="closeModal()">닫기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!----------------------------------- 모달 ------------------------------------------------>
                    </c:forEach>
                </table>
            </div>
            
            <div class="p_paging p_invitation_bottom">
                <c:choose>
                    <%-- 현재 페이지가 1페이지이면 이전 글자만 보여줌 --%>
                    <c:when test="${paging.page <= 1}">
                        <a class="p_priveous">이전</a>
                    </c:when>

                    <c:otherwise>
                        <%-- 이전을 누르면 컨트롤러에 현재 페이지보다 1 작은 페이지로 요청 --%>
                        <a class="p_priveous" href="/admin/invitation?page=${paging.page-1}&keyword=${param.keyword}">[이전]</a>
                    </c:otherwise>
                </c:choose>

                <%-- 자바로 생각하면 >> for(int i = startPage; i <= endPage; i++) --%>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                    <c:choose>
                        <%-- 현재 페이지는 클릭할 필요가 없기 때문에 <span>태그 처리 --%>
                        <c:when test="${i eq paging.page}">
                            <span>${i}</span>
                        </c:when>

                        <c:otherwise>
                            <%-- 다른 페이지 이동이 필요할때 컨트롤러에 요청 --%>
                            <a class="page_number" href="/admin/invitation?page=${i}&keyword=${param.keyword}" style="color: #7f7f7f">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- 현재 페이지가 가장 끝 페이지이면 다음이라는 text만 나오게 함 --%>
                <c:choose>
                    <c:when test="${paging.page >= paging.maxPage}">
                        <a class="p_next">다음</a>
                    </c:when>
                    <%-- 다음을 누르면 현재 페이지보다 1 큰 페이지로 요청 --%>
                    <c:otherwise>
                        <a class="p_next" href="/admin/invitation?page=${paging.page+1}&keyword=${param.keyword}">다음</a>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
        <!--컨테이너2 끝-->
    </div>
</div>
<!--------------------------------- 모달 버튼 ---------------------------------------------->
<script>
    // 모달 열기
    function openModal() {
        document.getElementById('myModal').style.display = 'block';
        document.getElementById('modalBackground').style.display = 'block';
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById('myModal').style.display = 'none';
        document.getElementById('modalBackground').style.display = 'none';
    }
</script>
<!--------------------------------- 모달 버튼 ---------------------------------------------->
<!--------------------------------- 달력 -------------------------------------------------->
<script>
    let choiceDay = document.getElementById('movieTime');
    flatpickr(choiceDay, {
        minDate: "today",
        enableTime: true,
        dateFormat: "Y-m-d H:i",
    });
</script>
<!--------------------------------- 달력 -------------------------------------------------->
<script>
    async function invitation(){
        let userId = document.getElementById('userId').value;
        let movieTime = document.getElementById('movieTime').value;
        let invitationCode = document.getElementById('invitationCode').value;
        let movieName = document.getElementById('movieName').value;
        let theaterName = document.getElementById('theaterName').value;
        let theaterAddress = document.getElementById('theaterAddress').value;

        let response = await fetch(`/admin/vip-issued`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                userId: userId,
                movieTime: movieTime,
                invitationCode: invitationCode,
                movieName: movieName,
                theaterName: theaterName,
                theaterAddress: theaterAddress
            }),
        });
        let responseBody = await response.json();

        if(responseBody.success){
            alert('초청권을 전달했습니다!');
        } else {
            alert('초청권 전달을 실패했습니다.');
        }
    }
</script>
</script>
</body>



