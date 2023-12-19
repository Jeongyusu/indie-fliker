function setKeyword() {
    var searchInput = document.querySelector('.j_text_area');
    var searchValue = encodeURIComponent(searchInput.value.trim());

    // 동적으로 폼 액션 설정해주기
    document.getElementById('search-form').action = "/fund/search?keyword=" + searchValue;

    return true; // 폼 제출 진행을 위해 true 반환
}