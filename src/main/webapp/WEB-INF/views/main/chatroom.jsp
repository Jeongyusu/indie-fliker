<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<body style="overflow: hidden">

<div class="container-fluid">
    <div class="row">
        <div id="l_select_movie">
            <h5>우리는 독립적이고 독특한 영화들을 즐기는 곳입니다. 함께 특별한 순간을 만들어봐요.</h5>
        </div>
        <div class="l_chat_section l_hide_on_small">
            <div class="l_channel">채널</div>
            <c:forEach var="movie" items="${openMovieChatDTOs}" varStatus="status">
                <button class="l_channel_card_button" id="movie${status.count}"> # ${movie.movieName}</button>
                <span class="l_toggle_more" style="display: none">
                <div class="card l_channel_card">
                    <img src="${movie.thumbnail}" alt="채팅방 이미지" class="img-fluid m-2">
                    <div class="card-text l_channel_movie_detail" style="font-size: small;">감독 : ${movie.director}<br/>
                        장르 : ${movie.genre}<br/>
                        등급 : ${movie.runningGrade}<br/>
                        개봉일 : ${movie.onlineReleaseDate}
                    </div>
                </div>
            </span>
            </c:forEach>
        </div>
        <!-- 채팅방 : room + 참가자 -->
        <c:forEach var="chat" items="${openMovieChatDTOs}" varStatus="status">
            <div class="l_chat_room" id="movie_chat${status.count}">
                <input id="movieTitle${status.count}" value="${chat.movieName}" type="hidden" />
                <div class="l_chat_message_box col-12">
                    <div class="l_chat_messages" id="chatMessages${status.count}">
                        <!-- 채팅 메시지들 -->
                    </div>
                    <div class="l_chatbar input-group">
                        <input id="l_message_input${status.count}" type="text" class="form-control l_input_chat" placeholder="메시지 입력...">
                        <button class="l_send_message_button" id="send_button${status.count}" type="button" >
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="m21.426 11.095-17-8A1 1 0 0 0 3.03 4.242l1.212 4.849L12 12l-7.758 2.909-1.212 4.849a.998.998 0 0 0 1.396 1.147l17-8a1 1 0 0 0 0-1.81z"></path></svg>
                        </button>
                    </div>
                </div>
                <div class="l_chat_section_user l_hide_on_small">
                    <div class="h5 my-4">참여 인원</div>
                    <div class="l_participants_list">
                        <div class="l_participant_in_user align-items-center" id="l_participant_in${status.count}">
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="l_participant_user d-flex fixed-bottom" style="margin-bottom: 2.5rem;">
            <div class="l_hide_on_small l_my_profile">
                <img src="${principal.pic}" alt="내 프로필">
                <span>내 프로필</span>
            </div>
        </div>
        <input type="hidden" value="${principal.pic}" id="principalPic">
        <input type="hidden" value="${principal.username}" id="principalUsername">
    </div>
</div>
<!-- 스크립트 위로 올리면 에러나요! -->
<script type="module" src="../../../../js/lsr/chatroom.js"></script>
</body>
</html>