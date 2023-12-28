<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layout/header.jsp" %>

<body class="l_body">
<div class="k_funding_save">
    <p>검색어 : ${keyword}</p>
</div>
<div class="container l_main_margin_bottom">
    <div class="container l_movie_list_title">
        <p class="l_list_title">검색 결과</p>
    </div>
    <div id="data-container" class="row row-cols-xl-5">
        <c:forEach var="result" items="${searchResultDTOs}">
            <div class="col my-4 l_movie_card_form">
                <div class="card l_movie_card j_paging">
                    <a href="/fund/funding/${result.fundingId}"><img src="${result.thumbnail}" class="card-img" alt="..."></a>
                </div>
                <div class="l_percent l_mint l_strong">${result.fundingRate}% 달성</div>
                <div class="l_title">${result.movieName}</div>
                <div class="l_content">${result.synopsis}</div>
                <div class="l_production">${result.production}</div>
            </div>
        </c:forEach>
    </div>
</div>

<div>
    <button id="scrollToTopBtn"><img src="/images/icons/upArrow.gif" class="j_up_button"></button>
</div>
<script src="../../../../js/lsr/search_result.js"></script>
<script type="module" src="/js/jys/pagination.js"></script>

<%@ include file="../layout/footer.jsp" %>

