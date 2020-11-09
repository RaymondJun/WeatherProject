package kr.green.weather.getJson;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import kr.green.weather.dao.CustDAO;
import kr.green.weather.service.CustService;
import kr.green.weather.service.MapService;
import kr.green.weather.vo.CustVO;
import kr.green.weather.vo.MapVO;
import lombok.extern.slf4j.Slf4j;




@Slf4j
@XmlRootElement
public class GetApi {
	
	public static String getGjson(String x, String y) {
		// url 포트:
		// http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst
		// ?serviceKey=fy1M0mEYsaa2dtUH1WSy9j2uTK%2FDUctjI8%2FvtgVQe2bcHzRshhez7OkgnCqqKjPDCfxIT%2Fhrk9s5vFFT210p5Q%3D%3D
		// &pageNo=1
		// &numOfRows=10
		// &dataType=JSON
		// &base_date=20200928
		// &base_time=0500
		// &nx=60&ny=127&
		/*  서비스키				ServiceKey	4	필수	-	공공데이터포털에서 받은 인증키
			페이지 번호			pageNo		4	필수	1	페이지번호
			한 페이지 결과 수	numOfRows	4	필수	10	한 페이지 결과 수
			응답자료형식		dataType	4	옵션	XML	요청자료형식(XML/JSON)Default: XML
			발표일자			base_date	8	필수	20151201	15년 12월 1일 발표
			발표시각			base_time	4	필수	0600	06시 발표(정시단위)
			예보지점 			X 좌표	nx	2	옵션	18	예보지점의 X 좌표값
			예보지점 			Y 좌표	ny	2	옵션	1	예보지점 Y 좌표
		 */
		
		
//		String principal =  getPrincipal();
//		CustVO custVO = custDAO.selectById(principal);
//		
//		String addr = custVO.getCaddress();
//		String[] list = addr.split(" ");
//		String si = list[0]+"%";
//		String gu = list[1];
//				
//		x = mapService.selectBySiGuLikeX(si, gu).toString();
//		y = mapService.selectBySiGuLikeY(si, gu).toString();
//		
//		if(x == null && y == null) {
//			gu = list[1]+list[2];
//			x = mapService.selectBySiGuLikeX(si, gu).toString();
//			y = mapService.selectBySiGuLikeY(si, gu).toString();
//		}
		
		String date = Time.useDate();
		String time = Time.useDate2();
		
		StringBuilder 	sb = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst");
		String 			serviceKey = "fy1M0mEYsaa2dtUH1WSy9j2uTK%2FDUctjI8%2FvtgVQe2bcHzRshhez7OkgnCqqKjPDCfxIT%2Fhrk9s5vFFT210p5Q%3D%3D";
		String 			pageNo = "1";
		String 			numOfRows = "10";
		String 			dataType = "JSON";
		String 			base_date = date;
		String 			base_time = time;
		String 			nx = x;
		String 			ny = y;
		String			result = null;
		try {
			
			// 서비스 키 넣기
			sb.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" +serviceKey);//URLEncoder.encode("%3D" + serviceKey,"UTF-8")
			System.out.println();
			// 페이지 번호 넣기
			sb.append("&"+URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo);
			// 한 페이지 결과 수 넣기
			sb.append("&"+URLEncoder.encode("numOfRows","UTF-8") + "=" + numOfRows);
			// 응답자료형식
			sb.append("&"+URLEncoder.encode("dataType","UTF-8") + "=" + dataType);
			// 발표일자
			sb.append("&"+URLEncoder.encode("base_date","UTF-8") + "=" + base_date);
			// 발표시각
			sb.append("&"+URLEncoder.encode("base_time","UTF-8") + "=" + base_time);
			// 예보지점 X 좌표
			sb.append("&"+URLEncoder.encode("nx","UTF-8") + "=" + nx);
			// 예보지점 Y 좌표
			sb.append("&"+URLEncoder.encode("ny","UTF-8") + "=" + ny);
			System.out.println(sb);
			URL url = new URL(sb.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "applicatoin/json");
			System.out.println("REsponse code:" + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			Gson gson = new Gson();
			StringBuilder sb1 = new StringBuilder();
			String line;
			while((line = rd.readLine()) != null) {
				sb1.append(line+"\n");
			}
			log.debug("============================================================================");
			log.debug("sb1 결과 : " + sb1);
			log.debug("============================================================================");
			rd.close();
			conn.disconnect();
			//System.out.println(sb1.toString());
			
			result = sb1.toString();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		
		return result;
	}
	
	public static void main(String[] args) {
		String result = GetApi.getGjson("60", "127");
		Gson gson = new Gson();
		result =  gson.fromJson(result, GsonPar.class).toString();
		System.out.println();
		System.out.println("결과 : "+  result);
	}
	
		
}
