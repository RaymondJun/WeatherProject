<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>회원 수정 완료</title>
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

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/pages/page_log_reg_v2.css">  
    <!--  google font -->	
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontYeon.css">
    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/custom.css">
    <!--  카카오 다음 우편번호 주소 검색 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript">
    	$(function() {
    		
		});
    	
    </script>
</head> 
<body>
<!--=== Content Part ===-->    
<div class="container">
    <!--Reg Block-->
    <div class="reg-block">
        <div class="reg-block-header">
            <h2>비밀 번호 변경에 실패 하였습니다.</h2>
            <h2>다시 시도해 주세요.</h2>
        </div>
		<div style="text-align: center;"><!-- btn-u btn-u-hover margin-right-5 -->
			<a href="home" class="btn-group-vertical btn-u">홈으로</a>
		</div>
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
<!-- JS Customization -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>
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