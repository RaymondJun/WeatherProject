<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>회원 삭제</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<!--  table  -->
	<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/component.css" /> -->
	<link rel="stylesheet" id="theme_style" type="text/css" href="https://www.jeasyui.com/easyui/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
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
	<!--  JQuery script -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/custom.css">
    <!-- notify -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/notifyStyle.css">
    <!--  google font -->	
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontYeon.css">
</head>	
<body> 
<script type="text/javascript">
	$(function(){
		$("#list").on( 'dblclick',function() {
			var cemail = 
			console.log(cemail);
			$.notify.addStyle('foo', {
				  html: 
					  
				    "<div>" +
				      "<div class='clearfix'>" +
				        "<div class='title' data-notify-html='title'/>" +
				        "<div class='buttons'>" +
				          "<button class='no'>Cancel</button>" +
				          "<form action='delListsOk' method='post' >" +
				          "<button class='yes' data-notify-text='button' type='submit' ></button>" +
				          "</form>" +
				        "</div>" +
				      "</div>" +
				    "</div>"
				    
				    
				});
			//listen for click events from this style
			$(document).on('click', '.notifyjs-foo-base .no', function() {
			  //programmatically trigger propogating hide event
			  $(this).trigger('notify-hide');
			});
			$(document).on('click', '.notifyjs-foo-base .yes', function() {
			  //show button text
			  //hide notification
			  $(this).trigger('notify-hide');
			});
			$.notify({
				title 	:'정말로 삭제 하시겠습니까?',
				button  :'삭제',
				cancel  :'취소'
				}, {
					style : 'foo',
					autoHide: false,
					clickToHide: false
			});
		});
	});
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
            <div class="topbar">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <ul class="loginbar pull-right">
	                <c:if test="${empty user }">
	                	<li class="topbar-devider"></li> <!-- 클래스 hoverSelector -->
	                    <li ><a href="question">Help</a></li>
	                    <li class="topbar-devider"></li>   
	                    <li><a href="page_faq.html">회원가입</a></li>  
	                    <li class="topbar-devider"></li>   
	                    <li><a href="login">로그인</a></li>
	                </c:if>
	                <c:if test="${not empty user }">
	                	<li class="topbar-devider"></li>
	                    <li ><a href="logout">로그아웃</a></li>
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
                                        <li><a href="about">About Us</a></li>
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
                                    <a href="showArlam">알 람</a>
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
            <h1>회원 삭제</h1>
        </div>
    </div>
    <!--=== End Interactive Slider ===-->
	<!--  table start -->
	<div class="" style="text-align: center; margin: auto;" id="custList">
		<!-- <table >
			<thead>
				<tr>
					<th>회원번호</th>
					<th>이메일</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>권한</th>
				</tr>
				
			</thead>
			<tbody>
				<c:if test="${empty custVO }">
					<tr>
						<td colspan="12">등록된 회원이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty custVO }">
					<c:forEach var="vo" items="${custVO }">
						<tr id="list" >
							<td>${vo.custno }</td>
							<td id="ids" >${vo.cemail }</td>
							<td>${vo.cname }</td>
							<td>${vo.cnickname }</td>
							<td>${vo.cbirth }</td>
							<td>${vo.cgender }</td>
							<td>${vo.cphone }</td>
							<td>${vo.czipcode }</td>
							<td>${vo.caddress }</td>
							<td>${vo.caddress2 }</td>
							<td>${vo.enabled }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table> -->
		<table id="dg" title="문의 사항" class="easyui-datagrid" style="width:1100px;height:auto;"data-options="singleSelect:true,collapsible:false,url:'delList',method:'get', rownumbers:true,sortOrder:'desc',
	        autoRowHeight:false,fitColumns:true,
	        pagination:true,
	        pageSize:10" border="1" >
	        <thead>
	            <tr>
	                <th data-options="field:'custno',width:30">회원번호</th>
	                <th data-options="field:'cemail',width:200, align:'center'">아이디</th>
	                <th data-options="field:'cname',width:100, align:'center'">이름</th>
	                <th data-options="field:'cnickname',width:100, align:'center'">별명</th>
	                <th data-options="field:'cbirth',width:100, align:'center'">생년월일</th>
	                <th data-options="field:'cgender',width:50, align:'center'">성별</th>
	                <th data-options="field:'cphone',width:120, align:'center'">전화번호</th>
	                <th data-options="field:'caddress',width:250, align:'center'">주소</th>
	                <th data-options="field:'caddress2',width:300, align:'center'">상세주소</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="toolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">글지우기</a>
	    </div>
	    <script type="text/javascript">
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('리얼리?','이 회원을 정말로 지우시겠어요?',function(r){
                    if (r){
                        $.get('delListsOk', {cemail:row.cemail});
                        location.reload();
                    }
                });
            }
        }
    </script>
    </div>
	</div>
	<!--  table end -->
	

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
        <div class="footer">
            <div class="container">
                <div class="row">
                    <!-- About -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <a href="home"><img id="logo-footer" class="footer-logo" src="${pageContext.request.contextPath }/resources/assets/img/wlogo.png" width="150" height="40" alt=""></a>
                        <p>About Unify dolor sit amet, consectetur adipiscing elit. Maecenas eget nisl id libero tincidunt sodales.</p>
                        <p>Duis eleifend fermentum ante ut aliquam. Cras mi risus, dignissim sed adipiscing ut, placerat non arcu.</p>    
                    </div><!--/col-md-3-->
                    <!-- End About -->

                    <!-- Latest -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <div class="posts">
                            <div class="headline"><h2>Latest Posts</h2></div>
                            <ul class="list-unstyled latest-list">
                                <li>
                                    <a href="#">Incredible content</a>
                                    <small>May 8, 2014</small>
                                </li>
                                <li>
                                    <a href="#">Best shoots</a>
                                    <small>June 23, 2014</small>
                                </li>
                                <li>
                                    <a href="#">New Terms and Conditions</a>
                                    <small>September 15, 2014</small>
                                </li>
                            </ul>
                        </div>
                    </div><!--/col-md-3-->  
                    <!-- End Latest --> 
                    
                    <!-- Link List -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <div class="headline"><h2>Useful Links</h2></div>
                        <ul class="list-unstyled link-list">
                            <li><a href="#">About us</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">Portfolio</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">Latest jobs</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">Community</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">Contact us</a><i class="fa fa-angle-right"></i></li>
                        </ul>
                    </div><!--/col-md-3-->
                    <!-- End Link List -->                    

                    <!-- Address -->
                    <div class="col-md-3 map-img md-margin-bottom-40">
                        <div class="headline"><h2>Contact Us</h2></div>                         
                        <address class="md-margin-bottom-40">
                            25, Lorem Lis Street, Orange <br />
                            California, US <br />
                            Phone: 800 123 3456 <br />
                            Fax: 800 123 3456 <br />
                            Email: <a href="mailto:info@anybiz.com" class="">info@anybiz.com</a>
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
                            2015 &copy; All Rights Reserved.
                           <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
                        </p>
                    </div>

                    <!-- Social Links -->
                    <div class="col-md-6">
                        <ul class="footer-socials list-inline">
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Skype">
                                    <i class="fa fa-skype"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Google Plus">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Linkedin">
                                    <i class="fa fa-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest">
                                    <i class="fa fa-pinterest"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Dribbble">
                                    <i class="fa fa-dribbble"></i>
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
<!-- Esaytable -->
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/datagrid-export.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/progress-bar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/owl-carousel.js"></script>
<!-- Notify -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/notify.js"></script>
<!--  table script -->

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<!-- <script src="${pageContext.request.contextPath }/resources/table/js/jquery.stickyheader.js"></script> -->
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