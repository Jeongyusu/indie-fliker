// 페이지 로딩 시 아래의 함수 실행
window.onload = function (){
    onLoadImg();
};

// 영화 상영 등급
function onLoadImg(){
    let gradeImg = document.querySelector("#n_grade_img");
    let runningGrade = document.querySelector("#n_runningGrade").value;
    let src = "";
    if(runningGrade == "전체 관람가"){
        src = "/images/icons/movie_level_all.png";
    }else if(runningGrade == "12세 이상 관람가"){
        src = "/images/icons/movie_level_12.png";
    }else if(runningGrade == "15세 이상 관람가"){
        src = "/images/icons/movie_level_15.png";
    }else {
        src = "/images/icons/movie_level_19.png";
    }
    gradeImg.src = src;
    console.log("src : " + gradeImg.src);
}