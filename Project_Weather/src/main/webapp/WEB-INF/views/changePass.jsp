<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>Change PassWord</title>

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

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/custom.css">
    <!--  google font -->	
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontYeon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqFunction.js"></script>
	<!--<c:if test="${empty custVO }">
		<c:redirect url="home"/>
	</c:if>-->
</head> 
<body>
<!--=== Content Part ===-->    
<div class="container">
    <!--Reg Block-->
    <div class="reg-block">
    	<form action="changePassOk" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="reg-block-header">
            <h2>비밀 번호 변경</h2>
        </div>

        <%-- 이부분을 반드시 숨겨서 가져가야 한다. --%>
        <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
            <input type="text" class="form-control" placeholder="Email" id="cemail" name="cemail">
        </div>
        <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input type="password" class="form-control" placeholder="현재 비밀 번호" id="cpassword" name="cpassword">
        </div>
        <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input type="password" class="form-control" placeholder="변경 할 비밀 번호" id="npassword" name="npassword">
        </div>
        <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input type="password" class="form-control" placeholder="변경 비밀 번호 확인" id="cpassword2" name="cpassword2">
        </div>
        <hr>
         <div  style="text-align: center;" >
             <button type="submit" class="btn-u">변경 하기</button>
             <a type="button" href="home" class="btn-u">취소 하기</a>
             <!-- <button type="button" class="btn-u">비밀 번호 찾기</button> -->
         </div>
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
<!-- JS Customization -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqFunction.js"></script>
<script type="text/javascript">
    $.backstretch([
      //"${pageContext.request.contextPath }/resources/assets/img/bg/19.jpg",
      //"${pageContext.request.contextPath }/resources/assets/img/bg/18.jpg",
      "${pageContext.request.contextPath }/resources/assets/img/bg/2.jpg",
      "${pageContext.request.contextPath }/resources/assets/img/bg/8.jpg",
      ], {
        fade: 1000,
        duration: 7000
    }); 
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 