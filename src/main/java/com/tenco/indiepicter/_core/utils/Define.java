package com.tenco.indiepicter._core.utils;


public class Define {
    public static final String PRINCIPAL = "principal";
    public static final int MAX_FILE_SIZE = 1024 * 1024 * 50; // MB
    // 8bit -> 1byte
    // 1024byte -> 1KB
    // 1,048,576 -> 1MB

    // uploadPath는 운영체제에 따라 동적으로 변경됨
    public static final String uploadPath;

    public static Integer SaveFundingPK;

    static {
        // 운영 체제 확인
        String os = System.getProperty("os.name").toLowerCase();

        // Mac인 경우
        if (os.contains("mac")) {
            uploadPath = "/desktop/upload";
        }
        // Windows인 경우
        else if (os.contains("win")) {
            uploadPath = "C:\\spring_upload\\indiepicter\\upload";
        }
        // 기타 운영 체제인 경우
        else {
            uploadPath = "/path/to/other/upload/directory";
        }
    }

//    public static final String UPLOAD_DIRECTORY = uploadPath;
    
    // 파일 저장 로컬 주소
 	public static final String UPLOAD_DIRECTORY="C:\\spring_upload\\indiepicter\\upload";
 	public static final String userbasicpic = "/images/userbasicpic/userimg.jpg";
 															
}
