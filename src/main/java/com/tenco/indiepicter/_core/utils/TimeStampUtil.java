package com.tenco.indiepicter._core.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TimeStampUtil {
    public static String timeStampToString(Timestamp time) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
        return simpleDateFormat.format(time);
    }

}
