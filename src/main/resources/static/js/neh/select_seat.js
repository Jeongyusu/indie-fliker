

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
}

// 티켓 수량 버튼
///////////////////////////////////////////////////////////////
function count(type){
    let minusButton = document.querySelector("#n_minus_button");
    let plusButton = document.querySelector("#n_plus_button");
    let count = document.querySelector(".n_count");
    let number = count.innerHTML; // 0
    let clickedCount = document.querySelector("#n_clicked_seat_count");

    // 총 관람 좌석 수
    let allSeatCount = 124;
    // 이미 예약이 완료된 좌석 수
    let existSeatCount = document.querySelector("#n_exist_seat_list") ? document.querySelector("#n_exist_seat_list").value : 0;
    // 제한 숫자
    let limitNumber;


    if(118 <= existSeatCount && existSeatCount <= 124){
        limitNumber = allSeatCount - existSeatCount - 1;

    }else if(existSeatCount < 118){
        limitNumber = 5;
    }

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

    if(limitNumber < number){
        plusButton.disabled = true;
    }else {
        plusButton.disabled = false;
    }

    if(number < clickedCount.value){
        alert("선택한 좌석 먼저 해제해주세요.");
        return;
    }


    count.innerHTML = number;
}


// 좌석 선택하기
///////////////////////////////////////////////////////////////
const seatWrapper = document.querySelector(".n_seat_wrapper"); // 극장 자리들
let existSeatJsonBody = new Array(); // 이미 선택된 자리(비활성화) - JSON
let existSeatNumbers = new Array(); // 이미 선택된 좌석 이름(JSON 파싱)
let existSeats = new Array(); // 이미 선택된 자리(비활성화)
let clickedSeats = new Array(); // 선택한 모든 자리
let exist = ""; // 이미 선택된 자리가 있는 div를 담는 함수
let clicked = ""; // 선택한 자리가 있는 div를 담는 함수
let div = ""; // 추가할 tag

