<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>펀딩 업로드</title>
    <link href="../../../../resources/static/css/khy_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="k_funding_upload_container">
    <div class="k_funding_upload_titles">영화 대표 사진 <span class="k_star_class">*</span></div>
    <form action="/upload" method="post" enctype="multipart/form-data" class="k_funding_upload_picture">
        <label for="photo" class="k_funding_upload_select_pic">
            <i class="fas fa-camera"></i>
            사진 선택 <span class="k_star_class">*</span></label>
        <input type="file" id="moviemain" name="photo" accept="image/*">
        <br>
    </form>
    <div class="k_funding_upload_movie_level k_funding_upload_titles">영화 상영 등급 <span class="k_star_class">*</span></div>
    <select class="k_funding_upload_select_option">
        <option value="option1">전체 관람가</option>
        <option value="option2">15세 이상 관람가</option>
        <option value="option3">청소년 관람 불가</option>
    </select>
</div>
<div class="k_funding_upload_container_two">
    <div class="k_funding_upload_titles">영화 제목 <span class="k_star_class">*</span>
    </div>
    <input class="k_funding_upload_movie_name">
</div>
<div class="k_funding_upload_container_third">
    <div class="k_funding_upload_titles">펀딩 기간 <span class="k_star_class">*</span>
        <div class="k_funding_upload_funding_date">1년 이내만 가능</div>
    </div>
    <input type="text" id="firstDay" class="k_funding_upload_first_date" placeholder="펀딩 시작일">
    <input type="text" id="lastDay" class="k_funding_upload_last_date" placeholder="펀딩 마감일">
    <div class="k_funding_upload_titles k_funding_upload_movie_schedule">(온라인) 상영 예정일 <span
            class="k_star_class">*</span></div>
    <input type="text" id="limitDay" class="k_funding_upload_schedule_date" placeholder="상영 예정일">
</div>
<div class="k_funding_upload_container_two">
    <div class="k_funding_upload_middle_title k_funding_upload_titles">시놉시스 <span class="k_star_class">*</span>

    </div>
</div>
<div class="k_funding_upload_container_two">
    <input class="k_funding_upload_sibnob">
</div>
<div class="k_funding_upload_container_two">
    <div class="k_funding_upload_middle_title k_funding_upload_titles">연출의도 <span class="k_star_class">*</span>

    </div>
</div>
<div class="k_funding_upload_container_two">
    <input class="k_funding_upload_sibnob">
</div>
<div class="k_funding_upload_container_three">
    <div class="k_funding_upload_titles">포토 <span class="k_star_class">*</span></div>

</div>
<div class="k_funding_upload_container_four">
    <form action="/upload" method="post" enctype="multipart/form-data" class="k_funding_upload_picture">
        <label for="photo" class="k_funding_upload_select_photo_pic">
            <i class="fas fa-camera"></i>
            사진 선택 <span class="k_star_class">*</span></label>
        <input type="file" id="photo" name="photo" accept="image/*">
        <br>
    </form>
    <form action="/upload" method="post" enctype="multipart/form-data" class="k_funding_upload_picture">
        <label for="photo" class="k_funding_upload_select_photo_pic_receive">
            <i class="fas fa-camera"></i>
            <span class="k_star_class"></span></label>
        <input type="file" id="photo1" name="photo" accept="image/*">
        <br>
    </form>
    <form action="/upload" method="post" enctype="multipart/form-data" class="k_funding_upload_picture">
        <label for="photo" class="k_funding_upload_select_photo_pic_receive">
            <i class="fas fa-camera"></i>
            <span class="k_star_class"></span></label>
        <input type="file" id="photo2" name="photo" accept="image/*">
        <br>
    </form>
    <form action="/upload" method="post" enctype="multipart/form-data" class="k_funding_upload_picture">
        <label for="photo" class="k_funding_upload_select_photo_pic_receive">
            <i class="fas fa-camera"></i>
            <span class="k_star_class"></span></label>
        <input type="file" id="photo3" name="photo" accept="image/*">
        <br>
    </form>
</div>
<div class="k_funding_upload_container_three">
    <div class="k_funding_upload_titles">감독사진 <span class="k_star_class">*</span></div>
    <div class="k_funding_upload_head_Career k_funding_upload_titles">감독 작품 경력</div>

