package com.tenco.indiepicter._core.utils;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.vo.MyPath;
import org.springframework.http.HttpStatus;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class PicToStringUtil {

    public static String picToString(MultipartFile pic) {
        UUID uuid = UUID.randomUUID();
        String fileName = uuid + "_" + pic.getOriginalFilename();
        Path filePath = Paths.get(MyPath.IMG_PATH + fileName);
        try {
            Files.write(filePath, pic.getBytes());
        } catch (Exception e) {
            throw new MyDynamicException("사진 변환 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return fileName;

    }
}
