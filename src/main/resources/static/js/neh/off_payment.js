// 페이지 로딩 시 아래의 함수 실행
window.onload = function (){
    onLoadImg();
    discount();
};

// 영화 상영 등급
function onLoadImg(){
    let gradeImg = document.querySelector("#n_grade_img");
    let runningGrade = document.querySelector("#n_runningGrade").value;
    let src = "";
    if(runningGrade === "전체 관람가"){
        src = "/images/icons/movie_level_all.png";
    }else if(runningGrade === "12세 이상 관람가"){
        src = "/images/icons/movie_level_12.png";
    }else if(runningGrade === "15세 이상 관람가"){
        src = "/images/icons/movie_level_15.png";
    }else {
        src = "/images/icons/movie_level_19.png";
    }
    gradeImg.src = src;
    console.log("src : " + gradeImg.src);
}

// VIP일 경우,
function discount() {
    const createdDiv = document.querySelector(".n_people_and_pay");
    let discountPay = document.querySelector("#discountPrice").value;
    let totalPayElement = document.querySelector("#n_price");
    let totalPay = totalPayElement.innerHTML;
    let totalPayInt = parseFloat(totalPay.replace(/,/g, ''));
    let totalCountElement = document.querySelector("#n_people_count");
    let totalCount = totalCountElement.innerHTML;
    let userGrade = document.querySelector("#userGrade").value;

    if(userGrade === "VIP"){
        let changePrice = totalPayInt - (discountPay * totalCount);
        totalPayElement.innerHTML = changePrice.toLocaleString(); // 1,000

        let div = document.createElement("div");
        div.id = "n_vip_div";
        let p = document.createElement("p");
        p.innerHTML = "VIP 할인 적용";
        p.id = "n_vip";
        let span = document.createElement("span");
        span.id = "n_vip_span";
        let priceP = document.createElement("p");
        priceP.id = "n_vip_discount_price"
        priceP.innerHTML = "- " + (discountPay * totalCount).toLocaleString();
        let wonP = document.createElement("p");
        wonP.innerHTML = "원";

        span.appendChild(priceP);
        span.appendChild(wonP);
        div.appendChild(p);
        div.appendChild(span);
        createdDiv.appendChild(div);
    }
}

// "이전" 클릭 시
function back(){
    history.back();
}

// 선택한 결제 방법
let selectedPay = document.querySelector("#selectPayment");
let movieId = document.querySelector("#n_movie_id").value;

function selectPay(radio){
    selectedPay = radio.value;
    console.log("선택됨");
}

// 선택한 결제 실행 버튼
function pay(){

    // 결제 수단 미 선택 시
    if(selectedPay.value === ""){
        alert("결제 수단을 선택해 주세요.");
        return;
    }

    let totalPay = document.querySelector("#n_price").innerHTML;
    let totalPayInt = parseFloat(totalPay.replace(/,/g, ''));

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
    console.log("예매번호 : " + reservationCode);

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
        name: "오프라인 영화 티켓",
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
        name : '오프라인 영화 티켓',
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
        name : '오프라인 영화 티켓',
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
    let seatNames = document.querySelector("#SeatNames").value;
    let runningDateId = document.querySelector("#runningDateId").value;
    let unitPrice = document.querySelector("#unitPrice").value;
    let totalPay = document.querySelector("#n_price").innerHTML;
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
    console.log("seatNames : " + seatNames);
    console.log("runningDateId : " + runningDateId);
    console.log("unitPrice : " + unitPrice);
    console.log("finalPrice : " + finalPrice);
    console.log("totalCount : " + totalCount);
    console.log("fundingId : " + fundingId);
    console.log("movieId : " + movieId);

    let dto = {
        reservationCode: reservationCode,
        discountPrice: discountPrice,
        paymentTypeId: paymentTypeId,
        seatNames: seatNames,
        runningDateId: runningDateId,
        unitPrice: unitPrice,
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
        let response = await fetch(`/payment/${movieId}/off-save`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(dto)
        });

        if (response.ok) {
            console.log("결제 정보 저장 완료");
            // 방금 예매한 예매 번호 GET 요청
            selectReservationId(movieId);
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
            reservationId = reservationIdDTO.reservationId;

            // 티켓 화면 GET 요청
            offReservationTicket(movieId, reservationId);

        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}


async function offReservationTicket(movieId, reservationId) {
    console.log("reservationId" + reservationId);

    try {
        let response = await fetch(`/reservation/${movieId}/off-ticket?reservationId=${reservationId}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            },
        });

        if (response.ok) {
            console.log("이동");
            console.log("movieId" + movieId);
            console.log("reservationId" + reservationId);
            window.location.href = `/reservation/${movieId}/off-ticket?reservationId=${reservationId}`; // 예시: 성공 페이지 URL
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}
