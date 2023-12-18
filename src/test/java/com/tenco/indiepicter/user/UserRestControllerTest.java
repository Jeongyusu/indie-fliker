package com.tenco.indiepicter.user;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.hamcrest.Matchers.nullValue;

import com.tenco.indiepicter._core.advice.ValidAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.test.web.servlet.MockMvc;
import com.fasterxml.jackson.databind.ObjectMapper;

@Import({ValidAdvice.class }) // webmvc가 ioc에 올려주지 않는 것을 직접 로딩하기
@EnableAspectJAutoProxy // aop 활성화
@WebMvcTest(UserRestController.class)
// f - ds - usercontroller (현재 메모리에 뜬 것)
public class UserRestControllerTest {

    @Autowired // @webMvcTest에서 AutoConfigureMockMvc가 IOC에 띄워준다.
    private MockMvc mvc; // 컨트롤러 요청 객체

    @MockBean // 구현체를 만들어준다.(껍데기만)
    private UserService userService;

    @Autowired
    private ObjectMapper om;

//    @Test
//    public void join_test() throws Exception {
//        // given (데이터 준비)
//        UserRequestDTO.JoinDTO joinDTO = new UserRequestDTO.JoinDTO();
//        joinDTO.setUserEmail("cos@nate.com");
//        joinDTO.setPassword1("meta1234!");
//        joinDTO.setUsername("cos");
//
//        String requestBody = om.writeValueAsString(joinDTO);
//        System.out.println("테스트 :" + requestBody);
//
//        // when (실행)
//        ResultActions actions = mvc.perform(post("/join").content(requestBody).contentType(MediaType.APPLICATION_JSON));
//        String responseBody = actions.andReturn().getResponse().getContentAsString();
//        System.out.println("테스트 : " + responseBody);
//        // then (상태 검증)
//        actions.andExpect(jsonPath("$.success").value(true));
//        actions.andExpect(jsonPath("$.response").value(nullValue()));
//        actions.andExpect(jsonPath("$.error").value(nullValue()));
//    }

}