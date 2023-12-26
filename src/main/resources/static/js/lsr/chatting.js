/**
 * [관리자 페이지] 영화 채팅방 오픈
 * 채팅방 오픈된 영화 없애기 해줘야 해요! or 버튼 비활성화
 */

import { db } from './firebase-config.js';

$(document).ready(function() {
    // 모달에 내용 넣고 firestore에 영화 추가하는 내용
    $('.btn[data-toggle="modal"]').on('click', function() {
        var movieTitle = $(this).closest('.p_menu1').find('.p_p1').text();
        var achievementRate = $(this).closest('.p_menu1').find('.p_p2').text();

        $('.modal-body .movie-title').text("영화 제목: " + movieTitle);
        $('.modal-body .achievement-rate').text("달성률: " + achievementRate);

        $('#startChatBtn').on('click', function() {
            $.ajax({
                url: '/api/chat/open',
                type: 'POST',
                data: { movieTitle: movieTitle },
                success: function(response) {
                    console.log('채팅방이 성공적으로 열렸습니다.');
                },
                error: function(error) {
                    console.error('채팅방 열기에 실패했습니다:', error.statusText);
                }
            });


            insertOpenChatMovie(movieTitle);
            $('#staticBackdrop').modal('hide');
            // ----- 채팅방 오픈된 영화 없애기 ----- //

        });
    });
});

function insertOpenChatMovie(movieTitle) {
    const startTime = new Date();
    const endTime = new Date(startTime.getTime() + 2 * 60 * 60 * 1000);

    db.collection("openChats").add({
        movie_title : movieTitle,
        start_time: startTime,
        end_time: endTime
    })
        .then((docRef) => {
            console.log("영화가 성공적으로 추가되었습니다. 문서 ID:", docRef.id);
        })
        .catch((error) => {
            console.error("영화 추가 중 오류 발생:", error);
        });
}