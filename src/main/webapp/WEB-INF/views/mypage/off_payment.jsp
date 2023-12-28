<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="container">
        <div class="l_my_page_title">펀딩한 내역</div>
        <div class="text-center">
            <a href="/payment/off-payment" class="l_effect_underline" style="border-bottom: 2px solid; padding-bottom: 11px;">오프라인 상영 내역</a>
            <a href="/payment/on-payment" class="l_effect_underline" >온라인 펀딩 내역</a>
        </div>
    </div>
    <c:forEach var="myOfflinePaymentDTO" items="${myOfflinePaymentDTOs}" varStatus="status">
        <c:choose>
            <c:when test="${myOfflinePaymentDTO.paymentId eq myOfflinePaymentDTO.refundPaymentId}">
            <div class="l_movie_card card text-bg-light">
                <div class="row g-0">
                    <div class="col-md-4 d-flex align-items-center justify-content-center l_card_container">

                        <img src="${myOfflinePaymentDTO.thumbnail}" class="l_fund_card_img">

                    </div>
                    <div class="col-md-5 d-flex align-items-center">
                        <div class="l_re_card_body">
                            <div class="l_re_card_title">${myOfflinePaymentDTO.movieName}</div>
                            <div class="l_re_card_synopsis">${myOfflinePaymentDTO.synopsis}</div>
                            <div class="l_re_card_refund">환불이 완료 되었습니다.</div>
                            <div class="l_re_card_pay_date"><a class="l_strong" style="margin-right: 16px">환불 일시</a> ${myOfflinePaymentDTO.formatToRefundDate()}</div>
                            <div class="l_re_card_payment"><a class="l_strong" style="margin-right: 16px">결제 정보</a> <a id="finalPrice${status.count}">- ${myOfflinePaymentDTO.formatToRefundPrice()}</a>원</div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex flex-column align-items-end justify-content-end mb-4">
                        <input type="hidden" value="${myOfflinePaymentDTO.reservationCode}" id="reservationCode${status.count}">
                        <input type="hidden" value="${myOfflinePaymentDTO.paymentId}" id="paymentId${status.count}">
                        <input class="btn text-white mt-2" id="l_card_re_button" type="button"  value="환불완료" disabled>
                    </div>
                </div>
            </div>
            </c:when>
            <c:otherwise>
                <div class="l_movie_card card text-bg-light">
                    <div class="row g-0">
                        <div class="col-md-4 d-flex align-items-center justify-content-center l_card_container">
                            <img src="${myOfflinePaymentDTO.thumbnail}" class="l_fund_card_img">
                        </div>
                        <div class="col-md-5 d-flex align-items-center">
                            <div class="l_card_body">
                                <div class="l_card_title">${myOfflinePaymentDTO.movieName}</div>
                                <div class="l_card_percent l_mint">${myOfflinePaymentDTO.formatToPercent()}% 달성</div>
                                <div class="l_card_synopsis">${myOfflinePaymentDTO.synopsis}</div>
                                <div class="l_card_director">감독 : ${myOfflinePaymentDTO.director}</div>
                                <div class="l_card_pay_date"><a class="l_strong" style="margin-right: 16px">결제 일시</a> ${myOfflinePaymentDTO.formatToDate()}</div>
                                <div class="l_card_payment"><a class="l_strong" style="margin-right: 16px">결제 정보</a> <a id="finalPrice${status.count}">${myOfflinePaymentDTO.formatToPrice()}</a>원</div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex flex-column align-items-end justify-content-end mb-4">
                            <form action="/reservation/${myOfflinePaymentDTO.movieId}/off-ticket" method="get">
                                <input type="hidden" value="${myOfflinePaymentDTO.reservationId}" id="reservationId${status.count}" name="reservationId">
                                <button class="btn btn-outline-dark mt-2" type="submit" style="margin-right: 3.5rem; width: 8rem;" id="ticket_button${status.count}">티켓 확인</button>
                            </form>
                            <input type="hidden" value="${myOfflinePaymentDTO.reservationCode}" id="reservationCode${status.count}">
                            <input type="hidden" value="${myOfflinePaymentDTO.paymentId}" id="paymentId${status.count}">
                            <button class="btn l_mint_button text-white mt-2" type="button" style="margin-right: 3.5rem; width: 8rem;" onclick="confirmModal(${status.count})" id="refund_button${status.count}">환불 하기</button>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>


<script src="../../../../js/lsr/off_payment.js"></script>
<%@ include file="../layout/footer.jsp" %>