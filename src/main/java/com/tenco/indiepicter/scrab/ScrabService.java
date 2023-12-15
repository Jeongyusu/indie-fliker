package com.tenco.indiepicter.scrab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrabService {

    @Autowired
    private ScrabRepository scrabRepository;

    public boolean toggleScrab(Integer userId, Integer fundingId) {
        Integer scrabExists = scrabRepository.isScrabExists(userId, fundingId);
        if (scrabExists != null) {
            scrabRepository.deleteScrab(userId, fundingId);
            System.out.println("좋아요를 취소했습니다.");
            return false;
        } else {
            scrabRepository.insertScrab(userId, fundingId);
            System.out.println("좋아요를 추가했습니다.");
            return true;
        }
    }

    public boolean checkIsLiked(Integer userId, Integer fundingId) {
        Integer scrabExists = scrabRepository.isScrabExists(userId, fundingId);
        return scrabExists != null;

    }
}