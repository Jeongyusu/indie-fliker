let currentPage = 2;
let isLoading = false;

window.onload = function () {
    // 영화 등급 이미지 로드
    onLoadImg();

    console.log("온로드 실행");
    loadMoreData();

    // 스크롤 이벤트에 이벤트 리스너를 추가
    document.getElementById('data-container').addEventListener('scroll', function () {
        loadMoreData();
    })};

// 현재 URL에서 쿼리스트링을 가져오기
function getQueryStringValue(key) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    return urlParams.get(key);
}

// fetch로 새로운 데이터 받아오기
async function fetchMovieList(page) {
    let response = await fetch(`/api/on-movies?page=${page}`);
    let responseBody = await response.json();
    console.log("fetch펀딩 내부 제이슨 변환완료");
    if (responseBody.success) {
        console.log("success 진입" + responseBody.response);
        return responseBody.response;
    } else {
        throw new Error(responseBody.error);
    }
}


// 마우스 스크롤 감지 후 새로운 데이터를 받아온 후 새로운 요소 생성하기
function loadMoreData() {
    console.log("loadMoreData 진입");

    if (isLoading) {
        return;
    }

    const container = document.getElementById('data-container');

    // 유저 스크롤 현재 위치 감지
    if (container.scrollTop + container.clientHeight >= container.scrollHeight) {
        isLoading = true;
        console.log("ajax진입 전");
        // 로딩 딜레이 주기
        setTimeout(async () => {
            try {
                const newData = await fetchMovieList(currentPage);
                console.log("newData 확인" + newData);
                // Append new data to the container
                const row = document.querySelector('#data-container'); // Assuming you have a row element to append the new columns
                newData.forEach(funding => {
                    const col = document.createElement('div');
                    col.className = 'col my-4';
                    col.classList.add('l_movie_card_form');

                    const card = document.createElement('div');
                    card.className = 'card';
                    card.classList.add('l_main_card');

                    const a = document.createElement('a');
                    a.href = `/fund/funding/${funding.fundingId}`;

                    const img = document.createElement('img');
                    img.src = funding.movieThumbnail;
                    img.className = 'card-img';

                    const h4 = document.createElement('div');
                    h4.className = 'l_percent';
                    h4.classList.add('l_mint');
                    h4.classList.add('l_strong');
                    h4.textContent = `${funding.fundingRate}% 달성`;

                    const h5 = document.createElement('div');
                    h5.className = 'l_movie_online_title';

                    const grade = document.createElement('img');
                    grade.className = 'l_grade_img';

                    const name = document.createElement('div');
                    name.className = 'l_title';
                    name.innerHTML = funding.movieName;

                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.className = 'grade';
                    input.value = funding.runningGrade;

                    const period = document.createElement('div');
                    period.className = 'l_period';
                    period.innerHTML = '상영 : ' + funding.period();

                    const synopsis = document.createElement('div');
                    synopsis.className = 'l_content';
                    synopsis.innerHTML = funding.synopsis;

                    const product = document.createElement('div');
                    product.className = 'l_production';
                    product.innerHTML = funding.production;

                    a.appendChild(img);
                    h5.appendChild(grade);
                    h5.appendChild(name);
                    h5.appendChild(input);
                    card.appendChild(a);
                    card.appendChild(h4);
                    card.appendChild(h5);
                    card.appendChild(period);
                    card.appendChild(synopsis);
                    card.appendChild(product);
                    col.appendChild(card);

                    row.appendChild(col);
                    const footer = document.querySelector('footer');
                    document.body.appendChild(footer);

                });

                // 현재 페이지 증가 및 로딩 상태 변경
                currentPage++;
                isLoading = false;
            } catch (error) {
                console.error('Error fetching data:');
            }  finally {
            isLoading = false;
            }
        }, 1000);
    }
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
