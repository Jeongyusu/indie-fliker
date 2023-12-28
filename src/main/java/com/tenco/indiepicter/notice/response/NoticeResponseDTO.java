package com.tenco.indiepicter.notice.response;

import java.sql.Timestamp;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

@Data
public class NoticeResponseDTO {
    private Integer id;
    private String noticeTitle;
    private String content;
    private String category;
    private Timestamp createdAt;

    public String formatNoticeDate(){
        return TimeStampUtil.timeStampToString(createdAt);
    }
	
}
