let movieId = document.querySelector('#movieId').value;

let onlineEndDate = document.querySelector("#onlineEndDate");
let onlineReleaseDate = document.querySelector("#onlineReleaseDate");

let userId = document.querySelector("#principalId").value;
let username = document.querySelector("#principalUsername").value;
let userPic = document.querySelector("#principalPic").value;
let userGrade = document.querySelector("#principalGrade").value;

let reviewButton = document.querySelector(".l_review_button");
let vipReviewButton = document.querySelector(".l_vip_review_button");


// 채팅방 form display 설정
let chatTime = document.querySelector("#chatTime").value;
console.log("chatTime : " + chatTime);
let chatGetTime = new Date(chatTime).getTime();
// timestamp로 가져온다는 가정하에

// 채팅 시작 시간
let chatFirstTime = new Date(chatTime);
console.dir("채팅 시작 : " + chatFirstTime);


// 채팅 종료 시간
let chatLastTime = new Date(chatGetTime + 2 * 60 * 60 * 1000);
console.dir("채팅 종료 : " + chatLastTime);


// 채팅 안내 시간(채팅시간 1시간 전)
let chatInfoTime = new Date(chatGetTime - 60 * 60 * 1000);
console.dir("채팅 안내시간 : " + chatInfoTime);

// 현재시간
let currentDate = new Date();
console.log("현재시간 : " + currentDate)

// 영향을 줄 요소
let chatForm = document.getElementById('chatForm');

// 채팅 입장 Form
if(chatForm != null){
    if(currentDate >= chatFirstTime && currentDate <= chatLastTime){
        chatForm.style.display = 'block';
    }else {
        chatForm.style.display = 'none';
    }
}
// 채팅 안내 Form
if(currentDate >= chatInfoTime && currentDate <= chatLastTime){
    $(document).ready(function(){
        $("#myModal").modal('show');
    });
}else {
}


// 페이지 로드 시 review 찾아오기
window.onload = function () {
    findNormalReview(movieId);
    findVipReview(movieId);
};

///////////////////////////////////////////////////
// 댓글

// 댓글 - 관람평쓰기 버튼 클릭시 저장
reviewButton.addEventListener("click", function () {
    let reviewContent = document.querySelector(".l_chat_message_input").value;
    let movieId = document.querySelector("#movieId").value;

    if(reviewContent.trim() === ""){
        alert("공백은 입력할 수 없습니다.");
        return;
    }

    let reviewSaveDTO = {
        reviewContent: reviewContent,
        movieId: movieId
    };

    saveNormalReview(reviewSaveDTO);
})


// 댓글 - 삭제하기 / 수정하기 버튼 클릭시 삭제 / 수정
let reviewElement = document.querySelector('#l_review_element');
reviewElement.addEventListener("click", function (event) {
    if(event.target.classList.contains("l_review_delete")){
        let reviewDeleteButton = event.target;

        // 클릭된 요소의 부모 요소를 찾음
        let reviewContainer = reviewDeleteButton.closest(".l_message_container");

        let normalReviewId = reviewContainer.querySelector(".normalReviewId").value;
        let movieId = document.querySelector("#movieId").value;

        let reviewDeleteDTO = {
            normalReviewId: normalReviewId,
            movieId: movieId
        };

        deleteNormalReview(reviewDeleteDTO);
    }
    if(event.target.classList.contains("l_review_update")){
        let reviewUpdateButton = event.target;

        // 클릭된 요소의 부모 요소를 찾음
        let reviewContainer = reviewUpdateButton.closest(".l_message_container");

        // 수정하기 클릭 시, input 태그 활성화
        let reviewContent = document.querySelector(".l_message_text");
        reviewContent.disabled = false;
        reviewContainer.classList.add("l_add_color");

    }
})


// 댓글 수정 시 Enter 클릭
function enterReviewKey(e) {
    if (window.event.keyCode === 13) {
        let reviewContent = e.value;

        if(reviewContent.trim() === ""){
            alert("공백은 입력할 수 없습니다.");
            return;
        }

        let movieId = document.querySelector("#movieId").value;
        let normalReviewId = document.querySelector(".normalReviewId").value;

        let reviewUpdateDTO = {
            reviewContent: reviewContent,
            normalReviewId: normalReviewId,
            movieId: movieId
        };

        updateNormalReview(reviewUpdateDTO);
    }
}


