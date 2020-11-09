package kr.green.weather.getJson;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {
	
	public static String useDate() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String time1 = sdf1.format(date);
		return time1;
	}
	public static String useDate2() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("HHmm");
		Date date = new Date();
		String time2 = sdf1.format(date);
		int tt = Integer.parseInt(time2);
//		- Base_time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
//		- API 제공 시간(~이후) : 02:10, 05:10, 08:10, 11:10, 14:10, 17:10, 20:10, 23:10
		if (tt >=300 && tt <= 459) {
			time2 = "0200";
		}else if(tt >=600 && tt <= 759) {
			time2 = "0500";
		}else if(tt >=900  && tt <=1059) {
			time2 = "0800";
		}else if(tt >=1200  && tt <=1359) {
			time2 = "1100";
		}else if(tt >=1500  && tt <=1659) {
			time2 = "1400";
		}else if(tt >=1800  && tt <=1959) {
			time2 = "1700";
		}else if(tt >=2100  && tt <=2259) {
			time2 = "2000";
		}else if(tt >=2300 && tt<=2359) {
			time2 = "2300";
//			if(tt>=1 && tt<=159) {
//				Date date1 = new Date();
//				// 3. 오늘날짜 format에 맞춰서 String 으로 변경(기준날짜가 오늘이 아니면 생략가능)
//				Calendar cal = Calendar.getInstance();
//				// 4. 기준이 되는 날짜(format에 맞춘)
//				// 5. 한국 날짜 기준 Calendar 클래스 선언
//				// 6. 선언된 Calendar 클래스에 기준 날짜 설정
//				cal.setTime(cal);
//				// 7. 하루전으로 날짜 설정
//				cal.add(Calendar.DATE, -1);
//			}
		}
		return time2;
	}
	
	/*
	 * public static String useCalendar() { SimpleDateFormat sdf1 = new
	 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); SimpleDateFormat sdf2 = new
	 * SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	 * 
	 * Calendar calendar = Calendar.getInstance();
	 * 
	 * String time1 = sdf1.format(calendar.getTime()); String time2 =
	 * sdf2.format(calendar.getTime());
	 * 
	 * return time1; } public static String useCTM() { SimpleDateFormat sdf1 = new
	 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); SimpleDateFormat sdf2 = new
	 * SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	 * 
	 * String time1 = sdf1.format(System.currentTimeMillis()); String time2 =
	 * sdf2.format(System.currentTimeMillis());
	 * 
	 * return time1; } public static String useDateCal() { SimpleDateFormat sdf =
	 * new SimpleDateFormat("yyyyMMdd HHmmss");
	 * 
	 * Date date = new Date();
	 * 
	 * Calendar calendar = Calendar.getInstance();
	 * 
	 * calendar.setTime(date); // 현재 시간보다 한시간 이전 시간 을 구함 calendar.add(calendar.HOUR,
	 * -1); // 한시간 이전 시간을 가져옴 String pastHour = sdf.format(calendar.getTime());
	 * 
	 * return pastHour; }
	 */
}
