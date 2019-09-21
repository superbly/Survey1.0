<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="myCarousel" class="carousel slide" data-ride="carousel">

	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active">
			<img src="./img/car1.jpg" style="width: 100%;" alt="First slide">
			<div class="container">
				<div class="carousel-caption"></div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item">
			<img src="./img/car2.jpg" style="width: 100%;" data-src=""
				alt="Second slide">
			<div class="container">
				<div class="carousel-caption"></div>
			</div>
		</div>
		<!--슬라이드2-->

		<!--슬라이드3-->
		<div class="item">
			<img src="./img/car3.jpg" style="width: 100%;" data-src=""
				alt="Third slide">
			<div class="container">
				<div class="carousel-caption"></div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>

	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
		class="glyphicon glyphicon-chevron-left"></span></a> <a
		class="right carousel-control" href="#myCarousel" data-slide="next"><span
		class="glyphicon glyphicon-chevron-right"></span></a>
</div>