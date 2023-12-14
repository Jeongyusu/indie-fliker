let genre = '극영화';
let currentPage = 2;
let isLoading = false;

window.onload = function () {
    console.log("온로드 실행");
    loadMoreData(genre);
    //genre를 현재URL의 쿼리스트링 키 값을 검색해서 가져오기
    genre = getQueryStringValue('genre');
    console.log("genre : " + genre);

    // 스크롤 이벤트에 이벤트 리스너를 추가
    document.getElementById('data-container').addEventListener('scroll', function () {
        loadMoreData(genre);
    })};

// 현재 URL에서 쿼리스트링을 가져오기
function getQueryStringValue(key) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    return urlParams.get(key);
}

// fetch로 새로운 데이터 받아오기
async function fetchFundingList(genre, page) {
    let response = await fetch(`/api/fundings?genre=${genre}&page=${page}`);
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
function loadMoreData(genre) {
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
                const newData = await fetchFundingList(genre, currentPage);
                console.log("newData 확인" + newData);
                // Append new data to the container
                const row = document.querySelector('#data-container'); // Assuming you have a row element to append the new columns
                newData.forEach(funding => {
                    const col = document.createElement('div');
                    col.className = 'col my-4';

                    const card = document.createElement('div');
                    card.className = 'card';

                    const img = document.createElement('img');
                    img.src = funding.movieThumbnail;
                    img.className = 'card-img';

                    const h4 = document.createElement('div');
                    h4.className = 'h4 card-title l_mint mt-3';
                    h4.textContent = `펀딩 달성률 ${funding.fundingRate}%`;

                    const h5 = document.createElement('div');
                    h5.className = 'h5 card-text mt-2';
                    h5.textContent = `[${funding.movieName}]`;

                    const p = document.createElement('div');
                    p.className = 'card-text mt-2';
                    p.textContent = funding.synopsis;

                    const figcaption = document.createElement('figcaption');
                    figcaption.className = 'figure-caption';
                    figcaption.textContent = funding.production;

                    card.appendChild(img);
                    col.appendChild(card);
                    col.appendChild(h4);
                    col.appendChild(h5);
                    col.appendChild(p);
                    col.appendChild(figcaption);

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