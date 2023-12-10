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