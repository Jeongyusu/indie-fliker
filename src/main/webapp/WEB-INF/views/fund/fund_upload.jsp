<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<form action="/funding-ready/save" method="post" enctype="multipart/form-data">
    <div class="k_funding_save">
        <p>펀딩 등록하기</p>
    </div>
    <div class="k_funding_main">
        <div class="k_funding_upload">
            <div class="k_funding_upload_container">
                <div class="pic_wrap">
                    <div id="pic_container" class="k_funding_pic_title">영화 대표 사진 <span class="k_star_class">*</span></div>
                    <label id="basicPic" for="thumbnail" class="k_funding_upload_select_photo_pic2">
                        <img src="/images/icons/add_camera.png" class="k_camera_icon">
                        사진 선택 <span class="k_star_class">*</span></label>
                    <input type="file" id="thumbnail" name="movieThumbnail" accept="image/*" onchange="changeUserPic(this.id, 'basicPic', 'k_funding_thumbnail_style', event)" class="k_funding_upload_label">
                </div>
                <br>

                <div class="grade_wrap">
                    <div class="k_custom_margin">
                        <div class="k_funding_upload_movie_level k_funding_upload_grade_title k_text_no_wrap">영화 상영 등급 <span class="k_star_class">*</span></div>
                        <div class="k_funding_upload_movie_level k_funding_upload_grade_title k_text_no_wrap k_margin_top55">배급사 <span class="k_star_class">*</span></div>
                    </div>
                    <div>
                        <select class="k_custom_select_option" name="runningGrade">
                            <option value="전체 관람가">전체 관람가</option>
                            <option value="12세 이상 관람가">12세 이상 관람가</option>
                            <option value="15세 이상 관람가">15세 이상 관람가</option>
                            <option value="청소년 관람 불가">청소년 관람 불가</option>
                        </select>
                        <input type="text" class="k_funding_upload_schedule_date k_margin_production" placeholder="배급사" name="production">
                    </div>
                </div>

            </div>
            <div class="k_funding_upload_container_two">
                <div class="k_funding_upload_first_title">영화 제목
                    <span class="k_star_class">*</span>
                </div>
                <input type=text class="k_funding_upload_movie_name j_special_check" name="movieTitle">
            </div>
            <div class="k_funding_upload_container_third">
                <div id="k_fund">
                    <div class="k_funding_upload_fund_titles">펀딩 기간 <span class="k_star_class">*</span>
                        <div class="k_funding_upload_funding_date">1년 이내만 가능</div>
                    </div>
                    <input type="text" id="firstDay" class="k_funding_upload_first_date" placeholder="펀딩 시작일" name="fundingPeriodStart">
                    <input type="text" id="lastDay" class="k_funding_upload_last_date" placeholder="펀딩 마감일" name="fundingPeriodEnd">
                </div>
                <div class="k_funding_upload_titles k_funding_upload_movie_schedule">(온라인) 상영 예정일
                    <span class="k_star_class">*</span>
                </div>
                <input type="text" id="limitDay" class="k_funding_upload_schedule_date" placeholder="상영 예정일" name="dDay">
            </div>
            <div class="k_funding_genre_container">
                <div class="k_funding_genre_grade_title">영화 장르<span class="k_star_class">*</span></div>
                <select class="k_funding_genre_select_option" name="genre">
                    <option value="극영화">극영화</option>
                    <option value="애니메이션">애니메이션</option>
                    <option value="다큐멘터리">다큐멘터리</option>
                    <option value="실험영화">실험영화</option>
                </select>

                <div class="k_funding_make_year k_funding_upload_movie_schedule">제작 년도
                    <span class="k_star_class">*</span>
                </div>
                <input id="k_place_holder" type="text" class="k_funding_upload_schedule_date" placeholder="제작년도" name="makeYear">
            </div>

            <div class="k_funding_genre_container">
                <div class="k_funding_genre_grade_title">펀딩 목표금액<span class="k_star_class">*</span></div>
                <select class="k_funding_genre_select_option" name="targetPrice">
                    <option value="5000000">5백만원</option>
                    <option value="10000000">1천만원</option>
                    <option value="15000000">1천5백만원</option>
                    <option value="20000000">2천만원</option>
                    <option value="25000000">2천5백만원</option>
                    <option value="30000000">3천만원</option>
                    <option value="35000000">3천5백만원</option>
                    <option value="40000000">4천만원</option>
                    <option value="45000000">4천5백만원</option>
                    <option value="50000000">5천만원</option>



                </select>

                <div class="k_funding_make_year k_funding_upload_movie_schedule">1회 펀딩금액
                    <span class="k_star_class">*</span>
                </div>
                <input type="text" class="k_funding_upload_schedule_date k_background_color" name="pricePerOnetime" value="8000" onclick="handleClick(this);" readonly>

            </div>



            <div class="k_margin_top">
                <div class="k_funding_upload_container_two">
                    <div class="k_funding_upload_middle_title k_funding_upload_titles">시놉시스
                        <span class="k_star_class">*</span>
                    </div>
                </div>
                <div class="k_funding_upload_container_two">
                    <textarea class="k_funding_upload_sibnob j_special_check" name="synopsis"></textarea>
                </div>
            </div>
            <div class="k_margin_top">
                <div class="k_funding_upload_container_two">
                    <div class="k_funding_upload_middle_title k_funding_upload_titles">연출의도
                        <span class="k_star_class">*</span>
                    </div>
                </div>
                <div class="k_funding_upload_container_two">
                    <textarea class="k_funding_upload_sibnob j_special_check" name="directingIntension"></textarea>
                </div>
            </div>
            <div class="k_margin_top">
                <div class="k_funding_upload_container_two">
                    <div class="k_funding_upload_middle_title k_funding_upload_titles">포토
                        <span class="k_star_class">*</span>
                    </div>
                    <button type="button" class="k_plus_button" onclick="addPhotoField()">
                        <img src="/images/icons/plus.png">
                    </button>
                    <button type="button" class="k_minus_button" onclick="deletePhotoField()">
                        <img src="/images/icons/minus.png" class="k_minus_img">
                    </button>
                </div>
            </div>

            <div id="pic_plus" class="k_funding_upload_container_four">
                <label id="movie_pic" for="movie_photo" class="k_funding_upload_select_photo_pic">
                    <img src="/images/icons/add_camera.png" class="k_camera_icon">
                    사진 선택 <span class="k_star_class">*</span></label>
                <input type="file" id="movie_photo" name="moviePhotos" accept="image/*" onchange="changeUserPic(this.id, 'movie_pic', 'k_funding_movie_pic_style', event)" class="k_funding_upload_label">
                <br>

            </div>
            <div class="k_margin_top">
                <div class="k_funding_upload_container_three">
                    <div class="k_funding_upload_direct_title">
                        <div class="k_funding_upload_titles">감독사진
                            <span class="k_star_class">*</span>
                        </div>
                        <div class="k_funding_upload_head_Career k_funding_upload_titles k_padding_right70">감독 작품 경력</div>
                    </div>
                    <div class="k_plus_content">
                        <button type="button" class="k_plus_button" onclick="plusCareerMovie()">
                            <img src="/images/icons/plus.png">
                        </button>
                        <button type="button" class="k_minus_button" onclick="minusCareerMovie()">
                            <img src="/images/icons/minus.png" class="k_minus_img k_padding_bottom5">
                        </button>
                    </div>
                </div>
                <div class="k_funding_upload_container_four">
                    <label id="director_pic" for="director_photo" class="k_funding_upload_select_photo_pic">
                        <img src="/images/icons/add_camera.png" class="k_camera_icon">
                        사진 선택 <span class="k_star_class">*</span>
                    </label>
                    <input type="file" id="director_photo" name="directorPhoto" accept="image/*" onchange="changeUserPic(this.id, 'director_pic', 'k_funding_movie_director_style', event)" class="k_funding_upload_label">
                    <br>
                    <div class="k_funding_directer_career">
                        <div id="career_movie" class="k_career_movie_style">
                            <input type=text class="k_funding_upload_career_input j_special_check" placeholder="작품 이름" name="directorCareers" oninput="setDefaultIfEmpty(this, '미정')">
                        </div>
                        <div id="career_movie_year" class="k_funding_upload_head_limit">
                            <input type="number" class="k_funding_upload_movie_year" placeholder="작품 년도" name="directorCareerYears" min="1900" max="2024" oninput="validateYearInput(this)">
                        </div>
                    </div>
                </div>
                <div id="k_cm_margin_top">
                </div>
                <div class="k_funding_upload_container_three">
                    <div class="k_funding_upload_titles k_funding_upload_pride">영화제 상영 및 수상작 <span class="k_star_class">*</span></div>
                    <button type="button" class="k_plus_button" onclick="plusAwardsMovie()">
                        <img src="/images/icons/plus.png">
                    </button>
                    <button type="button" class="k_minus_button" onclick="minusAwardsMovie()">
                        <img src="/images/icons/minus.png" class="k_minus_img">
                    </button>
                </div>
                <div class="k_funding_directer_career">
                    <div id="awards_movie" class="k_career_movie_style">
                        <input type=text class="k_funding_awards_movie_input j_special_check" placeholder="작품 이름" name="directorAwards" oninput="setDefaultIfEmpty(this, '미정')">
                    </div>
                    <div id="awards_movie_year" class="k_funding_upload_head_limit">
                        <input type="number" class="k_funding_upload_movie_year" placeholder="작품 년도" name="directorAwardYears" min="1900" max="2024" oninput="validateYearInput(this)">
                    </div>
                </div>
                <div class="k_funding_upload_career">
                    영화제 상영 및 수상작과 수상 년도를 작성해주세요.예) 2022 Nshville Film Festival / 예) 2022
                </div>
                <div class="k_funding_upload_career">
                    영화제 상영 및 수상작은 최대 10까지 등록 가능합니다.
                </div>
                <div class="k_custom_flex">
                    <div class="k_funding_upload_titles k_funding_upload_pride">출연 배우<span class="k_star_class">*</span></div>
                    <button type="button" class="k_plus_button" onclick="plusActor()">
                        <img src="/images/icons/plus.png">
                    </button>
                    <button type="button" class="k_minus_button" onclick="minusActor()">
                        <img src="/images/icons/minus.png" class="k_minus_img">
                    </button>
                </div>

            </div>
            <div class="k_funding_directer_career">
                <div id="movie_actor" class="k_career_movie_style">
                    <input type=text class="k_funding_awards_movie_input j_special_check" placeholder="배우 이름" name="actors" oninput="setDefaultIfEmpty(this, '미정')">
                </div>
                <div id="movie_actor_role" class="k_funding_upload_head_limit">
                    <input type="text" class="k_funding_upload_movie_year j_special_check" placeholder="배역" name="actorRoles" oninput="setDefaultIfEmpty(this, '미정')">
                </div>
            </div>

            <div class="k_funding_upload_container_three k_funding_upload_titles">
                <div class="container mt-3" id="k_table_staff">
                    <p>스태프</p><p class="k_star_class">*</p>
                    <table class="table table-bordered rounded-0" id="k_table">
                        <tbody id="k_table_body">
                        <tr>
                            <th>감독</th>
                            <td>
                                <input class="j_special_check" type="text" name="staff.director">
                            </td>
                            <th>각본</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.script">
                            </td>
                        </tr>
                        <tr>
                            <th>촬영</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.filming">
                            </td>
                            <th>조명</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.lighting">
                            </td>
                        </tr>
                        <tr>
                            <th>미술</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.art">
                            </td>
                            <th>편집</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.editing">
                            </td>
                        </tr>
                        <tr>
                            <th>사운드</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.sound">
                            </td>
                            <th>음악</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.music">
                            </td>
                        </tr>
                        <tr>
                            <th>의상</th>
                            <td>
                                <input type="text" class="j_special_check" name="staff.clothes">
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
    <div class="k_custom_gif_container">
        <img src="/images/icons/down-arrow.gif" class="k_custom_gif">
        <%--        <div style="width: 30px"></div>--%>
        <%--        <img src="/images/icons/down-arrow.gif" class="k_custom_gif">--%>
    </div>
    <div class="k_funding_save_form">
        <button type="submit" class="k_custom_button">
            <p>펀딩 등록하기</p>
        </button>
    </div>
