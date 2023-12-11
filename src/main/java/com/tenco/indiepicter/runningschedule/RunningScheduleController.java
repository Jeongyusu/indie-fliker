package com.tenco.indiepicter.runningschedule;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequestMapping("/runningschedule")
public class RunningScheduleController {

    @Autowired
    private RunningScheduleService runningScheduleService;

    // 오프라인 영화 상영 일정(달력) 페이지 요청(GET)
    @GetMapping("/{movieId}/total-day")
    public String totalDay(@PathVariable Integer movieId, Model model) {
        RunningScheduleResponse.totalDayDTO totalDayDto = runningScheduleService.totalDay(1);
        model.addAttribute("totalDayDto", totalDayDto);
        return "reservation/select_day";
    }

}
