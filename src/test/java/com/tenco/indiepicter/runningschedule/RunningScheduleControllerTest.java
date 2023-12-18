package com.tenco.indiepicter.runningschedule;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

import static org.hamcrest.Matchers.nullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@EnableAspectJAutoProxy // aop 활성화
@WebMvcTest(RunningScheduleController.class)
// f - ds - usercontroller (현재 메모리에 뜬 것)
public class RunningScheduleControllerTest {

    @Autowired // @webMvcTest에서 AutoConfigureMockMvc가 IOC에 띄워준다.
    private MockMvc mvc; // 컨트롤러 요청 객체

    @MockBean // 구현체를 만들어준다.(껍데기만)
    private RunningScheduleService runningScheduleService;

    @Autowired
    private ObjectMapper om;

    @Test
    public void selectSeat_test() throws Exception {
        // given (데이터 준비)
        Integer runningId = 1;

        // when (실행)
        ResultActions actions = mvc.perform(get("/runningschedule/1/select-seat")
                .param("runningId", "1") // 예시로 runningId 추가
                .contentType(MediaType.APPLICATION_JSON));
        String responseBody = actions.andReturn().getResponse().getContentAsString();
        System.out.println("테스트 : " + responseBody);
        // then (상태 검증)
        actions.andExpect(jsonPath("$.success").value(true));
        actions.andExpect(jsonPath("$.response").value(responseBody));
        actions.andExpect(jsonPath("$.error").value(nullValue()));
    }

}