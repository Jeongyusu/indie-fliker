// 현재 페이지와 총 페이지를 서버에서 받을 예정 (jsp로 변경 예정(c:foreach로 돌릴거임))
const pageInfo = {
    currentPage: 3,
    totalPages: 10
};

const pagination = $('#l_pagination');

for (let i = 1; i <= pageInfo.totalPages; i++) {
    const li = $('<li>').addClass('page-item');
    const a = $('<a>').addClass('page-link').attr('href', '#');

    if (i === pageInfo.currentPage) {
        li.addClass('active');
    }

    a.text(i);
    li.append(a);
    pagination.append(li);
}

// 토큰 발급 요청
async function getToken(num){
    try {
        const response = await fetch("/getToken", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        });

        if (response.ok) {
            console.log("토큰 발급 성공");
            let token = await response.text();
            console.log("token" + token);
            cancelPay(num, token);
        } else {
            console.error("토큰 발급 실패..:", response.status, response.statusText);
            response.status(500).json(/* 오류 응답 생성 */);
        }
    } catch (error) {
        console.error("Ajax 요청 중에 오류 발생:", error);
        // 여기서 에러를 적절하게 처리하거나, 필요에 따라 다른 동작 수행

    }

}


// 카카오 페이 환불 요청
async function cancelPay(num, token) {
    let merchantUid = document.querySelector('#reservationCode' + num).value;
    let formatPrice = document.querySelector('#finalPrice' + num).innerHTML;
    let finalPrice = parseInt(formatPrice.replace(/,/g, ''), 10);

    try {
        const response = await fetch("/wantRefund", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                "merchant_uid": merchantUid,
                "cancel_request_amount": finalPrice,
                "reason": "결제 환불",
                "token": token
            }),
        });

        if (response.ok) {
            console.log("성공이닷");
            deletePayments(num);
        } else {
            console.error("환불 실패:", response.status, response.statusText);
            response.status(500).json(/* 오류 응답 생성 */);
        }
    } catch (error) {
        console.error("Ajax 요청 중에 오류 발생:", error);
        // 여기서 에러를 적절하게 처리하거나, 필요에 따라 다른 동작 수행

    }
}

// 결제 내역 삭제
async function deletePayments(num){
    let reservationId = document.querySelector('#reservationId' + num).value;
    let orderId = document.querySelector('#orderId' + num).value;
    let paymentId = document.querySelector('#paymentId' + num).value;
    let movieId = document.querySelector('#movieId' + num).value;

    let deleteIds = {
        reservationId:reservationId,
        orderId:orderId,
        paymentId:paymentId
    };

    try {
        const response = await fetch(`/payment/${movieId}/on-delete`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(deleteIds),
        });

        if (response.ok) {
            console.log("삭제 성공");
            location.reload();
        } else {
            response.status(500).json(/* 오류 응답 생성 */);
        }
    } catch (error) {
        console.error("Ajax 요청 중에 오류 발생:", error);

    }

}