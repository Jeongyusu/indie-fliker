/**
 * [온라인 영화 시청] 에 들어가는 댓글 + 맨 위로가기 버튼
 */

const commentContainer = document.getElementById('l_comment_container');
const reviewContainer = document.getElementById('l_review_container');

function addMessage(profile, name, message, container) {
    const messageContainer = document.createElement('div');
    messageContainer.classList.add('l_message_container');

    const messageElement = document.createElement('div');
    messageElement.classList.add('l_message_text');

    const profileImg = document.createElement('div');
    profileImg.classList.add('l_profile_img');
    if (profile != null) {
        profileImg.style.backgroundImage = `url(${profile})`;
    }

    const textContainer = document.createElement('div');
    textContainer.classList.add('l_text_container');

    const nameElement = document.createElement('div');
    nameElement.classList.add('l_message_name');
    nameElement.textContent = name;

    const textElement = document.createElement('div');
    textElement.classList.add('l_message_text');
    textElement.textContent = message;

    messageContainer.appendChild(messageElement);
    messageElement.appendChild(profileImg);
    messageElement.appendChild(textContainer);
    textContainer.appendChild(nameElement);
    textContainer.appendChild(textElement);

    container.appendChild(messageContainer);
}

// for문으로 addMessage하면 됩니다.
addMessage("data:image/jpeg;base64,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", "sksk", "hihihihihi", commentContainer);
addMessage("", "sksk", "hihihihihi", commentContainer);
addMessage("", "sksk", "hihihihihi", commentContainer);
addMessage("", "sksk", "hihihihihi", commentContainer);
addMessage("", "sksk", "hihihihihi", commentContainer);

addMessage("", "sksk", "hihihihihi", reviewContainer);
addMessage("", "sksk", "hihihihihi", reviewContainer);
addMessage("", "sksk", "hihihihihi", reviewContainer);
addMessage("", "sksk", "hihihihihi", reviewContainer);
addMessage("", "sksk", "hihihihihi", reviewContainer);


// 맨 위로 가기 버튼
document.addEventListener('DOMContentLoaded', function () {
    var backToTopButton = document.getElementById('l_back_to_top');

    if (backToTopButton) {
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        }

        function handleScroll() {
            if (document.documentElement.scrollTop > 100) {
                backToTopButton.classList.add('show');
            } else {
                backToTopButton.classList.remove('show');
            }
        }

        backToTopButton.addEventListener('click', function (e) {
            e.preventDefault();
            scrollToTop();
        });

        window.addEventListener('scroll', handleScroll);
    }
});

function handleClickTab(number) {
    $('#l_online_navbar ul li').removeClass('l_active');
    $('#l_online_navbar ul li:nth-child(' + number + ')').addClass('l_active');

    $('.content').hide();
    $('.content[num=' + number + ']').show();
}

function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
} 