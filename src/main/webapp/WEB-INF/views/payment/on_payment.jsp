<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<div id="n_select_movie">
    <h5>독립 영화의 매력을 느끼러 가보세요! 독립 영화는 예측 불허의 감동과 특별한 이야기로 가득 차 있습니다.</h5>
</div>
<main>
    <div>
        <div class="n_body">
            <div class="row justify-content-center n_select_row">
                <div class="n_select_form">
                    <img id="n_movie_img" src="${selectFundingDTO.thumbnail}">
                    <div class="n_form_check_detail">
                        <span id="n_ticket_type">
                        <p>[온라인 티켓]</p>
                        </span>
                        <div id="n_movie_title_grade_form">
                            <span>
                                <input type="hidden" id="n_runningGrade" value="${selectFundingDTO.runningGrade}">
                                <img src="/images/icons/movie_level_all.png" id="n_grade_img_on">
                            </span>
                                <span>
                                <p id="n_movie_title">${selectFundingDTO.movieName}</p>
                            </span>
                        </div>
                        <div id="n_director_staff">
                            <p>감독 : ${selectFundingDTO.director}</p>
                            <p>각본 : ${selectFundingDTO.script}</p>
                        </div>
                        <p id="n_movie_content">${selectFundingDTO.synopsis}</p>
                        <div class="n_show_period">
                            <img src="/images/icons/movie.png" width="20" height="20">
                            <c:choose>
                                <c:when test="${selectFundingDTO.formatToReleaseDate() != null}">
                                    <p>온라인 상영 기간 : ${selectFundingDTO.formatToReleaseDate()} ~ ${selectFundingDTO.formatToEndDate()} </p>
                                </c:when>
                                <c:otherwise>
                                    <p>${selectFundingDTO.formatToDDay()} 온라인 상영 예정</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div class="n_select_price">
                    <span id="n_ticket_title">
                        <p>
                            [4일간 무제한 스트리밍]
                        </p>
                        <p id="n_ticket_title_info">
                            4일 동안 무제한 스트리밍으로 독립영화의 풍부한 세계를 즐겨보세요! 언제, 어디서든 온라인으로 접속하여 다양한 장르와 주제의 영화를 감상할 수 있습니다.
                        </p>
                    </span>
                    </br>
                    </br>
                    <span id="n_select_price">
                        <p id="n_ticket_price">8,000</p>
                        <p>원</p></span>
                </div>
                <div class="n_donation">
                    <span class="n_info">
                        <p id="n_donation_title">후원금 더하기(선택)</p>
                        <p class="n_donation_comment">후원금을 더하여 참여할 수 있습니다. 추가 후원금을 입력하시겠습니까?</p>
                    </span>
                    <span class="n_donation_price">
                        <input type="text" class="form-control" id="n_donation_price" placeholder="0" name="donationPrice" value="" oninput="inputDonation()">
                        <p class="n_donation_comment">원을 추가로 후원합니다.</p>
                    </span>
                </div>
                <form action="/" method="get">
                    <input type="hidden" name="total_price" value="">
                    <input type="hidden" name="select_movie" value="">
                    <div class="n_total_price">
                        <p class="n_total_comment">"${selectFundingDTO.movieName}"에 </p>
                        <p id="n_total_price">8,000</p>
                        <p class="n_total_comment">원을 참여합니다.</p>
                    </div>
                    <div id="n_on_pay_button">
                        <div class>
                            <button type="button" class="n_payment_button_modal" data-bs-toggle="modal" data-bs-target="#myModal">
                                결제하기
                            </button>
                            <!-- The Modal -->
                            <div class="modal" id="myModal">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header n_modal_header">
                                            <p class="modal-title n_modal_title">결제 수단</p>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <div>
                                                <label class="n_box_radio_button">
                                                    <input type="radio" id="radio-1" name="payment" value="1" onclick="selectPay(this)">
                                                    <span>
                                                        <img src="/images/logo/kakao.png">
                                                        <p>카카오 페이</p>
                                                    </span>
                                                </label>
                                                <label class="n_box_radio_button">
                                                    <input type="radio" id="radio-2" name="payment" value="2" onclick="selectPay(this)">
                                                    <span>
                                                        <img src="/images/logo/payco.png">
                                                        <p>페이코</p>
                                                    </span>
                                                </label>
                                                <label class="n_box_radio_button">
                                                    <input type="radio" id="radio-3" name="payment" value="3" onclick="selectPay(this)">
                                                    <span>
                                                        <img src="/images/logo/inicis.png">
                                                        <p>KG 이니시스</p>
                                                    </span>
                                                </label>
                                            </div>
                                        </div>
                                        <input type="hidden" id="selectPayment" value="">
                                        <input type="hidden" id="reservationCode" value="">
                                        <input type="hidden" id="paymentTypeId" value="">
                                        <input type="hidden" id="discountPrice" value="0">
                                        <input type="hidden" id="n_movie_id" value="${selectFundingDTO.movieId}">
                                        <input type="hidden" id="totalCount" value="1">
                                        <input type="hidden" id="fundingId" value="${selectFundingDTO.fundingId}">
                                        <input type="hidden" id="userEmail" value="${principal.userEmail}">
                                        <input type="hidden" id="username" value="${principal.username}">
                                        <input type="hidden" id="userTel" value="${principal.tel}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script src="../../../../js/neh/on_payment.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
