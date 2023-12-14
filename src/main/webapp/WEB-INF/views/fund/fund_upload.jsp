<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="k_funding_save">
    <p>펀딩 등록하기</p>
</div>
<div class="k_funding_main">
    <div class="k_funding_upload">
        <div class="k_funding_upload_container">
            <div class="k_funding_upload_pic_title">영화 대표 사진 <span class="k_star_class">*</span></div>
            <form action="/upload" method="post" enctype="multipart/form-data" class="k_funding_upload_picture">
                <label for="photo" class="k_funding_upload_select_photo_pic">
                    <i class="fas fa-camera"></i>
                    사진 선택 <span class="k_star_class">*</span></label>
                <input type="file" id="moviemain" name="photo" accept="image/*">
                <br>
            </form>
            <div class="k_funding_upload_movie_level k_funding_upload_grade_title">영화 상영 등급 <span class="k_star_class">*</span></div>
            <select class="k_funding_upload_select_option">
                <option value="option1">전체 관람가</option>
                <option value="option1">12세 이상 관람가</option>
                <option value="option2">15세 이상 관람가</option>
                <option value="option3">청소년 관람 불가</option>
            </select>
        </div>
        <div class="k_funding_upload_container_two">
            <div class="k_funding_upload_first_title">영화 제목
                <span class="k_star_class">*</span>
            </div>
            <input class="k_funding_upload_movie_name">
        </div>
        <div class="k_funding_upload_container_third">
            <div id="k_fund">
                <div class="k_funding_upload_fund_titles">펀딩 기간 <span class="k_star_class">*</span>
                    <div class="k_funding_upload_funding_date">1년 이내만 가능</div>
                </div>
                <input type="text" id="firstDay" class="k_funding_upload_first_date" placeholder="펀딩 시작일">
                <input type="text" id="lastDay" class="k_funding_upload_last_date" placeholder="펀딩 마감일">
            </div>
            <div class="k_funding_upload_titles k_funding_upload_movie_schedule">(온라인) 상영 예정일
                <span class="k_star_class">*</span>
            </div>
            <input type="text" id="limitDay" class="k_funding_upload_schedule_date" placeholder="상영 예정일">
        </div>
        <div class="k_margin_top">
            <div class="k_funding_upload_container_two">
                <div class="k_funding_upload_middle_title k_funding_upload_titles">시놉시스
                    <span class="k_star_class">*</span>
                </div>
            </div>
            <div class="k_funding_upload_container_two">
                <textarea class="k_funding_upload_sibnob">
                </textarea>
            </div>
        </div>
        <div class="k_margin_top">
            <div class="k_funding_upload_container_two">
                <div class="k_funding_upload_middle_title k_funding_upload_titles">연출의도
                    <span class="k_star_class">*</span>
                </div>
            </div>
            <div class="k_funding_upload_container_two">
                <textarea class="k_funding_upload_sibnob">
                </textarea>
            </div>
        </div>
        <div class="k_margin_top">
            <div class="k_funding_upload_container_two">
                <div class="k_funding_upload_middle_title k_funding_upload_titles">포토
                    <span class="k_star_class">*</span>
                </div>
            </div>
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
        <div class="k_margin_top">
            <div class="k_funding_upload_container_three">
                <div class="k_funding_upload_direct_title">
                    <div class="k_funding_upload_titles">감독사진
                        <span class="k_star_class">*</span>
                    </div>
                    <div class="k_funding_upload_head_Career k_funding_upload_titles">감독 작품 경력</div>
                </div>
                <div class="k_plus_content">
                    <div>
                        <button type="button" class="k_plus_button">
                            <img src="/images/icons/plus.png">
                        </button>
                    </div>
                </div>
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
                <div class="k_funding_directer_career">
                    <input class="k_funding_upload_career_input" placeholder="작품 이름">
                    <div class="k_funding_upload_head_limit" style=""></div>
                    <input type="text" class="k_funding_upload_movie_year" placeholder="작품 년도">
                </div>
            </div>
        </div>
        <div class="k_funding_upload_container_three">
            <div class="k_funding_upload_titles k_funding_upload_pride">영화제 상영 및 수상작 <span class="k_star_class">*</span></div>
            <div>
                <button type="button" class="k_plus_button">
                    <img src="/images/icons/plus.png">
                </button>
            </div>
        </div>
        <div class="k_funding_upload_container_two">
            <input class="k_funding_upload_career_input_two" placeholder="작품 이름">

            <input type="text" class="k_funding_upload_movie_year" placeholder="작품 년도">
        </div>
        <div class="k_funding_upload_career">
            영화제 상영 및 수상작과 수상 년도를 작성해주세요.예) 2022 Nshville Film Festival / 예) 2022
        </div>
        <div class="k_funding_upload_career">
            영화제 상영 및 수상작은 최대 10까지 등록 가능합니다.
        </div>
        <div class="k_funding_upload_container_three k_funding_upload_titles">
            <div class="container mt-3" id="k_table_staff">
                <p>스태프</p><p class="k_star_class">*</p>
                <table class="table table-bordered rounded-0" id="k_table">
                    <tbody id="k_table_body">
                    <tr>
                        <th>감독</th>
                        <td>
                            <input type="text">
                        </td>
                        <th>각본</th>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>촬영</th>
                        <td>
                            <input type="text">
                        </td>
                        <th>조명</th>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>미술</th>
                        <td>
                            <input type="text">
                        </td>
                        <th>편집</th>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>사운드</th>
                        <td>
                            <input type="text">
                        </td>
                        <th>음악</th>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>의상</th>
                        <td>
                            <input type="text">
                        </td>
                        <th></th>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
<%@ include file="../layout/footer.jsp" %>
