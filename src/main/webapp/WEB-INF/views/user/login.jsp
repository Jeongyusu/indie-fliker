<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

	<div class="container k_login_container">
		<div class="text-left k_login">로그인</div>
		<form action="/user/login" method="post" enctype="multipart/form-data">
			<div class="k_form_group">
				<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요."
					onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 입력'" value="ssar@nate.com">
			</div>
			<div class="k_form_group">
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력입력하세요."
					onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력'" value="1234">
			</div>
			<div class="k_input_button">
				<button type="submit">이메일로 로그인</button>
			</div>
			<div class="k_kakao">
				<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=eaa873dc471f9ad17affff6005825aef&redirect_uri=http://localhost:80/user/kakao-callback">
					<img alt="" src="/images/kakao/kakao_login_medium_wide.png">
				</a>
			</div>
		</form>
		<a href="/user/find-email-pw" class="k_forget">로그인 정보를 잊으셨나요?</a>
		<a href="/user/password-update" class="k_forget">비밀번호 변경하기</a>
		<div class="k_no_id_aligin">
			<div class="k_no_id">아직 인디픽터 계정이 없나요?</div>
			<a href="/user/join" class="k_join">회원가입</a>
		</div>
	</div>

<%@ include file="../layout/footer.jsp" %>
