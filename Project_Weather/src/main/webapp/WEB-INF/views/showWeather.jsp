<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>날씨 보기</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<!--  table  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/component.css" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/headers/header-default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/parallax-slider/css/parallax-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/custom.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <!-- svg -->
    <link href="https://code.jquery.com/jquery-2.2.4.min.js" rel="text/javascript">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.4.1/snap.svg-min.js" ></script>
	<script  src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/svg/codePan.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/svg/weatherSvg.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/svg/weatherSvgCss.css">
    <!--  google font -->	
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontYeon.css">
	<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<script type="text/javascript">
	$(function() {
	    mainURL = 'http://localhost:8080/weather/xxx';
	    var date = new Date();
	    var h = date.getHours();
	    console.log(typeof h);
		$.ajax({
	        url: mainURL,
	        type: 'GET',
	        success: function(data) {
	        	var json = JSON.parse(data);
	        	var jj = json["response"].body.items.item;
	        	//console.log(jj);
	        	var t = {};
	        	var sky;
	        	var rain;
	        	var temp;
	        	var arr = [];
        		$(jj).each(function(index, item) {
       				var fcstVal = item.fcstValue;
       				arr.push({category:item.category, fcstValue:fcstVal});
       				//map[cateVal] = {fcstValue:fcstVal};
       				//map[cateVal] = fcstVal;
       				//map[fcstValue] = fcstVal;
       				//t = {indx:map};
       				//console.log("T  : ", t);
       				/* map[category] = cateVal;
       				map[fcstValue] = fcstVal; */
					//var sky = map.filter(sky => sky.category.includes('T3H')); 
					//var sky = jj[index].fcstValue;

				});
	        		if(arr[0].category=="POP"){
						var rainPer = 	arr[0].fcstValue;
						console.log("rainPer  : ", rainPer);
						$("#summary").html("강수확률 : " + rainPer +"%");
					};
	        		if(arr[1].category=="PTY"){
						rain = 	arr[1].fcstValue;
						console.log("rain  : ", rain);
					};
					if(arr[6].category == "T3H"){
						temp = arr[6].fcstValue;
						console.log("temp6  : ", temp);
					}else if(arr[5].category == "T3H"){
						temp = arr[5].fcstValue;
						console.log("temp5  : ", temp);
					}else if(arr[4].category == "T3H"){
						temp = arr[4].fcstValue;
						console.log("temp4  : ", temp);
					}else if(arr[3].category == "T3H"){
						temp = arr[3].fcstValue;
						console.log("temp3  : ", temp);
					};
					
					if(arr[6].category == "SKY"){
						sky = arr[6].fcstValue;
						console.log("sky6  : ", sky);
					}else if(arr[5].category == "SKY"){
						sky = arr[5].fcstValue;
						console.log("sky5  : ", sky);
					}else if(arr[4].category == "SKY"){
						sky = arr[4].fcstValue;
						console.log("sky4  : ", sky);
					}else if(arr[3].category == "SKY"){
						sky = arr[3].fcstValue;
						console.log("sky3  : ", sky);
					};
					
	        	// 3시간 기온이 현 날씨 보다 4도 낮게 나온다.
	        	temp = temp * 1;
	        	console.log(typeof temp);
	        	console.log(typeof rain);
	        	 // 현재 기온을 표시한다.
	        	$(".temp").html((temp+ 3) + '<span style="font-size: 30px;line-height: 30px;vertical-align: top;margin-left: 5px;">c</span>');
	        	
	        	 if(rain != null){// if
	        		switch (rain) {
	        		//button-snow button-rain button-wind button-thunder button-sun
	        			case '0':
	        				$("#button-sun").bind("click");
	        				$("#button-sun").trigger("click");
	        				
	        			break;
						case '1'://비(1)
	        				$("#button-rain").bind("click");
	        				$("#button-rain").trigger("click");
							//$("#showRain").append("비");
						break;
						case '2'://진눈개비(2)
	        				$("#button-rain").bind("click");
	        				$("#button-rain").trigger("click");
							//$("#showRain").append("진눈개비");
						break;
						case '3'://눈(3) 
	        				$("#button-rain").bind("click");
	        				$("#button-rain").trigger("click");
							//$("#showRain").append("눈");
						break;
						case '4'://소나기(4) 
	        				$("#button-rain").bind("click");
	        				$("#button-rain").trigger("click");
							//$("#showRain").append("소나기");
						break;
						case '5'://빗방울(5) 
	        				$("#button-rain").bind("click");
	        				$("#button-rain").trigger("click");
							//$("#showRain").append("빗방울");
						break;
						case '6':// 빗방울/눈날림(6)
	        				$("#button-rain").bind("click");
	        				$("#button-rain").trigger("click");
							//$("#showRain").append("우박");
						break;
						case '7'://눈날림(7)  
							$("#button-snow").bind("click");
	        				$("#button-snow").trigger("click");
						break;
					}// switch
	        	}
	        	if(sky != null){
	        		switch (sky) {
						case '1':// 맑음(1)
							if(h<18){
								$("#button-sun").bind("click");
		        				$("#button-sun").trigger("click");
							}else if(h>18){
								$("#button-sunn").bind("click");
		        				$("#button-sunn").trigger("click");
							}
							
						break;
						case '3':// 구름많음(3),
							$("#button-cloud").bind("click");
	        				$("#button-cloud").trigger("click");
							
						break;
						case '4':// 흐림(4)
							$("#button-cloud").bind("click");
	        				$("#button-cloud").trigger("click");
						break;
					}// switch
	        	}// else
	        	
	        },// success function
	        error : function(data){
	            console.log('실패 - '+data);
	        }

		});// ajax 
}); // main function	
</script>
<script type="text/javascript">

