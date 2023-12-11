package com.tenco.indiepicter.runningschedule;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tenco.indiepicter._core.advice.ValidAdvice;
import com.tenco.indiepicter.user.UserRequest;
import com.tenco.indiepicter.user.UserRestController;
import com.tenco.indiepicter.user.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

import java.util.List;

import static org.hamcrest.Matchers.nullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

    @EnableAspectJAutoProxy // aop 활성화
    @WebMvcTest(RunningScheduleRestController.class)
// f - ds - usercontroller (현재 메모리에 뜬 것)
    public class RunningscheduleRestControllerTest {

        @Autowired // @webMvcTest에서 AutoConfigureMockMvc가 IOC에 띄워준다.
        private MockMvc mvc; // 컨트롤러 요청 객체

        @MockBean // 구현체를 만들어준다.(껍데기만)
        private RunningScheduleService runningScheduleService;

        @MockBean // 구현체를 만들어준다.(껍데기만)
        private RunningScheduleRepository runningScheduleRepository;

        @Autowired
        private ObjectMapper om;

        @Test
        public void apiSelectDay_test() throws Exception {
            // given (데이터 준비)
            Integer movieId = 1;
            String selectDay = "2023-12-24";

            // when (실행)
            List<RunningSchedule> responseDto
                    = runningScheduleRepository.findByMovieIdAndRunningDate(movieId, selectDay);
            System.out.println("결과 : " + responseDto);

            // then (상태 검증)
//            actions.andExpect(jsonPath("$.success").value(true));
//            actions.andExpect(jsonPath("$.response").value(nullValue()));
//            actions.andExpect(jsonPath("$.error").value(nullValue()));
        }
    }