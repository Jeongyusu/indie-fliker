package com.tenco.indiepicter.notice.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeResponseDTO {

    private String noticeTitle;
    private String content;
    private String category;
    private Timestamp createdAt;
	
}
