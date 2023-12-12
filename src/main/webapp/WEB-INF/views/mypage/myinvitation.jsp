<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>


<main>
    <div class="n_custom_fluid">
        <div class="row justify-content-center">
        	<c:forEach var="VipReservationDTO" items="${VipReservationDTOLists}">
            <div id="n_reservation_ticket">
                <div class="n_movie_img">
                    <img src="/images/moviePoster/the_boy_poster1.jpg">
                </div>
                <div class="n_reservation_detail">
                    	<span id="n_comment"><p>초청권이 도착했습니다!!!</p></span>
                    <div class="n_detail">
              			<span>
                			<p class="n_title">· 예매 영화</p>
                			<p>그대들은 어떻게 살 것인가? ${vipReservationDTO.movieName}</p>
              			</span>
              			<span>
                			<p class="n_title">· 관람 시간 </p>
                			<p id="n_day">2024.10.02 ${vipReservationDTO.runningDate}</p>
                			<p id="n_time">15:05 ~ 16:20 ${vipReservationDTO.startTime}</p>
              			</span>
              			<span>
                			<p class="n_title">· 극장 주소</p>
                			<p>부산 서면 ${vipReservationDTO.address}</p>
              			</span>
              			<span>
                			<p class="n_title">· 좌석 번호 </p>
               	 			<p class="n_seat_number">G15 ${vipReservationDTO.seatName}</p>
              			</span>
              			<span>
                			<p class="n_title">· 관람 극장</p>
                			<p id="n_place">그린 시네마 ${vipReservationDTO.theaterName}</p>
              			</span>
              			<span>
               		</div>
                </div>
                <div class="n_reservation_number">
                    <span><p id="n_title">예매 번호</p></span>
                    <span><p id="n_number">9931-650-40013 ${vipReservationDTO.reservationCode}</p></span>
                </div>
                
            </div>
            </c:forEach>
            
            <!--
            <div id="n_reservation_list_button">
            	<form action="" method="get">
                    <input type="hidden" name="" value="" >
                    <button type="submit" id="n_button">예매 내역</button>
                </form>   
            </div>
            -->
            
            <div id="n_attention_comment">
                <p>· 상영안내</p>
                <p class="n_comment">- 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</p>
                <p class="n_comment">- 상영시간 1시간 전까지 취소 가능하며, 갭쳐화면으로는 입장하실 수 없습니다.</p>
            </div>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>