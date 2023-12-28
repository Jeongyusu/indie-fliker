package com.tenco.indiepicter.user;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

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
    private boolean isWithdrawal;
    private Timestamp createdAt;

    @Builder
    public User(Integer id, String userEmail, String password, String username, String pic, String grade, String tel, String gubun, boolean isWithdrawal, Timestamp createdAt) {
        this.id = id;
        this.userEmail = userEmail;
        this.password = password;
        this.username = username;
        this.pic = pic;
        this.grade = grade;
        this.tel = tel;
        this.gubun = gubun;
        this.isWithdrawal = isWithdrawal;
        this.createdAt = createdAt;
    }

    public void setUserPassword(String password) {
    	this.password = password;
    }
}

