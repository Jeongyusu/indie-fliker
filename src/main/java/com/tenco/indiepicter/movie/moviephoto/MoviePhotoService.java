package com.tenco.indiepicter.movie.moviephoto;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.PicToStringUtil;
import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.AdminFundingUpdateFormDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Service
public class MoviePhotoService {

    @Autowired
    private MoviePhotoRepository moviePhotoRepository;

    @Transactional
    public void saveMoviePhotos(FundingSaveDTO fundingSaveDTO, Integer movieId) {
        for (MultipartFile photos : fundingSaveDTO.getMoviePhotos()) {
            MoviePhoto moviePhoto = MoviePhoto.builder()
                    .moviePic(PicToStringUtil.picToString(photos))
                    .movieId(movieId)
                    .build();

            int resultRowCount = moviePhotoRepository.saveMoviePhoto(moviePhoto);
            if (resultRowCount != 1) {
                throw new MyDynamicException("영화 포토 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
    }

    @Transactional
    public void updateById(AdminRequestFundingUpdateFormDTO adminRequestFundingUpdateFormDTO){
        log.debug("====포토 테스트==========");
        log.debug(adminRequestFundingUpdateFormDTO.getMoviePhotos().toString());
        for (int i = 0; i < adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i++) {
            if (adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i) != null && !adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i).isEmpty()) {

            } else {
                return;
            }
        }
        for(int i=0; i < adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i++){
            log.debug("포토인서트");
            MoviePhoto moviePhoto = MoviePhoto.builder()
                    .id(adminRequestFundingUpdateFormDTO.getMoviePhotoId())
                    .moviePic(PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i)))
                    .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
                    .build();
            int resultRowCount = moviePhotoRepository.updateById(moviePhoto);
            if (resultRowCount != 1) {
                throw new MyDynamicException("영화 포토 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

    }
}