<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>그대들은 어떻게 살 것인가</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- css -->
    <link href="../../../../css/neh_style.css" rel="stylesheet">

    <style>
        .container-fluid {
            display: flex;
            align-items: center;
            max-width: 1200px;
        }
    </style>
<body>
<div id="n_select_movie">
    <h5>기대되는 영화! "그대들은 어떻게 살 것인가?"</h5>
</div>
<div class="container-fluid">
    <div class="n_body">
        <div class="row justify-content-center n_select_row">
            <div class="n_select_form">
                <img id="n_movie_img" src="images/moviePhoto/the_boy1.jpg">
                <div class="n_form_check_detail">
                        <span id="n_ticket_type">
                        <p>[온라인 티켓]</p>
                        </span>
                    <p id="n_movie_title">그대들은 어떻게 살 것인가?</p>
                    <p id="n_movie_content">어머니를 그리워하며 새로운 보금자리에 적응하던 주인공 "마히토"가 정체불명의 왜가리와 함께 저택의 신비로운 탑에 대한 이야기를 듣게 되는 작품을 기대해 주세요</p>
                    <div class="n_show_period">
                        <img src="images/icons/movieCrawl.png" width="20" height="20">
                        <p>23.10.15 온라인 상영 예정</p>
                        <!--23.10.15 ~ 23.10.30 오프라인 상영 기간 추가-->
                    </div>
                </div>
            </div>
            <div class="n_select_price">
                <span id="n_ticket_title">[4일간 무제한 스트리밍]</span>
                <span id="n_select_price"><p id="n_ticket_price">8,000</p><p>원</p></span>
            </div>
            <div class="n_donation">
                    <span class="n_info">
                        <p id="n_donation_title">후원금 더하기(선택)</p>
                        <p class="n_donation_comment">후원금을 더하여 참여할 수 있습니다. 추가 후원금을 입력하시겠습니까?</p>
                    </span>
                <span class="n_donation_price">
                        <input type="text" class="form-control" id="n_donation_price" placeholder="0" name="donationPrice" value="" oninput="inputDonation()">
                        <p class="n_donation_comment">원을 추가로 후원합니다.</p>
                    </span>
            </div>
            <form action="/" method="get">
                <input type="hidden" name="total_price" value="">
                <input type="hidden" name="select_movie" value="">
                <div class="n_total_price">
                    <p class="n_total_comment">"그대들은 어떻게 살 것 인가?"에 </p>
                    <p id="n_total_price">8,000</p>
                    <p class="n_total_comment">원을 참여합니다.</p>
                </div>
                <div id="n_on_pay_button">
                    <button type="submit" id="n_next_button">다음 단계로 ></button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
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
</script>
</html>