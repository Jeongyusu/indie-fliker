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
                            <input type="hidden" id="n_movie_id" value="${selectDTO.movieId}">
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
                                <p>인원 : </p>
                                <p id="n_people_count">${selectDTO.totalCount}</p>
                            </div>
                            <div class="n_total_pay">
                                <p>최종 결제 금액</p>
                                <span id="n_price_span">
                                    <p id="n_price">${selectDTO.formatToBalance()}<p></p>원</p>
                                </span>
                            </div>
                        </div>
                        <div>
                            <input type="hidden" id="discountPrice" name="discountPrice" value="2000">
                        </div>
                        <div id="n_payment_choice">
                            <p>결제 수단 선택</p>
                        </div>
                        <div id="n_payment">
                            <label class="box-radio-input">
                                <input type="radio" id="radio-1" name="payment" value="1" onclick="selectPay(this)">
                                <span>
                                    <img src="/images/logo/kakao.png">
                                    <p>카카오 페이</p>
                                </span>
                            </label>
                            <label class="box-radio-input">
                                <input type="radio" id="radio-2" name="payment" value="2" onclick="selectPay(this)">
                                <span>
                                    <img src="/images/logo/payco.png">
                                    <p>페이코</p>
                                </span>
                            </label>
                            <label class="box-radio-input">
                                <input type="radio" id="radio-3" name="payment" value="3" onclick="selectPay(this)">
                                <span>
                                    <img src="/images/logo/inicis.png">
                                    <p>KG 이니시스</p>
                                </span>
                            </label>
                        </div>
                    </div>
                    <input type="hidden" id="n_select_pay" value="">
                    <input type="hidden" id="n_reservation_code" value="">
                    <input type="hidden" id="paymentTypeId" value="">
                    <input type="hidden" id="SeatNames" value="${selectDTO.seatNames}">
                    <input type="hidden" id="runningDateId" value="${selectDTO.runningDateId}">
                    <input type="hidden" id="unitPrice" value="${selectDTO.unitPrice}">
                    <input type="hidden" id="totalPrice" value="${selectDTO.totalPrice}">
                    <input type="hidden" id="totalCount" value="${selectDTO.totalCount}">
                    <input type="hidden" id="fundingId" value="${selectDTO.fundingId}">
                    <input type="hidden" id="userGrade" value="${principal.grade}">
                    <div class="n_payment_button">
                        <button type="button" id="n_prev">이전</button>
                        <button type="button" id="n_pay" onclick="pay()">결제</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/off_payment.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
