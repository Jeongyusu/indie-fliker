package com.tenco.indiepicter.movie.moviefile;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MovieFileService {

    @Autowired
    private MovieFileRepository movieFileRepository;

    @Transactional
    public int deleteAllByMovieId(Integer movieId){
        int resultRowCount = movieFileRepository.deleteAllByMovieId(movieId);
        if(resultRowCount != 1) {
            throw new MyDynamicException("무비 파일 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }
}
