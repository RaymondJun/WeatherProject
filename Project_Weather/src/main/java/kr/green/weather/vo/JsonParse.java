package kr.green.weather.vo;

import java.util.ArrayList;

import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsonParse {
	 @SerializedName("category") protected ArrayList<JsonParse> category;
	 @SerializedName("fcstValue") protected ArrayList<JsonParse> fcstValue;
}
