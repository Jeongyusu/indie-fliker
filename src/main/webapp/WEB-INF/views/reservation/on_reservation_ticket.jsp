<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>
<main>
    <div class="n_custom_fluid">
        <div class="row justify-content-center">
            <div id="n_reservation_ticket">
                    <div class="n_movie_img">
                        <img src=${onReservationTicketDTO.thumbnail}>
                    </div>
                    <div class="n_reservation_detail">
                        <span id="n_comment"><p>펀딩 구매가 완료되었습니다!</p></span>
                        <div class="n_detail">
                        <span>
                            <p class="n_title">· 예매 영화</p>
                            <p>${onReservationTicketDTO.movieName}</p>
                        </span>
                            <span>
                            <p class="n_title">· 장르</p>
                            <p>${onReservationTicketDTO.movieGenre}</p>
                        </span>
                        <c:choose>
                            <c:when test="${onReservationTicketDTO.formatToReleaseDate() != null}">
                                <span>
                                    <p class="n_title">· 온라인 상영 기간</p>
                                </span>
                                <span>
                                    <p>${onReservationTicketDTO.formatToReleaseDate()} ~ ${onReservationTicketDTO.formatToEndDate()} </p>
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span>
                                    <p class="n_title">· 온라인 상영 예정일</p>
                                </span>
                                <span>
                                    <p>${onReservationTicketDTO.formatToDDay()}</p>
                                </span>
                            </c:otherwise>
                        </c:choose>
                            <span>
                            <p class="n_title">· 결제 정보</p>
                            <p>${onReservationTicketDTO.formatToBalance()}원</p>
                        </span>
                        </div>
                    </div>
                    <div class="n_reservation_number">
                        <span><p id="n_title">예매 번호</p></span>
                        <span><p id="n_number">${onReservationTicketDTO.reservationCode}</p></span>
                    </div>
                </div>
            <div id="n_reservation_list_button">
                <form action="/payment/on-funding" method="get">
                    <button type="submit" id="n_button">예매 내역</button>
                </form>
            </div>
            <div id="n_attention_comment">
                <p>· 관람안내</p>
                <p class="n_comment">- 구매하신 예매권은 온라인 상영관에서 언제든지 관람이 가능합니다.</p>
                <p class="n_comment">- 관람 기간은 <strong>총 4일</strong>이며, <strong>온라인 상영 기간 내</strong>에 관람이 가능합니다.</p>
                <p class="n_comment">- 관람 시작 기준은 구매 시점이며, 이후 4일이 지나면 자동으로 관람이 종료됩니다.</p>
            </div>
        </div>
    </div>
</main>
<!-- footer -->
<%@ include file="../layout/footer.jsp" %>