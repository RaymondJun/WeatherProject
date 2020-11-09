package kr.green.weather.getJson;

import com.google.gson.Gson;

import kr.green.weather.vo.JsonParse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class GsonPar {
	public String gsonParse(String result) {
		Gson gson = new Gson();
		JsonParse jsp = new JsonParse();
		JsonParse jp = gson.fromJson(result, JsonParse.class);
		//List<Api> list = Arrays.asList(arr);
	

		// Json parser를 만들어 만들어진 문자열 데이터를 객체화 
//		JsonParser jsonParser = new JsonParser();
//		JsonObject jsonObj = (JsonObject) jsonParser.parse(result);
//		// response 키를 가지고 데이터를 파싱 
//		JsonObject parse_response = (JsonObject) jsonObj.get("response");
//		// response 로 부터 body 찾기
//		JsonObject parse_body = (JsonObject) parse_response.get("body");
//		// body 로 부터 items 찾기 
//		JsonObject parse_items = (JsonObject) parse_body.get("items");
//		// items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다.
//		JsonArray parse_item = (JsonArray) parse_items.get("item");
//		String category;
//		JsonObject weather;
//		
//		for(int i = 0;i < parse_item.size();i++) {
//			// json 데이터 item에 들어있는 것을 한 줄씩 가져 온다.
//			weather = (JsonObject) parse_item.get(i);
//			// 각 카테고리의 값
//			Object fcstValue = weather.get("fcstValue");
//			category = weather.get("category").toString();
//			if(category == "PTY") {
//				System.out.println("+_=-_+__+_++_+_+___________________+_+__+__+_+__+__+_+__+___+_++_");
//				System.out.println(", PTY fcst_Value : "+ fcstValue);
//				System.out.println("+_=-_+__+_++_+_+___________________+_+__+__+_+__+__+_+__+___+_++_");
//			}
//			System.out.print("\tcategory : "+ category);
//			
//			System.out.print(", fcst_Value : "+ fcstValue);
//		}
	
		
		return null;
	}
}
