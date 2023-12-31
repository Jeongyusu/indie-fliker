package com.tenco.indiepicter.movie;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.handler.exception.MyUnAuthorizedException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter._core.utils.Script;
import com.tenco.indiepicter.movie.response.OnMovieDetailDTO;
import com.tenco.indiepicter.review.normalreview.NormalReviewService;
import com.tenco.indiepicter.review.normalreview.response.NormalReviewsToMovieDTO;
import com.tenco.indiepicter.review.vipreview.VipReviewService;
import com.tenco.indiepicter.review.vipreview.response.VipReviewsToMovieDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/movie")
public class MovieController {

    @Autowired
    private MovieService movieService;

    @Autowired
    private HttpSession session;

    // 온라인 상영관(GET)
    @GetMapping("/{movieId}/on-theater")
    public String onTheaterToMovie(@PathVariable Integer movieId, Model model){
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        if(principal == null){
            throw new MyUnAuthorizedException("로그인이 필요합니다", HttpStatus.UNAUTHORIZED);
        }
        OnMovieDetailDTO onMovieDetailDTO = movieService.onTheaterToMovie(movieId);
        model.addAttribute("onMovieDetailDTO", onMovieDetailDTO);
        model.addAttribute("principal", principal);
        return "main/on_watch";
    }
}
