// 펀딩 & 환불 버튼 클릭 시 해당 안내문 출력
let selectInfo = document.querySelector("#n_info");
let fundIcon = document.querySelector("#n_fund");
let refundIcon = document.querySelector("#n_refund");
let selectFundSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTYuMDMxMjUgMjguODI0SDI1Ljk1OTJDMjcuMDU1MyAyOC44MjQgMjcuOTU5MiAyNy45MiAyNy45NTEyIDI2LjgyNFYxMy41SDI5VjlDMjkgNy44OTU0MyAyOC4xMDQ2IDcgMjcgN0g1QzMuODk1NDMgNyAzIDcuODk1NDMgMyA5VjEzLjUwMDFINC4wMzEyNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRaIiBmaWxsPSIjQjlFRUVFIi8+CjxwYXRoIGQ9Ik0xNiA2LjVDMTguMDMzIDQuMDE4NDkgMjAuMTIxMyAyLjcxMTEzIDIxLjExMTcgMi40NjM1M0MyMi42NDc3IDIuMDcxNTMgMjMuNzE5NyAzLjc0MzUzIDIyLjY1NTcgNC45MTE1M0MyMS45MjYxIDUuNzExNzYgMjAuODc5IDYuNDI0MDQgMTkuNSA2Ljg2NSIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTE2IDYuNUMxMy45MzY5IDMuOTcyMTcgMTEuODc3NiAyLjcxMzA5IDEwLjg4NjEgMi40NjM1M0M5LjM1MDE0IDIuMDcxNTMgOC4yNzgxNCAzLjc0MzUzIDkuMzQyMTQgNC45MTE1M0M5LjkwNzcyIDUuNTMxODUgMTEuMzMyNiA2LjMzMTg3IDEyLjUgNi44MDk4MiIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTQuMDMxMjUgMTMuNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRIMjUuOTU5MkMyNy4wNTUyIDI4LjgyNCAyNy45NTkyIDI3LjkyIDI3Ljk1MTIgMjYuODI0VjEzLjQ5OTkiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjguNzgzIDEzLjU2NzhWOC44Mzk4NEMyOC43ODMgNy43MzU4NCAyNy44ODcgNi44Mzk4NCAyNi43ODMgNi44Mzk4NEg1LjIwNzAzQzQuMTAzMDMgNi44Mzk4NCAzLjIwNzAzIDcuNzM1ODQgMy4yMDcwMyA4LjgzOTg0VjEzLjU2NzhIMjguNzgzWiIgc3Ryb2tlPSIjMjEyNTI5Ii8+CjxwYXRoIGQ9Ik0xNS45NzQ2IDYuNzUxOTVWMjguODI0IiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8L3N2Zz4K";
let fundSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTE2IDYuNUMxOC4wMzMgNC4wMTg0OSAyMC4xMjEzIDIuNzExMTMgMjEuMTExNyAyLjQ2MzUzQzIyLjY0NzcgMi4wNzE1MyAyMy43MTk3IDMuNzQzNTMgMjIuNjU1NyA0LjkxMTUzQzIxLjkyNjEgNS43MTE3NiAyMC44NzkgNi40MjQwNCAxOS41IDYuODY1IiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8cGF0aCBkPSJNMTYgNi41QzEzLjkzNjkgMy45NzIxNyAxMS44Nzc2IDIuNzEzMDkgMTAuODg2MSAyLjQ2MzUzQzkuMzUwMTQgMi4wNzE1MyA4LjI3ODE0IDMuNzQzNTMgOS4zNDIxNCA0LjkxMTUzQzkuOTA3NzIgNS41MzE4NSAxMS4zMzI2IDYuMzMxODcgMTIuNSA2LjgwOTgyIiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8cGF0aCBkPSJNNC4wMzEyNSAxMy41VjI2LjgyNEM0LjAzMTI1IDI3LjkyOCA0LjkyNzI1IDI4LjgyNCA2LjAzMTI1IDI4LjgyNEgyNS45NTkyQzI3LjA1NTIgMjguODI0IDI3Ljk1OTIgMjcuOTIgMjcuOTUxMiAyNi44MjRWMTMuNDk5OSIgc3Ryb2tlPSIjMjEyNTI5Ii8+CjxwYXRoIGQ9Ik0yOC43ODMgMTMuNTY3OFY4LjgzOTg0QzI4Ljc4MyA3LjczNTg0IDI3Ljg4NyA2LjgzOTg0IDI2Ljc4MyA2LjgzOTg0SDUuMjA3MDNDNC4xMDMwMyA2LjgzOTg0IDMuMjA3MDMgNy43MzU4NCAzLjIwNzAzIDguODM5ODRWMTMuNTY3OEgyOC43ODNaIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE1Ljk3NDYgNi43NTE5NVYyOC44MjQiIHN0cm9rZT0iIzIxMjUyOSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIi8+Cjwvc3ZnPgo=";
let selectRefunSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3QgeD0iNy41IiB5PSI3LjUiIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyIgcng9IjEiIGZpbGw9IiNCOUVFRUUiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjIuMjc2NSA1LjMzNzIzTDIxLjUgMi40Mzk0NUwyNC4zOTc4IDEuNjYzIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE2IDEuNUM3Ljk5MTg3IDEuNSAxLjUgNy45OTE4NyAxLjUgMTZDMS41IDI0LjAwODEgNy45OTE4NyAzMC41IDE2IDMwLjVDMjQuMDA4MSAzMC41IDMwLjUgMjQuMDA4MSAzMC41IDE2QzMwLjUgMTAuNzM2OCAyNy42OTU4IDYuMTI4NTcgMjMuNSAzLjU4NzgyQzIzLjAxNzcgMy4yOTU3NSAyMi41MTcgMy4wMzEwMSAyMiAyLjc5NTczIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE0LjUgOFYxMUgxNy41VjgiIHN0cm9rZT0iIzIxMjUyOSIvPgo8L3N2Zz4K";
let refundSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3QgeD0iNy41IiB5PSI3LjUiIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyIgcng9IjEiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjIuMjc2NSA1LjMzNzIzTDIxLjUgMi40Mzk0NUwyNC4zOTc4IDEuNjYzIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE2IDEuNUM3Ljk5MTg3IDEuNSAxLjUgNy45OTE4NyAxLjUgMTZDMS41IDI0LjAwODEgNy45OTE4NyAzMC41IDE2IDMwLjVDMjQuMDA4MSAzMC41IDMwLjUgMjQuMDA4MSAzMC41IDE2QzMwLjUgMTAuNzM2OCAyNy42OTU4IDYuMTI4NTcgMjMuNSAzLjU4NzgyQzIzLjAxNzcgMy4yOTU3NSAyMi41MTcgMy4wMzEwMSAyMiAyLjc5NTczIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE0LjUgOFYxMUgxNy41VjgiIHN0cm9rZT0iIzIxMjUyOSIvPgo8L3N2Zz4K";


