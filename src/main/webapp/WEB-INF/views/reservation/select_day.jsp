<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
                    <form id="n_day_movies_form">
                        <button type="submit" id="select_movie_button">
                            <div id="n_day_movies">
                <span id="n_movie_time">
                  <p class="n_start_time">14:05</p>
                  <p class="n_end_time">~15:57</p>
                </span>
                                <span id="n_movie_title">
                  <p>그대들은 어떻게 살 것인가?</p>
                </span>
                            </div>
                            <div id="n_seat">
                                <div id="n_seat_count">
                                    <p class="n_possible_seat">119</p><p class="n_all_seat">/168</p>
                                </div>
                            </div>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/select_day.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
