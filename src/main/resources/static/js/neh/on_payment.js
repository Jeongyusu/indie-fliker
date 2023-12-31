// 페이지 로딩 시 아래의 함수 실행
window.onload = function (){
    onLoadImg();
};

// 영화 상영 등급
function onLoadImg(){
    let gradeImg = document.querySelector("#n_grade_img_on");
    let runningGrade = document.querySelector("#n_runningGrade").value;
    let src = "";
    if(runningGrade === "전체관람가"){
        src = "/images/icons/movie_level_all.png";
    }else if(runningGrade === "12세이상 관람가"){
        src = "/images/icons/movie_level_12.png";
    }else if(runningGrade === "15세이상 관람가"){
        src = "/images/icons/movie_level_15.png";
    }else if(runningGrade === "등급 미분류"){
        src = "/images/icons/movie_level_no.png";
    }else{
        src = "/images/icons/movie_level_19.png";
    }
    gradeImg.src = src;
    console.log("src : " + gradeImg.src);
}

function inputDonation(){
    // 입력된 값
    let ticket_price = document.querySelector("#n_ticket_price").innerHTML;
    let inputDonationPrice = document.querySelector("#n_donation_price").value;

    // String -> int
    let ticketIntPrice = parseInt(ticket_price.replace(/,/g, '')); // 8,000 -> 숫자
    let inputIntPrice = parseInt(inputDonationPrice);

    // 펀딩금 + 후원금, int -> String
    let totalIntPrice = ticketIntPrice + inputIntPrice; // 숫자
    let totalStringPrice = totalIntPrice.toLocaleString(); // 숫자 -> 1,000

    // 최종 결제 금액
    let totalPrice = document.querySelector("#n_total_price");
    if(inputDonationPrice === 0 || inputDonationPrice === ""){
        totalPrice.innerHTML = ticket_price;
    }else{
        totalPrice.innerHTML = totalStringPrice;
    }
}

// 선택한 결제 방법
let selectedPay = document.querySelector("#selectPayment");
let movieId = document.querySelector("#n_movie_id").value;

function selectPay(radio){
    selectedPay = radio.value;
    console.log("선택됨");
    pay(selectedPay);
}

// 선택한 결제 실행 버튼
function pay(selectedPay){
    console.log("결제 시작!! " + selectedPay);

    let totalPrice = document.querySelector("#n_total_price").innerHTML; // 8,000
    let totalPayInt = parseFloat(totalPrice.replace(/,/g, ''));
    let reservationCode = document.querySelector("#reservationCode").value;
    let paymentType = document.querySelector("#paymentTypeId").value;

    let userEmail = document.querySelector("#userEmail").value;
    let username = document.querySelector("#username").value;
    let userTel = document.querySelector("#userTel").value;



    // 예매번호(reservationNumber) 및 주문번호(merchant_uid) - 고유번호
    let uuid4 = uuid.v4().replace(/-/g, '');
    let merchantUid = uuid4.substring(0, 14); // merchant_uid
    console.log("결제가격 : " + totalPayInt);

    reservationCode = merchantUid;
    console.log("주문번호 : " + reservationCode);

    // 결제 수단 선택
    if(selectedPay === "1"){
        kakaoPay(merchantUid, totalPayInt, selectedPay, userEmail, username, userTel);
    }else if(selectedPay === "2"){
        payco(merchantUid, totalPayInt, selectedPay, userEmail, username, userTel);
    }else if(selectedPay === "3"){
        kgPay(merchantUid, totalPayInt, selectedPay, userEmail, username, userTel);
    }

    paymentType = selectedPay;
    console.log("결제요청 : " + paymentType);

}

// 카카오 페이 결제 요청
function kakaoPay(merchantUid, totalPayInt, selectedPay, userEmail, username, userTel) {
    console.log("실행됨");
    // 결제 초기화
    IMP.init('imp81816223') // 예: 'imp00000000a'
    IMP.request_pay({
        pg: "kakaopay.TC0ONETIME", // 상점CID
        pay_method: "card", // 생략가
        merchant_uid: merchantUid, // 상점에서 생성한 고유 주문번호
        name: "온라인 영화 티켓",
        amount: totalPayInt,
        buyer_email: userEmail,
        buyer_name: username,
        buyer_tel: userTel,
    }, async function (rsp) {
        if (rsp.success) {
            console.log("결제 성공");
            postRequest(merchantUid, selectedPay);
        } else {
            alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
        }
    });
}

