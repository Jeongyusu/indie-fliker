package com.tenco.indiepicter._core.utils;

import java.text.DecimalFormat;

public class BalanceUtil {

    // 천 단위 콤마 찍기
    public static String formatBalance(Integer balance){
        DecimalFormat df = new DecimalFormat("###,###");
        String formatMoney = df.format(balance);
        return formatMoney;
    }
}
