/**
 * 채팅 메세지 add, snapshot으로 확인
 */

import {db} from './firebase-config.js';

const username = document.getElementById('principalUsername').value;
const userPic = document.getElementById('principalPic').value;


// 메세지 보내는 버튼
const sendMessageButtons = document.querySelectorAll('.l_send_message_button');


// 채팅방 버튼
const chatButtons = document.querySelectorAll('.l_channel_card_button');

// 해당 채팅 버튼을 클릭 시 채팅 내용 뜨기
chatButtons.forEach((chatButton) => {
    chatButton.addEventListener('click', ()=> {
        const number = chatButton.getAttribute('id').replace('movie', ''); // 1

        let chatMessagesContainer = document.getElementById(`chatMessages` + number);
        let movieTitle = document.getElementById(`movieTitle` + number).value;

        // 채팅방 초기화
        chatMessagesContainer.innerHTML = "";
        // 리스너 호출
        snapshotListener(chatMessagesContainer, movieTitle);

        // 화면 높이 가져와서 채팅방에 설정하기
        const windowHeight = window.innerHeight;
        const chatContainers = document.querySelectorAll(".l_chat_message_box");
        chatContainers.forEach(chatContainer => {
            chatContainer.style.height = `${windowHeight}px`;
        });
    })
});



// 각 채팅방에 존재하는 메시지 전송 버튼을 클릭 시 메세지를 인식하여 채팅방에 메세지 넣기
sendMessageButtons.forEach((sendMessageButton) => {

    sendMessageButton.addEventListener('click', () => {

        const number = sendMessageButton.getAttribute('id').replace('send_button', ''); // 1
        const messageInput = document.getElementById(`l_message_input` + number);
        const messageText = messageInput.value;
        const chatTitle = document.getElementById(`movieTitle` + number).value;
        console.log("채팅방 영화 : " + chatTitle);

        const timestamp = new Date().toLocaleTimeString();

        // add 로 메세지 넣기
        db.collection(chatTitle).add({
            name: username,
            pic: userPic,
            message: messageText,
            timestamp: timestamp,
        })
            .then((docRef) => {
                console.log("메시지가 성공적으로 추가되었습니다. 문서 name:", docRef.name);
            })
            .catch((error) => {
                console.error("메시지 추가 중 오류 발생:", error);
            });

        messageInput.value = '';
    });
});

// 스냅샷 리스너 (채팅이 추가되는지 듣고있음)
let unsubscribeSnapshotListener;  // 변수 추가

function snapshotListener(chatMessagesContainer, chatTitle) {

    const username = document.getElementById('principalUsername').value;
    const userPic = document.getElementById('principalPic').value;

    // 이전에 등록된 스냅샷 리스너 해제
    if (unsubscribeSnapshotListener) {
        unsubscribeSnapshotListener();
    }

    // 새로운 스냅샷 리스너 등록
    unsubscribeSnapshotListener = db.collection(chatTitle)
        .orderBy("timestamp")
        .onSnapshot((snapshot) => {
            snapshot.docChanges().forEach((change) => {
                if (change.type === "added") {
                    const messageData = change.doc.data();

                    // username 넣기
                    let includeUsers = [];
                    includeUsers.push({username: username, userPic: userPic});
                    console.log("해당 배열에 있는 애들 : " + includeUsers.toString());


                    // 특정 값이 배열에 존재하는지 확인
                    let existingUser = includeUsers.filter(user => user.username === messageData.name && user.userPic === messageData.pic);

                    if (!existingUser) {
                        // 해당 사용자가 배열에 존재하지 않으면 추가
                        includeUsers.push({ username: messageData.name, userPic: messageData.pic });
                        console.log("해당 배열에 있는 애들 : " + includeUsers.toString());
                    }

                    includeUsers.forEach((includeUser) => {
                        console.log("참여인원들 : " + includeUser.username);
                        // 참여인원 추가
                        addParticipation (includeUser.username, includeUser.userPic);
                    })
                    // 메세지 내용 추가
                    const messageContainer = addMessage(messageData.name, messageData.pic, messageData.message, messageData.timestamp, username, userPic);
                    chatMessagesContainer.appendChild(messageContainer);
                    chatMessagesContainer.scrollTop = chatMessagesContainer.scrollHeight;
                }
            });
        });
}

