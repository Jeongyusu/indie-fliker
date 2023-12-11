<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
                        <p class="n_pay_step_choice">좌석 지정</p>
                    </li>
                    <li class="n_other_li">
                        <p class="n_pay_step_p">결제 하기</p>
                    </li>
                </ol>
            </div>
            <div id="n_select_seat">
                <div id="n_movie_seat">
                    <div class="n_last_count">
                        <div class="n_count_person">
                            <p>관람인원</p>
                        </div>
                        <div class="n_ticket_count">
                            <div class="n_last_count_button">
                                <button id="n_minus_button" onclick="count('minus')" disabled>-</button>
                                <p class="n_count">0</p>
                                <button id="n_plus_button" onclick="count('plus')">+</button>
                            </div>
                        </div>
                    </div>
                    <div id="n_seat_and_attention">
                        <div id="n_seat_wrapper">
                            <div class="n_seat_wrapper"></div>
                        </div>
                        <div id="n_attention_seat">
                        <span>
                            <input type="button" id="n_choice">
                            <p>선택</p>
                        </span>
                            <span>
                            <div>
                                <input type="button" id="n_exist" value="X">
                            </div>
                            <p>예매 완료</p>
                        </span>
                            <span>
                            <input type="button" id="n_possible">
                            <p>일반</p>
                        </span>
                        </div>
                    </div>
                </div>
                <div id="n_select_movie_seat">
                    <div id="n_select_info">
                        <div id="n_img">
                            <img src="images/moviePhoto/the_boy1.jpg">
                        </div>
                        <div id="n_movie_title">
                            <img src="images/icons/movie_level_all.png">
                            <p>그대들은 어떻게 살 것인가?</p>
                        </div>
                        <div id="n_movie_day_and_time">
                            <div class="n_select_count">
                                <span id="n_day"><p>2023.01.02</p></span>
                                <span id="n_time"><p>15:05 ~ 17:03</p></span>
                            </div>
                        </div>
                        <div>
                            <div class="n_select_seat_wrapper">
                                <input type="hidden" id="n_clicked_seat_list" name="" value="">
                                <input type="hidden" id="n_exist_seat_list" name="" value="">
                                <input type="hidden" id="n_selected_seat_data" name="" value="">
                            </div>
                        </div>
                    </div>
                    <form>
                        <button type="submit" id="n_payment_button">
                            <div class="n_last_price">
                                <span class="n_last_price" id="n_last_count"><p id="n_person_count">0</p><p>인</p></span>
                                <span class="n_last_price" id="last_price"><p>총</p><p id="n_price">0</p><p>원</p></span>
                            </div>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/select_seat.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
