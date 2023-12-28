<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layout/header.jsp" %>

<body class="l_body">

<!-- 영화 목록 (20개씩 비동기로 받아올 예정) -->
<div class="container l_main_margin_bottom">
    <div class="container l_movie_list_title">
        <p class="l_list_title">찜한 목록</p>
    </div>
    <div class="container l_main_margin_bottom" style="margin-bottom: 20px">
        <div id="data-container" class="row row-cols-xl-5">
            <c:forEach var="scrab" items="${scrabDTOs}" >
                <div class="col my-4 l_movie_card_form">
                    <div class="card l_movie_card">
                        <a href="/fund/funding/${scrab.fundingId}"><img src="${scrab.thumbnail}" class="card-img" alt="..."></a>
                        <div class="l_align_flex">
                            <div class="l_percent l_mint l_strong">${scrab.calculateAndSetAchievementRate()}% 달성</div>
                            <button type="button" onclick="removeScrab(${scrab.fundingId})" class="l_bookmark_button">
                                <i class="l_like_icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <path d="M20.205 4.791a5.938 5.938 0 0 0-4.209-1.754A5.906 5.906 0 0 0 12 4.595a5.904 5.904 0 0 0-3.996-1.558 5.942 5.942 0 0 0-4.213 1.758c-2.353 2.363-2.352 6.059.002 8.412L12 21.414l8.207-8.207c2.354-2.353 2.355-6.049-.002-8.416z"></path>
                                    </svg>
                                </i>
                            </button>
                        </div>
                    </div>
                    <div class="l_title">${scrab.movieName}</div>
                    <div class="l_content">${scrab.synopsis}</div>
<%--                    <div class="l_production">${dday.production}</div>--%>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


<script src="../../../../js/lsr/likelist.js"></script>

<%@ include file="../layout/footer.jsp" %>