// 페이코 결제 요청
function payco(merchantUid, totalPayInt, selectedPay, userEmail, username, userTel) {
    // 결제 초기화
    IMP.init('imp81816223') // 예: 'imp00000000a'
    IMP.request_pay({
        pg : 'payco',
        merchant_uid: merchantUid,
        name: "온라인 영화 티켓",
        amount : totalPayInt,
        buyer_email : userEmail,
        buyer_name : username,
        buyer_tel : userTel,
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log("결제 성공");
            postRequest(merchantUid, selectedPay);
        } else {
            alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
        }
    });
}

// kg 이니시스 결제 요청
function kgPay(merchantUid, totalPayInt, selectedPay, userEmail, username, userTel) {
    // 결제 초기화
    IMP.init('imp81816223') // 예: 'imp00000000a'
    IMP.request_pay({
        pg : 'html5_inicis.INIBillTst',
        pay_method : 'card',
        merchant_uid: merchantUid,
        name: "온라인 영화 티켓",
        amount : totalPayInt,
        buyer_email : userEmail,
        buyer_name : username,
        buyer_tel : userTel,
    }, function (rsp) {
        if (rsp.success) {
            console.log("결제 성공");
            postRequest(merchantUid, selectedPay);
        } else {
            alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
        }
    });
}

function postRequest(merchantUid, selectedPay){
    let discountPrice = document.querySelector("#discountPrice").value;
    let totalPay = document.querySelector("#n_total_price").innerHTML;
    let finalPayInt = parseFloat(totalPay.replace(/,/g, ''));
    let totalCount = document.querySelector("#totalCount").value;
    let fundingId = document.querySelector("#fundingId").value;
    let movieId = document.querySelector("#n_movie_id").value;
    let reservationCode = merchantUid;
    let paymentTypeId = selectedPay;
    let finalPrice = finalPayInt;

    console.log("merchantUid : " + merchantUid);
    console.log("discountPrice : " + discountPrice);
    console.log("paymentTypeId : " + paymentTypeId);
    console.log("finalPrice : " + finalPrice);
    console.log("totalCount : " + totalCount);
    console.log("fundingId : " + fundingId);
    console.log("movieId : " + movieId);

    let dto = {
        reservationCode: reservationCode,
        discountPrice: discountPrice,
        paymentTypeId: paymentTypeId,
        finalPrice: finalPrice,
        totalCount: totalCount,
        fundingId: fundingId,
        movieId: movieId
    };

    // 예매 정보 POST 요청
    savePayment(movieId, dto);
}

async function savePayment(movieId, dto) {
    try {
        let response = await fetch(`/payment/${movieId}/on-save`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(dto)
        });

        if (response.ok) {
            console.log("결제 정보 저장 완료");
            // 방금 예매한 예매 번호 GET 요청
            await selectReservationId(movieId);
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}

async function selectReservationId(movieId) {
    try {
        let response = await fetch(`/reservation/api/reservation-id`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            },
        });

        if (response.ok) {
            console.log("reservationId 조회 성공");
            let responseData = await response.json();

            let reservationIdDTO = responseData.response; // body
            let reservationId = reservationIdDTO.reservationId;
            console.log("예약번호 : " + reservationId);

            // 티켓 화면 GET 요청
            await onReservationTicket(movieId, reservationId);

        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


async function onReservationTicket(movieId, reservationId) {
    console.log("reservationId" + reservationId);

    try {
        let response = await fetch(`/reservation/${movieId}/on-ticket?reservationId=${reservationId}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            },
        });

        if (response.ok) {
            console.log("이동");
            console.log("movieId" + movieId);
            console.log("reservationId" + reservationId);
            window.location.href = `/reservation/${movieId}/on-ticket?reservationId=${reservationId}`; // 예시: 성공 페이지 URL
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}
