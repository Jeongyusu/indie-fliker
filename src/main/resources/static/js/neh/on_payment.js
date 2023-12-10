function inputDonation(){
    // 입력된 값
    let ticket_price = document.querySelector("#n_ticket_price").innerHTML;
    let inputDonationPrice = document.querySelector("#n_donation_price").value;

    // String -> int
    let ticketIntPrice = parseInt(ticket_price.replace(/,/g, '')); // 8,000 -> 숫자
    let inputIntprice = parseInt(inputDonationPrice);

    // 펀딩금 + 후원금, int -> String
    let totalIntPrice = ticketIntPrice + inputIntprice; // 숫자
    let totalStringPrice = totalIntPrice.toLocaleString(); // 숫자 -> 1,000

    // 최종 결제 금액
    let totalPrice = document.querySelector("#n_total_price");
    if(inputDonationPrice == 0){
        totalPrice.innerHTML = ticket_price;
    }else{
        totalPrice.innerHTML = totalStringPrice;
    }
}