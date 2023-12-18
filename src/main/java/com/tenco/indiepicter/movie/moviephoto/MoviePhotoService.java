package com.tenco.indiepicter.movie.moviephoto;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.PicToStringUtil;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MoviePhotoService {

    @Autowired
    private MoviePhotoRepository moviePhotoRepository;

    @Transactional
    public void saveMoviePhotos(FundingSaveDTO fundingSaveDTO, Integer movieId){
        for ( MultipartFile photos : fundingSaveDTO.getMoviePhotos()) {
            MoviePhoto moviePhoto = MoviePhoto.builder()
                    .moviePic(PicToStringUtil.picToString(photos))
                    .movieId(movieId)
                    .build();

            int resultRowCount = moviePhotoRepository.saveMoviePhoto(moviePhoto);
            if(resultRowCount != 1) {
                throw new MyDynamicException("영화 포토 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
    }
}
