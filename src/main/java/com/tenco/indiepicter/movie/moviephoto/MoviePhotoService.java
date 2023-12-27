package com.tenco.indiepicter.movie.moviephoto;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.PicToStringUtil;
import com.tenco.indiepicter._core.utils.StringUtil;
import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.AdminFundingUpdateFormDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

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
    public void updateById(AdminRequestFundingUpdateFormDTO adminRequestFundingUpdateFormDTO) {
        log.debug("====포토 테스트==========");
        List<Integer> photoIndex = StringUtil.convertStringToListInteger(adminRequestFundingUpdateFormDTO.getMoviePhotoIds());
        log.debug(photoIndex.toString());

        if (photoIndex.size() > adminRequestFundingUpdateFormDTO.getMoviePhotos().size()) {
            log.debug("처음개수 > 인풋개수");
            for (int i = photoIndex.size() - adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i > 0; i--) {
                moviePhotoRepository.deleteById(photoIndex.get(i), adminRequestFundingUpdateFormDTO.getMovieId());
            }
            MoviePhoto mpIndex = findById(photoIndex.get(0));
            String moviePic = null;
            if(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(0).getSize() > 0) {
                moviePic = PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(0));}
            else {
                moviePic = mpIndex.getMoviePic();
            }

            MoviePhoto moviePhoto = MoviePhoto.builder()
                    .id(photoIndex.get(0))
                    .moviePic(moviePic)
                    .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
                    .build();

            if(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(0) == null){
                moviePhoto.setMoviePic(null);
            }
            moviePhotoRepository.updateById(moviePhoto);
        } else if (photoIndex.size() < adminRequestFundingUpdateFormDTO.getMoviePhotos().size()) {
            log.debug("처음개수 < 인풋개수");
            for (int i = 0; i < photoIndex.size(); i++) {

                MoviePhoto mpIndex = findById(photoIndex.get(i));
                String moviePic = null;
                if(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i).getSize() > 0) {
                    moviePic = PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i));}
                else {
                    moviePic = mpIndex.getMoviePic();
                }

                MoviePhoto moviePhoto = MoviePhoto.builder()
                        .id(photoIndex.get(i))
                        .moviePic(moviePic)
                        .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
                        .build();
                if(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i) == null){
                    moviePhoto.setMoviePic(null);
                }
                int resultRowCount = moviePhotoRepository.updateById(moviePhoto);
                if (resultRowCount != 1) {
                    throw new MyDynamicException("영화 포토 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }


            for (int i = photoIndex.size(); i < adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i++) {

                String moviePic = null;

                if(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i).getSize() > 0) {
                    moviePic = PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i));}
                else {
                    moviePic = "/images/icons/alt.png";
                }
                MoviePhoto moviePhoto = MoviePhoto.builder()
                        .moviePic(moviePic)
                        .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
                        .build();
                if(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i) == null){
                    moviePhoto.setMoviePic(null);
                }
                moviePhotoRepository.saveMoviePhoto(moviePhoto);
            }
        } else if (photoIndex.size() == adminRequestFundingUpdateFormDTO.getMoviePhotos().size()) {
            log.debug("처음개수 = 인풋개수");
            for (int i = 0; i < adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i++) {

                MoviePhoto mpIndex = findById(photoIndex.get(i));

                String moviePic = null;

                if(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i).getSize() > 0) {
                    moviePic = PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i));}
                else {
                    moviePic = mpIndex.getMoviePic();
                }

                MoviePhoto moviePhoto = MoviePhoto.builder()
                        .id(photoIndex.get(i))
                        .moviePic(moviePic)
                        .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
                        .build();

                int resultRowCount = moviePhotoRepository.updateById(moviePhoto);
                if (resultRowCount != 1) {
                    throw new MyDynamicException("영화 포토 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }


//        for (int i = 0; i < adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i++) {
//            if (adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i) != null && !adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i).isEmpty()) {
//            } else {
//
//            }
//        }
//
//        if (adminRequestFundingUpdateFormDTO.getMoviePhotos().size() == photoIndex.size()) {
//            for (int i = 0; i < adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i++) {
//                log.debug("포토인서트");
//                MoviePhoto moviePhoto = MoviePhoto.builder()
//                        .id(photoIndex.get(i))
//                        .moviePic(PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i)))
//                        .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
//                        .build();
//
//                int resultRowCount = moviePhotoRepository.updateById(moviePhoto);
//                if (resultRowCount != 1) {
//                    throw new MyDynamicException("영화 포토 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
//                }
//            }
//        } else if (adminRequestFundingUpdateFormDTO.getMoviePhotos().size() < photoIndex.size()) {
//            deleteById(adminRequestFundingUpdateFormDTO.getMovieId());
//            for (int i = 0; i < adminRequestFundingUpdateFormDTO.getMoviePhotos().size(); i++) {
//                log.debug("포토인서트");
//                MoviePhoto moviePhoto = MoviePhoto.builder()
//                        .moviePic(PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMoviePhotos().get(i)))
//                        .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
//                        .build();
//                int resultRowCount = moviePhotoRepository.saveMoviePhoto(moviePhoto);
//                if (resultRowCount != 1) {
//                    throw new MyDynamicException("영화 포토 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
//                }
//            }
//        }
        }
    }

    @Transactional
    public int deleteAllById(Integer id){
        int resultRowCount = moviePhotoRepository.deleteAllById(id);
        if (resultRowCount != 1) {
            throw new MyDynamicException("영화 포토 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

    @Transactional
    public int deleteById(Integer id, Integer movieId){
        int resultRowCount = moviePhotoRepository.deleteById(id, movieId);
        if (resultRowCount != 1) {
            throw new MyDynamicException("영화 포토 일부 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

    public MoviePhoto findById(Integer id){
       return moviePhotoRepository.findById(id);
    }
}