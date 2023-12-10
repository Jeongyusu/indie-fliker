<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="../../../../css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <!-- 달력 -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">

    <title>Title</title>
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
                <div id="j_nav_menu">
                    <ul class="j_nav_menu_ul">
                        <li><a href="#">영화목록</a></li>
                        <li><a href="#">펀딩+</a></li>
                        <li><a href="#">영화예매</a></li>
                        <li><a href="#">채팅방</a></li>
                        <li><a href="#">더보기</a></li>
                    </ul>
                </div>
            </div>
            <div class="j_nav_right">
                <div class="j_search_form">
                    <form id="search-form" action="/" method="get">
                        <div class="j_search_area">
                            <input class="j_text_area" type="text" name="search" placeholder="새로운 영화가 필요하신가요?">
                            <button class="j_search_magnifier" type="submit">
                                <img src="/images/icons/magnifier.png" alt="돋보기">
                            </button>
                        </div>
                    </form>
                </div>
                <div id="j_login_and_join">
                    <ul class="j_nav_menu_thin_ul">
                        <li><a href="#">로그인</a></li>
                        <li><a href="#">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
