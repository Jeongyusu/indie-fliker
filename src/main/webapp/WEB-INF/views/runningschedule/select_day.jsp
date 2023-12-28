<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp" %>
<body class="l_body">
    <div id="n_select_movie">
        <h5>독립 영화의 매력을 느끼러 가보세요! 독립 영화는 예측 불허의 감동과 특별한 이야기로 가득 차 있습니다.</h5>
    </div>
    <div class="n_flex_center">
        <div class="n_thousand_body n_body_margin">
            <div class="row justify-content-center">
                <div id="n_pay_step">
                    <ol>
                        <li class="n_other_li">
                            <p class="n_pay_step_choice">날짜 선택</p>
                        </li>
                        <li class="n_middle_li">
                            <p class="n_pay_step_p">좌석 지정</p>
                        </li>
                        <li class="n_other_li">
                            <p class="n_pay_step_p">결제 하기</p>
                        </li>
                    </ol>
                </div>
                <div id="n_select_day">
                    <div class="n_movie_calendar">
                        <input type="hidden" id="n_activeCal" disabled>
                        <input type="hidden" id="n_firstDay" value=${totalDayDTO.startRunningDate}>
                        <input type="hidden" id="n_lastDay" value=${totalDayDTO.endRunningDate}>
                        <input type="hidden" id="n_movieId" value=${totalDayDTO.movieId}>
                        <input type="hidden" id="n_theaterId" value=${totalDayDTO.theaterId}>
                    </div>
                    <div class="n_select_day_movies">
                        <input type="text" id="n_otherInput" placeholder="날짜를 선택해주세요" disabled="">
                        <div id="n_container">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="../../../../js/neh/select_day.js"></script>
<%@ include file="../layout/footer.jsp" %>
