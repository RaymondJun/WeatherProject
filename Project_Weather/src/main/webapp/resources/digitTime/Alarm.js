$(function(){

	// Cache some selectors

	var clock = $('#clock'),
		alarm = clock.find('.alarm'),
		ampm = clock.find('.ampm'),
		dialog = $('#alarm-dialog').parent(),
		alarm_set = $('#alarm-set'),
		alarm_clear = $('#alarm-clear'),
		time_is_up = $('#time-is-up').parent();
	
	// This will hold the number of seconds left
	// until the alarm should go off
	var alarm_counter = -1;

	// Map digits to their names (this will be an array) 디지털 문자 이름 표기
	var digit_to_name = 'zero one two three four five six seven eight nine'.split(' ');

	// This object will hold the digit elements 디지털 문자 표기
	var digits = {};

	// Positions for the hours, minutes, and seconds 현재 시간 표기
	var positions = [
		'h1', 'h2', ':', 'm1', 'm2', ':', 's1', 's2'
	];

	// Generate the digits with the needed markup,
	// and add them to the clock
	/////////////////////////////digital 숫자로 현재 시간 만들기
	var digit_holder = clock.find('.digits');

	$.each(positions, function(){

		if(this == ':'){
			digit_holder.append('<div class="dots">');
		}
		else{

			var pos = $('<div>');

			for(var i=1; i<8; i++){
				pos.append('<span class="d' + i + '">');
			}

			// Set the digits as key:value pairs in the digits object
			digits[this] = pos;

			// Add the digit elements to the page
			digit_holder.append(pos);
		}

	});
	/////////////////////////////digital 숫자로 현재 시간 만들기

	//////////////////// Add the weekday names 요일 보이기

	var weekday_names = 'MON TUE WED THU FRI SAT SUN'.split(' '),
		weekday_holder = clock.find('.weekdays');

	$.each(weekday_names, function(){
		weekday_holder.append('<span>' + this + '</span>');
	});

	var weekdays = clock.find('.weekdays span');
	///////////////////////////////////// Add the weekday names 요일 보이기
	
	
	
    // 알람을 맞추기 위한 현재 시간 설정용 변수
    var curTime;
    var curTimeH;
    var ap;

	// Run a timer every second and update the clock 매 시간 표기

	$(function update_time(){

		// moment.js 로 현재시간 String 으로 표기
		// hh 12시간 형식으로 표기
		// mm - minutes, ss-seconds (all with leading zeroes),
		// d = 요일표기 , A = AM/PM 표기

		var now = moment().format("hhmmssdA");
		var nowH = moment().format("HHmmss");
        
		digits.h1.attr('class', digit_to_name[now[0]]);
		digits.h2.attr('class', digit_to_name[now[1]]);
		digits.m1.attr('class', digit_to_name[now[2]]);
		digits.m2.attr('class', digit_to_name[now[3]]);
		digits.s1.attr('class', digit_to_name[now[4]]);
		digits.s2.attr('class', digit_to_name[now[5]]);

		// The library returns Sunday as the first day of the week.
		// Stupid, I know. Lets shift all the days one position down, 
		// and make Sunday last
        // 현재시간을 합쳐서 숫자로 계산
        curTime = parseInt(now[0]+now[1]+now[2]+now[3]+now[4]+now[5]);
        curTimeH = parseInt(nowH[0]+nowH[1]+nowH[2]+nowH[3]+nowH[4]+nowH[5]);
		// 오전 오후 확인 A or P
		ap = now[7];
		console.log(ap);
		var dow = now[6];
		dow--;
		
		// Sunday!
		if(dow < 0){
			// Make it last
			dow = 6;
		}

		// Mark the active day of the week
		weekdays.removeClass('activeR').eq(dow).addClass('activeR');

		// Set the am/pm text: AMPM 텍스트로 뿌리기
		ampm.text(now[7]+now[8]);

		// Is there an alarm set?
        
		//if(alarm_counter > curTime){
			
			// Decrement the counter with one second
			//alarm_counter--;////////////////////////

			// Activate the alarm icon
			//alarm.addClass('activeR');
		//}
		console.log(alarm_counter);
		console.log(curTime);
		if(alarm_counter == curTime){
			console.log("안에 카운터 : "+alarm_counter);
			console.log("안에 커타임 : " + curTime);
			time_is_up.fadeIn();

			// Play the alarm sound. This will fail
			// in browsers which don't support HTML5 audio

			try{
				$('#alarm-ring')[0].play();
			}
			catch(e){}
			
			alarm_counter--;
			alarm.removeClass('activeR');
		}
		else{
			// The alarm has been cleared
			alarm.removeClass('activeR');
		}

		// Schedule this function to be run again in 1 sec
		setTimeout(update_time, 1000);
        
	});

	// Switch the theme

	$('#switch-theme').click(function(){
		clock.toggleClass('light dark');
	});


	// Handle setting and clearing alamrs

	$('.alarm-button').click(function(){
		
		// Show the dialog
		dialog.trigger('show');

	});

	dialog.find('.close').click(function(){
		dialog.trigger('hide')
	});

	dialog.click(function(e){

		// When the overlay is clicked, 
		// hide the dialog.

		if($(e.target).is('.overlay')){
			// This check is need to prevent
			// bubbled up events from hiding the dialog
			dialog.trigger('hide');
		}
	});
    

	alarm_set.click(function(){

		var valid = true, after = 0,
			to_seconds = [3600, 60, 1];
        var set = [];
        var setT = "";
		dialog.find('.input').each(function(i){

			// Using the validity property in HTML5-enabled browsers:

			if(this.validity && !this.validity.valid){

				// The input field contains something other than a digit,
				// or a number less than the min value

				valid = false;
				this.focus();

				return false;
			}

            // 알람 설정 값 가져와서 INT로 만들기
            set.push(this.value);
            for(var i = 0; i<set.length;i++){
                console.log(" set["+ i +"] : " + set[i]);
            }
            
            setT = parseInt(set[0] + set[1] + set[2]);
            
            console.log(" INSIDE setT : " + setT);
			after = setT; // to_seconds[i]
           
		});
        console.log(" OUT SIDE set : " + set);
        console.log(" OUT SIDE setT : " + setT);
		if(!valid){
			alert('숫자만 입력하셔야 합니다!');
			return;
		}
		
		if(after < curTime){
			alert('현재 시간보다 앞선 시간을 선택해주세요!');
			$('.input').val("");
			return;	
		}else if(after>=125959){
			alert('시간 단위는 12시간 단위로 지정해주세요!');
			after.clear();
			return;
		}

		alarm_counter = after;
		dialog.trigger('hide');
	});

	alarm_clear.click(function(){
		alarm_counter = -1;

		dialog.trigger('hide');
	});

	// Custom events to keep the code clean
	dialog.on('hide',function(){

		dialog.fadeOut();

	}).on('show',function(){

		// Calculate how much time is left for the alarm to go off.

		var hours = 0, minutes = 0, seconds = 0, tmp = 0;

		if(alarm_counter > 0){
			
			// There is an alarm set, calculate the remaining time

			tmp = alarm_counter;

			hours = Math.floor(tmp/3600);
			tmp = tmp%3600;

			minutes = Math.floor(tmp/60);
			tmp = tmp%60;

			seconds = tmp;
		}

		// Update the input fields
		dialog.find('.input').eq(0).val(hours).end().eq(1).val(minutes).end().eq(2).val(seconds);

		dialog.fadeIn();

	});

	time_is_up.click(function(){
		time_is_up.fadeOut();
	});

});