<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><!doctype html>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<main>
    <div class="n_custom_fluid">
        <div class="row justify-content-center">
            <div id="n_pay_step">
                <ol>
                    <li class="n_other_li">
                        <p class="n_pay_step_p">날짜 선택</p>
                    </li>
                    <li class="n_middle_li">
                        <p class="n_pay_step_p">좌석 지정</p>
                    </li>
                    <li class="n_other_li">
                        <p class="n_pay_step_choice">결제 하기</p>
                    </li>
                </ol>
            </div>
            <div id="n_select_movie_pay">
                <form class="n_pay">
                    <div id="n_last_payment">
                        <div id="n_movie_title">
                            <input type="hidden" id="n_runningGrade", value="${selectDTO.runningGrade}">
                            <img src="/images/icons/movie_level_all.png" id="n_grade_img">
                            <p>${selectDTO.movieName}</p>
                        </div>
                        <div class="n_movie_day">
                            <p id="n_day">${selectDTO.formatToDate()}</p>
                            <p id="n_time">${selectDTO.formatToStartTime()} ~ ${selectDTO.formatToEndTime()}</p>
                        </div>
                        <div class="n_movie_place">
                            <p id="n_place">${selectDTO.theaterName}</p>
                            <p id="n_address">${selectDTO.theaterAddress}</p>
                            <p id="n_number">${selectDTO.theaterTel}</p>
                        </div>
                        <div class="n_people_and_pay">
                            <div class="n_people">
                                <p>인원 : ${selectDTO.totalCount}인</p>
                            </div>
                            <div class="n_total_pay">
                                <p>최종 결제 금액</p>
                                <p id="n_price">${selectDTO.formatToBalance()}원</p>
                            </div>
                        </div>
                        <div id="n_payment_choice">
                            <p>결제 수단 선택</p>
                        </div>
                        <div id="n_payment">
                            <label><input type="radio" name="payment" value="kakao"> 카카오 페이</label>
                            <label><input type="radio" name="payment" value="payco"> 페이코</label>
                            <label><input type="radio" name="payment" value="card"> 신용/체크카드</label>
                        </div>
                    </div>
                    <div class="n_payment_button">
                        <button id="n_prev">이전</button>
                        <button id="n_pay">결제</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/off_payment.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
