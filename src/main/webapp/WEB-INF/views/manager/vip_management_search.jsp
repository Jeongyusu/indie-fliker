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
        <div class="p_usermanagement_container2">
            <div class="p_container_title">
                <h3>VIP회원 관리</h3>
            </div>
            <form id="search-form" action="/admin/vip/search" method="get">
                <div class="p_search">
                    <input type="text" name="keyword" placeholder="검색 하기">
                    <button type="submit" class="p_search_button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <div class="p_usermanagement_form">
                <table class="table table-hover">
                    <thead>
                        <tr id="custom_container">
                            <th>#</th>
                            <th>회원 ID</th>
                            <th>회원 닉네임</th>
                            <th>회원 가입 날짜</th>
                            <th>회원 등급</th>
                            <th>회원 삭제</th>
                        </tr>
                    </thead>
                    <c:forEach var="user" items="${adminVipPagingLists}">
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
                            <td>
                                <button id="userDelete" data-id="${user.id}" onclick="deleteById(${user.id})">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
            </div>
            
            <div class="p_paging p_vipmanagement_bottom">
                <c:choose>
                    <%-- 현재 페이지가 1페이지이면 이전 글자만 보여줌 --%>
                    <c:when test="${paging.page <= 1}">
                        <a class="p_priveous">이전</a>
                    </c:when>

                    <c:otherwise>
                        <%-- 이전을 누르면 컨트롤러에 현재 페이지보다 1 작은 페이지로 요청 --%>
                        <a class="p_priveous" href="/admin/vip-management?page=${paging.page-1}&keyword=${param.keyword}">이전</a>
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
                            <a class="page_number" href="/admin/vip-management?page=${i}&keyword=${param.keyword}" style="color: #7f7f7f">${i}</a>
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
                        <a class="p_next" href="/admin/vip-management?page=${paging.page+1}&keyword=${param.keyword}">다음</a>
                    </c:otherwise>
                </c:choose>
            </div>
        
        </div>

        <!--컨테이너2 끝-->
        
    </div>
    
    <script>
        async function deleteById(userId){
            let response = await fetch('/admin/vip-management-isWithdrawal?userId=' + userId)
            let responseBody = await response.json();
            const userConfirmed = window.confirm('정말로 삭제하시겠습니까?'); 
            if(userConfirmed){
                if(responseBody.success){
                    alert('삭제에 성공했습니다.');
                    let parent = document.getElementById('custom_container');
                    parent.innerHTML='';
                    // let originData = ``;
                    // parent.appendChild(originData);
                    location.reload();
                } else {
                    alert('삭제에 실패했습니다.');
                }
            }
        }
    </script>
    
</body>