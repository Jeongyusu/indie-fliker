package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.scrab.response.ScrabDTO;
import com.tenco.indiepicter.scrab.response.ScrabResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@Transactional
public class ScrabService {

    @Autowired
    private ScrabRepository scrabRepository;


    // 좋아요

    public boolean toggleScrab(Integer userId, Integer fundingId) {
        log.debug("들어오니??", userId , fundingId);
        Integer scrabExists = scrabRepository.isScrabExists(userId, fundingId);
        if (scrabExists != null) {
            try {
                scrabRepository.deleteScrab(userId, fundingId);
                log.info("좋아요를 취소했습니다.");
            } catch (Exception e) {
                throw new MyDynamicException("좋아요 기능 작동중 에러.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
            return false;
        } else {
            try {
                scrabRepository.insertScrab(userId, fundingId);
                log.info("좋아요를 추가했습니다.");
            } catch (Exception e) {
                throw new MyDynamicException("좋아요 기능 작동중 에러.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
            return true;
        }
    }


    // 좋아요 유무
    public boolean checkIsLiked(Integer userId, Integer fundingId) {
        Integer scrabExists = scrabRepository.isScrabExists(userId, fundingId);
        return scrabExists != null;
    }

    // 좋아요 list

    public List<ScrabResponseDTO> scrabview(Integer userId) {
        List<ScrabResponseDTO> scrabs = scrabRepository.viewScrabList(userId);

        for (ScrabResponseDTO scrab : scrabs) {
            scrab.calculateAndSetAchievementRate();
        }

        return scrabs;
    }

    // 좋아요 리스트 삭제용 api
    public boolean deleteListScrab(Integer userId, Integer fundingId) {
        boolean scrabExists = scrabRepository.deleteListScrab(userId, fundingId);
        return scrabExists;
    }



}
