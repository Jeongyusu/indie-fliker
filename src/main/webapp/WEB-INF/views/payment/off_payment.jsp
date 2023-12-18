<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><!doctype html>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<div id="n_select_movie">
    <h5>선택하신 영화와 상영시간을 확인해주세요!</h5>
</div>
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
                            <input type="hidden" id="n_runningGrade", value="${selectRunningScheduleAndPlaceDTO.runningGrade}">
                            <img src="/images/icons/movie_level_all.png" id="n_grade_img">
                            <p>${selectRunningScheduleAndPlaceDTO.movieName}</p>
                        </div>
                        <div class="n_movie_day">
                            <p id="n_day">${selectRunningScheduleAndPlaceDTO.formatToDate()}</p>
                            <p id="n_time">${selectRunningScheduleAndPlaceDTO.formatToStartTime()} ~ ${selectRunningScheduleAndPlaceDTO.formatToEndTime()}</p>
                        </div>
                        <div class="n_movie_place">
                            <p id="n_place">${selectRunningScheduleAndPlaceDTO.theaterName}</p>
                            <p id="n_address">${selectRunningScheduleAndPlaceDTO.theaterAddress}</p>
                            <p id="n_number">${selectRunningScheduleAndPlaceDTO.theaterTel}</p>
                        </div>
                        <div class="n_people_and_pay">
                            <div class="n_people">
                                <p>인원 : </p>
                                <p id="n_people_count">${selectRunningScheduleAndPlaceDTO.totalCount}</p>
                            </div>
                            <div class="n_total_pay">
                                <p>최종 결제 금액</p>
                                <span id="n_price_span">
                                    <p id="n_price">${selectRunningScheduleAndPlaceDTO.formatToBalance()}<p></p>원</p>
                                </span>
                            </div>
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
                    <div class="n_payment_button">
                        <button type="button" id="n_back" onclick="back()">이전</button>
                        <button type="button" id="n_pay" onclick="pay()">결제</button>
                    </div>
                </form>
                <input type="hidden" id="selectPayment" value="">
                <input type="hidden" id="reservationCode" value="">
                <input type="hidden" id="paymentTypeId" value="">
                <input type="hidden" id="discountPrice" name="discountPrice" value="2000">
                <input type="hidden" id="n_movie_id" value="${selectRunningScheduleAndPlaceDTO.movieId}">
                <input type="hidden" id="SeatNames" value="${selectRunningScheduleAndPlaceDTO.seatNames}">
                <input type="hidden" id="runningDateId" value="${selectRunningScheduleAndPlaceDTO.runningDateId}">
                <input type="hidden" id="unitPrice" value="${selectRunningScheduleAndPlaceDTO.unitPrice}">
                <input type="hidden" id="totalPrice" value="${selectRunningScheduleAndPlaceDTO.totalPrice}">
                <input type="hidden" id="totalCount" value="${selectRunningScheduleAndPlaceDTO.totalCount}">
                <input type="hidden" id="fundingId" value="${selectRunningScheduleAndPlaceDTO.fundingId}">
                <input type="hidden" id="userGrade" value="${principal.grade}">
                <input type="hidden" id="userEmail" value="${principal.userEmail}">
                <input type="hidden" id="username" value="${principal.username}">
                <input type="hidden" id="userTel" value="${principal.tel}">
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/off_payment.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
