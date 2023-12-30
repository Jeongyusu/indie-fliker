window.onload = function () {
    onLoadImg();
    dDayChange();
    endMovie();
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

function dDayChange(){
    let dDays = document.querySelectorAll('.l_dday');
    dDays.forEach((dDay) => {
        if(dDay.innerHTML === 'D-Day'){
            dDay.style.backgroundColor = 'var(--point_04)';
        }
    })
}

function endMovie(){
    let movies = document.querySelectorAll('[id^="reservatedDay"]');
    movies.forEach((movie) => {
        // 구매 날짜
        let reservatedDate = new Date(movie.value);
        console.log("구매날짜 : " + reservatedDate);

        // 종료 날짜 계산
        let addDate = new Date(reservatedDate); // 새로운 Date 객체를 생성하여 기존 날짜를 복사
        let endDay = reservatedDate.setDate(reservatedDate.getDate() + 3); // 3일을 더한 날짜로 설정
        let endDate = new Date(endDay);
        console.log("종료 날짜 : " + endDate);

        // 현재 날짜
        let currentDate = new Date();

        if(endDate < currentDate){
            // 해당 영화의 number 가져오기
            let number = movie.getAttribute('id').replace("reservatedDay", "");

            // 해당 영화의 최상위 부모요소 가져오기
            let card = document.getElementById('order' + number);

            if (card) {
                card.style.display = 'none';
            }
        }
    })
}
