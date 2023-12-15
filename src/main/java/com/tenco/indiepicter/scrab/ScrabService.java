package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.scrab.response.ScrabResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Slf4j
@Service
public class ScrabService {

    @Autowired
    private ScrabRepository scrabRepository;

@Transactional
    public boolean toggleScrab(Integer userId, Integer fundingId) {
        Integer scrabExists = scrabRepository.isScrabExists(userId, fundingId);
        if (scrabExists != null) {
            try {
                scrabRepository.deleteScrab(userId, fundingId);
                log.info("좋아요를 취소했습니다.");
            } catch(Exception e) {
                throw new MyDynamicException("좋아요 서비스 중 서버 에러 발생", HttpStatus.INTERNAL_SERVER_ERROR);
            }
            return false;
        } else {
            try {
                scrabRepository.insertScrab(userId, fundingId);
                log.info("좋아요를 추가했습니다.");
            } catch(Exception e) {
                throw new MyDynamicException("좋아요 서비스 중 서버 에러 발생", HttpStatus.INTERNAL_SERVER_ERROR);
            }
            return true;
        }
    }

    public boolean checkIsLiked(Integer userId, Integer fundingId) {
        Integer scrabExists = scrabRepository.isScrabExists(userId, fundingId);
        return scrabExists != null;

    }

    public List<ScrabResponseDTO> scrabview(Integer fundingId) {
        return scrabRepository.viewScrabList(fundingId);
    }
}
