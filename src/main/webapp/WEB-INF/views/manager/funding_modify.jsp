<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
    <!-- 달력 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <script src="/js/jys/dropdown.js"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <!-- 포트원 결제하기  -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- uuid 사용하기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.3.2/uuid.min.js"></script>
    <script src="/js/jys/keywordset.js"></script>
    <link href="/css/style.css" rel="stylesheet">
    <!-- 카카오 결제하기  -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- 카카오 환불하기   -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>


    <title>IndieFliker</title>
</head>
<body>
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
                    <c:choose>
                        <c:when test="${adminFundingUpdateFormDTO.movieThumbnail != null}">
                            <img src="${adminFundingUpdateFormDTO.movieThumbnail}" class="k_funding_upload_select_photo_pic2">
                            </label>
                        </c:when>
                        <c:otherwise>
                             <i id="fa-camera" class="fas fa-camera"></i>사진 선택 <span class="k_star_class">*</span></label>
                        </c:otherwise>
                    </c:choose>
                <input type="file" id="thumbnail" accept="image/*" onchange="callMultipleFunctionsAboutThumbnail(this)" class="k_funding_upload_label">
                <input type="hidden" name="movieThumbnail" value="${adminFundingUpdateFormDTO.movieThumbnail}">

            </div>
                <br>

            <div class="grade_wrap">
                <div class="k_custom_margin">
                    <div class="k_funding_upload_movie_level k_funding_upload_grade_title k_text_no_wrap">영화 상영 등급 <span class="k_star_class">*</span></div>
                    <div class="k_funding_upload_movie_level k_funding_upload_grade_title k_text_no_wrap k_margin_top55">배급사 <span class="k_star_class">*</span></div>
                </div>
                <div>
                    <select class="k_custom_select_option" name="runningGrade" id="j_running_grade_select">
                        <option value="전체 관람가">전체 관람가</option>
                        <option value="12세 이상 관람가">12세 이상 관람가</option>
                        <option value="15세 이상 관람가">15세 이상 관람가</option>
                        <option value="청소년 관람 불가">청소년 관람 불가</option>
                    </select>
                    <input type="text" class="k_funding_upload_schedule_date k_margin_production" placeholder="배급사" name="production" value="${adminFundingUpdateFormDTO.production}">
                </div>
            </div>

        </div>
        <div class="k_funding_upload_container_two">
            <div class="k_funding_upload_first_title">영화 제목
                <span class="k_star_class">*</span>
            </div>
            <input type=text class="k_funding_upload_movie_name" name="movieTitle" value="${adminFundingUpdateFormDTO.movieName}">
        </div>
        <div class="k_funding_upload_container_third">
            <div id="k_fund">
                <div class="k_funding_upload_fund_titles">펀딩 기간 <span class="k_star_class">*</span>
                    <div class="k_funding_upload_funding_date">1년 이내만 가능</div>
                </div>
                <input type="text" id="firstDay" class="k_funding_upload_first_date" placeholder="펀딩 시작일" name="fundingPeriodStart" value="${adminFundingUpdateFormDTO.fundingReleaseDate}">
                <input type="text" id="lastDay" class="k_funding_upload_last_date" placeholder="펀딩 마감일" name="fundingPeriodEnd" value="${adminFundingUpdateFormDTO.fundingEndDate}">
            </div>
            <div class="k_funding_upload_titles k_funding_upload_movie_schedule">(온라인) 상영 예정일
                <span class="k_star_class">*</span>
            </div>
            <input type="text" id="limitDay" class="k_funding_upload_schedule_date" placeholder="상영 예정일" name="dDay" value="${adminFundingUpdateFormDTO.DDay}">
        </div>
        <div class="k_funding_genre_container">
            <div class="k_funding_genre_grade_title">영화 장르<span class="k_star_class">*</span></div>
            <select class="k_funding_genre_select_option" name="genre" id="j_genre_select">
            <option value="극영화">극영화</option>
            <option value="애니메이션">애니메이션</option>
            <option value="다큐멘터리">다큐멘터리</option>
            <option value="실험영화">실험영화</option>
            </select>

            <div class="k_funding_make_year k_funding_upload_movie_schedule">제작 년도
                <span class="k_star_class">*</span>
            </div>
            <input id="k_place_holder" type="text" class="k_funding_upload_schedule_date" placeholder="제작년도" name="makeYear" value="${adminFundingUpdateFormDTO.makeYear}">
        </div>

        <div class="k_funding_genre_container">
            <div class="k_funding_genre_grade_title">펀딩 목표금액<span class="k_star_class">*</span></div>
            <select class="k_funding_genre_select_option" name="targetPrice" id="j_target_price_select">
                <option value="50000000">5천만원</option>
                <option value="100000000">1억원</option>
                <option value="150000000">1억 5천만원</option>
                <option value="200000000">2억원</option>
                <option value="250000000">2억 5천만원</option>
                <option value="300000000">3억원</option>
                <option value="350000000">3억 5천만원</option>
                <option value="400000000">4억원</option>
                <option value="450000000">4억 5천만원</option>
                <option value="500000000">5억원</option>
            </select>

            <div class="k_funding_make_year k_funding_upload_movie_schedule">1회 펀딩금액
                <span class="k_star_class">*</span>
            </div>
            <input type="text" class="k_funding_upload_schedule_date k_background_color" name="pricePerOnetime" value="8000" onclick="handleClick(this);" readonly>
            <input type="hidden" id="j_target_price" value="${adminFundingUpdateFormDTO.targetPrice}">
            <input type="hidden" id="j_running_grade" value="${adminFundingUpdateFormDTO.runningGrade}">
            <input type="hidden" id="j_genre" value="${adminFundingUpdateFormDTO.genre}">
            <input type="hidden" id="photoListCount" value="${adminFundingUpdateFormDTO.splitStringToList(adminFundingUpdateFormDTO.moviePhotos).size()}">
            <input type="hidden" id="careerCount" value="${adminFundingUpdateFormDTO.splitStringToListCustom(adminFundingUpdateFormDTO.directorCareers).size()}">
        </div>



        <div class="k_margin_top">
            <div class="k_funding_upload_container_two">
                <div class="k_funding_upload_middle_title k_funding_upload_titles">시놉시스
                    <span class="k_star_class">*</span>
                </div>
            </div>
            <div class="k_funding_upload_container_two">
                <textarea class="k_funding_upload_sibnob" name="synopsis">${adminFundingUpdateFormDTO.synopsis}</textarea>
            </div>
        </div>
        <div class="k_margin_top">
            <div class="k_funding_upload_container_two">
                <div class="k_funding_upload_middle_title k_funding_upload_titles">연출의도
                    <span class="k_star_class">*</span>
                </div>
            </div>
            <div class="k_funding_upload_container_two">
                <textarea class="k_funding_upload_sibnob" name="directingIntension">${adminFundingUpdateFormDTO.directingIntension}</textarea>
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
             <c:forEach var="photo" items="${adminFundingUpdateFormDTO.splitStringToList(adminFundingUpdateFormDTO.moviePhotos)}" varStatus="status">
                 <label id="movie_pic${status.index}" for="movie_photo${status.index}" class="k_funding_upload_select_photo_pic">
                 <c:choose>
                     <c:when test="${photo != null}">
                         <img src="${photo}" class="k_funding_upload_select_photo_pic"></label>
                     </c:when>
                     <c:otherwise>
                         <i id="fa-camera" class="fas fa-camera"></i>사진 선택 <span class="k_star_class">*</span></label>
                     </c:otherwise>
                 </c:choose>
                 <input type="file" id="movie_photo${status.index}" name="moviePhotos" accept="image/*" onchange="changeUserPic(this.id, 'movie_pic${status.index}', 'k_funding_movie_pic_style', event)" class="k_funding_upload_label">
             </c:forEach>
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
                        <c:choose>
                             <c:when test="${adminFundingUpdateFormDTO.directorPhoto != null}">
                              <img src="${adminFundingUpdateFormDTO.directorPhoto}" class="k_funding_upload_select_photo_pic"></label>
                             </c:when>
                        <c:otherwise>
                            <i id="fa-camera" class="fas fa-camera"></i>사진 선택 <span class="k_star_class">*</span></label>
                        </c:otherwise>
                        </c:choose>
                    </label>
                    <input type="file" id="director_photo" name="directorPhoto" accept="image/*" onchange="changeUserPic(this.id, 'director_pic', 'k_funding_movie_director_style', event)" class="k_funding_upload_label">
                    <br>
                <div class="k_funding_directer_career">
                    <div id="career_movies" class="k_career_movie_style">
                        <c:forEach var="careerMovie" items="${adminFundingUpdateFormDTO.extractNames(adminFundingUpdateFormDTO.splitStringToListCustom(adminFundingUpdateFormDTO.directorCareers))}" varStatus="status">
                            <input type=text id="career_movie${status.index}" class="k_funding_upload_career_input" placeholder="작품 이름" name="directorCareers" value="${careerMovie}"}>
                        </c:forEach>
                    </div>
                    <div id="career_movie_years" class="k_funding_upload_head_limit">
                        <c:forEach var="careerYear" items="${adminFundingUpdateFormDTO.extractYears(adminFundingUpdateFormDTO.splitStringToListCustom(adminFundingUpdateFormDTO.directorCareers))}" varStatus="status">
                            <input type="text" id="career_movie_year${status.index}"  class="k_funding_upload_movie_year" placeholder="작품 년도" name="directorCareerYears" value="${careerYear}">
                        </c:forEach>

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
                    <input type=text class="k_funding_awards_movie_input" placeholder="작품 이름" name="directorAwards">
                </div>
                <div id="awards_movie_year" class="k_funding_upload_head_limit">
                    <input type="text" class="k_funding_upload_movie_year" placeholder="작품 년도" name="directorAwardYears">
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
                <input type=text class="k_funding_awards_movie_input" placeholder="배우 이름" name="actors">
            </div>
            <div id="movie_actor_role" class="k_funding_upload_head_limit">
                <input type="text" class="k_funding_upload_movie_year" placeholder="배역" name="actorRoles">
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
                            <input type="text" name="staff.director" value="${adminFundingUpdateFormDTO.staff.director}">
                        </td>
                        <th>각본</th>
                        <td>
                            <input type="text" name="staff.script" value="${adminFundingUpdateFormDTO.staff.script}">
                        </td>
                    </tr>
                    <tr>
                        <th>촬영</th>
                        <td>
                            <input type="text" name="staff.filming" value="${adminFundingUpdateFormDTO.staff.filming}">
                        </td>
                        <th>조명</th>
                        <td>
                            <input type="text" name="staff.lighting" value="${adminFundingUpdateFormDTO.staff.lighting}">
                        </td>
                    </tr>
                    <tr>
                        <th>미술</th>
                        <td>
                            <input type="text" name="staff.art" value="${adminFundingUpdateFormDTO.staff.art}">
                        </td>
                        <th>편집</th>
                        <td>
                            <input type="text" name="staff.editing" value="${adminFundingUpdateFormDTO.staff.editing}">
                        </td>
                    </tr>
                    <tr>
                        <th>사운드</th>
                        <td>
                            <input type="text" name="staff.sound" value="${adminFundingUpdateFormDTO.staff.sound}">
                        </td>
                        <th>음악</th>
                        <td>
                            <input type="text" name="staff.music" value="${adminFundingUpdateFormDTO.staff.music}">
                        </td>
                    </tr>
                    <tr>
                        <th>의상</th>
                        <td>
                            <input type="text" name="staff.clothes" value="${adminFundingUpdateFormDTO.staff.clothes}">
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
    <div class="k_funding_save">
        <button type="submit" class="k_custom_button">
            <p>펀딩 등록하기</p>
        </button>
    </div>
