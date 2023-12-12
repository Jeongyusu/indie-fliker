<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp" %>

<main>
    <div class="n_custom_fluid">
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
                    <input type="hidden" id="n_firstDay" value=${totalDayDto.startRunningDate}>
                    <input type="hidden" id="n_lastDay" value=${totalDayDto.endRunningDate}>
                    <input type="hidden" id="n_movieId" value=${totalDayDto.movieId}>
                    <input type="hidden" id="n_theaterId" value=${totalDayDto.theaterId}>

                </div>
                <div class="n_select_day_movies">
                    <input type="text" id="n_otherInput" placeholder="날짜를 선택해주세요" disabled="">
                    <div id="n_container">
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/select_day.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>