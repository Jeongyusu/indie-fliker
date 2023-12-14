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

// VIP일 경우,
function discount() {
    const createdDiv = document.querySelector(".n_people_and_pay");
    let discountPay = document.querySelector("#discountPrice").value;
    let totalPayElement = document.querySelector("#n_price");
    let totalPay = totalPayElement.innerHTML;
    let totalPayInt = parseFloat(totalPay.replace(/,/g, ''));
    let totalCountElement = document.querySelector("#n_people_count");
    let totalCount = totalCountElement.innerHTML;
    // let userGrade = document.querySelector("#userGrade").value;
    // TODO : 로그인 시 위의 주석 풀고, 아래의 String userGrade 지우기

    let userGrade = "VIP";

    if(userGrade == "VIP"){
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

// 선택한 결제 방법
let selectedPay = document.querySelector("#n_select_pay");
let movieId = document.querySelector("#n_movie_id").value;

function selectPay(radio){
    selectedPay = radio.value;
    console.log("선택됨");
}

// 선택한 결제 실행 버튼
function pay(){
    let totalPay = document.querySelector("#n_price").innerHTML;
    let totalPayInt = parseFloat(totalPay.replace(/,/g, ''));

    let reservationCode = document.querySelector("#n_reservation_code").value;
    let paymentTypeId = document.querySelector("#paymentTypeId").value;

    // 예매번호(reservationNumber) 및 주문번호(merchant_uid) - 고유번호
    let uuid4 = uuid.v4().replace(/-/g, '');
    let merchantUid = uuid4.substring(0, 14); // merchant_uid
    console.log("예매번호 : " + merchantUid);
    console.log("결제가격 : " + totalPayInt);

    reservationCode = merchantUid;
    console.log("예매번호 : " + reservationCode);

    if(selectedPay == "1"){
        kakaoPay(merchantUid, totalPayInt);
    }else if(selectedPay == "2"){
        payco(merchantUid, totalPayInt);
    }else if(selectedPay == "3"){
        kgPay(merchantUid, totalPayInt);
    }

    paymentTypeId = selectedPay;
    console.log("결제요청 : " + paymentTypeId);

}

// 카카오 페이 결제 요청
function kakaoPay(merchantUid, totalPayInt) {
    console.log("실행됨");
    // 결제 초기화
    IMP.init('imp81816223') // 예: 'imp00000000a'
    IMP.request_pay({
        pg: "kakaopay.TC0ONETIME", // 상점CID
        pay_method: "card", // 생략가
        merchant_uid: merchantUid, // 상점에서 생성한 고유 주문번호
        name: "오프라인 영화 티켓",
        amount: totalPayInt,
        buyer_email: "test@portone.io",
        buyer_name: "남은혜",
        buyer_tel: "010-1234-5678",
    }, async function (rsp) {
        if (rsp.success) {
            console.log("결제 성공");
            postRequest();
            window.location.href = `/reservation/${movieId}/off-ticket`; // 예시: 성공 페이지 URL
        } else {
            alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
        }
    });
}

// 페이코 결제 요청
function payco(merchantUid, totalPayInt) {
    // 결제 초기화
    IMP.init('imp81816223') // 예: 'imp00000000a'
    IMP.request_pay({
        pg : 'payco',
        merchant_uid: merchantUid,
        name : '오프라인 영화 티켓',
        amount : totalPayInt,
        buyer_email : 'Iamport@chai.finance',
        buyer_name : '아임포트 기술지원팀',
        buyer_tel : '010-1234-5678',
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log("결제 성공");
            postRequest();
            window.location.href = `/reservation/${movieId}/off-ticket`; // 예시: 성공 페이지 URL
        } else {
            alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
        }
    });
}

// kg 이니시스 결제 요청
function kgPay(merchantUid, totalPayInt) {
    // 결제 초기화
    IMP.init('imp81816223') // 예: 'imp00000000a'
    IMP.request_pay({
        pg : 'html5_inicis.INIBillTst',
        pay_method : 'card',
        merchant_uid: merchantUid,
        name : '오프라인 영화 티켓',
        amount : totalPayInt,
        buyer_email : 'Iamport@chai.finance',
        buyer_name : '아임포트 기술지원팀',
        buyer_tel : '010-1234-5678',
    }, function (rsp) {
        if (rsp.success) {
            console.log("결제 성공");
            postRequest();
            window.location.href = `/reservation/${movieId}/off-ticket`; // 예시: 성공 페이지 URL
        } else {
            alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
        }
    });
}

function postRequest(){
    let reservationCode = document.querySelector("#n_reservation_code").value;
    let discountPrice = document.querySelector("#discountPrice").value;
    let paymentTypeId = document.querySelector("#paymentTypeId").value;
    let SeatNames = document.querySelector("#SeatNames").value;
    let runningDateId = document.querySelector("#runningDateId").value;
    let unitPrice = document.querySelector("#unitPrice").value;
    let totalPrice = document.querySelector("#totalPrice").value;
    let totalCount = document.querySelector("#totalCount").value;
    let fundingId = document.querySelector("#fundingId").value;
    let movieId = document.querySelector("#n_movie_id").value;

    console.log("SeatNames : " + SeatNames);
    console.log("fundingId : " + fundingId);

    let saveOrderDate = {
        movieId: movieId,
        seatNames: SeatNames,
        unitPrice: unitPrice,
        totalCount: totalCount,
        fundingId: fundingId,
    };

    let saveSeatDate = {
        movieId: movieId,
        seatNames: SeatNames,
        unitPrice: unitPrice,
        totalCount: totalCount,
        fundingId: fundingId,
    };

    // saveOrder
    saveOrder(movieId, saveOrderDate);
    // saveSeatName
    saveSeatName(movieId, saveSeatDate);
}

async function saveOrder(movieId, saveOrderDate) {
    try {
        let response = await fetch(`/order/${movieId}/Save`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(saveOrderDate)
        });

        if (response.ok) {
            console.log("saveOrder save");
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}

async function saveSeatName(movieId, saveOrderDate) {
    try {
        let response = await fetch(`/seat/${movieId}/Save`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(saveSeatDate)
        });

        if (response.ok) {
            console.log("seatName save");
        } else {
            console.error("실패", response.statusText);
        }
    } catch (e) {
        console.error("실패", e.message);
    }
}