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
                <div>
                    <div id="n_seat_wrapper">
                        <div class="n_seat_wrapper"></div>
                    </div>
                    <div id="n_attention_seat">
                        <button id="n_choice"></button>
                        <button id="n_exist"></button>
                        <button id="n_possible"></button>
                    </div>
                </div>
            </div>
            <div id="n_select_movie_seat"></div>
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
    let exist = ""; // 이미 선택된 자리에 넣을 class명
    let clicked = ""; // 선택한 자리에 넣을 class 명
    let div = ""; // 추가할 tag

    let selectedSeatsData = ['A1', 'A2', 'A3'];

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
            div.append(input); // 해당 input 태그를 div에 추가
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
            })
        }
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
            input.style = 'margin-right:10px;';
        }
    }
</script>
</body>
</html>