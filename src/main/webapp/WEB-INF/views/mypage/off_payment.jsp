<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <div class="l_my_page_title">펀딩한 내역</div>
    <div class="text-center">
        <a href="/payment/on-payment" class="l_effect_underline" style="border-bottom: 2px solid; padding-bottom: 11px;">온라인 펀딩 내역</a>
        <a href="/payment/off-payment" class="l_effect_underline" >오프라인 상영 내역</a>
    </div>
    <c:forEach var="MyOfflinePaymentDTO" items="${MyOfflinePaymentDTOs}" varStatus="status">
        <div class="l_movie_card card text-bg-light">
            <div class="row g-0">
                <div class="col-md-4 d-flex align-items-center justify-content-center l_card_container">
                    <img src="${MyOfflinePaymentDTO.thumbnail}" class="l_fund_card_img" alt="">
                </div>
                <div class="col-md-5 d-flex align-items-center">
                    <div class="l_card_body">
                        <div class="l_card_title">${MyOfflinePaymentDTO.movieName}</div>
                        <div class="l_card_percent l_mint">${MyOfflinePaymentDTO.formatToPercent()}% 달성</div>
                        <div class="l_card_synopsis">${MyOfflinePaymentDTO.synopsis}</div>
                        <div class="l_card_director">감독 : ${MyOfflinePaymentDTO.director}</div>
                        <div class="l_card_pay_date"><a class="l_strong" style="margin-right: 16px">결제 일시</a> ${MyOfflinePaymentDTO.formatToDate()}</div>
                        <div class="l_card_payment"><a class="l_strong" style="margin-right: 16px">결제 정보</a> <a id="finalPrice${status.count}">${MyOfflinePaymentDTO.formatToPrice()}</a>원</div>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-end justify-content-end mb-4">
                    <form action="/reservation/${MyOfflinePaymentDTO.movieId}/on-ticket">
                        <input type="hidden" value="${MyOfflinePaymentDTO.reservationId}" id="reservationId${status.count}">
                        <button class="btn btn-outline-dark mt-2" type="submit" style="margin-right: 3.5rem; width: 8rem;">티켓 확인</button>
                    </form>
                    <input type="hidden" value="${MyOfflinePaymentDTO.reservationCode}" id="reservationCode${status.count}">
                    <input type="hidden" value="${MyOfflinePaymentDTO.orderId}" id="orderId${status.count}">
                    <input type="hidden" value="${MyOfflinePaymentDTO.paymentId}" id="paymentId${status.count}">
                    <input type="hidden" value="${MyOfflinePaymentDTO.movieId}" id="movieId${status.count}">
                    <button class="btn l_mint_button text-white mt-2" type="button" style="margin-right: 3.5rem; width: 8rem;" onclick="getToken(${status.count})">환불 하기</button>
                </div>
            </div>
        </div>
    </c:forEach>

    <nav aria-label="Page navigation ">
        <ul class="pagination justify-content-center" id="l_pagination">
        </ul>
    </nav>

</div>

<script src="../../../../js/lsr/off_payment.js"></script>
<%@ include file="../layout/footer.jsp" %>