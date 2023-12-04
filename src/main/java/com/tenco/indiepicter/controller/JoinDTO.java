package com.tenco.indiepicter.controller;

import lombok.Getter;
import lombok.NonNull;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
public class JoinDTO {
    @NotEmpty(message = "아이디는 비어있을 수 없습니다.")
    String userId;
    @NotEmpty(message = "이름은 비어있을 수 없습니다.")
    String username;
}
