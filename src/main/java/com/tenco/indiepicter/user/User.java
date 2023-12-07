package com.tenco.indiepicter.user;

import lombok.*;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class User {
    private Integer id;
    private String userEmail;
    private String password;
    private String username;
    private String pic;
    private Integer userGrade;
    private String tel;
    private String role;
    private Timestamp created_at;

    @Builder
    public User(Integer id, String userEmail, String password, String username, String pic, Integer userGrade, String tel, String role, Timestamp created_at) {
        this.id = id;
        this.userEmail = userEmail;
        this.password = password;
        this.username = username;
        this.pic = pic;
        this.userGrade = userGrade;
        this.tel = tel;
        this.role = role;
        this.created_at = created_at;
    }
}

