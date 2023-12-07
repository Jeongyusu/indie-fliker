package com.tenco.indiepicter.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    Integer id;
    String userEmail;
    String password;
    String username;
    String pic;
    int grade;
    String tel;
    String role;
    Timestamp created_at;
}
