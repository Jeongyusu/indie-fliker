window.onload = loadMoreData();

document.getElementById('data-container').addEventListener('scroll', loadMoreData);

// ...

async function fetchFundingList(genre, page) {
    genre = '극영화';
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


function loadMoreData() {
    let currentPage = 2;
    let isLoading = false;
    let genre = '극영화';

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
            }
        }, 1000);
    }
}
