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
                    <p class="n_pay_step_choice">날짜 선택</p>
                </li>
                <li class="n_middle_li">
                    <p class="n_pay_step_p">좌석 지정</p>
                </li>
                <li class="n_other_li">
                    <p class="n_pay_step_p">결제 하기</p>
                </li>
            </ol>
        </div>
        <div id="n_select_day">
            <div class="n_movie_calendar">
                <input type="hidden" id="n_activeCal" disabled>
                <input type="hidden" id="n_firstDay">
                <input type="hidden" id="n_lastDay">
            </div>
            <div class="n_select_day_movies">
                <input type="text" id="n_otherInput" placeholder="날짜를 선택해주세요" disabled="">
                <form id="n_day_movies_form">
                    <button type="submit" id="select_movie_button">
                        <div id="n_day_movies">
                <span id="n_movie_time">
                  <p class="n_start_time">14:05</p>
                  <p class="n_end_time">~15:57</p>
                </span>
                            <span id="n_movie_title">
                  <p>그대들은 어떻게 살 것인가?</p>
                </span>
                        </div>
                        <div id="n_seat">
                            <div id="n_seat_count">
                                <p class="n_possible_seat">119</p><p class="n_all_seat">/168</p>
                            </div>
                        </div>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    let activeCal = document.querySelector("#n_activeCal");
    let otherInput = document.querySelector("#n_otherInput");
    let firstDay = document.querySelector("#n_firstDay");
    let lastDay = document.querySelector("#n_lastDay");

    flatpickr(activeCal, {
        minDate: firstDay,  // 지정 가능한 최소 날짜
        maxDate: lastDay,  // 지정 가능한 최대 날짜
        locale: 'ko',           // 한국어로 달력 출력
        inline: true,           // 항상 달력 활성화
        onChange: function(selectedDates, dateStr, instance) {
            otherInput.value = dateStr;
            console.log('selectedDates 날짜:', selectedDates);
            // [Thu Dec 21 2023 00:00:00 GMT+0900 (한국 표준시)]
            console.log('dateStr 날짜:', dateStr);
            // 2023-12-21
            console.log('instance 날짜:', instance);
            // 리스트
        },
    });
</script>
</body>
</html>