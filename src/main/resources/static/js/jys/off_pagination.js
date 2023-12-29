let currentPage = 2;
let isLoading = false;
window.onload = function () {
    console.log("온로드 실행");
    onLoadImg();
    isLoading = false;
};

$(window).scroll(function() {
    // 스크롤 이동 시 실행되는 코드
    console.log("제이쿼리 스크롤");
    if ($(window).scrollTop() + $(window).height() >= $(document).height() / 2 + 100) {
        // 페이지 하단에 도달했을 때만 추가 데이터 로드
        loadMoreData();
    }

});


// fetch로 새로운 데이터 받아오기
async function fetchFundingList(page) {
    let response = await fetch('/api/off-movies?page=' + page);
    let responseBody = await response.json();

    if (responseBody.success) {
        return responseBody.response;
    } else {
        throw new Error(responseBody.error);
    }
}

// 마우스 스크롤 감지 후 새로운 데이터를 받아온 후 새로운 요소 생성하기
function loadMoreData() {

    if (isLoading) {
        return;
    }
    isLoading = true;

    // 로딩 딜레이 주기
    setTimeout(async () => {
        try {
            const newData = await fetchFundingList(currentPage);
            newData.forEach(function(funding) {
                var newElement = document.createElement('div');
                newElement.classList.add('col', 'my-4', 'l_movie_card_form');

                newElement.innerHTML = '<div class="card l_main_card">' +
                    '<div class="l_movie_image">' +
                    '<figure class="l_front">' +
                    '<img src="' + funding.movieThumbnail + '" class="card-img" alt="...">' +
                    '</figure>' +
                    '<div class="l_overlay_button l_back">' +
                    '<a href="/fund/funding/' + funding.fundingId + '"><button class="btn btn-outline-success l_button">예매하기</button></a>' +
                    '</div>' +
                    '</div>' +
                    '<div class="l_percent l_mint l_strong">' + funding.fundingRate + '% 달성</div>' +
                    '<div class="l_movie_online_title">' +
                    '<img src="" class="l_grade_img">' +
                    '<div class="l_title">' + funding.movieName + '</div>' +
                    '<input type="hidden" value="' + funding.runningGrade + '" class="grade">' +
                    '</div>' +
                    '<div class="l_period">상영 : ' + formatPeriod(timeStampToDate(funding.offlineReleaseDate), timeStampToDate(funding.offlineEndDate)) + '</div>' +
                    '<div class="l_content">' + funding.synopsis + '</div>' +
                    '<div class="l_production">' + funding.production + '</div>' +
                    '</div>' +
                    '</div>';

                // Append new content to the container with id 'data-container'
                $('#data-container').append(newElement);
            });
            currentPage++;
        } catch (error) {
            console.error('Error fetching data:', error);
        } finally {
            isLoading = false;
        }
    }, 1000);

    var scrollToTopBtn = document.getElementById("scrollToTopBtn");

    window.addEventListener("scroll", function() {
        // 현재 스크롤 위치 가져오기
        var scrollPosition = window.scrollY;

        // 스크롤 위치가 300px 이상이면 버튼 표시, 아니면 숨김
        if (scrollPosition > 500) {
            scrollToTopBtn.style.display = "block";
        } else {
            scrollToTopBtn.style.display = "none";
        }
    });

    // 버튼 클릭 시 맨 위로 스크롤하는 함수
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: "smooth" // 부드러운 스크롤 적용
        });
    }

    // 버튼에 클릭 이벤트 리스너 추가
    scrollToTopBtn.addEventListener("click", scrollToTop);
}

function formatPrice(number) {
    const formatter = new Intl.NumberFormat('en-US');
    return formatter.format(number);
}


function onLoadImg(){
    let gradeImgs = document.querySelectorAll(".l_grade_img");
    let runningGrades = document.querySelectorAll(".grade");
    gradeImgs.forEach((gradeImg) => {
        runningGrades.forEach((grade) => {
            console.log("gradeImg" + gradeImg);
            console.log("grade" + grade);

            let src = "";
            if(grade.value === "전체관람가"){
                src = "/images/icons/movie_level_all.png";
            }else if(grade.value === "12세이상 관람가"){
                src = "/images/icons/movie_level_12.png";
            }else if(grade.value === "15세이상 관람가"){
                src = "/images/icons/movie_level_15.png";
            }else if(grade.value === "등급 미분류"){
                src = "/images/icons/movie_level_no.png";
            }else{
                src = "/images/icons/movie_level_19.png";
            }

            gradeImg.src = src;
            console.log("src : " + gradeImg.src);
        })
    })
}

function timeStampToDate(timeStamp) {
    var date = new Date(timeStamp);
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2); // Months are zero-based
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

function formatPeriod(releaseDate, endDate) {
    return releaseDate + " ~ " + endDate;
}

