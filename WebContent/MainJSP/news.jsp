<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="center-block" style="background-image: url( './img/back.jpg' );">
	<div class="container">
		<div class="row">

			<div class="col-md-6" style="margin-top: 20px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<b>News</b>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12">
								<ul class="demo2">
									<li class="news-item"><a
										href="https://www.gov.kr/portal/service/serviceInfo/PTR000050188">자동차
											결함 신고</a></li>
									<li class="news-item"><a
										href="https://namu.wiki/w/BMW%20%EC%B0%A8%EB%9F%89%20%EC%97%B0%EC%87%84%20%ED%99%94%EC%9E%AC%20%EC%82%AC%EA%B3%A0">BMW
											차량 연쇄 화재 사고</a></li>
									<li class="news-item"><a
										href="https://www.carisyou.com/magazine/FOCUS/72653">국내 최초
											급발진 의심신고 운행차량 TOP10</a></li>
									<li class="news-item"><a
										href="http://www.evpost.co.kr/wp/2019-%EC%84%9C%EC%9A%B8-%EB%AA%A8%ED%84%B0%EC%87%BC-%EC%8B%A0%EC%B0%A8-%EC%95%88%EC%A0%84%EB%8F%84-%ED%8F%89%EA%B0%80-1%EC%9C%84-%EB%84%A5%EC%8F%98/">NEXO
											신차 안전도 평가</a></li>
									<li class="news-item"><a
										href="http://m.ekn.kr/section_view.html?no=73424">장애인LPG차
											일반인도 살 수 있다.</a></li>
									<li class="news-item"><a
										href="http://www.seouleconews.com/news/articleView.html?idxno=49053">현대차도
											안전-품질문제 쏘나타 출고 지연</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
			<div class="col-md-6" style="margin-top: 20px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<b>Benefit</b>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12">
								<ul id="demo3">
									<li class="news-item"><a
										href="http://www.daedeok.go.kr/dpt/goContents.do?link=/dpt/dpt06/DPT06020406&menuId=DPT06020406">장애인
											차량 구입시 차량 혜택 </a></li>
									<li class="news-item"><a
										href="https://www.hybridbonus.or.kr/EP020204000SF01.do">저공해차
											구매 혜택 </a></li>
									<li class="news-item"><a
										href="https://www.daejeon.go.kr/veh/ContentsHtmlView.do?tapMenuSeq=579&menuSeq=575">대전
											자동차 취득세 계산 방법과 감면혜택</a></li>
									<li class="news-item"><a
										href="https://www.gov.kr/portal/service/serviceInfo/131200000008">다자녀
											자동차 취득세 면제혜택</a></li>
									<li class="news-item"><a
										href="https://www.gov.kr/portal/service/serviceInfo/339000000223">국가
											유공자 자동차세 감면 </a></li>
									<li class="news-item"><a
										href="https://blog.kumhotire.co.kr/933">업무용 차량 구매 시 세금혜택</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {

		$(".demo2").bootstrapNews({
			newsPerPage : 4,
			autoplay : true,
			pauseOnHover : true,
			navigation : false,
			direction : 'down',
			newsTickerInterval : 2500,
			onToDo : function() {
				//console.log(this);
			}
		});

		$("#demo3").bootstrapNews({
			newsPerPage : 4,
			autoplay : true,
			pauseOnHover : true,
			navigation : false,
			direction : 'down',
			newsTickerInterval : 2500,
			onToDo : function() {
				//console.log(this);
			}
		});

	});
</script>
