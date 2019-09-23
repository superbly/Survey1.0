<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href=".css/Login_CSS/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href=".css/Login_CSS/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href=".css/Login_CSS/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href=".css/Login_CSS/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href=".css/Login_CSS/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href=".css/Login_CSS/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="css./Login_CSS/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="css./Login_CSS/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./css/Login_CSS/css/util.css">
<link rel="stylesheet" type="text/css" href="./css/Login_CSS/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" action="loginServlet" method="post">
					<span class="login100-form-title p-b-33"> Servey </span>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="id" placeholder="ID">
						<span class="focus-input100-1"></span> <span
							class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="password"
							placeholder="Password"> <span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="container-login100-form-btn m-t-20">
						<input type="submit" class="login100-form-btn" value="로그인">
					</div>

					<div class="text-center p-t-45 p-b-4">
						<span class="txt1"> 찾기 </span> <a href="#" class="txt2 hov1">
							ID / Password? </a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // Login.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {%>
                <script type="text/javascript">alert("비밀번호를 확인해주세요!");</script>
            <% }
            else if(msg!=null && msg.equals("-1"))
            {%>    
                <script type="text/javascript">alert("아이디를 확인해주세요!");</script>
            <% } 
            else if(msg!=null && msg.equals("1"))
            {%>
            	<script type="text/javascript">
            	location.href="index.jsp?contentPage=./MainJSP/MainPage.jsp;";
   		 		var a = "<%= session.getAttribute("sessionID") %>";
		 		alert(a + "님 로그인되었습니다.");
				</script>
            <%}
     %>
            
	<!--===============================================================================================-->
	<script src=".css/Login_CSS/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src=".css/Login_CSS/vendor/bootstrap/js/popper.js"></script>
	<!--===============================================================================================-->
	<script src=".css/Login_CSS/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src=".css/Login_CSS/vendor/daterangepicker/moment.min.js"></script>
	<script src=".css/Login_CSS/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src=".css/Login_CSS/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src=".css/Login_CSS/js/main.js"></script>
	<!--===============================================================================================-->