package com.tenco.indiepicter._core.utils;

import java.util.ArrayList;
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

    public static String addBracketsWithComma(List<String> inputList) {
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < inputList.size(); i++) {
            result.append("[").append(inputList.get(i)).append("]");

            // 마지막 요소 뒤에는 쉼표 추가하지 않음
            if (i < inputList.size() - 1) {
                result.append(",");
            }
        }

        return result.toString();
    }

    public static String stringJoin(String a, String b) {
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

    public static String stringBrJoin(String a, String b) {
        String[] arr1 = a.split(", ");
        String[] arr2 = b.split(", ");

        // StringJoiner를 사용하여 새로운 문자열 생성
        StringJoiner resultJoiner = new StringJoiner("");

        // arr1과 arr2 중에서 길이가 더 짧은 쪽까지만 반복
        int length = Math.min(arr1.length, arr2.length);
        for (int i = 0; i < length; i++) {
            // StringJoiner에 요소 추가
            resultJoiner.add("[" + arr1[i] + "]" + " (" + arr2[i] + ")</br>");
        }

        return resultJoiner.toString();
    }


    public static String stringAwardBrJoin(String a, String b) {
        String[] arr1 = a.split(", ");
        String[] arr2 = b.split(", ");

        // StringJoiner를 사용하여 새로운 문자열 생성
        StringJoiner resultJoiner = new StringJoiner("");

        // arr1과 arr2 중에서 길이가 더 짧은 쪽까지만 반복
        int length = Math.min(arr1.length, arr2.length);
        for (int i = 0; i < length; i++) {
            // StringJoiner에 요소 추가
            resultJoiner.add(arr1[i] + " (" + arr2[i] + ")</br>");
        }

        return resultJoiner.toString();
    }


    public static List<Integer> convertStringToListInteger(String inputString) {
        List<Integer> resultList = new ArrayList<>();

        String[] stringArray = inputString.split(",");

        for (String str : stringArray) {
            resultList.add(Integer.parseInt(str.trim()));
        }

        return resultList;
    }
}