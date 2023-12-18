package com.tenco.indiepicter._core.utils;

import java.util.List;
import java.util.StringJoiner;

public class StringUtil {
    public static String listToString(List<String> dataList) {

        StringJoiner joiner = new StringJoiner(", ", "", "");

        for (String item : dataList) {
            joiner.add(item);
        }

        return joiner.toString();
    }

    public static String stringJoin(String a, String b){
        String[] arr1 = a.split(", ");
        String[] arr2 = b.split(", ");

        // StringJoiner를 사용하여 새로운 문자열 생성
        StringJoiner resultJoiner = new StringJoiner(", ");

        for (int i = 0; i < arr1.length; i++) {

            // StringJoiner에 요소 추가
            resultJoiner.add(arr1[i] + " (" + arr2[i] + ")");
        }

        return resultJoiner.toString();
    }

    public static String stringBrJoin(String a, String b){
        String[] arr1 = a.split(", ");
        String[] arr2 = b.split(", ");

        // StringJoiner를 사용하여 새로운 문자열 생성
        StringJoiner resultJoiner = new StringJoiner("");

        for (int i = 0; i < arr1.length; i++) {

            // StringJoiner에 요소 추가
            resultJoiner.add(arr1[i] + " (" + arr2[i] + ")</br>");
        }

        return resultJoiner.toString();
    }
}
