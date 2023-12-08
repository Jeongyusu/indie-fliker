/**
 * 사용하시게 될때는 apikey 주석 풀어주세요!
 */

const userId = document.getElementById('userId').value;
const movieTitle = document.getElementById('movieTitle').value;

const chatMessagesContainer = document.getElementById('chatMessages');
const messageInput = document.getElementById('l_message_input');
const sendMessageButton = document.getElementById('l_send_message_button');

var firebaseConfig = {
//    apiKey: "AIzaSyBizQ8BXMTz4wRDIXsMiCfvOK-90kq6n1k",
    authDomain: "indiflinker-chat.firebaseapp.com",
    projectId: "indiflinker-chat",
};

firebase.initializeApp(firebaseConfig);
var db = firebase.firestore();

sendMessageButton.addEventListener('click', () => {
    const messageText = messageInput.value;
    const timestamp = new Date().toLocaleTimeString();

    // add 로 메세지 넣기
    db.collection(movieTitle).add({
        id : userId,
        message: messageText,
        timestamp: timestamp,
    })
    .then((docRef) => {
        console.log("메시지가 성공적으로 추가되었습니다. 문서 ID:", docRef.id);
    })
    .catch((error) => {
        console.error("메시지 추가 중 오류 발생:", error);
    });
    messageInput.value = '';
});

// snapshot 리스너 (채팅이 추가되는지 듣고있음)
db.collection(movieTitle)
.orderBy("timestamp")
.onSnapshot((snapshot) => {
    snapshot.docChanges().forEach((change) => {
        if (change.type === "added") {
            const messageData = change.doc.data();

            addMessage(messageData.id, messageData.message, messageData.timestamp);
            chatMessagesContainer.scrollTop = chatMessagesContainer.scrollHeight;
        }
    });
});

function addMessage(name, message, time) {
    const messageContainer = document.createElement('div');
    messageContainer.classList.add('l_message_container');
    
    const textContainer = document.createElement('div');
    textContainer.classList.add('l_message_text');
    
    const nameElement = document.createElement('div');
    nameElement.classList.add('l_message_name');
    nameElement.textContent = name;
    
    const textElement = document.createElement('div');
    textElement.textContent = message;
    
    const timeElement = document.createElement('div');
    timeElement.classList.add('l_message_time');
    timeElement.textContent = time;
    
    messageContainer.appendChild(nameElement);
    messageContainer.appendChild(textElement);
    messageContainer.appendChild(timeElement);
    
    chatMessagesContainer.appendChild(messageContainer);
}