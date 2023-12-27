package com.tenco.indiepicter.admin.response;

import lombok.Data;

public class AdminReviewResponseDTO {
    @Data
    public static class DeleteCommentRequest {
        private Integer userId;
        private Integer movieId;
        private Integer commentId;

    }

}
