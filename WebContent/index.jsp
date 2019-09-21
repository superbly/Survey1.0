<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage == null)
        contentPage="./serveyform.jsp";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<!-- 부트스트랩 -->
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- footer -->
<link rel="stylesheet" href="./css/footer-distributed-with-address-and-phones.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

<!-- 뉴스 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
<link href="./css/site.css" rel="stylesheet" type="text/css" />
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="./js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
	
<!-- nav-custom -->
<link href="./css/nav-custom.css" rel="stylesheet"/>

<!-- footer 하단 고정을 위한 css -->
<style type="text/css">
body,html {
    height:100%;
    background-color: #E9ECF1;
}
#container {
    min-height:70%;
    margin-top: 12px;
    margin-bottom: 12px;
}
#footer {
    height:40px;

}
</style>

<title>Sell Car</title>

</head>

<body>
	<div id="top">
		<%@ include file="./LayoutJSP/top.jsp"%>
	</div>	
	<!-- center -->
	<div id="container">
		<jsp:include page="<%=contentPage%>"/>
	</div>
	<!------------>
	<div id="footer">
		<%@ include file="./LayoutJSP/footer.jsp"%>
	</div>
</body>
</html>