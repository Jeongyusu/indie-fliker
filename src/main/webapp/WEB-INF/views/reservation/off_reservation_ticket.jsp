<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>


<main>
    <div class="n_custom_fluid">
        <div class="row justify-content-center">
            <div id="n_reservation_ticket">
                <div class="n_movie_img">
                    <img src=${offReservationTicketDTO.thumbnail}>
                </div>
                <div class="n_reservation_detail">
                    <span id="n_comment"><p>영화 예매가 완료되었습니다!</p></span>
                    <div class="n_detail">
                        <span>
                            <p class="n_title">· 예매 영화</p>
                            <p>${offReservationTicketDTO.movieName}</p>
                        </span>
                        <span>
                            <p class="n_title">· 관람 시간</p>
                            <p id="n_day">${offReservationTicketDTO.formatToDate()}</p>
                            <p id="n_time">${offReservationTicketDTO.formatToStartTime()} ~ ${offReservationTicketDTO.formatToEndTime()}</p>
                        </span>
                        <span>
                            <p class="n_title">· 관람 인원</p>
                            <p>${offReservationTicketDTO.audience}명</p>
                        </span>
                        <span>
                            <p class="n_title">· 좌석 번호</p>
                            <p class="n_seat_number">${offReservationTicketDTO.seats}</p>
                        </span>
                        <span>
                            <p class="n_title">· 관람 극장</p>
                            <p id="n_place">${offReservationTicketDTO.theaterName}</p>
                        </span>
                        <span>
                            <p class="n_title">· 결제 정보</p>
                            <p>${offReservationTicketDTO.formatToBalance()}원</p>
                        </span>
                    </div>
                </div>
                <div class="n_reservation_number">
                    <span><p id="n_title">예매 번호</p></span>
                    <span><p id="n_number">${offReservationTicketDTO.reservationCode}</p></span>
                </div>
            </div>
            <div id="n_reservation_list_button">
                <form action="" method="get">
                    <input type="hidden" name="" value="" >
                    <button type="submit" id="n_button">예매 내역</button>
                </form>
            </div>
            <div id="n_attention_comment">
                <p>· 상영안내</p>
                <p class="n_comment">- 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</p>
                <p class="n_comment">- 상영시간 1시간 전까지 취소 가능하며, 갭쳐화면으로는 입장하실 수 없습니다.</p>
            </div>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>