function addMessage(name, pic, message, time, principalUsername, principalPic) {


    if(name !== principalUsername){
        const chatContainer = document.createElement('div');
        chatContainer.classList.add('l_chat_container');

        const profileContainer = document.createElement('div');
        profileContainer.classList.add('l_participant_chat');
        profileContainer.classList.add('d-flex');
        profileContainer.classList.add('align-items-center');

        const profile = document.createElement('img');
        profile.src = pic;

        const username = document.createElement('span');

        const messageContainer = document.createElement('div');
        messageContainer.classList.add('l_message_container');

        const textContainer = document.createElement('div');
        textContainer.classList.add('l_message_text');

        const nameElement = document.createElement('div');
        nameElement.classList.add('l_message_name');
        nameElement.textContent = name;

        const textElement = document.createElement('div');
        textElement.classList.add('l_message_message');
        textElement.textContent = message;

        const timeElement = document.createElement('div');
        timeElement.classList.add('l_message_time');
        timeElement.textContent = time;


        profileContainer.appendChild(profile);
        profileContainer.appendChild(username);

        messageContainer.appendChild(nameElement);
        messageContainer.appendChild(textElement);
        messageContainer.appendChild(timeElement);

        chatContainer.appendChild(profileContainer);
        chatContainer.appendChild(messageContainer);

        return chatContainer;


    } else {
        const chatContainer = document.createElement('div');
        chatContainer.classList.add('l_chat_container_from_user');

        const profileContainer = document.createElement('div');
        profileContainer.classList.add('l_participant_chat');
        profileContainer.classList.add('d-flex');
        profileContainer.classList.add('align-items-center');

        const profile = document.createElement('img');
        profile.src = principalPic;

        const messageContainer = document.createElement('div');
        messageContainer.classList.add('l_message_container_from_user');

        const textContainer = document.createElement('div');
        textContainer.classList.add('l_message_text');

        const textElement = document.createElement('div');
        textElement.classList.add('l_message_message');
        textElement.textContent = message;

        const timeElement = document.createElement('div');
        timeElement.classList.add('l_message_time_from_user');
        timeElement.textContent = time;


        profileContainer.appendChild(profile);

        messageContainer.appendChild(textElement);
        messageContainer.appendChild(timeElement);

        chatContainer.appendChild(messageContainer);
        chatContainer.appendChild(profileContainer);

        return chatContainer;

    }
}

// 참여인원 추가하기
function addParticipation (participationUsername, participationPic) {
    let profileContainer = document.querySelector(".l_participants_list");
    console.log("참여인원추가하는 사람 이름 : " + participationUsername);
    console.log("참여인원에 추가하는 사람 사진 명 : " + participationPic);

    // 이미 존재하는지 확인
    // if (document.getElementById(participationUsername)) {
    //     console.log(`Element with id ${participationUsername} already exists. Skipping creation.`);
    //     return;
    // }

    // // 없는 유저는 삭제
    // if(document.getElementById(participationUsername).innerHTML !== profileContainer){
    //     document.getElementById(participationUsername).remove();
    // }

    let profileForm = document.createElement('div');
    profileForm.classList.add("l_participant_in_user");
    profileForm.classList.add("d-flex");
    profileForm.classList.add("align-items-center");

    profileForm.innerHTML = `
                            <img src="${participationPic}">
                            <span id="${participationUsername}">${participationUsername}</span>
    `;

    profileContainer.appendChild(profileForm);

}


// Enter 키를 누를 때 메시지 전송 -> TODO: 수정해야 함?
function handleKeyPress() {
    console.log('');
    if (window.event.keyCode === 13) {
        sendMessage();
    }
}

// 채널 버튼 토글
let channelButton = document.querySelectorAll(".l_channel_card_button");
channelButton.forEach(function (button) {
    button.addEventListener("click", function () {

        // .l_toggle_more을 순회하면서 모든 display를 none 하기
        let allMoreContent = document.querySelectorAll(".l_toggle_more");
        allMoreContent.forEach(function (moreContent) {

            if (moreContent.style.display === "none") {
                moreContent.style.display = "none";
            } else {
                moreContent.style.display = "none";
            }
        })

        // 그 다음 button 하위 요소 중 이벤트가 발생한 버튼이 하위 요소 중 none이 있다면 inline하기
        let currentMoreContent = button.nextElementSibling;
        if (currentMoreContent.style.display === "none") {
            currentMoreContent.style.display = "inline";
        }
    })
})

//////////////////////////////////////////////////////////////////

const channelButtons = document.querySelectorAll('.l_channel_card_button');
const chatRooms = document.querySelectorAll('.l_chat_room');

// 채널 버튼을 순회
channelButtons.forEach(channel => {
    channel.addEventListener('click', () => {
        // 선택된 탭에 대한 스타일 변경
        // 특정 버튼을 클릭하면 나머지 버튼의 active를 삭제
        channelButtons.forEach(channel => channel.classList.remove('active'));
        channel.classList.add('active');

        // 선택된 탭 내용 표시
        // tab의 id에 tab -> content로 변경하면 id=content1을 찾는다.
        const channelId = channel.getAttribute('id').replace('movie', 'movie_chat');
        chatRooms.forEach(room => room.classList.remove('show'));
        document.getElementById(channelId).classList.add('show');
    });
});

