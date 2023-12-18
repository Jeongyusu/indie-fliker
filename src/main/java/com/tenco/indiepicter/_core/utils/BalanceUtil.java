package com.tenco.indiepicter._core.utils;

import java.text.DecimalFormat;

public class BalanceUtil {


    // 천 단위 콤마 찍기
    public static String formatBalance(Integer balance){
        DecimalFormat df = new DecimalFormat("###,###");
        String formatMoney = df.format(balance);
        return formatMoney;
    }

    // 달성률 계산 및 정수 값 포맷
    public static String calculateAndSetAchievementRate(Integer targetPrice, Integer presentPrice) {

        Double achievementRate = 0.0;

        if (targetPrice == 0) {
            achievementRate = 0.0;
        } else {
            // 소숫점 자리를 유지하고 반올림
            achievementRate = (double) Math.round(((double) presentPrice / targetPrice * 100) * 10) / 10.0;
        }

        // 출력 시 소수점 이하 자릿수를 표시하지 않도록 설정
        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
        String formattedAchievementRate = decimalFormat.format(achievementRate);

        return formattedAchievementRate;
    }


}
