<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<body style="overflow: hidden;">
<!-- value = ${userId} 로 받을거임, 채팅방도 ${movieTitle} 이런식으로 받을 예정 -->
<input id="userId" value="sara" type="hidden" />
<input id="movieTitle" value="하울의" type="hidden" />

<div class="container-fluid">
    <div class="row">
        <div id="l_select_movie">
            <h5>우리는 독립적이고 독특한 영화들을 즐기는 곳입니다. 함께 특별한 순간을 만들어봐요.</h5>
        </div>
        <div class="col-md-2 l_chat_section l_hide_on_small">
            <div class="l_channel">채널</div>
            <span class="n_toggleMore">
                    <div class="card l_channel_card">
                        <div class="card-title l_font_pupple l_movie_title"># 그대들은 어떻게 살 것인가</div>
                        <img src="/static/images/moviePoster/the_boy_poster1.jpg" alt="채팅방 이미지" class="img-fluid m-2">
                        <div class="p card-text l_channel_movie_detail" style="font-size: small;">감독 : 미야자키 하야오<br/>
                            장르 : 미야자키 하야오<br/>
                            등급 : 미야자키 하야오<br/>
                            개봉일 : 미야자키 하야오
                        </div>
                    </div>
                </span>
            <button class="p l_channel_card_button" onclick="toggleMore()"> # 그대들은 어떻게 살 것인가</button>
            <span class="n_toggleMore">
                    <div class="card l_channel_card" style="display: none">
                        <div class="card-title l_font_pupple l_movie_title"># 그대들은 어떻게 살 것인가</div>
                        <img src="/static/images/moviePoster/the_boy_poster1.jpg" alt="채팅방 이미지" class="img-fluid m-2">
                        <div class="p card-text l_channel_movie_detail" style="font-size: small;">감독 : 미야자키 하야오<br/>
                            장르 : 미야자키 하야오<br/>
                            등급 : 미야자키 하야오<br/>
                            개봉일 : 미야자키 하야오
                        </div>
                    </div>
                </span>
            <button class="p l_channel_card_button" onclick="toggleMore()"># 하울의 움직이는 성</button>
            <span class="n_toggleMore">
                    <div class="card l_channel_card" style="display: none">
                        <div class="card-title l_font_pupple l_movie_title"># 그대들은 어떻게 살 것인가</div>
                        <img src="/static/images/moviePoster/the_boy_poster1.jpg" alt="채팅방 이미지" class="img-fluid m-2">
                        <div class="p card-text l_channel_movie_detail" style="font-size: small;">감독 : 미야자키 하야오<br/>
                            장르 : 미야자키 하야오<br/>
                            등급 : 미야자키 하야오<br/>
                            개봉일 : 미야자키 하야오
                        </div>
                    </div>
                </span>
            <button class="p l_channel_card_button" onclick="toggleMore()"># 서울의 봄</button>
            <span class="n_toggleMore">
                    <div class="card l_channel_card" style="display: none">
                        <div class="card-title l_font_pupple l_movie_title"># 그대들은 어떻게 살 것인가</div>
                        <img src="/static/images/moviePoster/the_boy_poster1.jpg" alt="채팅방 이미지" class="img-fluid m-2">
                        <div class="p card-text l_channel_movie_detail" style="font-size: small;">감독 : 미야자키 하야오<br/>
                            장르 : 미야자키 하야오<br/>
                            등급 : 미야자키 하야오<br/>
                            개봉일 : 미야자키 하야오
                        </div>
                    </div>
                </span>
            <button class="p l_channel_card_button" onclick="toggleMore()"># 3일의 휴가</button>
        </div>
        <div class="l_chat_message_box col-md-8 col-12">
            <div class="l_chat_messages" id="chatMessages">
                <!-- 채팅 메시지들 -->
            </div>
        </div>
        <div class="col-md-2 l_chat_section l_hide_on_small">
            <div class="h5 my-4">참여 인원</div>
            <div class="l_participants_list">
                <div class="l_participant d-flex align-items-center">
                    <img src="https://dummyimage.com/100/000/fff.jpg" alt="참가자1">
                    <span>참가자1</span>
                </div>
                <div class="l_participant d-flex align-items-center">
                    <img src="https://dummyimage.com/100/000/fff.jpg" alt="참가자2">
                    <span>참가자2</span>
                </div>
            </div>
        </div>

        <div class="l_participant d-flex fixed-bottom" style="margin-bottom: 2.5rem;">
            <div class="l_hide_on_small">
                <img src="https://dummyimage.com/100/000/fff.jpg" alt="내 프로필">
                <span>내 프로필</span>
            </div>
            <div class="l_chatbar input-group mb-5">
                <input id="l_message_input" type="text" class="form-control" placeholder="메시지 입력...">
                <button id="l_send_message_button" class="btn btn-outline-secondary" type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="m21.426 11.095-17-8A1 1 0 0 0 3.03 4.242l1.212 4.849L12 12l-7.758 2.909-1.212 4.849a.998.998 0 0 0 1.396 1.147l17-8a1 1 0 0 0 0-1.81z"></path></svg>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 스크립트 위로 올리면 에러나요! -->
<script src="../../../../js/lsr/on_watch.js"></script>
</body>
</html>