<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body class="l_body">

<div class="k_profile_main">
    <div class="k_profile_info_set">프로필 정보 설정</div>
    <form id="form" action="/user/profile" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <div class="k_form_group">
            <label class="k_profile_pic">프로필 사진</label>
            <div style="text-align: center">
                <input type="hidden" name="id" id="id" value ="${sessionScope.principal.id}">
                <div class="k_file_button">
                    <label id="file_button" for="file" style="background-color: transparent">
                        <img id="preview" class="k_profile" alt="" id="pic" src="${sessionScope.principal.pic}" onclick="return false;">
                    </label>
                    <input type="file" id="file" name="file" onchange="changeUserPic(event)" style="display: none">
                </div>
            </div>
        </div>
        <div class="k_form_group">
            <label class="k_input_label">닉네임</label>
            <input type="text" class="form-control k_join_radius" id="username" name="username"  placeholder="${sessionScope.principal.username}">
            <p id="usernameCkeck"></p>
        </div>
        <div class="k_form_group">
            <label class="k_input_label">전화번호</label>
            <input type="text" class="form-control k_join_radius k_profile_input" id="tel" name="tel" placeholder="${sessionScope.principal.tel}">
            <p id="telCkeck"></p>
        </div>
        <div class="k_form_group">
            <label class="k_input_label">비밀번호</label>
                <input type="password" placeholder="비밀번호 입력" class="form-control k_join_radius k_profile_input" id="password1" name="password1">
                <p id="password1Ckeck"></p>
            <div class="k_form_group">
                <input type="password" placeholder="비밀번호 확인" class="form-control k_join_radius k_profile_input" id="password2" name="password2">
                <p id="password2Ckeck"></p>
            </div>
        </div>
        <div class="k_profile_bttns_margin">
            <a class="k_profile_bttn_cancle" href="/user/mypage">취소</a>
            <button type="submit" class="k_profile_bttn_ok">확인</button>
        </div>
    </form>
</div>

	<script>
		function changeUserPic(e1) {
		    let f = e1.srcElement.files[0];
		    console.log(f.type);
		    if (!f.type.match("image.*")) {
		      alert("이미지를 등록해주세요");
		      return;
		    }
		    let reader = new FileReader();
		    reader.onload = function (e2) { // 파일이 다 읽어지면 콜백됨
		      let previewEl = document.querySelector("#preview");
		      previewEl.setAttribute("src", e2.target.result);
		    }
		    reader.readAsDataURL(f); // 파일 읽기 onload()
		  	}
	</script>

<!--------------------------------------- 유효성 검사 ----------------------------------->
<script>
    // 이름 정규표현식으로 유효성 검사
    $('#username').focusout(function() {
        let nickname = $('#username').val()
        let nicknameCheck =  /^[가-힣a-zA-Z]{2,15}$/
        if (!nicknameCheck.test(nickname)){
            $('#usernameCkeck').html('한글, 영문 이름 2~15자 이내로 입력해주세요.').css('color', 'red');
            return false
        }
        $('#usernameCkeck').html('')
    });
    // $('#form').on('submit', function() {
    //     let nickname = $('#username').val()
    //     let nicknameCheck =  /^[가-힣a-zA-Z]{2,15}$/
    //     if (!nicknameCheck.test(nickname)){
    //         $('#usernameCkeck').html('한글, 영문 이름 2~15자 이내로 입력해주세요.').css('color', 'red');
    //         $('#username').focus()
    //         return false
    //     }
    //     $('#usernameCkeck').html('')
    // })
</script>
<script>
    // 전화번호 정규표현식으로 유효성 검사
    $('#tel').focusout(function() {
        let mobile = $('#tel').val()
        let mobileCheck =  /^\d{11}$/
        if (!mobileCheck.test(mobile)){
            $('#telCkeck').html('전화번호 11자리를 올바르게 입력하세요.').css('color', 'red');
            return false
        }
        $('#telCkeck').html('')
    });
    // $('#form').on('submit', function() {
    //     let mobile = $('#tel').val()
    //     let mobileCheck =  /^\d{11}$/
    //     if (!mobileCheck.test(mobile)){
    //         $('#telCkeck').html('전화번호 11자리를 올바르게 입력하세요.').css('color', 'red');
    //         $('#tel').focus()
    //         return false
    //     }
    //     $('#telCkeck').html('')
    // });
</script>
<script>
    // 비밀번호 정규표현식으로 유효성 검사
    $('#password1').focusout(function() {
        let pwdval = $('#password1').val()
        let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/

        if (!pwdcheck.test(pwdval) || pwdval.length<8){
            $('#password1Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
            return false
        }
        $("#password1Ckeck").html('')
    });
    // $('#form').on('submit', function() {
    //     let pwdval = $('#password1').val()
    //     let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/
    //
    //     if (!pwdcheck.test(pwdval) || pwdval.length<8){
    //         $('#password1Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
    //         $('#password1').focus()
    //         return false
    //     }
    //     $("#password1Ckeck").html('')
    // })
    $('#password2').focusout(function() {
        let pwdval = $('#password2').val()
        let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/

        if (!pwdcheck.test(pwdval) || pwdval.length<8){
            $('#password2Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
            return false
        }
        $("#password2Ckeck").html('')
    });
    // $('#form').on('submit', function() {
    //     let pwdval = $('#password2').val()
    //     let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/
    //
    //     if (!pwdcheck.test(pwdval) || pwdval.length<8){
    //         $('#password2Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
    //         $('#password2').focus()
    //         return false
    //     }
    //     $("#password2Ckeck").html('')
    // })
</script>

<!--------------------------------------- 유효성 검사 ----------------------------------->

<%@ include file="../layout/footer.jsp" %>
