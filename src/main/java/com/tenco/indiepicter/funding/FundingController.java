package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter._core.utils.Script;
import com.tenco.indiepicter.banner.BannerService;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.*;
import com.tenco.indiepicter.movie.MovieService;
import com.tenco.indiepicter.movie.moviestaff.MovieStaffService;
import com.tenco.indiepicter.scrab.ScrabService;
import com.tenco.indiepicter.theater.TheaterService;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/fund")
public class FundingController {
    @Autowired
    private HttpSession session;

    @Autowired
    private FundingService fundingService;

    @Autowired
    private BannerService bannerService;

    @Autowired
    private TheaterService theaterService;

    @Autowired
    private ScrabService scrabService;

    @Autowired
    private MovieService movieService;

    @Autowired
    private MovieStaffService movieStaffService;

    @GetMapping({"/funding-plus", "/main"})
    public String fundingPlus (@RequestParam(name = "genre", defaultValue = "") String genre, @RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        // 전체 조회
        if(genre.isEmpty() || genre == null){
            List<FundingDTO> moviesByMainDTOs = fundingService.moviesByMain(page, 5);
            List<BannerDTO> bannerDTOs = bannerService.DisplayBannerByAll();
            FundingListDTO fundingListDTO = new FundingListDTO(moviesByMainDTOs, bannerDTOs);
            model.addAttribute("fundingListDTO", fundingListDTO);
            return "main/movielist";
        }
        // 장르별 조회
        List<FundingDTO> moviesByGenreDTOs = fundingService.moviesByGenre(genre, page, 5);
        List<BannerDTO> bannerDTOs = bannerService.DisplayBanner(genre);
        FundingListDTO fundingListDTO = new FundingListDTO(moviesByGenreDTOs, bannerDTOs);
        model.addAttribute("fundingListDTO", fundingListDTO);
        return "main/movielist";
    }

    @GetMapping("/on-air")
    public String onAirMovies(Model model){
        OnAirTotalDTO onAirTotalDTO = new OnAirTotalDTO(fundingService.onAirMovies(), fundingService.onAirRankedMovies());
        model.addAttribute("onAirTotalDTO", onAirTotalDTO);
        return "main/main";
    }

    @GetMapping("/on-dday")
    public String onDDayMovies(Model model){
        List<OnDDayMovieDTO> onDDayMovieDTOs = fundingService.onDDayMovies(1, 15);
        log.debug("사이즈" + onDDayMovieDTOs.size());
        model.addAttribute("onDDayMovieDTOs", onDDayMovieDTOs);
        return "main/on_d_day_list";
    }

    @GetMapping("/off-air")
    public String offAirMovies(Model model){
        OffAirTotalDTO offAirTotalDTO = new OffAirTotalDTO(fundingService.offAirMovies(), fundingService.offAirRankedMovies(), theaterService.mainPageTheaters());
        model.addAttribute("offAirTotalDTO", offAirTotalDTO);
        return "main/off_main";
    }

    @GetMapping("/funding/{id}")
    public String detailFunding(@PathVariable Integer id, Model model, HttpSession session){
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        // pricipal이 null이면 null을 사용하여 isLiked를 체크
        boolean isLiked = principal != null && scrabService.checkIsLiked(principal.getId(), id);

        FundingDetailDTO fundingDetailDTO = fundingService.detailFunding(id);
        List<FundingDTO> moviesByMainDTOs = fundingService.moviesByMain(1, 10);

        model.addAttribute("fundingDetailDTO", fundingDetailDTO);
        model.addAttribute("moviesByMainDTOs", moviesByMainDTOs);
        model.addAttribute("isLiked", isLiked);

        return "fund/on_detail";
    }

    @GetMapping("/offline-movie/{id}")
    public String detailOfflineMovie(@PathVariable Integer id, Model model){
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        // pricipal이 null이면 null을 사용하여 isLiked를 체크
        boolean isLiked = principal != null && scrabService.checkIsLiked(principal.getId(), id);
        System.out.println("isLiked : " + isLiked);

        OfflineMovieDetailDTO offlineMovieDetailDTO = fundingService.detailOfflineMovie(id);
        List<FundingDTO> moviesByMainDTOs = fundingService.moviesByMain(1, 10);

        model.addAttribute("offlineMovieDetailDTO", offlineMovieDetailDTO);
        model.addAttribute("moviesByMainDTOs", moviesByMainDTOs);
        model.addAttribute("isLiked", isLiked);
        return "fund/off_detail";
    }

    @GetMapping("/saveForm")
    public String fundingSaveForm(){
        return "fund/fund_upload";
    }


    @GetMapping("/search")
    public String searchFunding(@RequestParam( name ="keyword") String keyword, Model model){
        List<SearchResultDTO> searchResultDTOs = fundingService.searchKeyword(keyword);
        model.addAttribute("keyword", keyword);
        model.addAttribute("searchResultDTOs", searchResultDTOs);
        return "main/search_result";
    }

    @PostMapping("/save")
    public @ResponseBody String saveFunding(FundingSaveDTO requestDTO){
        fundingService.saveFunding(requestDTO);
        return Script.href("/fund/funding-plus", "펀딩 등록 성공! 심사 후 승인됩니다.");
    }



}
