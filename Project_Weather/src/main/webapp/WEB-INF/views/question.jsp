<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Question</title>
<!-- Meta -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/favicon.ico">

    <!-- Web Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">
	<!-- table -->
	<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/table/css/component.css" /> -->
	<link rel="stylesheet" id="theme_style" type="text/css" href="https://www.jeasyui.com/easyui/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/headers/header-v2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/font-awesome/css/font-awesome.min.css">
    
    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/custom.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <!--  google font -->
	<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontYeon.css">
</head>	

<body class="header-fixed">    

<div class="wrapper">
 <!--=== Header v2 ===-->
    <div class="header-v2 header-sticky">
        <div class="container container-space">
            <!-- Topbar v2 -->
            <div class="topbar-v2">
                <div class="row">
                    <div class="col-sm-8">
                        <ul class="list-inline top-v2-contacts">
                            <li>Email: <a href="mailto:info@htmlstream.com">jbs0206j@google.com</a></li>
                            <li>연락처: 010-5674-9399</li>
                            <li>
                                <div class="language-bar">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <span class="heading">Languages</span>
                                    </a>
                                    <ul class="languages-dropdown" role="menu">
                                        <li class="active">
                                            <a href="#">English</a> 
                                        </li>
                                        <li><a href="#">Spanish</a></li>
                                        <li><a href="#">Russian</a></li>
                                        <li><a href="#">German</a></li>
                                    </ul>
                                </div>
                            </li>    
                        </ul>
                    </div>
                    <!-- 로그인 , 회원가입 버튼  -->
                    <div class="col-sm-4">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="topbar-buttons pull-right">
                        	<c:if test="${empty custVO }">
                            	<a href="login" class="btn-u btn-brd btn-brd-hover btn-u-light margin-right-5">로그인</a>
	                            <a href="insert" class="btn-u">회원가입</a>
                            </c:if>
                        	<c:if test="${not empty custVO }">
                           	<form action="logout" method="post">
                           		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                           		<button id="logoutBtn" type="submit" class="btn-u btn-brd btn-brd-hover btn-u-light margin-right-5">로그 아웃</button>
                            	<a href="update" class="btn-u btn-brd btn-brd-hover btn-u-light margin-right-5">정보 수정</a>
                            	<a href="changePass" class="btn-u btn-brd btn-brd-hover btn-u-light margin-right-5">비번 변경</a>
                        	</form>
                        	</c:if>
                        </div>
                    </div>
                </div>        
            </div>
            <!-- End Topbar v2 -->
        </div>
    
        <!-- Navbar -->
        <div class="navbar navbar-default mega-menu" role="navigation">
            <div class="container container-space">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="fa fa-bars"></span>
                    </button>
                    <a class="navbar-brand brand-style" href="home">
                        <img id="logo-header" src="${pageContext.request.contextPath }/resources/assets/img/wlogo.png" width="150" height="40" alt="Logo">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-responsive-collapse">
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
                                        <li><a href="question" >문의 사항</a></li>
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
                </div><!--/navbar-collapse-->
            </div>    
        </div>            
        <!-- End Navbar -->
    </div>
    <!--=== End Header v2 ===-->

    <!-- Interactive Slider v2 -->
    <div class="interactive-slider-v2">
        <div class="container">
            <h1>문의 사항</h1>
            <p style="font-family: 'Yeon Sung', cursive;">추가 요청사항 및 탈퇴 관련 요청사항에 대해 적어주시면 됩니다.</p>
        </div>
    </div>
    <!-- End Interactive Slider v2 -->

    <!--=== Content ===-->
    <div class="container content-md" ><!-- class="container content-md" -->
		 <!-- <table class="easyui-datagrid" title="문의 사항" style="width:1100px;height:auto;color: orange;" id="dg"
	        data-options="singleSelect:true,collapsible:false,url:'json',method:'get', rownumbers:true,sortOrder:'desc',
	        autoRowHeight:false,
	        pagination:true,
	        pageSize:10" border="1">
	        <thead>
	            <tr>
	                <th data-options="field:'num',width:100, align:'center'">글번호</th>
	                <th data-options="field:'content',width:600">Memo</th>
	                <th data-options="field:'name',width:150, align:'center'">이 름</th>
	                <th data-options="field:'now',width:150, align:'center'">등록일</th>
	            </tr>
	        </thead>
	    </table>
	    <table style="width:1005px;">
        <tr>
            <td>
                <form action="quest" method="get" id="ff">
                    <input class="easyui-textbox" name="name" style="width:15%" data-options="label:'이름:',required:true">
                    <input class="easyui-textbox" name="password" style="width:15%" data-options="label:'비번:',required:true"><br /><br />
                    <input class="easyui-textbox" name="content" style="width:70%;height: 80px" data-options="label:'내용:',required:true">
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">저장</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">지우기</a>
                </form>
                <script>
                    function submitForm(){
                        $('#ff').submit();
                    }
                    function clearForm(){
                        $('#ff').form('clear');
                    }
                </script>
            </td>
        </tr>
    </table> --> <!-- url="json"    toolbar="#toolbar" pagination="true"    rownumbers="true" fitColumns="true" singleSelect="true" -->
        <table id="dg" title="문의 사항" class="easyui-datagrid" style="width:1100px;height:auto;"data-options="singleSelect:true,collapsible:false,url:'json',method:'get', rownumbers:true,sortOrder:'desc',
	        autoRowHeight:false,fitColumns:true,
	        pagination:true,
	        pageSize:10" border="1" >
	        <thead>
	            <tr>
	                <!-- <th data-options="field:'num',width:100, align:'center'">글번호</th> -->
	                <th data-options="field:'content',width:600">Memo</th>
	                <th data-options="field:'name',width:200, align:'center'">이 름</th>
	                <th data-options="field:'now',width:200, align:'center'">등록일</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="toolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">글쓰기</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">글수정</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">글지우기</a>
	    </div>
	    
	    <div id="dlg" class="easyui-dialog" style="width:500px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
	        <form id="fm" action="quest" method="get" novalidate style="margin:0;padding:20px 50px">
		            <h3>글 등 록</h3>
		            <div style="margin-bottom:10px">
		                <input name="name" class="easyui-textbox" required="true" label="이 름:" style="width:100%">
		            </div>
		            <div style="margin-bottom:10px">
		                <input name="password" class="easyui-textbox" required="true" label="비밀 번호:" style="width:100%">
		            </div>
		            <div style="margin-bottom:10px">
		                <input name="content" class="easyui-textbox" required="true" label="내 용:" style="width:100%">
		            </div>
	        </form>
	    </div>
	     <div id="dlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">글등록</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
	    </div>
	    <div id="dlt" class="easyui-dialog" style="width:500px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
	        <form id="ft" action="change" method="get" novalidate style="margin:0;padding:20px 50px">
		            <h3>글 수 정</h3>
		            <div style="margin-bottom:10px" hidden="hidden">
		                <input name="num" class="easyui-textbox" required="true" label="번호" style="width:100%" >
		            </div>
		            <div style="margin-bottom:10px">
		                <input name="name" class="easyui-textbox" required="true" label="이 름:" style="width:100%" readonly="readonly">
		            </div>
		            <div style="margin-bottom:10px">
		                <input name="password" class="easyui-textbox" required="true" label="비밀 번호:" style="width:100%">
		            </div>
		            <div style="margin-bottom:10px">
		                <input name="content" class="easyui-textbox" required="true" label="내 용:" style="width:100%">
		            </div>
	        </form>
	    </div>
	    <div id="dlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="editUserOK()" style="width:90px">글수정</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlt').dialog('close')" style="width:90px">Cancel</a>
	    </div>
	    <script type="text/javascript">
        var url;
        function newUser(){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','New User');
            $('#fm').form('clear');
        }
        function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlt').dialog('open').dialog('center').dialog('setTitle','Edit User');
                $('#ft').form('load',row);
            }
        }
        function editUserOK(){
                $('#ft').submit();
        }
        
        function saveUser(){
            $('#fm').submit();              
            
        }
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
                    if (r){
                        $.get('delQ',{name:row.name});
                        location.reload();
                    }
                });
            }
        }
    </script>
    </div>
    <!--=== End Content ===-->

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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/plugins/jquery.parallax.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>
<!-- Esaytable -->
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/datagrid-export.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
    <!--  내 js 및 css -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqFunction.js"></script>

<!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/respond.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>	