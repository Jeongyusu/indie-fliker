let activeCal = document.querySelector("#n_activeCal");
let otherInput = document.querySelector("#n_otherInput");
let firstDay = document.querySelector("#n_firstDay").value;
let lastDay = document.querySelector("#n_lastDay").value;

flatpickr(activeCal, {
    minDate: firstDay,  // 지정 가능한 최소 날짜
    maxDate: lastDay,  // 지정 가능한 최대 날짜
    locale: 'ko',           // 한국어로 달력 출력
    inline: true,           // 항상 달력 활성화
    onChange: function(selectedDates, dateStr, instance) {
        otherInput.value = dateStr;
    },
});