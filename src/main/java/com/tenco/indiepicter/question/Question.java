package com.tenco.indiepicter.question;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Question {
    private Integer id;
    private String questionTitle;
    private String content;
    private String category;
    private Timestamp createdAt;

    @Builder
    public Question(Integer id, String questionTitle, String content, String category, Timestamp createdAt) {
        this.id = id;
        this.questionTitle = questionTitle;
        this.content = content;
        this.category = category;
        this.createdAt = createdAt;
    }
}
