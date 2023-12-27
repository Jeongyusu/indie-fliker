<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
    <!-- 달력 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <script src="/js/jys/dropdown.js"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <!-- 포트원 결제하기  -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- uuid 사용하기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.3.2/uuid.min.js"></script>
    <script src="/js/jys/keywordset.js"></script>
    <link href="/css/style.css" rel="stylesheet">
    <!-- 카카오 결제하기  -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- 카카오 환불하기   -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>


    <title>IndieFliker</title>
</head>
<body>
    <header class="j_header">
        <nav class="j_nav">
            <div class="j_nav_left">
                <div id="j_logo">
                    <a href="#">
                        <img class="j_logo" src="/images/logo/IndieFliker.png" alt="로고">
                    </a>
                    <a class="j_logo_text_padding" href="#">
                    <span class="j_logo_text">IndieFliker</span>
                    </a>
                </div>
                <div id="j_nav_menu" class="j_navi">
                    <ul class="j_nav_menu_ul">
                        <li>
                            <a href="/fund/on-air">영화목록</a>
                            <ul class="j_submenu">
                                <li>메뉴를 선택하세요></li>
                                <li><a href="/fund/on-air">온라인 상영중인 영화보기</a></li>
                                <li><a href="/fund/off-air">오프라인 상영중인 영화보기</a></li>
                                <li><a href="/fund/on-dday">온라인 개봉 예정 영화보기</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/fund/funding-plus">펀딩+</a>
                            <ul class="j_submenu">
                                <li>영화 장르를 선택하세요></li>
                                <li><a href="/fund/funding-plus">전체</a></li>
                                <li><a href="/fund/funding-plus?genre=극영화">극영화</a></li>
                                <li><a href="/fund/funding-plus?genre=애니메이션">애니메이션</a></li>
                                <li><a href="/fund/funding-plus?genre=다큐멘터리">다큐멘터리</a></li>
                                <li><a href="/fund/funding-plus?genre=실험영화">실험영화</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/fund/saveForm" class="j_custom_margin30">펀딩 등록</a>
<<<<<<< HEAD
=======
<%--                            <ul class="j_submenu">--%>
<%--                                <li><a href="#">추가메뉴1</a></li>--%>
<%--                                <li><a href="#">추가메뉴2</a></li>--%>
<%--                                <li><a href="#">추가메뉴3</a></li>--%>
<%--                                <li><a href="#">추가메뉴4</a></li>--%>
<%--                            </ul>--%>


>>>>>>> 0bd6375c10dfed5aa77904bf1592f88c2673ad63
                        </li>
                    </ul>
                </div>
            </div>
            <div class="j_nav_right">
                <div class="j_search_form">
                    <form id="search-form" action="/fund/search" method="get">
                        <div class="j_search_area">
                            <input class="j_text_area" type="text" name="keyword" placeholder="새로운 영화가 필요하신가요?">
                            <button class="j_search_magnifier" type="submit">
                                <img src="/images/icons/magnifier.png" alt="돋보기">
                            </button>
                        </div>
                    </form>
                </div>
                <div id="j_login_and_join">
                    <ul class="j_nav_menu_thin_ul">
                        <c:choose>
                            <c:when test="${not empty sessionScope.principal}">
                                <li><a href="/user/mypage">마이 페이지</a></li>
                                <li><a href="/user/logout">로그아웃</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/user/login">로그인</a></li>
                                <li><a href="/user/join">회원가입</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

