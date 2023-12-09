/**
 * [관리자 페이지] 영화 채팅방 오픈
 * 채팅방 오픈된 영화 없애기 (리스트 중에 해당영화를) 제거 해줘야해요!
 */

import { db } from './firebase-config.js';

 $(document).ready(function() {
	 // 모달에 내용 넣고 firestore에 영화 추가하는 내용
    $('.btn[data-toggle="modal"]').on('click', function() {
    	var movieTitle = $(this).closest('.p_menu1').find('.p_p1').text();
        var achievementRate = $(this).closest('.p_menu1').find('.p_p2').text();
        
        $('.modal-body .movie-title').text("영화 제목: " + movieTitle);
        $('.modal-body .achievement-rate').text("달성률: " + achievementRate);
        
        // 버튼 누르면 영화제목 firestore에 저장
        $('#startChatBtn').on('click', function() {
			insertOpenChatMovie(movieTitle);
            // 모달 닫기
            $('#staticBackdrop').modal('hide');
            // (리스트로 받았던 영화 중에) 채팅방 오픈된 영화 없애기 
            
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