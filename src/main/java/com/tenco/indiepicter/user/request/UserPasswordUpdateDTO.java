package com.tenco.indiepicter.user.request;

import lombok.Data;

@Data
public class UserPasswordUpdateDTO {
    private String userEmail;
    private String password1;
    private String password2;
}