// 댓글 등록
async function saveNormalReview(reviewSaveDTO) {
    try {
        let response = await fetch(`/normal-review/api/save`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reviewSaveDTO)
        });

        if (response.ok) {
            findNormalReview(reviewSaveDTO.movieId);
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


// 댓글 삭제
async function deleteNormalReview(reviewDeleteDTO) {
    try {
        let response = await fetch(`/normal-review/api/delete`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reviewDeleteDTO)
        });

        if (response.ok) {

            findNormalReview(reviewDeleteDTO.movieId);
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


// 댓글 수정
async function updateNormalReview(reviewUpdateDTO) {
    try {
        let response = await fetch(`/normal-review/api/update`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reviewUpdateDTO)
        });

        if (response.ok) {

            findNormalReview(reviewUpdateDTO.movieId);
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


// 댓글 목록 조회
async function findNormalReview(movieId) {
    try {
        // fetch를 통한 비동기 통신
        let response = await fetch(`/normal-review/api/${movieId}/list`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            },
        });


        if (response.ok) {
            console.log("조회 완료!");
            let responseData = await response.json();
            let NormalReviewsToMovieDTO = responseData.response; // body

            let reviewElement = document.querySelector('#l_review_element');
            // 매번 초기화 해서 데이터를 삽입할 때 마다 중복이 없도록 한다.
            reviewElement.innerHTML = "";

            let reviewCount = document.querySelector("#count");
            reviewCount.innerHTML = NormalReviewsToMovieDTO.length;

            // 응답이 성공 후, HTML에 데이터 삽입(for-each)
            NormalReviewsToMovieDTO.forEach(function (normalReview) {
                let reviewDiv = document.createElement('div');
                reviewDiv.id = "l_review_container";
                reviewDiv.className = "l_chat_container";
                reviewDiv.innerHTML = `
                    <div class="l_message_container">
                        <div class="l_review_message_text">
                            <div class="l_profile_comment">
                                <div>
                                    <img src="${normalReview.userPic}" class="l_profile_img">
                                </div>
                                <div class="l_text_container">
                                    <input type="text" class="l_message_name" value="${normalReview.username}" disabled>
                                    <input type="text" class="l_message_text" value="${normalReview.reviewContent}" disabled onkeyup="enterReviewKey(this)">
                                    <input type="hidden" class="normalReviewId" value="${normalReview.normalReviewId}">
                                    <input type="hidden" class="reviewUserId" value="${normalReview.userId}">
                                </div>
                            </div>
                            <div class="dropdown l_dropdown_div">
                                <button type="button" class="dropdown-toggle l_review_set_button" data-bs-toggle="dropdown">
                                    <img src="/images/icons/menu.png">
                                </button>
                                <ul class="dropdown-menu l_dropdown_button">
                                    <button class="dropdown-item l_review_delete">삭제하기</button>
                                    <button class="dropdown-item l_review_update">수정하기</button>
                                </ul>
                            </div>
                        </div>
                    </div>
            `;
                reviewElement.appendChild(reviewDiv);
                let replyCount = document.querySelector('#count').innerHTML;
                replyCount = NormalReviewsToMovieDTO.length;
            })

        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}

//////////////////////////////////////////////////////
// 평론

// score 값 가져오기

// 평론 - 평론쓰기 버튼 클릭시 저장
if(userGrade === 'VIP'){
    vipReviewButton.addEventListener("click", function () {
        let vipReviewContent = document.querySelector(".l_commentary_input").value;
        let vipReviewPoint = document.querySelector("#l_score_point").value;
        let movieId = document.querySelector("#movieId").value;

        // 공백 입력 막기
        if(vipReviewContent.trim() === ""){
            alert("공백은 입력할 수 없습니다.");
            return;
        }

        // 평론을 이미 작성한 유저는 막기
        let vipReviewUsers = document.querySelectorAll(".vipReviewUserId");
        vipReviewUsers.forEach(function (vipReviewUser) {

            if (Array.from(vipReviewUsers).some(vipReviewUser => vipReviewUser.value.includes(userId))) {
                alert("영화 평론은 1번만 작성 가능합니다.");
                // 중복된 경우, 여기서 더 이상의 코드 실행을 막을 수 있습니다.
                // 예를 들어, 함수를 종료하거나 다른 처리를 추가할 수 있습니다.

                vipReviewUser.preventDefault();
                return;
            }
        })

        let vipReviewSaveDTO = {
            vipReviewContent: vipReviewContent,
            vipReviewPoint: vipReviewPoint,
            movieId: movieId
        };

        saveVipReview(vipReviewSaveDTO);
    })
}



// 평론 수정 시 Enter 클릭
function enterVipReviewKey(e) {
    if (window.event.keyCode === 13) {
        let vipReviewContent = e.value;
        let vipReviewPoint = document.querySelector(".l_score").innerHTML;
        let vipReviewId = document.querySelector(".vipReviewId").value;
        let movieId = document.querySelector("#movieId").value;

        if(vipReviewContent.trim() === ""){
            alert("공백은 입력할 수 없습니다.");
            return;
        }

        let vipReviewUpdateDTO = {
            vipReviewPoint: vipReviewPoint,
            vipReviewContent: vipReviewContent,
            vipReviewId: vipReviewId,
            movieId: movieId
        };

        updateVipReview(vipReviewUpdateDTO);
    }
}


// 평론 - 삭제하기 / 수정하기 버튼 클릭시 삭제 / 수정
let vipReviewElement = document.querySelector('#l_vip_review_element');
vipReviewElement.addEventListener("click", function (event) {
    if(event.target.classList.contains("l_vip_review_delete")){
        let vipReviewDeleteButton = event.target;

        // 클릭된 요소의 부모 요소를 찾음
        let vipReviewContainer = vipReviewDeleteButton.closest(".l_comment_container");

        let vipReviewId = vipReviewContainer.querySelector(".vipReviewId").value;
        let movieId = document.querySelector("#movieId").value;

        let vipReviewDeleteDTO = {
            vipReviewId: vipReviewId,
            movieId: movieId
        };

        deleteVipReview(vipReviewDeleteDTO);
    }
    if(event.target.classList.contains("l_vip_review_update")){
        let vipReviewUpdateButton = event.target;

        // 클릭된 요소의 부모 요소를 찾음
        let vipReviewContainer = vipReviewUpdateButton.closest(".l_comment_container");

        let vipReviewTextForm = vipReviewUpdateButton.closest(".l_commentary_list_container");

        // 수정하기 클릭 시, input 태그 활성화
        let vipReviewContent = vipReviewContainer.querySelector(".l_vip_message_text");
        vipReviewContent.disabled = false;
        vipReviewTextForm.style.backgroundColor = "var( --point_03)";

    }
})


// 평론 등록
async function saveVipReview(vipReviewSaveDTO) {
    try {
        let response = await fetch(`/vip-review/api/save`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(vipReviewSaveDTO)
        });

        if (response.ok) {
            findVipReview(vipReviewSaveDTO.movieId);

        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


// 평론 삭제
async function deleteVipReview(vipReviewDeleteDTO) {
    try {
        let response = await fetch(`/vip-review/api/delete`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(vipReviewDeleteDTO)
        });

        if (response.ok) {

            findVipReview(vipReviewDeleteDTO.movieId);
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


// 평론 수정
async function updateVipReview(vipReviewUpdateDTO) {
    try {
        let response = await fetch(`/vip-review/api/update`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(vipReviewUpdateDTO)
        });

        if (response.ok) {

            findVipReview(vipReviewUpdateDTO.movieId);

        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


// 평론 목록 조회
async function findVipReview(movieId) {
    try {
        // fetch를 통한 비동기 통신
        let response = await fetch(`/vip-review/api/${movieId}/list`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            },
        });

        if (response.ok) {
            let responseData = await response.json();
            let VipReviewsToMovieDTO = responseData.response; // body

            let vipReviewElement = document.querySelector('#l_vip_review_element');
            // 매번 초기화 해서 데이터를 삽입할 때 마다 중복이 없도록 한다.
            vipReviewElement.innerHTML = "";

            // 응답이 성공 후, HTML에 데이터 삽입(for-each)
            VipReviewsToMovieDTO.forEach(function (vipReview) {
                let vipReviewDiv = document.createElement('div');
                vipReviewDiv.id = "l_commentary_container";
                vipReviewDiv.className = "l_vip_review_container";
                vipReviewDiv.innerHTML = `
                    <div class="l_comment_container">
                        <div class="l_score_container">
                            <div class="l_score_title">평점</div>
                            <div class="l_score">${vipReview.vipReviewPoint}</div>
                        </div>
                        <div class="l_commentary_list_container">
                            <div class="l_commentary_message_text">
                                <div class="l_profile_comment">
                                    <div>
                                        <img src="${vipReview.userPic}" class="l_profile_img">
                                    </div>
                                     <div class="l_vip_text_container">
                                        <input type="text" class="l_vip_message_name" value="${vipReview.username}" disabled>
                                        <textarea class="l_vip_message_text" disabled onkeyup="enterVipReviewKey(this)">${vipReview.vipReviewContent}
                                        </textarea>
                                        <input type="hidden" class="vipReviewId" value="${vipReview.vipReviewId}">
                                        <input type="hidden" class="vipReviewUserId" value=${vipReview.userId}">
                                    </div>
                                </div>
                                <div class="dropdown l_dropdown_div">
                                    <button type="button" class="dropdown-toggle l_review_set_button" data-bs-toggle="dropdown">
                                        <img src="/images/icons/menu.png">
                                    </button>
                                    <ul class="dropdown-menu l_dropdown_button">
                                        <button class="dropdown-item l_vip_review_delete">삭제하기</button>
                                        <button class="dropdown-item l_vip_review_update">수정하기</button>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
            `;
                vipReviewElement.appendChild(vipReviewDiv);
            })

        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}

////////////////////////////////////////////////////
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