</div>
<div class="k_funding_upload_container_four">

    <form action="/upload" method="post" enctype="multipart/form-data" class="k_funding_upload_picture">
        <label for="photo" class="k_funding_upload_select_photo_pic">
            <i class="fas fa-camera"></i>
            사진 선택 <span class="k_star_class">*</span>
        </label>
        <input type="file" id="head" name="photo" accept="image/*">
        <br>

    </form>

    <input class="k_funding_upload_career_input" placeholder="작품 이름">
    <div class="k_funding_upload_head_limit" style="">dd</div>
    <input type="text" class="k_funding_upload_movie_year" placeholder="작품 년도">

</div>
<div class="k_funding_upload_container_three">
    <div class="k_funding_upload_titles k_funding_upload_pride">영화제 상영 및 수상작 <span class="k_star_class">*</span></div>

</div>
<div class="k_funding_upload_container_two">
    <input class="k_funding_upload_career_input_two" placeholder="작품 이름">

    <input type="text" class="k_funding_upload_movie_year" placeholder="작품 년도">
</div>
<div class="k_funding_upload_container_two k_funding_upload_head_limit">
    영화제 상영 및 수상작과 수상 년도를 작성해주세요.예)2022 Nshville Film Festival,2022
</div>
<div class="k_funding_upload_container_two k_funding_upload_head_limit">
    영화제 상영 및 수상작은 최대 10까지 등록 가능합니다.
</div>
<div class="k_funding_upload_container_three k_funding_upload_titles">
    <div class="container mt-3">
        <h2>스태프</h2>
        <table class="table">

            <tbody>
            <tr>
                <td class="bg-light">감독</td>
                <td>김하율</td>
                <td>def@somemail.com</td>
            </tr>
            <tr>
            <td class="bg-light">각본</td>
            <td>Joe</td>
            <td>joe@example.com</td>
            </tr>
            <tr>
            <td class="bg-light">촬영</td>
            <td>Doe</td>
            <td>john@example.com</td>
            </tr>
            <tr>
            <td class="bg-light">조명</td>
            <td>Moe</td>
            <td>mary@example.com</td>
            </tr>
            <tr>
            <td class="bg-light">미술</td>
            <td>Dooley</td>
            <td>july@example.com</td>
            </tr>
            <tr>
            <td class="bg-light">편집</td>
            <td>Refs</td>
            <td>bo@example.com</td>
            </tr>
            <tr>
            <td class="bg-light">사운드</td>
            <td>Activeson</td>
            <td>act@example.com</td>
            </tr>
            <tr>
            <td class="bg-light">음악</td>
            <td>Secondson</td>
            <td>sec@example.com</td>
            </tr>
            <tr>
            <td class="bg-light">의상</td>
            <td>Angie</td>
            <td>angie@example.com</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
<script>
    let firstDay = document.getElementById('firstDay');
    let lastDay = document.getElementById('lastDay');
    let limitDay = document.getElementById('limitDay');
    let day = "";

    flatpickr(firstDay, {
        minDate: "today",

        onChange: function (selectedDates, dateStr, instance) {
            firstDay.value = dateStr;
            console.log("firstDay.value :" + firstDay.value);

            day = getPlusOneYearDate(dateStr);

            // lastDay에 적용
            lastDayFlatpickr.set('minDate', firstDay.value);
            lastDayFlatpickr.set('maxDate', day);
            allDayFlatpickr.set('minDate', firstDay.value);
        },
    });

    // lastDay를 위한 flatpickr 객체 따로 생성
    let lastDayFlatpickr = flatpickr(lastDay, {
        onChange: function (selectedDates, dateStr, instance) {
            lastDay.value = dateStr;
            console.log("lastDay.value: " + lastDay.value);
            allDayFlatpickr.set('maxDate', lastDay.value);

        },
    });

    let allDayFlatpickr = flatpickr(limitDay, {
        locale: 'ko',
    });

    // 1년을 계산하는 메소드
    function getPlusOneYearDate(dateStr) {
        let currentDate = new Date(firstDay.value);
        currentDate.setFullYear(currentDate.getFullYear() + 1);
        return currentDate;
    }

</script>

</body>
</html>