</form>


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

    function changeUserPic(inputId, containerId, styleClass, e1) {
        let f = e1.srcElement.files[0];
        console.log(f.type);
        if (!f.type.match("image.*")) {
            alert("이미지를 등록해주세요");
            return;
        }
        let reader = new FileReader();
        reader.onload = function (e2) {
            let previewEl = document.querySelector("#" + inputId);
            let parentContainer = document.querySelector("#" + containerId);
            parentContainer.innerHTML = '';

            let newImg = document.createElement("img");
            newImg.setAttribute("src", e2.target.result);

            let parentElement = document.getElementById(containerId);
            parentElement.appendChild(newImg);
            newImg.classList.add(styleClass);
            previewEl.setAttribute("src", e2.target.result);
        }
        reader.readAsDataURL(f);
    }

    let photoCount = 1;

    function addPhotoField() {
        if(photoCount > 4){
            alert("최대 5장까지만 추가할 수 있습니다.")
            return;
        }
        // 새로운 레이블 생성
        let newLabel = document.createElement("label");
        newLabel.setAttribute("id", "movie" + photoCount);
        newLabel.setAttribute("for", "photo" + photoCount);
        newLabel.className = "k_funding_upload_select_photo_pic_receive";
        newLabel.innerHTML = '<img src="/images/icons/add_camera.png" class="k_camera_icon">' +
            '<span class="k_star_class"></span>';

        // 새로운 인풋 필드 생성
        let newInput = document.createElement("input");
        newInput.setAttribute("type", "file");
        newInput.setAttribute("id", "photo" + photoCount);
        newInput.setAttribute("name", "moviePhotos");
        newInput.setAttribute("accept", "image/*");
        newInput.setAttribute("onchange", "changeUserPic(this.id, 'movie" + photoCount + "', 'k_funding_movie_pic_style', event)");
        newInput.className = "k_funding_upload_label";

        // 컨테이너에 새로운 레이블과 인풋 필드 추가
        document.getElementById("pic_plus").appendChild(newLabel);
        document.getElementById("pic_plus").appendChild(newInput);

        // photoCount 증가
        photoCount++;
    }

    function deletePhotoField() {
        if(photoCount < 2) {
            alert("더 이상 삭제할 수 없습니다.");
            return;
        }
        // 삭제할 요소의 ID로 해당 요소를 찾아서 제거
        document.getElementById('movie' + (photoCount - 1)).remove();
        document.getElementById("photo" + (photoCount - 1)).remove();

        // photoCount 감소
        photoCount--;
    }

    let careerCount = 1;

    //
    function plusCareerMovie(){
        if(careerCount > 9) {
            alert("최대 10개까지 추가 가능합니다.");
            return;
        }
        let marginTopPx = 47 * careerCount;
        let InputCm = document.createElement("input");
        InputCm.setAttribute("type", "text");
        InputCm.setAttribute("id", "career_movie" + careerCount);
        InputCm.setAttribute("placeholder", "작품 이름");
        InputCm.setAttribute("name", "directorCareers");
        InputCm.className = "k_funding_upload_career_input";

        let InputCmY = document.createElement("input");
        InputCmY.setAttribute("type", "text");
        InputCmY.setAttribute("id", "career_movie_year" + careerCount);
        InputCmY.setAttribute("placeholder", "작품 년도");
        InputCmY.setAttribute("name", "directorCareerYears");
        InputCmY.className = "k_funding_upload_movie_year";

        let InputMarginTop = document.createElement("div");
        InputMarginTop.setAttribute("id","k_cm_margin_top" + careerCount);
        InputMarginTop.setAttribute("style","margin-top: "+ marginTopPx + "px;");


        // 컨테이너에 새로운 레이블과 인풋 필드 추가
        document.getElementById("career_movie").appendChild(InputCm);
        document.getElementById("career_movie_year").appendChild(InputCmY);
        document.getElementById("k_cm_margin_top").appendChild(InputMarginTop);
        careerCount++;
    }

    function minusCareerMovie(){
        if(careerCount < 2) {
            alert("더 이상 삭제할 수 없습니다.");
            return;
        }
        // 삭제할 요소의 ID로 해당 요소를 찾아서 제거
        document.getElementById('career_movie' + (careerCount- 1)).remove();
        document.getElementById("career_movie_year" + (careerCount - 1)).remove();
        document.getElementById("k_cm_margin_top" + (careerCount - 1)).remove();


        // careerCount 감소
        careerCount--;
    }

    let awardsCount = 1;


    function plusAwardsMovie(){
        if(awardsCount > 9) {
            alert("최대 10개까지 추가 가능합니다.");
            return;
        }
        let marginTopPx = 47 * awardsCount;
        let InputAm = document.createElement("input");
        InputAm.setAttribute("type", "text");
        InputAm.setAttribute("id", "awards_movie" + awardsCount);
        InputAm.setAttribute("placeholder", "작품 이름");
        InputAm.setAttribute("name", "directorAwards");
        InputAm.className = "k_funding_awards_movie_input";

        let InputAmY = document.createElement("input");
        InputAmY.setAttribute("type", "text");
        InputAmY.setAttribute("id", "awards_movie_year" + awardsCount);
        InputAmY.setAttribute("placeholder", "작품 년도");
        InputAmY.setAttribute("name", "directorAwardYears");
        InputAmY.className = "k_funding_upload_movie_year";

        // let InputMarginTop = document.createElement("div");
        // InputMarginTop.setAttribute("id","k_am_margin_top" + awardsCount);
        // InputMarginTop.setAttribute("style","margin-top: "+ marginTopPx + "px;");


        // 컨테이너에 새로운 레이블과 인풋 필드 추가
        document.getElementById("awards_movie").appendChild(InputAm);
        document.getElementById("awards_movie_year").appendChild(InputAmY);
        // document.getElementById("k_am_margin_top").appendChild(InputMarginTop);
        awardsCount++;
    }

    function minusAwardsMovie(){
        if(awardsCount < 2) {
            alert("더 이상 삭제할 수 없습니다.");
            return;
        }
        // 삭제할 요소의 ID로 해당 요소를 찾아서 제거
        document.getElementById("awards_movie" + (awardsCount- 1)).remove();
        document.getElementById("awards_movie_year" + (awardsCount - 1)).remove();
        // document.getElementById("k_cm_margin_top" + (awardsCount - 1)).remove();

        // awardsCount 감소
        awardsCount--;
    }

    let actorCount = 1;


    function plusActor(){
        if(actorCount > 9) {
            alert("최대 10개까지 추가 가능합니다.");
            return;
        }
        let InputAm = document.createElement("input");
        InputAm.setAttribute("type", "text");
        InputAm.setAttribute("id", "movie_actor" + actorCount);
        InputAm.setAttribute("placeholder", "배우 이름");
        InputAm.setAttribute("name", "actors");
        InputAm.className = "k_funding_awards_movie_input";

        let InputAmY = document.createElement("input");
        InputAmY.setAttribute("type", "text");
        InputAmY.setAttribute("id", "movie_actor_role" + actorCount);
        InputAmY.setAttribute("placeholder", "배역");
        InputAmY.setAttribute("name", "actorRoles");
        InputAmY.className = "k_funding_upload_movie_year";

        // let InputMarginTop = document.createElement("div");
        // InputMarginTop.setAttribute("id","k_am_margin_top" + awardsCount);
        // InputMarginTop.setAttribute("style","margin-top: "+ marginTopPx + "px;");


        // 컨테이너에 새로운 레이블과 인풋 필드 추가
        document.getElementById("movie_actor").appendChild(InputAm);
        document.getElementById("movie_actor_role").appendChild(InputAmY);
        // document.getElementById("k_am_margin_top").appendChild(InputMarginTop);
        actorCount++;
    }

    function minusActor(){
        if(actorCount < 2) {
            alert("더 이상 삭제할 수 없습니다.");
            return;
        }
        // 삭제할 요소의 ID로 해당 요소를 찾아서 제거
        document.getElementById("movie_actor" + (actorCount- 1)).remove();
        document.getElementById("movie_actor_role" + (actorCount - 1)).remove();
        // document.getElementById("k_cm_margin_top" + (awardsCount - 1)).remove();

        // awardsCount 감소
        actorCount--;
    }

    function handleClick(element) {
        alert('변경 불가능한 값입니다.');
    }

    function setDefaultIfEmpty(inputElement, defaultValue) {
        if (inputElement.value === '') {
            inputElement.value = defaultValue;
        }
    }

    // 올바른 연도 값만 입력가능
    function validateYearInput(inputElement) {
        var year = inputElement.value.trim();

        if (year.length === 4) {
            year = parseInt(year);

            if (isNaN(year) || year < 1900 || year > 2024) {
                alert("올바른 년도를 입력하세요 (1900부터 2024까지).");
                inputElement.value = '';
            }
        } else {
            // 입력이 4자리가 아니면 여기에서 다른 처리를 할 수 있습니다.
            // 현재는 아무 동작도 하지 않고 있습니다.
        }

        if (!inputElement.value.trim()) {
            inputElement.value = '2024';
        }
    }

    // 특정 클래스가 설정된 인풋 요소들을 선택합니다.
    var inputElements = document.querySelectorAll('.j_special_check');

    // 각각의 인풋 요소에 대해 이벤트 리스너를 등록합니다.
    inputElements.forEach(function(inputElement) {
        inputElement.addEventListener('input', function(event) {
            // 입력된 값에서 특수문자 여부를 확인합니다.
            var inputValue = event.target.value;
            var containsSpecialCharacters = /[!@#$%^&*(),.?":{}|<>]/.test(inputValue);

            // 특수문자가 포함된 경우 해당 특수문자를 찾아서 제거합니다.
            if (containsSpecialCharacters) {
                var modifiedValue = inputValue.replace(/[!@#$%^&*(),.?":{}|<>]/g, '');
                event.target.value = modifiedValue;
                alert('특수문자는 사용 불가능합니다.');
            }
        });
    });


</script>
<%@ include file="../layout/footer.jsp" %>