</script>
</head>	

<body>
<script>
 	window.console = window.console || function(t) {};
</script>
<script>
	if (document.location.search.match(/type=embed/gi)) {
  		 window.parent.postMessage("resize", "*");
 	}
</script>    

<div class="wrapper">
    <!--=== Header ===-->    
    <div class="header">
        <div class="container">
            <!-- Logo -->
            <a class="logo" href="home">
                <img src="${pageContext.request.contextPath }/resources/assets/img/wlogo.png"  width="150" height="40" alt="Logo">
            </a>
            <!-- End Logo -->
            
            <!-- Topbar -->
             <!-- Topbar -->
            <!-- <div class="topbar">
                <ul class="loginbar pull-right">
                    <c:if test="${empty custVO }">
	                    <li class="topbar-devider"></li>   
	                    <li><a href="page_faq.html">Help</a></li>  
	                    <li class="topbar-devider"></li>   
	                    <li><a type="" href="login">로그인</a></li>   
                     </c:if>
                   <form action="logout" method="post">
                    <c:if test="${not empty custVO }">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    	<button id="logoutBtn" class="topbar-devider" >로그아웃</button>
                    </c:if>
                   </form>
                </ul>
            </div> -->
            <!-- End Topbar -->
            <!-- Topbar -->
            <div class="topbar">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <ul class="loginbar pull-right">
	                <c:if test="${empty custVO }">
	                	<li class="topbar-devider"></li> <!-- 클래스 hoverSelector -->
	                    <li ><a href="question">Help</a></li>
	                    <li class="topbar-devider"></li>   
	                    <li><a href="page_faq.html">회원가입</a></li>  
	                    <li class="topbar-devider"></li>   
	                    <li><a href="login">로그인</a></li>
	                </c:if>
	                <c:if test="${not empty custVO }">
	                	<li class="topbar-devider"></li>
	                    <li ><a  href="logout">로그아웃</a></li>
	                    <li class="topbar-devider"></li>   
	                    <li><a href="update">정보 수정</a></li>  
	                    <li class="topbar-devider"></li>   
	                    <li><a href="changePass">비번 변경</a></li>
	                </c:if>
                </ul>
            </div>
            <!-- End Topbar -->

            <!-- Toggle get grouped for better mobile display -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars"></span>
            </button>
            <!-- End Toggle -->
        </div><!--/end container-->

        <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                	<div class="container">
                    <ul class="nav navbar-nav">
                        <!-- Home -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Home
                            </a>
                            <ul class="dropdown-menu">
                                
                                <!-- Shop UI Page -->
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">고객센터</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="question">문의 사항</a></li>
                                    </ul>                              
                                </li>
                                <!-- End Shop UI -->
                            </ul>
                        </li>
                        <!-- End Home -->

                        <!-- Pages -->                        
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Abouts
                            </a>
                            <ul class="dropdown-menu">
                                <!-- About Pages -->
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">About Pages</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="about">Weather 관하여</a></li>
                                    </ul>                                
                                </li>
                                <!-- End About Pages -->
                            </ul>
                        </li>
                        <!-- End Pages -->

                        <!-- Blog -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Weather
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="showWeather">날씨 보기</a>
                                </li>
                                <li>
                                    <a href="showAlarm">알 람</a>
                                </li>
                            </ul>
                         </li>
                        <!-- End Blog -->

                        <!-- Portfolio -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                               Manager
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">회원 관리</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="custLists">회원 목록</a></li>
                                        <li><a href="delCustLists">회원 탈퇴 관리</a></li>
                                        <li><a href="roleLists">회원 권한 관리</a></li>
                                    </ul>                                
                                </li>                        
                            </ul>
                        </li>
                        <!-- End Portfolio -->
                    </ul>
                   </div>
                </div><!--/navbar-collapse-->
    </div>
    <!--=== End Header ===-->

    <!--=== Interactive Slider ===-->
    <div class="breadcrumbs-v3 img-v3 text-center">
        <div class="container">
            <h1>우리 집 날씨</h1>
        </div>
    </div>
    <!--=== End Interactive Slider ===-->
	<form action="/" method="post" enctype="multipart/form-data" >
	<div class="background">
		<div class="Wcontainer">	
			<svg id="back">
				<radialGradient id="SVGID_1_" cx="0" cy="0" r="320.8304" gradientUnits="userSpaceOnUse">
					<stop  offset="0" style="stop-color:#FFDE17;stop-opacity:0.7"/>
					<stop  offset="1" style="stop-color:#FFF200;stop-opacity:0"/>
				</radialGradient>
				<path  id="sunburst" style="fill:url(#SVGID_1_);" d="M0,319.7c-18.6,0-37.3-1.6-55.5-4.8L-7.8,41.4c5.1,0.9,10.6,0.9,15.7,0L56,314.8C37.6,318,18.8,319.7,0,319.7z
			 M-160.8,276.6c-32.5-18.8-61.3-42.9-85.5-71.6L-34,26.2c3.4,4.1,7.4,7.4,12,10.1L-160.8,276.6z M161.3,276.4L22.1,36.2
			c4.5-2.6,8.6-6,12-10.1l212.6,178.5C222.5,233.4,193.8,257.6,161.3,276.4z M-302.5,108.3C-315.4,73-321.9,36-322-1.8l277.6-0.5
			c0,5.3,0.9,10.4,2.7,15.2L-302.5,108.3z M302.6,107.8L41.8,12.8c1.7-4.7,2.6-9.7,2.6-14.9c0-0.3,0-0.6,0-1H322l0-1.3l0,1.9
			C322,35.4,315.5,72.5,302.6,107.8z M-41.8-17.5l-261-94.5c12.8-35.4,31.6-68,55.8-96.9L-34.1-30.8C-37.5-26.8-40.1-22.3-41.8-17.5z
			 M41.7-17.7c-1.8-4.8-4.4-9.3-7.8-13.3l212-179.2c24.3,28.8,43.3,61.3,56.3,96.6L41.7-17.7z M-22.2-40.8l-139.6-240
			c32.7-19,68.1-32,105.2-38.6L-8-46.1C-13-45.2-17.8-43.4-22.2-40.8z M22-40.9c-4.4-2.6-9.2-4.3-14.2-5.1l47.1-273.6
			c37.2,6.4,72.7,19.2,105.4,38L22-40.9z"/>
			</svg>
			<nav>																																		
				<ul style="margin: 20px 20px 0 20px;list-style-type: none;padding: 0;display: flex;flex-direction: row;">
					<li style="display: block;width: 50px;text-align: center;color: #aaa;cursor: pointer;&:hover{color: #444;}&.active{color: #4444ff;}"><a id="button-snow" class="active"><i class="wi wi-snow"></i></a></li>
					<li style="display: block;width: 50px;text-align: center;color: #aaa;cursor: pointer;&:hover{color: #444;}&.active{color: #4444ff;}"><a id="button-wind"><i class="wi wi-strong-wind"></i></a></li>
					<li style="display: block;width: 50px;text-align: center;color: #aaa;cursor: pointer;&:hover{color: #444;}&.active{color: #4444ff;}"><a id="button-rain"><i class="wi wi-rain"></i></a></li>
					<li style="display: block;width: 50px;text-align: center;color: #aaa;cursor: pointer;&:hover{color: #444;}&.active{color: #4444ff;}"><a id="button-thunder"><i class="wi wi-lightning"></i></a></li>
					<li style="display: block;width: 50px;text-align: center;color: #aaa;cursor: pointer;&:hover{color: #444;}&.active{color: #4444ff;}"><a id="button-sun"><i class="wi wi-day-sunny"></i></a></li>
					<li style="display: block;width: 50px;text-align: center;color: #aaa;cursor: pointer;&:hover{color: #444;}&.active{color: #4444ff;}"><a id="button-cloud" ><i class="wi wi-cloudy"></i></a></li>
					<li style="display: block;width: 50px;text-align: center;color: #aaa;cursor: pointer;&:hover{color: #444;}&.active{color: #4444ff;}"><a id="button-sunn" class="night" ><i class="wi wi-night-clear"></i></a></li>
				</ul>
			</nav>
			<div id="card" class="weather">
				<svg id="inner" style="background-color: rgba(255,255,255,1);background: linear-gradient(to bottom, rgba(255,255,255,0.5) 50%, rgba(255,255,255,0) 100%);" >
					<defs>
						<path id="leaf" d="M41.9,56.3l0.1-2.5c0,0,4.6-1.2,5.6-2.2c1-1,3.6-13,12-15.6c9.7-3.1,19.9-2,26.1-2.1c2.7,0-10,23.9-20.5,25 c-7.5,0.8-17.2-5.1-17.2-5.1L41.9,56.3z"/>
					</defs>
					<circle  id="sun" style="fill: #F7ED47" cx="0" cy="0" r="50"/>
					<g id="layer3"></g>
					<g id="cloud3" class="cloud" style="fill:#c3e7fa;"></g>
					<g id="layer2"></g>
					<g id="cloud2" class="cloud" style="fill:#b9ffff;"></g>
					<g id="layer1"></g>
					<g id="cloud1" class="cloud" style="fill:#f9ffff;"></g>
				</svg>
				<div class="details" style="position: absolute;top: 0;left: 0;right: 0;	padding: 16px 20px;color: #888;	display: flex;flex-direction: row;justify-content: space-between;transition: color $speed ease;">
					<div class="temp" style="font-size: 60px;line-height: 60px;">
					</div>
					<div class="right" style="text-align: right;">
						<div id="date" style="margin: 4px 0;">
							${times },${gu},${dong }
						</div>
						<div id="summary" style="font-weight: 600;font-size: 22px;">
							
						</div>
					</div>
					
				</div>
			</div>
			<svg id="outer" style="position: fixed;pointer-events: none;"></svg>
		</div>
	</div>
	</form>

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
        <div class="footer">
            <div class="container">
                <div class="row">
                    <!-- About -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <a href="home"><img id="logo-footer" class="footer-logo" src="${pageContext.request.contextPath }/resources/assets/img/wlogo.png" alt=""></a>
                        <p>Easy & Simple</p>
                    </div><!--/col-md-3-->
                    <!-- End About -->

                    <!-- Latest -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <div class="posts">
                            <div class="headline"><h2>최근 활동</h2></div>
                            <ul class="list-unstyled latest-list">
                                <li>
                                    <a href="#">프로젝트 완료</a>
                                    <small>11/09 , 2020</small>
                                </li>
                                
                            </ul>
                        </div>
                    </div><!--/col-md-3-->  
                    <!-- End Latest --> 
                    
                    <!-- Link List -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <div class="headline"><h2>바로 가기</h2></div>
                        <ul class="list-unstyled link-list">
                            <li><a href="#">HOME</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">ABOUTS</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">WEATHER</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">MANAGER</a><i class="fa fa-angle-right"></i></li>
                        </ul>
                    </div><!--/col-md-3-->
                    <!-- End Link List -->                    

                    <!-- Address -->
                    <div class="col-md-3 map-img md-margin-bottom-40">
                        <div class="headline"><h2>Contact Us</h2></div>                         
                        <address class="md-margin-bottom-40">
                           경기도 성남시 미금로  <br />
                            그린아카데미 <br />
                            Phone: 800 123 3456 <br />
                            Fax: 800 123 3456 <br />
                            Email: jbs0206j@gmail.com
                        </address>
                    </div><!--/col-md-3-->
                    <!-- End Address -->
                </div>
            </div> 
        </div><!--/footer-->

        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">                     
                        <p>
                            2020 &copy; All Rights Reserved.
                           <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
                        </p>
                    </div>

                    <!-- Social Links -->
                    <div class="col-md-6">
                        <ul class="footer-socials list-inline">
                            <li>
                                <a href="http://facebook.com" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://twitter.com/" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                    <!-- End Social Links -->
                </div>
            </div> 
        </div><!--/copyright-->
    </div>     
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->			
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/jquery-appear.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/jquery.parallax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/counter/waypoints.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/counter/jquery.counterup.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/progress-bar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/owl-carousel.js"></script>
<!--  table script -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqFunction.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/table/js/jquery.stickyheader.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initCounter();
      	App.initParallaxBg();
        OwlCarousel.initOwlCarousel();
        ProgressBar.initProgressBarVertical();
    });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>