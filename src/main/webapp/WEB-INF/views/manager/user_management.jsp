<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 회원 관리 ( user_management ) 완료!</title>
    
    <!-- style.css와 연결 -->
    <link rel="stylesheet" href="/CSS/png_style.css">
    
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/register">영화 등록 허가</a></li>
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="/admin/check">펀딩 현황 확인</a></li>
                    <li><i class="fa-solid fa-pen p_icon3"></i><a href="/admin/update-delete">펀딩 등록 / 삭제</a></li>
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
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/playday">온라인 오픈 기간 설정</a></li>
                    <li><i class="fa-solid fa-comment p_icon2"></i><a href="/admin/chatting">채팅방 오픈</a></li>
                    <li><i class="fa-solid fa-note-sticky p_icon3"></i><a href="/admin/review">감상평 관리</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <!-- <div class="p_section5">
                <i class="fa-solid fa-gear p_icon1"></i>
                <a href="">환경설정</a>
            </div> -->

        </div>
        <!--컨테이너1 끝-->

        <!--컨테이너2 시작-->
        <div class="p_usermanagement_container2">
            <div class="p_title">
                <h3>회원 관리</h3>
            </div>
            <div class="p_filter">
                <a href=""><button><span>Filter</span></button></a>
                <i class="fa-solid fa-filter"></i>
            </div>

            <div class="p_section1">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>회원 ID</th>
                            <th>회원 닉네임</th>
                            <th>회원 가입 날짜</th>
                            <th>회원 등급</th>
                            <th>회원 삭제</th>
                        </tr>
                    </thead>
                    <c:forEach var="user" items="${adminUserPagingLists}">
                    <c:set var="i" value="${i+1}"/>
                    <tbody>
                        <tr>
                            <td>${i}</td>
                            <td>#${user.userEmail}</td>
                            <td>
                                <div>
                                    <img src="${user.pic}" alt="">
                                </div>
                                <span class="p_name1 p_name">${user.username}</span>
                            </td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.createdAt}"/></td>
                            <td>${user.grade}</td>
                            <td><a href="/admin/user-management-isWithdrawal/${user.id}"><button>삭제</button></a></td>

<%--                    <c:choose>--%>
<%--                        <c:when test="${user.isWithdrawal eq true}">--%>
<%--                             <td><a href="/admin/user-management-isWithdrawal/${user.id}"><button>삭제</button></a></td>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                             <td><a><button>삭제 완료</button></a></td>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>

                        </tr>
                    </tbody>
                    </c:forEach>

                </table>
            </div>

            <div class="p_usermanagement_bottom">
                <c:choose>
                    <%-- 현재 페이지가 1페이지이면 이전 글자만 보여줌 --%>
                    <c:when test="${paging.page <= 1}">
                        <a>[이전]</a>
                    </c:when>

                    <c:otherwise>
                        <%-- 이전을 누르면 컨트롤러에 현재 페이지보다 1 작은 페이지로 요청 --%>
                        <a href="/admin/user-management?page=${paging.page-1}">[이전]</a>
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
                            <a href="/admin/user-management?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- 현재 페이지가 가장 끝 페이지이면 다음이라는 text만 나오게 함 --%>
                <c:choose>
                    <c:when test="${paging.page >= paging.maxPage}">
                        <a>[다음]</a>
                    </c:when>
                    <%-- 다음을 누르면 현재 페이지보다 1 큰 페이지로 요청 --%>
                    <c:otherwise>
                        <a href="/admin/user-management?page=${paging.page+1}">[다음]</a>
                    </c:otherwise>
                </c:choose>
            </div>
        
        </div>

        <!--컨테이너2 끝-->
        
    </div>
    
</body>