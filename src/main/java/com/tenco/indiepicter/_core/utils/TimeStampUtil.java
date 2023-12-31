package com.tenco.indiepicter._core.utils;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class TimeStampUtil {
    public static String timeStampToString(Timestamp time) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(time);
    }

    public static String timeStampToDate(Timestamp time) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(time);
    }

    // 예. 14:58:00 => 14:58
    public static String timeToSubstring(String time) {
        return time.substring(0, time.length() -3);
    }

    // d-day
    public static String dDayFormatToDate(Timestamp date) {
        // 변환
        LocalDateTime dueDateTime = date.toLocalDateTime().plusDays(3);

        // 구매 종료(+3일)
        Integer year = dueDateTime.getYear();
        Integer month = dueDateTime.getMonthValue();
        Integer day = dueDateTime.getDayOfMonth();

        // 현재일 - 마감일
        LocalDate dueDate = LocalDate.of(year, month, day);
        LocalDate currentDate = LocalDate.now();
        Long daysDifference = ChronoUnit.DAYS.between(currentDate, dueDate);

        if (daysDifference == 0) {
            return "D-Day";
        } else {
            return "D - " + daysDifference;
        }
    }

    public static Timestamp StringToTimestamp(String dateString) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date parsedDate = dateFormat.parse(dateString);
            return new Timestamp(parsedDate.getTime());
        } catch (ParseException e) {
            // 날짜 파싱 실패 시 예외 처리
            e.printStackTrace();
            return null; //
        }

    }

    public static Time StringToTime(String timeString) {
        try {
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
            Date parsedTime = timeFormat.parse(timeString);
            return new Time(parsedTime.getTime());
        } catch (ParseException e) {
            // 시간 파싱 실패 시 예외 처리
            e.printStackTrace();
            return null;
        }
    }
}
