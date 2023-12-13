let activeCal = document.querySelector("#n_activeCal");
let otherInput = document.querySelector("#n_otherInput");
let firstDay = document.querySelector("#n_firstDay").value;
let lastDay = document.querySelector("#n_lastDay").value;

// 달력
flatpickr(activeCal, {
    minDate: firstDay,  // 지정 가능한 최소 날짜
    maxDate: lastDay,  // 지정 가능한 최대 날짜
    locale: 'ko',           // 한국어로 달력 출력
    inline: true,           // 항상 달력 활성화
    onChange: function(selectedDates, dateStr, instance) {
        otherInput.value = dateStr;
        loadSelectOptions(dateStr);
    },
});

// 상영 일정 부분 리로딩 - ajax
async function loadSelectOptions(dateStr) {
    let movieId = document.querySelector("#n_movieId").value;
    try {
        let response = await fetch(`/runningschedule/api/total-day/select-day?movieId=${movieId}&selectDay=${dateStr}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        });

        if (response.ok) {
            let responseData = await response.json();

            let totalDayDTOs = responseData.response; // body

            let container = document.getElementById("n_container");
            container.innerHTML = '';

            // 각 영화 정보에 대해 HTML 생성 및 추가
            totalDayDTOs.forEach(totalDayDTO => {
                let form = document.createElement("form");
                form.action = "/runningschedule/" + `${totalDayDTO.movieId}` + "/select-seat";
                form.id = "n_day_movies_form";
                form.method = "get"

                let nHiddenRunningDateId = document.createElement("input");
                nHiddenRunningDateId.type = "hidden";
                nHiddenRunningDateId.name = "runningDateId";
                nHiddenRunningDateId.value = `${totalDayDTO.runningDateId}`;

                let nHiddenTheaterId = document.createElement("input");
                nHiddenTheaterId.type = "hidden";
                nHiddenTheaterId.name = "theaterId";
                nHiddenTheaterId.value = `${totalDayDTO.theaterId}`;

                let button = document.createElement("button");
                button.type = "submit";
                button.id = "select_movie_button";

                let nDayMovies = document.createElement("div");
                nDayMovies.id = "n_day_movies";

                let nMovieTime = document.createElement("span");
                nMovieTime.id = "n_movie_time";
                nMovieTime.innerHTML = `
                <p class="n_start_time">${totalDayDTO.startTime.substring(0, totalDayDTO.startTime.length -3)}</p>
                <p class="n_end_time">~${totalDayDTO.endTime.substring(0, totalDayDTO.endTime.length -3)}</p>
                `;

                let nMovieLevel = document.createElement("span");
                nMovieLevel.id = "n_movie_level";
                let level = totalDayDTO.runningGrade;
                let src = "";
                if(level == "전체 관람가"){
                    src = "movie_level_all.png";
                }else if(level == "12세 이상 관람가"){
                    src = "movie_level_12.png";
                }else if(level == "15세 이상 관람가"){
                    src = "movie_level_15.png";
                }else {
                    src = "movie_level_19.png";
                }
                nMovieLevel.innerHTML = `<img src="/images/icons/${src}">`;

                let nMovieTitle = document.createElement("span");
                nMovieTitle.id = "n_movie_title";
                nMovieTitle.innerHTML = `<p>${totalDayDTO.movieName}</p>`;

                let nSeat = document.createElement("div");
                nSeat.id = "n_seat";

                let nSeatCount = document.createElement("div");
                nSeatCount.id = "n_seat_count";
                nSeatCount.innerHTML = `
                <p class="n_possible_seat">${totalDayDTO.existSeatCount}</p>
                <p class="n_all_seat">/${totalDayDTO.theaterSeatCount}</p>
                `;

// HTML 요소들을 조립
                nDayMovies.appendChild(nMovieTime);
                nDayMovies.appendChild(nMovieLevel);
                nDayMovies.appendChild(nMovieTitle);
                nSeat.appendChild(nSeatCount);
                button.appendChild(nDayMovies);
                button.appendChild(nSeat);
                form.appendChild(nHiddenTheaterId);
                form.appendChild(nHiddenRunningDateId);
                form.appendChild(button);

// 폼을 container에 추가
                container.appendChild(form);
            });

        } else {
            console.error("서버 응답이 실패했습니다.");
        }
    } catch (error) {
        console.error("에러 발생:", error);
    }
}