<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>회원 등록</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
    <!--  alertify css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/alertify.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/pages/page_log_reg_v2.css">    

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/custom.css">
    
   <!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
	<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" > -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/datepicker/bootstrap-datepicker.css">
	<!-- script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
	
	<!--  google font -->	
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontYeon.css">
    <!--  카카오 다음 우편번호 주소 검색 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript">
    	$(function() {
    		$("#cemail").click(function() {
				var cemail = alertify.prompt("아이디 중복체크");
				alert(cemail);
				$("#cemail").val(cemail);
				alert($("#cemail").val);
			});
		});
    </script>
    <style type="text/css">
    	#cemail{
    		cursor: pointer;
    	}
    </style>
</head> 
<body>
<!--=== Content Part ===-->    
<div class="container">
    <!--Reg Block-->
    <div class="reg-block">
    	<form action="insertOk" onsubmit="return formCheck();" method="post">
        <div class="reg-block-header">
            <h2 >회원 가입</h2>
            <!-- <ul class="social-icons text-center">
                <li><a class="rounded-x social_facebook" data-original-title="Facebook" href="#"></a></li>
                <li><a class="rounded-x social_twitter" data-original-title="Twitter" href="#"></a></li>
                <li><a class="rounded-x social_googleplus" data-original-title="Google Plus" href="#"></a></li>
                <li><a class="rounded-x social_linkedin" data-original-title="Linkedin" href="#"></a></li>
            </ul>
            <p>Already Signed Up? Click <a class="color-green" href="page_login1.html">Sign In</a> to login your account.</p> -->
        </div>
        <div class="input-group margin-bottom-10">
	        <div class="input-group" style="float: left;width:50%; padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-sort-amount-asc"></i></span>
	            <input type="text" class="form-control"  name="custno" value="${custno+1 }" id="custno" readonly="readonly">
	        </div>
	        <div class="input-group " style="float: right; width:50%;padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
	            <input type="text" class="form-control" placeholder="Email" id="cemail" value="${cemail }" name="cemail" >
	        </div>
	     </div>
        <div class="input-group margin-bottom-10">
	        <div class="input-group" style="float: left;width:50%; padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
	            <input type="password" class="form-control" placeholder="비밀 번호" id="cpassword" name="cpassword">
	        </div>
	        <div class="input-group" style="float: left;width:50%; padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-key"></i></span>
	            <input type="password" class="form-control" placeholder="비밀 번호 확인" id="cpassword2" name="cpassword2">
        	</div>
	    </div>
	     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        <div class="input-group margin-bottom-10">
	        <div class="input-group" style="float: left;width:50%; padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-user"></i></span>
	            <input type="text" class="form-control" placeholder="이 름" id="cname" name="cname">
	        </div>
	        <div class="input-group" style="float: left;width:50%; padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-film"></i></span>
	            <input type="text" class="form-control" placeholder="닉 네 임"   id="cnickname"   name=cnickname>
        	</div>
	    </div>
        <div class="input-group margin-bottom-10">
	        <div class="input-group" style="float: left;width:56%; padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
	            <input type="text" class="form-control" placeholder="생년월일" id="cbirth" name="cbirth">
	        </div>
	    <div class="checkbox" style="margin-left:20px; float: right;">
	    	<label style=" margin-right: 50px">
	    		<input type="checkbox" name="cgender" id="cgender1" value='M' > 남성
	    	</label>
	    	<label>
	    		<input type="checkbox" name="cgender" id="cgender2" value='F'> 여성
	    	</label>
	    </div>
	    </div>
	    <div class="input-group margin-bottom-10">
	        <div class="input-group" style="float: left;width:50%; padding: 5px;">
	            <span class="input-group-addon"><i class="fa fa-phone"></i></span>
	            <input type="text" class="form-control" placeholder="전화 번호" id="cphone" name="cphone">
        	</div>
		    <div class="input-group" style="float: left;width:50%; padding: 5px;">
		            <span class="input-group-addon"><i class="fa fa-home"></i></span>
		            <input type="text" class="form-control" placeholder="우편번호 찾기" id="czipcode" readonly="readonly" name="czipcode">
		    </div>
		</div>
	    <div class="input-group margin-bottom-15" >
	            <span class="input-group-addon"><i class="fa fa-home"></i></span>
	            <input type="text" class="form-control" placeholder="주 소(반드시 지번 주소로 입력 하셔야 합니다.)" id="caddress" readonly="readonly" name="caddress">
	    </div>
	    <div class="input-group margin-bottom-10" >
	            <span class="input-group-addon"><i class="fa fa-home"></i></span>
	            <input type="text" class="form-control" placeholder="상세 주소" id="caddress2" name="caddress2">
	    </div>
	    	<input type="hidden" name="enabled" id="enabled" value="1"/> 
	    	<input type="hidden" name="role" id="role" value='ROLE_WEATHER'/> 
        <hr>
            <div style="text-align: center;">
                <button type="submit" class="btn-u" id="registerBtn">회원 가입</button>                
                <button type="button" class="btn-u" id="cancelBtn">취소하기</button>                
            </div>
           
            <!-- col-lg-6 col-md-offset-1 -->
        </form>
    </div>
    <!--End Reg Block-->
</div><!--/container-->
<!--=== End Content Part ===-->

<!-- JS Global Compulsory -->           

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
<!--한국어  달력 쓰려면 추가 로드-->
<script src="${pageContext.request.contextPath }/resources/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/resources/datepicker/bootstrap-datepicker.ko.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqFunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/notify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/alertify.js"></script>
<script type="text/javascript">
		$.backstretch([
			      //"${pageContext.request.contextPath }/resources/assets/img/bg/2.jpg",
			      //"${pageContext.request.contextPath }/resources/assets/img/bg/8.jpg",
			      "${pageContext.request.contextPath }/resources/assets/img/bg/raincitys.png",
			      "${pageContext.request.contextPath }/resources/assets/img/bg/suny.png",
			      "${pageContext.request.contextPath }/resources/assets/img/bg/winters.png"
			      ], {
			        fade: 1000,
			        duration: 7000
	    });
</script>
<!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/respond.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 