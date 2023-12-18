package com.tenco.indiepicter.question.response;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class QuestionResponseDTO {

    private Integer id;
    private String questionTitle;
    private String content;
    private String category;
    private Timestamp createdAt;


}
