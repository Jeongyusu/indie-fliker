package com.tenco.indiepicter._core.utils;

import com.tenco.indiepicter._core.advice.ValidAdvice;
import com.tenco.indiepicter.user.UserRestController;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;

import java.sql.Date;
import java.time.LocalDate;


public class DateUtilTest {
    @Test
    public void dateUtil_test(){
        LocalDate test1 = DateUtil.stringToDate("1992-02-10");
        System.out.println("나여기" + test1);
    }
}
