package com.tenco.indiepicter._core.utils;

import java.text.DecimalFormat;

public class PercentUtill {
	
	// 달성률 퍼센트로 가공
	public static String decimalFormat(Integer presentPrice) {
		DecimalFormat decimalFormat = new DecimalFormat("#.#E0");
		return decimalFormat.format(presentPrice);
	}  

}
