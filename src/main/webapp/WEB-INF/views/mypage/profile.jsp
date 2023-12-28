<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="k_profile_main">
    <div class="k_profile_info_set">프로필 정보 설정</div>
    <form action="/user/profile" method="post" enctype="multipart/form-data">
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
            <input type="text" class="form-control k_join_radius" id="username" name="username" value="${sessionScope.principal.username}">
        </div>
        <div class="k_form_group">
            <label class="k_input_label">전화번호</label>
            <input type="text" class="form-control k_join_radius k_profile_input" id="tel" name="tel" value="${sessionScope.principal.tel}">
        </div>
        <div class="k_form_group">
            <label class="k_input_label">비밀번호</label>
                <input type="password" placeholder="비밀번호 입력" class="form-control k_join_radius k_profile_input" id="password1" name="password1">
            <div class="k_form_group">
                <input type="password" placeholder="비밀번호 확인" class="form-control k_join_radius k_profile_input" id="password2" name="password2">
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
<%@ include file="../layout/footer.jsp" %>
