<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>결제 하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 달력 -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">

    <!-- css -->
    <link href="../../../../css/neh_style.css" rel="stylesheet">

</head>
<body>
<div class="container-fluid n_custom_fluid">
    <div class="row justify-content-center">
        <div id="n_pay_step">
            <ol>
                <li class="n_other_li">
                    <p class="n_pay_step_p">날짜 선택</p>
                </li>
                <li class="n_middle_li">
                    <p class="n_pay_step_choice">좌석 지정</p>
                </li>
                <li class="n_other_li">
                    <p class="n_pay_step_p">결제 하기</p>
                </li>
            </ol>
        </div>
        <div id="n_select_seat">
            <div id="n_movie_seat">
                <div class="n_last_count">
                    <div class="n_count_person">
                        <p>관람인원</p>
                    </div>
                    <div class="n_ticket_count">
                        <div class="n_last_count_button">
                            <button id="n_minus_button" onclick="count('minus')" disabled>-</button>
                            <p class="n_count">0</p>
                            <button id="n_plus_button" onclick="count('plus')">+</button>
                        </div>
                    </div>
                </div>
                <div id="n_seat_and_attention">
                    <div id="n_seat_wrapper">
                        <div class="n_seat_wrapper"></div>
                    </div>
                    <div id="n_attention_seat">
                        <span>
                            <input type="button" id="n_choice">
                            <p>선택</p>
                        </span>
                        <span>
                            <div>
                                <input type="button" id="n_exist" value="X">
                            </div>
                            <p>예매 완료</p>
                        </span>
                        <span>
                            <input type="button" id="n_possible">
                            <p>일반</p>
                        </span>
                    </div>
                </div>
            </div>
            <div id="n_select_movie_seat">
                <div id="n_img">
                    <img src="images/moviePhoto/the_boy1.jpg">
                </div>
                <div id="n_movie_title">
                    <img src="images/icons/movie_level_all.png">
                    <p>그대들은 어떻게 살 것인가?</p>
                </div>
                <div id="n_movie_day_and_time">
                    <div class="n_select_count">
                        <span id="n_day"><p>2023.01.02</p></span>
                        <span id="n_time"><p>15:05 ~ 17:03</p></span>
                    </div>
                    <div class="n_select_count" >
                        <p id="n_select_count">3인</p>
                    </div>
                    <div>
                        <div class="n_select_seat_wrapper"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    // 티켓 수량 버튼
    function count(type){
        let minusButton = document.querySelector("#n_minus_button");
        let count = document.querySelector(".n_count");
        let number = count.innerHTML; // 0

        if(type == "plus"){
            number = parseInt(number) + 1;
        }else{
            number = parseInt(number) - 1;
        }

        if(number <= 0){
            minusButton.disabled = true;
        }else {
            minusButton.disabled = false;
        }

        // 계산 끝난 number를 count.innerHTML에 지정하기
        count.innerHTML = number;
        console.log("number : " + number);
    }

    const seatWrapper = document.querySelector(".n_seat_wrapper"); // 극장 자리들
    let existSeats = new Array(); // 이미 선택된 자리(비활성화)
    let clickedSeats = new Array(); // 선택한 모든 자리
    let exist = ""; // 이미 선택된 자리가 있는 div를 담는 함수
    let clicked = ""; // 선택한 자리가 있는 div를 담는 함수
    let div = ""; // 추가할 tag

    let selectedSeatsData = ['A1', 'A2', 'A3', 'C5'];

    // 페이지 로딩 시 아래의 함수 실행
    window.onload = function (){
        selectedSeat();
    };

    for(let i = 0; i < 10; i++) {
        div = document.createElement("div"); // div 태그 생성
        seatWrapper.append(div); // 해당 div 태그를 seatWrapper에 추가

        // * 이중 for문
        // 1줄에 div가 생성되면 (예. A줄) A1, A2, A3과 같은 input 태그를 추가
        for(let j = 0; j < 14; j++) {
            let input = document.createElement("input"); // input 태그 생성
            input.type = "button";
            input.name = "seats";
            input.classList = "n_seat";
            input.disabled = false;

            // input 태그가 생성 시 value값 지정하기
            mapping(input, i, j);
            // input 태그를 div 안에 구현
            div.append(input);

            function selectedSeat(){
                //for문 돌면서 찾기
                selectedSeatsData.forEach(existSeat => {
                    exist = document.querySelector("input[value='"+ existSeat +"']");
                    existSeats.push(exist);
                })

                if(existSeats != null){
                    existSeats.forEach(input => {
                        input.classList.add("n_exist");
                        input.disabled = true;
                        input.value = "X";
                    })
                }
                console.log("선택 불가능한 자리 : " + existSeats.values());
            }

            input.addEventListener("click", function (e) {
                // 중복 제거
                clickedSeats = clickedSeats.filter((select, seats) => clickedSeats.indexOf(select) != seats);

                // 2.
                if(input.classList.contains("n_clicked")){
                    input.classList.remove("n_clicked"); // 선택된 자리의 class 명 중 clicked 제거
                    clicked = document.querySelectorAll(".n_clicked"); // 제거되고 남은 모든 clicked input 선택
                    clicked.forEach(select => {
                        clickedSeats.push(select.value);
                    })
                    console.log("선택한 자리 : " + clickedSeats);
                }
                // 1.
                else{
                    input.classList.add("n_clicked"); // 선택한 자리의 class 명에 clicked 추가
                    clicked = document.querySelectorAll(".n_clicked"); // 추가되고 모든 clicked input 선택
                    clicked.forEach(select => {
                        clickedSeats.push(select.value);
                    })
                    console.log("선택한 자리 : " + clickedSeats);
                }
                lastSelectedSeat();
            })
        }
    }

    const selectSeatWrapper = document.querySelector(".n_select_seat_wrapper"); // 선택한 자리들
    let lastClickedSeats = new Array();
    let lastClicked = ""; // 최종 선택한 자리가 있는 div를 담는 함수
    let lastDiv = "";

    // 선택한 자리 나오게 하기
    // 먼저 6자리 만들기
    for(let l = 0; l < 2; l++){
        lastDiv = document.createElement("div"); // div 생성
        selectSeatWrapper.append(lastDiv);

        for(let d = 0; d < 3; d++ ){
            let lastInput = document.createElement("input");
            lastInput.type = "button";
            lastInput.name = "lastSeats";
            lastInput.classList = "n_lastSeat";
            lastInput.disabled = true;
            lastDiv.append(lastInput);
        }
    }

    function lastSelectedSeat(){
        //for문 돌면서 찾기
        clickedSeats.forEach(lastSeat => {
            lastClicked = document.querySelector("input[value='"+ lastSeat +"']");
            lastClickedSeats.push(lastClicked);
        })

        if(lastClickedSeats != null){
            lastClickedSeats.forEach(lastClicked => {
                lastInput.classList.add("n_last_select");
                lastInput.value = lastClicked.values();
            })
        }
        console.log("선택 불가능한 자리 : " + lastClickedSeats.values());
    }

    function mapping(input, i, j) {

        if (i == 0) {
            input.value = "A" + j;
            if ((j == 0 || j == 1)) {
                input.classList.add("n_hidden");
                input.disabled = true;
            }
            if ((j == 12 || j == 13)) {
                input.classList.add("n_hidden");
                input.disabled = true;
            }
        } else if (i == 1) {
            input.value = "B" + j;
            if (j == 0 || j == 13) {
                input.classList.add("n_hidden");
                input.disabled = true;
            }
        } else if (i == 2) {
            input.value = "C" + j;
        } else if (i == 3) {
            input.value = "D" + j;
        } else if (i == 4) {
            input.value = "E" + j;
        } else if (i == 5) {
            input.value = "F" + j;
        } else if (i == 6) {
            input.value = "G" + j;
        } else if (i == 7) {
            input.value = "H" + j;
        } else if (i == 8) {
            input.value = "I" + j;
        } else if (i == 9) {
            input.value = "J" + j;
        }
        if (j == 3 || j == 9) {
            input.style = 'margin-right:20px;';
        }
    }
</script>
</body>
</html>