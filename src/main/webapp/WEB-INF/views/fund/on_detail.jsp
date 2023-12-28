<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main>
    <div class="n_custom_container_fluid">
        <div class="body n_body">
            <div class="row justify-content-center n_row">
                <!-- 펀딩 영화 상세 내용-->
                <div class="col-sm-7">
                    <!-- 펀딩 영화 대표 이미지 -->
                    <div class="n_first_movie_img">
                        <img id="n_movie_img" src="${fundingDetailDTO.movieThumbnail}">
                    </div>
                    <!-- 펀드/환불 설명 -->
                    <div id="n_fund_attention">
                        <div>
                            <ul>
                                <li onclick="selectFund()">
                                    <span class="n_fund" aria-hidden="true">
                                        <img id="n_fund"
                                             src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTYuMDMxMjUgMjguODI0SDI1Ljk1OTJDMjcuMDU1MyAyOC44MjQgMjcuOTU5MiAyNy45MiAyNy45NTEyIDI2LjgyNFYxMy41SDI5VjlDMjkgNy44OTU0MyAyOC4xMDQ2IDcgMjcgN0g1QzMuODk1NDMgNyAzIDcuODk1NDMgMyA5VjEzLjUwMDFINC4wMzEyNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRaIiBmaWxsPSIjQjlFRUVFIi8+CjxwYXRoIGQ9Ik0xNiA2LjVDMTguMDMzIDQuMDE4NDkgMjAuMTIxMyAyLjcxMTEzIDIxLjExMTcgMi40NjM1M0MyMi42NDc3IDIuMDcxNTMgMjMuNzE5NyAzLjc0MzUzIDIyLjY1NTcgNC45MTE1M0MyMS45MjYxIDUuNzExNzYgMjAuODc5IDYuNDI0MDQgMTkuNSA2Ljg2NSIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTE2IDYuNUMxMy45MzY5IDMuOTcyMTcgMTEuODc3NiAyLjcxMzA5IDEwLjg4NjEgMi40NjM1M0M5LjM1MDE0IDIuMDcxNTMgOC4yNzgxNCAzLjc0MzUzIDkuMzQyMTQgNC45MTE1M0M5LjkwNzcyIDUuNTMxODUgMTEuMzMyNiA2LjMzMTg3IDEyLjUgNi44MDk4MiIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTQuMDMxMjUgMTMuNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRIMjUuOTU5MkMyNy4wNTUyIDI4LjgyNCAyNy45NTkyIDI3LjkyIDI3Ljk1MTIgMjYuODI0VjEzLjQ5OTkiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjguNzgzIDEzLjU2NzhWOC44Mzk4NEMyOC43ODMgNy43MzU4NCAyNy44ODcgNi44Mzk4NCAyNi43ODMgNi44Mzk4NEg1LjIwNzAzQzQuMTAzMDMgNi44Mzk4NCAzLjIwNzAzIDcuNzM1ODQgMy4yMDcwMyA4LjgzOTg0VjEzLjU2NzhIMjguNzgzWiIgc3Ryb2tlPSIjMjEyNTI5Ii8+CjxwYXRoIGQ9Ik0xNS45NzQ2IDYuNzUxOTVWMjguODI0IiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8L3N2Zz4K">
                                    </span>
                                    <span>펀딩</span>
                                </li>
                                <li onclick="selectRefund()">
                                    <span class="n_refund" aria-hidden="true">
                                    <img id="n_refund"
                                         src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3QgeD0iNy41IiB5PSI3LjUiIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyIgcng9IjEiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjIuMjc2NSA1LjMzNzIzTDIxLjUgMi40Mzk0NUwyNC4zOTc4IDEuNjYzIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE2IDEuNUM3Ljk5MTg3IDEuNSAxLjUgNy45OTE4NyAxLjUgMTZDMS41IDI0LjAwODEgNy45OTE4NyAzMC41IDE2IDMwLjVDMjQuMDA4MSAzMC41IDMwLjUgMjQuMDA4MSAzMC41IDE2QzMwLjUgMTAuNzM2OCAyNy42OTU4IDYuMTI4NTcgMjMuNSAzLjU4NzgyQzIzLjAxNzcgMy4yOTU3NSAyMi41MTcgMy4wMzEwMSAyMiAyLjc5NTczIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE0LjUgOFYxMUgxNy41VjgiIHN0cm9rZT0iIzIxMjUyOSIvPgo8L3N2Zz4K">
                                    </span>
                                    <span>환불</span>
                                </li>
                            </ul>
                        </div>
                        <div class="n_attention">
                            <p id="n_info">인디픽터 펀딩은 영화를 단순히 관람하는 것이 아닌 <strong>독립영화의 새로운 작품 제작 과정 지원·상영·사회적 가치</strong>를
                                확산해요.</p>
                        </div>
                    </div>
                    <!-- 펀딩 영화 정보 -->
                    <div id="n_movie_info">
                        <div>
                            <h4>프로젝트 시나리오</h4>
                        </div>
                        <div class="n_movie_text">
                            <h3>시놉시스</h3>
                            <p>
                                ${fundingDetailDTO.synopsis}
                            </p>
                        </div>
                        <div class="n_movie_text">
                            <h3>연출의도</h3>
                            <p>
                                ${fundingDetailDTO.directingIntension}

                            </p>
                        </div>
                        <div class="n_movie_img">
                            <h3>포토</h3>
                            <c:forEach var="photo" items="${fundingDetailDTO.moviePhotos}" >
                                <img src="${photo}">
                            </c:forEach>
                        </div>
                        <span id="n_toggle_more" style="display: none">
                            <div class="n_movie_text">
                                <h3>감독 작품 경력</h3>
                                <img id="n_director_img" src="${fundingDetailDTO.directorPic}">
                                <h5>${fundingDetailDTO.director}</h5>
                                <p>
                                    ${fundingDetailDTO.directorCareers}
                                </p>
                            </div>
                            <div class="n_movie_text">
                                <h3>영화제 상영 및 수상작</h3>
                                <p>
                                    ${fundingDetailDTO.directorAwardsFilm}
                                </p>
                            </div>
                            <div class="n_movie_text">
                                <h3>스태프</h3>
                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <th>감독</th>
                                        <td>${fundingDetailDTO.director}</td>
                                        <th>각본</th>
                                        <td>${fundingDetailDTO.script}</td>
                                    </tr>
                                    <tr>
                                        <th>촬영</th>
                                        <td>${fundingDetailDTO.filming}</td>
                                        <th>조명</th>
                                        <td>${fundingDetailDTO.lighting}</td>
                                    </tr>
                                    <tr>
                                        <th>미술</th>
                                        <td>${fundingDetailDTO.art}</td>
                                        <th>편집</th>
                                        <td>${fundingDetailDTO.editing}</td>
                                    </tr>
                                    <tr>
                                        <th>사운드</th>
                                        <td>${fundingDetailDTO.sound}</td>
                                        <th>음악</th>
                                        <td>${fundingDetailDTO.music}</td>
                                    </tr>
                                    <tr>
                                        <th>의상</th>
                                        <td colspan="3">${fundingDetailDTO.clothes}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </span>
                        <button id="n_toggle_button" onclick="toggleMore()">프로젝트 더 보기</button>
                        <input type="hidden" id="k_user_id" value="${sessionScope.principal.id}">
                        <input type="hidden" id="k_funding_id" value="${fundingDetailDTO.fundingId}">

                    </div>
                    <!-- 기대되는 영화 목록 -->
                    <div id="n_more_movie">
                        <h4>기대되는 좋은 영화들</h4>
                        <div class="row n_movie_list">
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                            <div class="n_more_movie">
                                <img src="/images/moviePoster/the_boy_poster1.jpg">
                                <p class="n_achieve">70%달성</p>
                                <p class="n_title">3월의 휴가</p>
                                <p class="n_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="n_directer">육상효</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 결제 관련 상세 내역-->
                <div class="col-sm-5 n_col_sm_5">
                    <div id="n_sell_info">
                        <div class="n_movie_category">
                            <p id="n_sharp">#</p>
                            <p id="n_category">${fundingDetailDTO.genre}</p>
                        </div>
                        <div class="n_sell_img">
                            <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik05LjYxNTIzIDQuNzg0OTVDOS42MTUyMyA0Ljc4NDk1IDEzLjA3NTIgNC4yNTk5NSAxNC4xNjAyIDMuMDY5OTVDMTQuODI1MiAyLjMzOTk1IDE0LjE1NTIgMS4yOTQ5NSAxMy4xOTUyIDEuNTM5OTVDMTIuNDU1MiAxLjcyNDk1IDExLjMxMDIgMi40MDk5NSA5LjYxNTIzIDQuNzg0OTVaIiBzdHJva2U9IiMwMDhFOTEiIHN0cm9rZS13aWR0aD0iMS4yOCIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTEwLjM4NDggNC43ODQ5NUMxMC4zODQ4IDQuNzg0OTUgNi45MjQ4MSA0LjI1OTk1IDUuODM5ODEgMy4wNjk5NUM1LjE3NDgxIDIuMzM5OTUgNS44NDQ4MSAxLjI5NDk1IDYuODA0ODEgMS41Mzk5NUM3LjUzOTgxIDEuNzI0OTUgOC42ODQ4MSAyLjQwOTk1IDEwLjM4NDggNC43ODQ5NVoiIHN0cm9rZT0iIzAwOEU5MSIgc3Ryb2tlLXdpZHRoPSIxLjI4Ii8+CjxwYXRoIGQ9Ik0xNi4yMjQ1IDE4LjAxNDlIMy43Njk1M0MzLjA3OTUzIDE4LjAxNDkgMi41MTk1MyAxNy40NTQ5IDIuNTE5NTMgMTYuNzY0OVY1LjQxOTkxQzIuNTE5NTMgNC43OTQ5MSAzLjAyOTUzIDQuMjg0OTEgMy42NTQ1MyA0LjI4NDkxSDE2LjMzNDVDMTYuOTU5NSA0LjI4NDkxIDE3LjQ2OTYgNC43OTQ5MSAxNy40Njk2IDUuNDE5OTFWMTYuNzY0OUMxNy40NzQ1IDE3LjQ0OTkgMTYuOTA5NSAxOC4wMTQ5IDE2LjIyNDUgMTguMDE0OVoiIGZpbGw9IiM0Q0RBREEiLz4KPHBhdGggZD0iTTE3Ljk4OTkgOC40Nzk5VjUuNTI0OUMxNy45ODk5IDQuODM0OSAxNy40Mjk5IDQuMjc0OSAxNi43Mzk5IDQuMjc0OUgzLjI1NDg4QzIuNTY0ODggNC4yNzQ5IDIuMDA0ODggNC44MzQ5IDIuMDA0ODggNS41MjQ5VjguNDc5OUgxNy45ODk5WiIgZmlsbD0iIzAwQkVCRSIvPgo8cGF0aCBkPSJNOS45ODUzNSA0LjIxOTk3VjE4LjAxNSIgc3Ryb2tlPSIjMDA4RTkxIiBzdHJva2Utd2lkdGg9IjEuMjgiLz4KPC9zdmc+Cg==">
                            <p>펀딩</p>
                        </div>
                        <div class="n_movie_title">
                            <p id="n_state">
                                <c:if test="${fundingDetailDTO.isOpen == 'true'}">
                                        [상영중]
                                </c:if>
                            </p>
                            <p id="n_title">${fundingDetailDTO.movieName}</p>
                        </div>
                        <div class="n_movie_content">
                            <p>${fundingDetailDTO.synopsis}</p>
                        </div>
                        <div class="n_sell_archive">
                            <span>
                            <p id="n_percent">${fundingDetailDTO.fundingRate}</p>
                            <p id="n_per_comment">% 달성</p>
                            </span>
                            <span id="n_dday"><p>${fundingDetailDTO.restPeriod}일 남음</p></span>
                        </div>
                        <div class="n_sell_fund_state">
                            <span>
                            <p id="n_price">${fundingDetailDTO.formatPresentPrice()}</p>
                            <p id="n_pri_comment">원 달성</p>
                            </span>
                            <span id="n_play"><p>${fundingDetailDTO.peopleCount}명 참여</p></span>
                        </div>
                        <div class="n_sell_period">
                            <span id="n_fund_type">
                                <p>진행기간</p>
                                <p>온라인 상영 예정일</p>
                            </span>
                            <span id="n_period">
                                <p>${fundingDetailDTO.fundingPeriod}</p>
                                <p>${fundingDetailDTO.formatTimeStamp()}</p>
                            </span>
                        </div>
                    </div>
                    <div id="n_sell_ticket">
                        <div>
                            <h5>온라인 티켓 구매</h5>
                            <div class="n_ticket_type">
                                <p id="price">${fundingDetailDTO.formatFundingProductPrice()}원</p>
                                <p>[온라인 티켓]</p>
                                <p>독립·예술영화를 아끼고 사랑하는 관객들을 위한 온라인 상영 관람 티켓</p>
                                </br>
                                </br>
                                <p>리워드 제공 형식</br>
                                    - 개봉 전 영화일 경우, 개봉 후 안내 문자가 발송됩니다.</br>
                                    - 개봉 후 처음 관람부터 4일간 무제한 관람이 가능합니다.</br>
                                    - 구매하신 영화는 마이페이지 - 결제내역에서 관람이 가능합니다.</br>
                                </p>
                                </br>
                                </br>
                                <p>
                                    티켓 구매 형식</br>
                                    - 온라인 티켓은 재 구매가 가능합니다.</br>
                                    - 온라인 티켓은 구매 기간은 펀딩 총 기간동안 구매 가능합니다.</br>
                                    - 펀딩의 총 기간은 영화 개봉 전 ~ 개봉 후 상영기간입니다.</br>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div id="n_sell_button">
                        <button type="button" class="bookmark_button">
                            <c:choose>
                                <c:when test="${isLiked}">
                                    <img class="scrap_icon" src="/images/icons/icons8-heart-24-red.png">
                                </c:when>
                                <c:otherwise>
                                    <img class="scrap_icon" src="/images/icons/icons8-heart-24-black.png">
                                </c:otherwise>
                            </c:choose>
                        </button>
                        <form action="/payment/${fundingDetailDTO.movieId}/on" method="get" id="n_funding_button">
                            <button type="submit" class="n_buy_button">펀딩하기</button>
                        </form>
                    </div>


                </div>
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/on_detail.js"></script>

<%@ include file="../layout/footer.jsp" %>
