<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<div id="n_select_movie">
    <h5>독립 영화의 매력을 느끼러 가보세요! 독립 영화는 예측 불허의 감동과 특별한 이야기로 가득 차 있습니다.</h5>
</div>
<main>
    <div>
        <div class="n_body">
            <div class="row justify-content-center n_select_row">
                <div class="n_select_form">
                    <img id="n_movie_img" src="/images/moviethumbnail/animation/mabup.jpeg">
                    <div class="n_form_check_detail">
                        <span id="n_ticket_type">
                        <p>[온라인 티켓]</p>
                        </span>
                        <div id="n_movie_title_grade_form">
                            <span>
                                <input type="hidden" id="n_runningGrade" value="${selectDTO.runningGrade}">
                                <img src="/images/icons/movie_level_all.png" id="n_grade_img_on">
                            </span>
                                <span>
                                <p id="n_movie_title">그대들은 어떻게 살 것인가?</p>
                            </span>
                        </div>
                        <div id="n_director_staff">
                            <p>감독 : 미야자키</p>
                            <p>각본 : 김진만, 천지영</p>
                        </div>
                        <p id="n_movie_content">어머니를 그리워하며 새로운 보금자리에 적응하던 주인공 "마히토"가 정체불명의 왜가리와 함께 저택의 신비로운 탑에 대한 이야기를 듣게 되는 작품을 기대해 주세요</p>
                        <div class="n_show_period">
                            <img src="/images/icons/movie.png" width="20" height="20">
                            <p>23.10.15 온라인 상영 예정</p>
                            <!--23.10.15 ~ 23.10.30 오프라인 상영 기간 추가-->
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
                        <p class="n_total_comment">"그대들은 어떻게 살 것 인가?"에 </p>
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
