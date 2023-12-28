<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>

<body class="l_body">
    <div class="container l_main_margin_bottom">
        <div class="container l_movie_list_title">
            <p class="l_list_title">구매한 온라인 개봉 영화</p>
            <p class="l_announce">아래의 상영안내를 꼭 읽어주세요</p>
        </div>
        <div class="container l_main_margin_bottom" style="margin-bottom: 20px">
            <div id="data-container" class="row row-cols-xl-5">
                <c:forEach var="orderMovie" items="${onAirMovieByUserDTOs}" varStatus="status">
                    <div class="col my-4 l_movie_card_form" id="order${status.count}">
                        <div class="l_on_movie_card">
                            <div class="l_flex_end" style="width: 100%">
                                <div class="l_dday">${orderMovie.formatDDay()}</div>
                            </div>
                            <a href="/fund/funding/${orderMovie.fundingId}"><img src="${orderMovie.movieThumbnail}" class="card-img" alt="..."></a>
                            <div class="l_movie_online_title">
                                <img src="" class="l_grade_img">
                                <div class="l_title">${orderMovie.movieName}</div>
                                <input type="hidden" value="${orderMovie.runningGrade}" class="grade">
                            </div>
                            <div class="l_period"><a class="l_strong">상영 기간</a></div>
                            <div class="l_period">${orderMovie.period()}</div>
                            <input type="hidden" value="${orderMovie.reservatedAt}" id="reservatedDay${status.count}">
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div id="n_attention_comment">
            <p>· 상영안내</p>
            <p class="n_comment">- 구매하신 예매권은 온라인 상영관에서 언제든지 관람이 가능합니다.</p>
            <p class="n_comment">- 관람 기간은 <strong>총 4일</strong>이며, <strong>온라인 상영 기간 내</strong>에 관람이 가능합니다.</p>
            <p class="n_comment">- 관람 시작 기준은 구매 시점이며, 이후 4일이 지나면 자동으로 관람이 종료 후 목록에서 삭제됩니다.</p>
        </div>
    </div>

<script src="../../../../js/lsr/on_movie_list.js"></script>

<%@ include file="../layout/footer.jsp" %>