</form>

<script>
    // 서버에서 받은 데이터 예시
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
    let careerCount = 0;
    let photoCount = 0;
    var serverTargetPrice = document.getElementById('j_target_price').value;
    var serverRunningGrade = document.getElementById('j_running_grade').value;
    let serverGenre = document.getElementById('j_genre').value;

    window.onload = function () {
        careerCount = document.getElementById('careerCount').value;
        photoCount = document.getElementById('photoListCount').value;
        console.log("안녕하세요" + careerCount)

        // JavaScript로 옵션 선택
        var selectTargetPrice = document.getElementById('j_target_price_select');
        for (var i = 0; i < selectTargetPrice.options.length; i++) {
            if (selectTargetPrice.options[i].value === serverTargetPrice) {
                selectTargetPrice.options[i].selected = true;
                break;
            }
        }

        var selectRunningGrade = document.getElementById('j_running_grade_select');
        for (var i = 0; i < selectRunningGrade.options.length; i++) {
            if (selectRunningGrade.options[i].value === serverRunningGrade) {
                selectRunningGrade.options[i].selected = true;
                break;
            }
        }

        var selectGenre = document.getElementById('j_genre_select');
        for (var i = 0; i < selectGenre.options.length; i++) {
            if (selectGenre.options[i].value === serverGenre) {
                selectGenre.options[i].selected = true;
                break;
            }
        }

        for (var i = 0; i< careerCount; i++) {
            let marginTopPx = 47 * (i);
            let InputMarginTop = document.createElement("div");
            InputMarginTop.setAttribute("id", "k_cm_margin_top" + i);
            InputMarginTop.setAttribute("style", "margin-top: " + marginTopPx + "px;");
            document.getElementById("k_cm_margin_top").appendChild(InputMarginTop);
        }
    }


    function addPhotoField() {
        console.log('로그 포토카운트');
        console.log(photoCount);
        if(photoCount > 4){
            alert("최대 5장까지만 추가할 수 있습니다.")
            return;
        }
        // 새로운 레이블 생성
        let newLabel = document.createElement("label");
        newLabel.setAttribute("id", "movie_pic" + photoCount);
        newLabel.setAttribute("for", "movie_photo" + photoCount);
        newLabel.className = "k_funding_upload_select_photo_pic_receive";
        var photoUrl = '${photo}';
        if (photoUrl !== '0') {
            var imgElement = document.createElement("img");
            imgElement.src = "${photo}";
            imgElement.className = "fas fa-camera";
            newLabel.appendChild(imgElement);
        } else {
            var iElement = document.createElement("i");
            iElement.id = "fa-camera";
            iElement.className = "fas fa-camera";
            newLabel.appendChild(iElement);

            var textNode = document.createTextNode("사진 선택 ");
            newLabel.appendChild(textNode);

            var spanElement = document.createElement("span");
            spanElement.className = "k_star_class";
            spanElement.appendChild(document.createTextNode("*"));
            newLabel.appendChild(spanElement);
        }
        // 새로운 인풋 필드 생성
        let newInput = document.createElement("input");
        newInput.setAttribute("type", "file");
        newInput.setAttribute("id", "movie_photo" + photoCount);
        newInput.setAttribute("name", "moviePhotos");
        newInput.setAttribute("accept", "image/*");
        newInput.setAttribute("onchange", "changeUserPic(this.id, 'movie_pic" + photoCount + "', 'k_funding_movie_pic_style', event)");
        newInput.className = "k_funding_upload_label";

        // 컨테이너에 새로운 레이블과 인풋 필드 추가
        document.getElementById("pic_plus").appendChild(newLabel);
        document.getElementById("pic_plus").appendChild(newInput);

        // photoCount 증가
        photoCount++;
    }

    function deletePhotoField() {
        if(photoCount <= 0) {
            alert("더 이상 삭제할 수 없습니다.");
            return;
        }
        // 삭제할 요소의 ID로 해당 요소를 찾아서 제거
        document.getElementById('movie_pic' + (photoCount-1)).remove();
        document.getElementById('movie_photo' + (photoCount-1)).remove();

        // photoCount 감소
        photoCount--;
        console.log("포토카운트 : " + photoCount )
    }


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
        document.getElementById("career_movies").appendChild(InputCm);
        document.getElementById("career_movie_years").appendChild(InputCmY);
        document.getElementById("k_cm_margin_top").appendChild(InputMarginTop);
        careerCount++;
    }

    function minusCareerMovie(){

        document.getElementById('career_movie' + (careerCount - 1)).remove();
        document.getElementById('career_movie_year' + (careerCount - 1)).remove();
        document.getElementById('k_cm_margin_top' + (careerCount - 1)).remove();


        // careerCount 감소
        careerCount--;
        console.log("커리어카운트" + careerCount)
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


    //수정할 사진을 선택하지 않았을 때 기존 사진이 들어가게 하고, 사진을 선택하면 업로드한 사진의 값이 히든 인풋의 밸류에 들어가게하기
    function updateHiddenInput(inputFile) {
        var hiddenInput = document.getElementById('movieThumbnail');
        // 파일이 선택되었을 때만 hidden input의 값을 업데이트
        if (inputFile.files.length > 0) {
            var file = inputFile.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                hiddenInput.value = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    function callMultipleFunctionsAboutThumbnail(inputFile) {
        updateHiddenInput(inputFile);
        changeUserPic('thumbnail', 'basicPic', 'k_funding_thumbnail_style', event);
    }


</script>
<%@ include file="../layout/footer.jsp" %>

