<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="n_flex_center">
        <div class="n_thousand_add_body">
            <div class="body n_body">
                <div class="row justify-content-center n_row">
                    <!-- 펀딩 영화 상세 내용-->
                    <div class="n_detail_info">
                        <!-- 펀딩 영화 대표 이미지 -->
                        <div class="n_first_movie_img">
                            <img id="n_movie_img" src="${offlineMovieDetailDTO.movieThumbnail}">
                        </div>
                        <!-- 펀드/환불 설명 -->
                        <div id="n_fund_attention">
                            <div>
                                <ul>
                                    <li onclick="selectFund()">
                                        <span class="n_fund" aria-hidden="true">
                                            <img id="n_fund" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTYuMDMxMjUgMjguODI0SDI1Ljk1OTJDMjcuMDU1MyAyOC44MjQgMjcuOTU5MiAyNy45MiAyNy45NTEyIDI2LjgyNFYxMy41SDI5VjlDMjkgNy44OTU0MyAyOC4xMDQ2IDcgMjcgN0g1QzMuODk1NDMgNyAzIDcuODk1NDMgMyA5VjEzLjUwMDFINC4wMzEyNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRaIiBmaWxsPSIjQjlFRUVFIi8+CjxwYXRoIGQ9Ik0xNiA2LjVDMTguMDMzIDQuMDE4NDkgMjAuMTIxMyAyLjcxMTEzIDIxLjExMTcgMi40NjM1M0MyMi42NDc3IDIuMDcxNTMgMjMuNzE5NyAzLjc0MzUzIDIyLjY1NTcgNC45MTE1M0MyMS45MjYxIDUuNzExNzYgMjAuODc5IDYuNDI0MDQgMTkuNSA2Ljg2NSIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTE2IDYuNUMxMy45MzY5IDMuOTcyMTcgMTEuODc3NiAyLjcxMzA5IDEwLjg4NjEgMi40NjM1M0M5LjM1MDE0IDIuMDcxNTMgOC4yNzgxNCAzLjc0MzUzIDkuMzQyMTQgNC45MTE1M0M5LjkwNzcyIDUuNTMxODUgMTEuMzMyNiA2LjMzMTg3IDEyLjUgNi44MDk4MiIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTQuMDMxMjUgMTMuNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRIMjUuOTU5MkMyNy4wNTUyIDI4LjgyNCAyNy45NTkyIDI3LjkyIDI3Ljk1MTIgMjYuODI0VjEzLjQ5OTkiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjguNzgzIDEzLjU2NzhWOC44Mzk4NEMyOC43ODMgNy43MzU4NCAyNy44ODcgNi44Mzk4NCAyNi43ODMgNi44Mzk4NEg1LjIwNzAzQzQuMTAzMDMgNi44Mzk4NCAzLjIwNzAzIDcuNzM1ODQgMy4yMDcwMyA4LjgzOTg0VjEzLjU2NzhIMjguNzgzWiIgc3Ryb2tlPSIjMjEyNTI5Ii8+CjxwYXRoIGQ9Ik0xNS45NzQ2IDYuNzUxOTVWMjguODI0IiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8L3N2Zz4K">
                                        </span>
                                        <span style="font-size: 11px;">펀딩</span>
                                    </li>
                                    <li onclick="selectRefund()">
                                        <span class="n_refund" aria-hidden="true">
                                        <img id="n_refund" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3QgeD0iNy41IiB5PSI3LjUiIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyIgcng9IjEiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjIuMjc2NSA1LjMzNzIzTDIxLjUgMi40Mzk0NUwyNC4zOTc4IDEuNjYzIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE2IDEuNUM3Ljk5MTg3IDEuNSAxLjUgNy45OTE4NyAxLjUgMTZDMS41IDI0LjAwODEgNy45OTE4NyAzMC41IDE2IDMwLjVDMjQuMDA4MSAzMC41IDMwLjUgMjQuMDA4MSAzMC41IDE2QzMwLjUgMTAuNzM2OCAyNy42OTU4IDYuMTI4NTcgMjMuNSAzLjU4NzgyQzIzLjAxNzcgMy4yOTU3NSAyMi41MTcgMy4wMzEwMSAyMiAyLjc5NTczIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE0LjUgOFYxMUgxNy41VjgiIHN0cm9rZT0iIzIxMjUyOSIvPgo8L3N2Zz4K">
                                        </span>
                                        <span style="font-size: 11px;">환불</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="n_attention">
                                <p id="n_info">인디픽터 펀딩은 영화를 단순히 관람하는 것이 아닌 <strong>독립영화의 새로운 작품 제작 과정 지원·상영·사회적 가치</strong>를 확산해요.</p>
                            </div>
                        </div>
                        <!-- 펀딩 영화 정보 -->
                        <div id="n_movie_info">
                            <div>
                                <h2>프로젝트 시나리오</h2>
                            </div>
                            <div class="n_movie_text">
                                <h3>시놉시스</h3>
                                <p>
                                    ${offlineMovieDetailDTO.synopsis}
                                </p>
                            </div>
                            <div class="n_movie_text">
                                <h3>연출의도</h3>
                                <p>
                                    ${offlineMovieDetailDTO.directingIntension}
                                </p>
                            </div>
                            <div class="n_movie_img">
                                <div class="n_movie_img">
                                    <h3>포토</h3>
                                    <c:forEach var="photo" items="${offlineMovieDetailDTO.moviePhotos}" >
                                        <img src="${photo}">
                                    </c:forEach>
                                </div>
                            </div>
                            <span id="n_toggle_more" style="display: none">
                                <div class="n_movie_text">
                                    <h3>감독 작품 경력</h3>
                                    <img id="n_director_img" src="${offlineMovieDetailDTO.directorPic}" alt="">
                                    <h5>${offlineMovieDetailDTO.director}</h5>
                                    <p>
                                        ${offlineMovieDetailDTO.directorCareers}
                                    </p>
                                </div>
                                <div class="n_movie_text">
                                    <h3>영화제 상영 및 수상작</h3>
                                    <p>
                                        ${offlineMovieDetailDTO.directorAwardsFilm}
                                    </p>
                                </div>
                                <div class="n_movie_text">
                                    <h3>스태프</h3>
                                    <table class="table table-bordered n_staff_table">
                                        <tbody>
                                        <tr>
                                            <th>감독</th>
                                            <td>${offlineMovieDetailDTO.director}</td>
                                            <th>각본</th>
                                            <td>${offlineMovieDetailDTO.script}</td>
                                        </tr>
                                        <tr>
                                            <th>촬영</th>
                                            <td>${offlineMovieDetailDTO.filming}</td>
                                            <th>조명</th>
                                            <td>${offlineMovieDetailDTO.lighting}</td>
                                        </tr>
                                        <tr>
                                            <th>미술</th>
                                            <td>${offlineMovieDetailDTO.art}</td>
                                            <th>편집</th>
                                            <td>${offlineMovieDetailDTO.editing}</td>
                                        </tr>
                                        <tr>
                                            <th>사운드</th>
                                            <td>${offlineMovieDetailDTO.sound}</td>
                                            <th>음악</th>
                                            <td>${offlineMovieDetailDTO.music}</td>
                                        </tr>
                                        <tr>
                                            <th>의상</th>
                                            <td colspan="3">${offlineMovieDetailDTO.clothes}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </span>
                            <button id="n_toggle_button" onclick="toggleMore()">프로젝트 더 보기</button>
                            <input type="hidden" id="k_funding_id" value="${fundingDetailDTO.fundingId}">
                        </div>
                        <!-- 기대되는 영화 목록 -->
                        <div id="n_more_movie">
                            <h4>기대되는 좋은 영화들</h4>
                            <div class="n_movie_list">
                                <c:forEach var="fund" items="${moviesByMainDTOs}">
                                    <div class="row n_more_movie">
                                        <a href="/fund/funding/${fund.fundingId}"><img src="${fund.movieThumbnail}"></a>
                                        <p class="n_achieve">${fund.fundingRate}%달성</p>
                                        <p class="n_title">${fund.movieName}</p>
                                        <p class="n_content">${fund.synopsis}</p>
                                        <p class="n_directer">${fund.production}</p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!-- 결제 관련 상세 내역-->
                    <div class="n_detail_pay">
                        <div class="n_sell_info">
                            <div class="n_movie_category">
                                <p id="n_sharp">#</p>
                                <p id="n_category">${offlineMovieDetailDTO.genre}</p>
                            </div>
                            <div class="n_sell_img">
                                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik05LjYxNTIzIDQuNzg0OTVDOS42MTUyMyA0Ljc4NDk1IDEzLjA3NTIgNC4yNTk5NSAxNC4xNjAyIDMuMDY5OTVDMTQuODI1MiAyLjMzOTk1IDE0LjE1NTIgMS4yOTQ5NSAxMy4xOTUyIDEuNTM5OTVDMTIuNDU1MiAxLjcyNDk1IDExLjMxMDIgMi40MDk5NSA5LjYxNTIzIDQuNzg0OTVaIiBzdHJva2U9IiMwMDhFOTEiIHN0cm9rZS13aWR0aD0iMS4yOCIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTEwLjM4NDggNC43ODQ5NUMxMC4zODQ4IDQuNzg0OTUgNi45MjQ4MSA0LjI1OTk1IDUuODM5ODEgMy4wNjk5NUM1LjE3NDgxIDIuMzM5OTUgNS44NDQ4MSAxLjI5NDk1IDYuODA0ODEgMS41Mzk5NUM3LjUzOTgxIDEuNzI0OTUgOC42ODQ4MSAyLjQwOTk1IDEwLjM4NDggNC43ODQ5NVoiIHN0cm9rZT0iIzAwOEU5MSIgc3Ryb2tlLXdpZHRoPSIxLjI4Ii8+CjxwYXRoIGQ9Ik0xNi4yMjQ1IDE4LjAxNDlIMy43Njk1M0MzLjA3OTUzIDE4LjAxNDkgMi41MTk1MyAxNy40NTQ5IDIuNTE5NTMgMTYuNzY0OVY1LjQxOTkxQzIuNTE5NTMgNC43OTQ5MSAzLjAyOTUzIDQuMjg0OTEgMy42NTQ1MyA0LjI4NDkxSDE2LjMzNDVDMTYuOTU5NSA0LjI4NDkxIDE3LjQ2OTYgNC43OTQ5MSAxNy40Njk2IDUuNDE5OTFWMTYuNzY0OUMxNy40NzQ1IDE3LjQ0OTkgMTYuOTA5NSAxOC4wMTQ5IDE2LjIyNDUgMTguMDE0OVoiIGZpbGw9IiM0Q0RBREEiLz4KPHBhdGggZD0iTTE3Ljk4OTkgOC40Nzk5VjUuNTI0OUMxNy45ODk5IDQuODM0OSAxNy40Mjk5IDQuMjc0OSAxNi43Mzk5IDQuMjc0OUgzLjI1NDg4QzIuNTY0ODggNC4yNzQ5IDIuMDA0ODggNC44MzQ5IDIuMDA0ODggNS41MjQ5VjguNDc5OUgxNy45ODk5WiIgZmlsbD0iIzAwQkVCRSIvPgo8cGF0aCBkPSJNOS45ODUzNSA0LjIxOTk3VjE4LjAxNSIgc3Ryb2tlPSIjMDA4RTkxIiBzdHJva2Utd2lkdGg9IjEuMjgiLz4KPC9zdmc+Cg==">
                                <p>
                                    <c:if test="${offlineMovieDetailDTO.isOpen == 'true'}">
                                    개봉완료! 현재 오프라인 상영중
                                </c:if>
                                </p>
                            </div>
                            <div class="n_movie_title">
                                <p id="n_title">${offlineMovieDetailDTO.movieName}</p>
                            </div>
                            <div class="n_movie_content">
                                <p>
                                    ${offlineMovieDetailDTO.synopsis}
                                </p>
                            </div>
                            <div class="n_sell_archive">
                                <span>
                                <p id="n_percent">${offlineMovieDetailDTO.fundingRate}</p>
                                <p id="n_per_comment">% 달성</p>
                                </span>
                                <span id="n_dday"><p>${offlineMovieDetailDTO.restPeriod}일 남음</p></span>
                            </div>
                            <div class="n_sell_fund_state">
                                <span>
                                <p id="n_price">${offlineMovieDetailDTO.formatPresentPrice()}</p>
                                <p id="n_pri_comment">원 달성</p>
                                </span>
                                <span id="n_play"><p>${offlineMovieDetailDTO.peopleCount}명 참여</p></span>
                            </div>
                            <div class="n_sell_period">
                                <span id="n_fund_type">
                                    <p id="n_fund_period">진행기간</p>
                                    <p id="n_show_period">오프라인 상영 기간</p>
                                </span>
                                <span id="n_period">
                                    <p>${offlineMovieDetailDTO.fundingPeriod}</p>
                                    <p>${offlineMovieDetailDTO.offlineRunningPeriod}</p>
                                </span>
                            </div>
                        </div>
                        <div id="n_sell_ticket">
                            <div>
                                <h5 id="ticket_title">오프라인 티켓 구매</h5>
                                <div class="n_ticket_type">
                                    <p id="price">${offlineMovieDetailDTO.formatFundingProductPrice()}원</p>
                                    <p>[오프라인 티켓]</p>
                                    <p>독립·예술영화를 아끼고 사랑하는 관객들을 위한 오프라인 상영 관람 티켓</p>
                                    </br>
                                    <p class="n_theater_info">- 영화관 안내</p>
                                    <p class="n_name">${offlineMovieDetailDTO.theaterName}</p>
                                    <p class="n_address">${offlineMovieDetailDTO.theaterAddress}</p>
                                    <p class="n_number">${offlineMovieDetailDTO.theaterTel}</p>
                                    </br>
                                    <p class="n_parking_info">- 주차장 안내</p>
                                    <p id="n_parking_detail">${offlineMovieDetailDTO.theaterPark}</p>
                                </div>
                            </div>
                        </div>
                        <div id="n_sell_button">
                            <button type="button" class="bookmark_button">
                                <c:choose>
                                    <c:when test="${isLiked}">
                                        <img id="scrap_icon" src="/images/icons/icons8-heart-24-red.png">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="scrap_icon" src="/images/icons/icons8-heart-24-black.png">
                                    </c:otherwise>
                                </c:choose>
                            </button>
                            <form action="/runningschedule/${offlineMovieDetailDTO.movieId}/select-day" method="get" id="n_funding_button">
                                <button type="submit" class="n_reservation_button">예매하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="../../../../js/neh/off_detail.js"></script>

<script>
    $(document).ready(function () {
        $(".bookmark_button").on('click', function () {
            let fundingId = document.getElementById('k_funding_id').value;

            // 클릭된 버튼 안에서 .scrap_icon 찾기
            var scrapIcon = $(this).find(".scrap_icon");

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
                console.log("000에러00000")
                console.log(error)
            });
        });
    });
</script>



<%@ include file="../layout/footer.jsp" %>