function selectFund(){
    selectInfo.innerHTML = "인디픽터 펀딩은 영화를 단순히 관람하는 것이 아닌 <strong>독립영화의 새로운 작품 제작 과정 지원·상영·사회적 가치</strong>를 확산해요.";
    fundIcon.src = selectFundSrc;
    refundIcon.src = refundSrc;
    console.log("펀드 클릭");
}

function selectRefund(){
    selectInfo.innerHTML = "<strong>영화 관람 전</strong> 결제 취소가 가능합니다.";
    fundIcon.src = fundSrc;
    refundIcon.src = selectRefunSrc;
    console.log("환불 클릭");
}
// 프로젝트 스토리 더보기 버튼
function toggleMore() {
    let moreContent = document.querySelector("#n_toggle_more");
    if (moreContent.style.display === "none") {
        moreContent.style.display = "inline";
    } else {
        moreContent.style.display = "none";
    }
}

// jQuery를 사용한 비동기 통신 코드

$(document).ready(function () {
    $(".bookmark_button").on('click', function () {
        let fundingId = document.getElementById('k_funding_id').value;

        // 클릭된 버튼 안에서 .scrap_icon 찾기
        var scrapIcon = $(this).children(".scrap_icon");

        // AJAX POST 요청
        var sendData = {
            fundingId: fundingId
        };

        $.ajax({
            type: "POST",
            url: "/api/scrabs/toggle",
            data: JSON.stringify(sendData),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (data, textStatus, xhr) {
            console.log(typeof data);
            console.log(data);

            // 좋아요가 추가된 경우
            if (data.response.scrabbed) {
                scrapIcon.attr("src", "/images/icons/icons8-heart-24-red.png");
            } else {
                // 좋아요가 제거된 경우
                scrapIcon.attr("src", "/images/icons/icons8-heart-24-black.png");
            }

        }).fail(function (error) {
            alert(error.responseText);
        });
    });
});