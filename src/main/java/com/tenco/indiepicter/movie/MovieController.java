package com.tenco.indiepicter.movie;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.movie.response.OnMovieDetailDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
        OnMovieDetailDTO onMovieDetailDTO = movieService.onTheaterToMovie(movieId);
        model.addAttribute("onMovieDetailDTO", onMovieDetailDTO);
        model.addAttribute("principal", principal);
        System.out.println("조회!!!!! = " + onMovieDetailDTO.toString());
        return "main/on_watch";
    }
}
