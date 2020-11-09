<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>About</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/favicon.ico">
	<!--  table  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/component.css" />
    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/headers/header-v2.css">
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
    <!--  google font -->	
	<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontYeon.css">
</head>	

<body>    

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
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
                                    <a href="javascript:void(0);">Project</a>
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
            <h1>About Us</h1>
            <p>Weather 더욱 직관적이고 실용적이도록...</p>
        </div>
    </div>
    <!--=== End Interactive Slider ===-->

    <!--=== Service Block v4 ===-->
    <div class="service-block-v4">
        <div class="container content-sm">
            <div class="row">
                <div class="col-md-4 service-desc md-margin-bottom-50">
                    <i class="icon-diamond"></i>
                    <h3>Design</h3>
                    <p class="no-margin-bottom">페이지의 디자인은 웹의 디자인을 가져와 사용하였다.<br> 도움을 주신 분께 감사드립니다. </p>
                </div>
                <div class="col-md-4 service-desc md-margin-bottom-50">
                    <i class="icon-rocket"></i>
                    <h3>Development</h3>
                    <p class="no-margin-bottom">스프링 부트 기반으로 오라클DB, JSON, Notify,  Timedropper 등등 여러 라이브러리를 사용하였고,<br> Ajax를 통해 외부데이터를 사용하였다. </p>
                </div>
                <div class="col-md-4 service-desc">
                    <i class="icon-support"></i>
                    <h3>R & D</h3>
                    <p class="no-margin-bottom">해당 프로젝트  좀 더 효용성있고 편리하게 사용하려면 어플리케이션 기반으로 하는 것이 좋다.<br>따라서 앞으로 어플리케이션을 공부하며 더 편리하게 사용할 수 있도록 만들겠다.</p>
                </div>
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
    <!--=== End Service Block v4 ===-->

    <!--=== Container Part ===-->
    <div class="container content-sm">
        <div class="headline-center margin-bottom-60">
            <h1>WHY WE ARE GOOD</h1>
            <h3>기존의 날씨를 보여주는 웹과 앱 등과 달리<br>
            다른 기능<strong>(Animation, Alarm)</strong>을 넣어 사용자가 더욱 편리하게 사용하고 실생활에 도움될 수 있도록 고안했다. </h3>              
        </div>

    </div>
    <!--=== End Container Part ===-->

    <!--=== Parallax Counter v4 ===-->
    <div class="parallax-counter-v4 parallaxBg">
        <div class="container content-sm">
            <div class="row">
                <div class="col-md-3 col-xs-6 md-margin-bottom-50">
                    <i class="icon-cup"></i>
                    <span class="counter">265</span>
                    <h4>Coffee's Drunk</h4>
                </div>
                <div class="col-md-3 col-xs-6 md-margin-bottom-50">
                    <i class="icon-clock"></i>
                    <span class="counter">5957</span>
                    <h4>Working Hours</h4>
                </div>
                <div class="col-md-3 col-xs-6">
                    <i class="icon-emoticon-smile"></i>
                    <span class="counter">${custno }</span>
                    <h4>Happy Clients</h4>
                </div>
                <div class="col-md-3 col-xs-6">
                    <i class="icon-bulb"></i>
                    <span class="counter">10</span>
                    <h4>Ideas</h4>
                </div>
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
    <!--=== End Parallax Counter v4 ===-->

    <!--=== Team v3 ===-->
    <div class="container content-sm">
        <div class="headline-center margin-bottom-60">
            <h1>Our Service</h1>
            <h4>Weather의 서비스들은
            <strong>사용자 서비스(회원가입, 정보수정,날씨보기, 알람),</strong><br />
            <strong>관리자 서비스(회원목록, 회원삭제) 등이 있다.</strong></h4>
            
            <!-- <p>Phasellus vitae ipsum ex. Etiam eu vestibulum ante. <br>
            Lorem ipsum <strong>dolor</strong> sit amet, consectetur adipiscing elit. Morbi libero libero, imperdiet fringilla </p> -->              
        </div>

        <div class="row team-v3">
            <div class="col-md-3 col-sm-6 md-margin-bottom-50">
                <div class="team-img">
                    <img class="img-responsive" src="assets/img/team/img1-md.jpg" alt="">
                    <div class="team-hover">
                        <span>Daniel Wearne</span>
                        <small>Technical Director</small>
                        <p>Lorem ipsum dolor sit ame con sectetur adipisci ng e lit.</p>
                        <ul class="list-inline team-social-v3">
                            <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 md-margin-bottom-50">
                <div class="team-img">
                    <img class="img-responsive" src="assets/img/team/img5-md.jpg" alt="">
                    <div class="team-hover">
                        <span>Sara Lisbon</span>
                        <small>Designer</small>
                        <p>Lorem ipsum dolor sit ame con sectetur adipisci ng e lit.</p>
                        <ul class="list-inline team-social-v3">
                            <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 sm-margin-bottom-50">
                <div class="team-img">
                    <img class="img-responsive" src="assets/img/team/img3-md.jpg" alt="">
                    <div class="team-hover">
                        <span>John Doe</span>
                        <small>Developer</small>
                        <p>Lorem ipsum dolor sit ame con sectetur adipisci ng e lit.</p>
                        <ul class="list-inline team-social-v3">
                            <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="team-img">
                    <img class="img-responsive" src="assets/img/team/img2-md.jpg" alt="">
                    <div class="team-hover">
                        <span>Alice Williams</span>
                        <small>Support</small>
                        <p>Lorem ipsum dolor sit ame con sectetur adipisci ng e lit.</p>
                        <ul class="list-inline team-social-v3">
                            <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="rounded-x fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!--/end row-->
    </div>
    <!--=== End Team v3 ===-->




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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqFunction.js"></script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>