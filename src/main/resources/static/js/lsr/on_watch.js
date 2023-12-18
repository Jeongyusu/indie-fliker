
let normalReviewId = document.querySelector("#normalReviewId").value;
let reviewContent = document.querySelector(".l_chat_message_input").value;
let reviewUserId = document.querySelector("#reviewUserId").value;

let vipReviewId = document.querySelector("#vipReviewId").value;
let vipReviewContent = document.querySelector(".l_commentary_input").innerHTML;
let vipReviewPoint = document.querySelector("#l_score_point").value;
let vipReviewUserId = document.querySelector("#vipReviewUserId").value;

let movieId = document.querySelector("#movieId").value;

let onlineEndDate = document.querySelector("#onlineEndDate");
let onlineReleaseDate = document.querySelector("#onlineReleaseDate");

let userId = document.querySelector("#principalId");
let username = document.querySelector("#principalUsername");
let userPic = document.querySelector("#principalPic");


let reviewButton = document.querySelector(".l_review_button");





let reviewSaveDTO = {
    reviewContent: reviewContent,
    movieId: movieId
};

let reviewDeleteDTO = {
    normalReviewId: normalReviewId,
    movieId: movieId
};

let reviewUpdateDTO = {
    reviewContent: reviewContent,
    normalReviewId: normalReviewId,
    movieId: movieId
};

let vipReviewSaveDTO = {
    vipReviewContent: vipReviewContent,
    vipReviewPoint: vipReviewPoint,
    movieId: movieId
};

let vipReviewDeleteDTO = {
    vipReviewId: vipReviewId,
    movieId: movieId
};

let vipReviewUpdateDTO = {
    vipReviewPoint:vipReviewPoint,
    vipReviewContent: vipReviewContent,
    vipReviewId: vipReviewId,
    movieId: movieId
};

reviewButton.addEventListener("click", function () {
    let reviewContent = document.querySelector(".l_chat_message_input").value;
    let movieId = document.querySelector("#movieId").value;

    let reviewSaveDTO = {
        reviewContent: reviewContent,
        movieId: movieId
    };

    saveNormalReview(reviewSaveDTO);
    console.log("movie_id : " + reviewSaveDTO.reviewContent);
    console.log("reviewContent : " + reviewSaveDTO.reviewContent);
})



async function saveNormalReview(reviewSaveDTO) {

    console.log("movie_id : " + reviewSaveDTO.reviewContent);
    console.log("reviewContent : " + reviewSaveDTO.reviewContent);

    try {
        let response = await fetch(`/normal-review/api/save`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reviewSaveDTO)

        });

        if (response.ok) {
            console.log("댓글 저장 완료");
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}









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