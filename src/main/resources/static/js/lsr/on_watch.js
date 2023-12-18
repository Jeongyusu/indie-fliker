/**
 * [온라인 영화 시청] 에 들어가는 댓글 + 맨 위로가기 버튼
 */

const reviewContainer = document.getElementById('l_review_container');
const commentContainer = document.getElementById('l_commentary_container');


function addReviewMessage(profile, name, message) {

    const messageContainer = document.createElement('div');
    messageContainer.classList.add('l_message_container');

    const messageElement = document.createElement('div');
    messageElement.classList.add('l_review_message_text');

    const profileAndCommentElement = document.createElement('div');
    profileAndCommentElement.classList.add('l_profile_comment');

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

    const settingButton = document.createElement('button');
    settingButton.classList.add('l_review_setting_button');

    const buttonImage = document.createElement('img');
    buttonImage.src = "/images/icons/menu.png";

    messageContainer.appendChild(messageElement);

    profileAndCommentElement.appendChild(profileImg);
    profileAndCommentElement.appendChild(textContainer);

    messageElement.appendChild(profileAndCommentElement);
    messageElement.appendChild(settingButton);

    settingButton.appendChild(buttonImage);

    textContainer.appendChild(nameElement);
    textContainer.appendChild(textElement);

    reviewContainer.appendChild(messageContainer);
}

function addCommentaryMessage(score, profile, name, message) {

    const commentaryContainer = document.createElement('div');
    commentaryContainer.classList.add('l_comment_container');

    const scoreContainer = document.createElement('div');
    scoreContainer.classList.add('l_score_container');

    const scoreTitle = document.createElement('div');
    scoreTitle.classList.add('l_score_title');
    scoreTitle.textContent = "평점";

    const scoreNumber = document.createElement('div');
    scoreNumber.classList.add('l_score');
    scoreNumber.textContent = score;

    const messageContainer = document.createElement('div');
    messageContainer.classList.add('l_commentary_list_container');

    const messageElement = document.createElement('div');
    messageElement.classList.add('l_commentary_message_text');

    const profileAndCommentElement = document.createElement('div');
    profileAndCommentElement.classList.add('l_profile_comment');

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

    const settingButton = document.createElement('button');
    settingButton.classList.add('l_commentary_setting_button');

    const buttonImage = document.createElement('img');
    buttonImage.src = "/images/icons/menu.png";

    messageContainer.appendChild(messageElement);

    profileAndCommentElement.appendChild(profileImg);
    profileAndCommentElement.appendChild(textContainer);

    messageElement.appendChild(profileAndCommentElement);
    messageElement.appendChild(settingButton);

    settingButton.appendChild(buttonImage);

    textContainer.appendChild(nameElement);
    textContainer.appendChild(textElement);

    scoreContainer.appendChild(scoreTitle);
    scoreContainer.appendChild(scoreNumber);

    commentaryContainer.appendChild(scoreContainer);
    commentaryContainer.appendChild(messageContainer);

    commentContainer.appendChild(commentaryContainer);
}

// for문으로 addMessage하면 됩니다.

addReviewMessage("", "sksk", "hihihihihi");
addReviewMessage("", "sksk", "hihihihihi");


addCommentaryMessage(5,"", "sksk", "hihihihihi");
addCommentaryMessage(1,"", "sksk", "hihihihihi");


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