async function loadExistSeatList(){
    let runningDateId = document.querySelector("#n_running_date_id").value;
    try {
        let response = await fetch(`/seat/api/exist-seat?runningDateId=${runningDateId}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        });
        if(response.ok){
            let responseData = await response.json();
            let existSeatData = responseData.response; // body
            existSeatJsonBody = existSeatData;
            if(existSeatJsonBody != null){
                existSeatJsonBody.forEach(existSeat => {
                    existSeatNumbers.push(existSeat.seatName); // [A3, A6, D3]
                    console.log("existSeat.seatName : " + existSeat.seatName);
                });

                console.log("existSeatNumbers" + existSeatNumbers);
                selectedSeat(existSeatNumbers);
            }
        } else {
            console.error("서버 응답이 실패했습니다.");
        }
    } catch (error) {
        console.error("에러 발생:", error);
    }
}


// 페이지 로딩 시 아래의 함수 실행
window.onload = function (){
    onLoadImg();
    loadExistSeatList();
};

for(let i = 0; i < 10; i++) {
    div = document.createElement("div");
    seatWrapper.append(div);

    for(let j = 0; j < 14; j++) {
        let input = document.createElement("input");
        input.type = "button";
        input.name = "seats";
        input.classList = "n_seat";
        input.disabled = false;

        mapping(input, i, j);
        div.append(input);

        input.addEventListener("click", function (e) {
            let wantCount = parseInt(document.querySelector(".n_count").innerHTML);
            let clickedCount = document.querySelector("#n_clicked_seat_count");
            let lastSelectSeatList = document.querySelector("#n_last_select_seat_list");

            // 관람인원에 따른 코드 실행
            if(wantCount == 0) {
                alert("관람인원을 선택해주세요");
                clickedSeats == [];
            }else{
                // 중복으로 선택되는 것을 방지
                clickedSeats = clickedSeats.filter((select, seats) => clickedSeats.indexOf(select) !== seats);

                // 선택이 된 좌석을 클릭 시 삭제
                if (input.classList.contains("n_clicked")) {
                    input.classList.remove("n_clicked");
                    clicked = document.querySelectorAll(".n_clicked");
                    clicked.forEach(select => {
                        clickedSeats.push(select.value);
                    });
                    clickedCount.value = clickedSeats.length;
                    console.log("선택된 자리들 : " + clickedSeats);
                    lastSelectSeatList.value = clickedSeats;
                    console.log("input에 들어간 값 : " + lastSelectSeatList.value);
                    lastSelectedSeat();
                    sumPrice();
                }
                // 좌석 선택하기
                else {
                    let seatNumber;

                    if (isNaN(parseInt(clickedCount.value))) {
                        seatNumber = 1;
                    } else {
                        seatNumber = parseInt(clickedCount.value) + 1;
                    }

                    if (seatNumber > wantCount) {
                        alert("이미 " + wantCount + "개의 자리를 선택하셨습니다.");
                        return;

                    }else{
                        input.classList.add("n_clicked");
                        clicked = document.querySelectorAll(".n_clicked");
                        clicked.forEach(select => {
                            clickedSeats.push(select.value);
                        });
                        clickedCount.value = clickedSeats.length;
                        console.log("선택된 자리들 : " + clickedSeats);
                        lastSelectSeatList.value = clickedSeats;
                        console.log("input에 들어간 값 : " + lastSelectSeatList.value);
                        lastSelectedSeat();
                        sumPrice();
                    }
                }
            }
        })
    }
}


// 선택한 좌석 목록 만들기
///////////////////////////////////////////////////////////////
const selectSeatWrapper = document.querySelector(".n_select_seat_wrapper"); // 선택한 자리들
let lastClickedSeats = new Array();
let lastClicked = "";
let lastDiv = "";

for(let l = 0; l < 1; l++){
    lastDiv = document.createElement("div");
    lastDiv.classList = "n_select_list";
    selectSeatWrapper.append(lastDiv);

    for(let d = 0; d < 6; d++ ){
        let lastInput = document.createElement("input");
        lastInput.type = "button";
        lastInput.name = "lastSeats";
        lastInput.classList = "n_last_seat";
        lastInput.disabled = true;
        lastDiv.append(lastInput);
    }
}

// 선택이 불가능한 좌석
function selectedSeat(existSeatList) {
    existSeatList.forEach(existSeat => {
        exist = document.querySelector("input[value='" + existSeat + "']");
        existSeats.push(exist);
    })
    if (existSeats != null) {
        existSeats.forEach(input => {
            input.classList.add("n_exist");
            input.disabled = true;
            input.value = "X";
        })
    }
    console.log("선택 불가능한 자리 : " + existSeatList);
}


// 좌석 총 인원 수와 결제 금액
///////////////////////////////////////////////////////////////
let ticketCount = document.querySelector("#n_person_count");
let totalTicketPrice = document.querySelector("#n_price");
let ticketCountValue = document.querySelector(".n_person_count");
let totalTicketPriceValue = document.querySelector(".n_price");
let ticketPrice = 8000;

function sumPrice(){
    // 티켓 값과 선택한 좌석 갯수
    let sumTicketprice = clickedSeats.length * ticketPrice;
    totalTicketPriceValue.value = sumTicketprice;

    // 총 금액, int -> String
    let totalStringTicketPrice = sumTicketprice.toLocaleString(); // 숫자 -> 1,000

    // 최종 결제 금액
    if(clickedSeats.length <= 0){
        totalTicketPrice.innerHTML = "0";
    }else{
        totalTicketPrice.innerHTML = totalStringTicketPrice;
    }
    console.log("가격 : " + totalStringTicketPrice);
}


// 선택한 좌석 목록 만들기 + 인원 등록
//////////////////////////////////////////////////////////////
function lastSelectedSeat(){
    if(clickedSeats != null){
        // 선택한 좌석 인원 등록
        let clickedCount = clickedSeats.length.toString();
        ticketCount.innerHTML = clickedCount;
        ticketCountValue.value = clickedCount;

        // 선택한 좌석 목록 만들기
        lastClicked = document.querySelectorAll(".n_last_seat");

        lastClicked.forEach(clickedSeat => {
            lastClickedSeats.push(clickedSeat);
        })

        if(lastClickedSeats.values() != null){
            lastClickedSeats.forEach(cliecked => {
                cliecked.value = "";
                cliecked.classList = "n_last_seat";
            })
        }

        clickedSeats.forEach((selectedSeatNumber, index) => {
            lastClickedSeats[index].classList = "n_last";
            lastClickedSeats[index].value = selectedSeatNumber;
        })
    }
}

// 결제금액이 0일 때 결제 막기
let paymentButton = document.querySelector("#n_payment_button");
let totalPrice = document.querySelector("#n_price");
paymentButton.addEventListener("click", function (){
    console.log("total + " + totalTicketPrice);
    if(parseInt(totalPrice.innerHTML) == 0){
        alert("결제할 금액이 없습니다.");
    }
});


// 영화관 좌석 value 지정하기
////////////////////////////////////////////////////////////
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