$(function() {
	$("#cemail").click(function() {
		var emailCk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var cemail = prompt("아이디 중복체크");
		$("#cemail").val(cemail);
		cemail = $(this).val();
		if(cemail==null || cemail.trim().length==0){
			$.notify("이러한 형식의 아이디는 사용 하실 수 없습니다.", "info");
			$("#cemail").val("");
		}else if(cemail.match(emailCk) == null) {
			$.notify("아이디는 반드시 이메일 형식으로 입력하셔야 합니다.", "info");
			$("#cemail").val("");
		}else{
			cemail = $(this).val();
    		idCkURL = 'http://localhost:8080/weather/idCheck';
    		$.ajax({
    			data:{cemail:cemail},
    			url:idCkURL,
    			dataType:'text',
    			type:'GET',
    			success: function(data){
    				if(data=="true"){
    					$.notify("이미 사용중인 아이디입니다.", "info");
    					$("#cemail").val("");
    				}else{
    					$.notify("사용 가능한 아이디입니다.", "info");
    				}
    				
    			}
    		});
		}
	});
});
	    
$(function(){


	
	// 회원등록 스크립 시작 =================================================	
		$("#cancelBtn").click(function() {
	       location.href="home";
	    });
	    
		// 우편번호로 다음 주소 검색
		$("#czipcode").click(function() {
			new daum.Postcode({
	            oncomplete: function(data) {
	            	// 지번 주소 변수  var jibunAddress = data.jibunAddress;
	            	$("#czipcode").val(data.zonecode); // 우편번호
	            	$("#caddress").val(data.jibunAddress); // 지번 주소
	            	$("#caddress").focus();
	            	
	            }
	        }).open();
		});
		$('#czipcode').css('cursor', 'pointer');
		
// 폼 체크  관련 요소들 =========================================================================================
		

	    	
	    	
	    	
// 달력을 datepicker 로 사용하기 ========================================================================================================================	    	
	    	//$(function() {	
	    		$('#cbirth').datepicker({
	    		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    		    //startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    		    //endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	    		    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
	    		    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
	    		    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
	    		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
	    		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
	    		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
	    		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
	    		    templates : {
	    		        leftArrow: '&laquo;',
	    		        rightArrow: '&raquo;'
	    		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
	    		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
	    		    title: "생년월일",	//캘린더 상단에 보여주는 타이틀
	    		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
	    		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	    		    
	    		});//datepicker end
	    		$('#cbirth').css('cursor', 'pointer');
	    	//});//ready end
// 달력을 datepicker 로 사용하기 ========================================================================================================================	    	
	// 회원등록 스크립 끝 =================================================




	// ABOUT 스크립 시작 =================================================
	
		
	// ABOUT 스크립 끝 =================================================
	
	
	
});// main 쿼리 끝--------------------
// 폼 체크  관련 요소들 =========================================================================================
	    	$(function() { 
	    		$("#delBtn").click(function() {
	    			$.notify("Alert!", {type:"info"});
	    		});
	    	});
	    	
	    	
// 체크박스 하나만 선택 가능 메서드===========================================================================
	  			$(function() { 
					  $('input[name="cgender"]').click(function(){
					  	if($(this).prop('checked')){
					  		$('input[name="cgender"]').prop('checked',false);
					  		$(this).prop('checked',true);
					  	}
					  });
				});
// 체크박스 하나만 선택 가능 메서드===========================================================================


// 정보 수정에 성별로 체크 상태 띄우기 ========================================================================
	    	 $(function() {
	    	 	var value = $("#cgender").val();
				if(value == 'M'){
					$("#cgender1").attr('checked','checked');
				}else if(value=='F'){
					$("#cgender2").attr('checked','checked');
				};
			});
// 정보 수정에 성별로 체크 상태 띄우기 ========================================================================
	function formCheck() {
				
				
	    		var value = $("#cpassword").val();
	    		if(value== null || value.trim().length==0){
	    			$.notify("비밀번호는 반드시 입력하셔야 합니다.", "info");
	    			$("#cpassword").val("");
	    			$("#cpassword").focus();
	    			return false;
	    		}
	    		var value = $("#cpassword2").val();
	    		if(value== null || value.trim().length==0){
	    			$.notify("비밀번호 확인은 반드시 입력하셔야 합니다.", "info");
	    			$("#cpassword2").val("");
	    			$("#cpassword2").focus();
	    			return false;
	    		}
	    		
	    		// 비밀번호 일치 검사
	    		if($("#cpassword").val()!= $("#cpassword2").val()){
	    			$.notify("비밀번호가 일치하지 않습니다.", "info");
	    			$("#cpassword").val("");
	    			$("#cpassword2").val("");
	    			$("#cpassword").focus();
	    			return false;
	    		}
	    		
	    		var value = $("#cname").val();
	    		if(value== null || value.trim().length==0){
	    			$.notify("이름은 반드시 입력해야 합니다.", "info");
	    			$("#cname").val("");
	    			$("#cname").focus();
	    			return false;
	    		}
	    		
	    		return true;
	  
};