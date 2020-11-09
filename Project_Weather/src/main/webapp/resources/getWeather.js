$(function() {
		var today = new Date();
	    var week = new Array('일','월','화','수','목','금','토');
	    var year = today.getFullYear();
	    var month = today.getMonth()+1;
	    var day = today.getDate();
	    var hours = today.getHours();
	    var minutes = today.getMinutes();
	    /*
	     * 기상청 30분마다 발표
	     * 30분보다 작으면, 한시간 전 hours 값
	     */
	    if(minutes < 30){
	        hours = hours - 1;
	        if(hours < 0){
	            // 자정 이전은 전날로 계산
	            today.setDate(today.getDate() - 1);
	            day = today.getDate();
	            month = today.getMonth()+1;
	            year = today.getFullYear();
	            hours = 23;
	        }
	    }
	    
	    /* example
	     * 9시 -> 09시 변경 필요
	     */
	    
	    if(hours < 10) {
	        hours = '0'+hours;
	    }
	    if(month < 10) {
	        month = '0' + month;
	    }    
	    if(day < 10) {
	        day = '0' + day;
	    } 
	 
	    today = year+""+month+""+day;
	    
	    /////////////////////////////////////////// x와 y 좌표 가져오기
	    var _nx = x; 
	    var _ny = y;
	    
	    myApiKey = "fy1M0mEYsaa2dtUH1WSy9j2uTK%2FDUctjI8%2FvtgVQe2bcHzRshhez7OkgnCqqKjPDCfxIT%2Fhrk9s5vFFT210p5Q%3D%3D";
	    
	    mainURL =  "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
	    mainURL += "?serviceKey=" + myApiKey;
	    mainURL += "&pageNo=1";
	    mainURL += "&numOfRows=10";
	    mainURL += "&dataType=JSON";
	    mainURL += "&base_date=" + today;
	    mainURL += "&base_time=" + hours +"00";
	    mainURL += "&nx=" + _nx + "&ny=" + _ny;
	    
	    $.ajax({
	        url: mainURL,
	        type: 'get',
	        success: function(data) {
	        	var $data = $(data).find("response>body>items>time");
	        	var category = '';
	        	
	        	// T3H 3시간 기온
	        	var temp = '';	
	        	// SKY 하늘 상태 맑음(1), 구름많음(3), 흐림(4) 
	        	var sky = '';	
	        	// PTY 강수형태 없음(0), 비(1), 진눈개비(2), 눈(3), 소나기(4), 빗방울(5), 빗방울/눈날림(6), 눈날림(7)
	        	var rain = '';	
	        	$.each($data, function(i,o) {
					category = $(o).find("category").text();
					
					if(category == 'T3H'){
						temp = $(this).find("factValue").text();
					}
					if(category == 'SKY'){
						sky = $(this).find("factValue").text();
					}
					if(category == 'PTY'){
						rain = $(this).find("factValue").text();
					}
				});
	        	
	        	if(rain != 0){// if
	        		switch (rain) {
						case '1'://비(1)
							
						break;
						case '2'://진눈개비(2)
							
						break;
						case '3'://눈(3) 
							
						break;
						case '4'://소나기(4) 
							
						break;
						case '5'://빗방울(5) 
							
						break;
						case '6'://빗방울/눈날림(6), 눈날림(7) 
							
						break;
						case '7'://눈날림(7)  
							
						break;
					}// switch
	        	}else{
	        		switch (sky) {
						case '1':// 맑음(1)
							
						break;
						case '3':// 구름많음(3),
							
						break;
						case '4':// 흐림(4)
					}// switch
	        	} // else
	        	
	        } // success function
	});
});