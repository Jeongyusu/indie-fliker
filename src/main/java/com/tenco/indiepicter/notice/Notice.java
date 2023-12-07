package com.tenco.indiepicter.notice;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Notice {
    private Integer id;
    private String noticeTitle;
    private String content;
    private String category;
    private Timestamp createdAt;

    @Builder
    public Notice(Integer id, String noticeTitle, String content, String category, Timestamp createdAt) {
        this.id = id;
        this.noticeTitle = noticeTitle;
        this.content = content;
        this.category = category;
        this.createdAt = createdAt;
    }
}
