/**
 * [실시간 채팅방] POST /chatroom 으로
 * { movieTitle } 보냄 (ChatController 확인)
 */

 import { db } from './firebase-config.js';
 
 const liveContainer = document.getElementById('l_live_chat_container');
 
 db.collection('openChats')
 	.get()
 	.then((querySnapshot) => {
	 	querySnapshot.forEach((doc) => {
			const docData = doc.data();
			const movieTitle = docData.movie_title;
			const startTime = docData.start_time.toDate();
			const endTime = docData.end_time.toDate();
			
			if (compareTimes(startTime, endTime)) {
                const openTime = startTime.toLocaleTimeString()
                +  ` ~ ` + endTime.toLocaleTimeString();

                const chatRoomCard = createChatRoomCard(movieTitle, openTime, true);
                liveContainer.appendChild(chatRoomCard);
            }
		});
	})
	.catch((error) => {
		console.error("문서 가져올 때 에러: ", error);
	});
	
function compareTimes(startTime, endTime) {
    const currentTimestamp = new Date().getTime();
    return currentTimestamp >= startTime && currentTimestamp <= endTime;
}

function createChatRoomCard(movieTitle, openTime, enterChatBtn) {
    const cardContainer = document.createElement('div');
    cardContainer.classList.add('l_movie_card', 'card', 'text-bg-light');

    cardContainer.innerHTML = `
        <div class="row g-0">
            <div class="col-md-4 d-flex align-items-center justify-content-center my-4">
                <img src="https://dummyimage.com/600x300/000/fff.jpg" class="card-img" alt="" style="width: 12rem; height: 18rem;">
            </div>
            <div class="col-md-5 d-flex align-items-center">
                <div class="card-body">
                    <div class="h4 card-title">${movieTitle}</div>
                    <div class="h6 card-text">개봉 기간</div>
                    <div class="p card-text l_mint mb-3">2023.12.01 ~ 2023.12.30</div>
                    <div class="p card-text mb-3">A blade runner must pursue and try to terminate four replicants...
                        A blade runner must pursue and try to terminate four replicants...
                    </div>
                    <div class="p card-text mb-2">오픈 시간</div>
                    <div class="p card-text">${openTime}</div>
                </div>
            </div>
            <div class="col-md-3 d-flex flex-column align-items-end justify-content-end mb-4">
			    ${enterChatBtn ? 
                    `<form action="http://localhost/chatroom" method="post" target="_blank">
                        <input type="hidden" name="movieTitle" value="${movieTitle}">
                        <button class="btn l_mint_button mt-2" type="submit" style="margin-right: 2.5rem; width: 10rem;">채팅방 입장</button>
                    </form>` 
                    : ''}
			</div>
        </div>
    `;

    return cardContainer;
}