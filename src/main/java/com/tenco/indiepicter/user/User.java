package com.tenco.indiepicter.user;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.*;

@NoArgsConstructor
@Getter
public class User {
    private Integer id;
    private String userEmail;
    private String password;
    private String username;
    private String pic;
    private String grade;
    private String tel;
    private String gubun;
    private Timestamp createdAt;

    @Builder
    public User(Integer id, String userEmail, String password, String username, String pic, String grade, String tel, String gubun, Timestamp createdAt) {
        this.id = id;
        this.userEmail = userEmail;
        this.password = password;
        this.username = username;
        this.pic = pic;
        this.grade = grade;
        this.tel = tel;
        this.gubun = gubun;
        this.createdAt = createdAt;
    }
}

