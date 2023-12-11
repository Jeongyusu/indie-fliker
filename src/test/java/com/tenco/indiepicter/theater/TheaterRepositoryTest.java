package com.tenco.indiepicter.theater;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tenco.indiepicter.runningschedule.RunningScheduleRepository;
import com.tenco.indiepicter.runningschedule.RunningScheduleRestController;
import com.tenco.indiepicter.runningschedule.RunningScheduleService;
import com.tenco.indiepicter.user.User;
import com.tenco.indiepicter.user.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

@EnableAspectJAutoProxy // aop 활성화
@WebMvcTest(TheaterRepository.class)
public class TheaterRepositoryTest {

    @Autowired // @webMvcTest에서 AutoConfigureMockMvc가 IOC에 띄워준다.
    private MockMvc mvc; // 컨트롤러 요청 객체

    @MockBean // 구현체를 만들어준다.(껍데기만)
    private TheaterRepository theaterRepository;

    @Autowired
    private ObjectMapper om;

    @Test
    public void findById_test() throws Exception {
        // given (데이터 준비)
        Integer theaterId = 1;

        // when (실행)

        // then (상태 검증)
//            actions.andExpect(jsonPath("$.success").value(true));
//            actions.andExpect(jsonPath("$.response").value(nullValue()));
//            actions.andExpect(jsonPath("$.error").value(nullValue()));
    }
}
