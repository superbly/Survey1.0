<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-custom">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style=font-size:23px; href="index.jsp?contentPage=./serveyform.jsp;">Servey</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a onclick="changeView(1)">Seryey란?</a></li>
					<li><a onclick="changeView(2)">설문지 만들기</a></li>
					<li><a onclick="changeView(3)">설문 참가</a></li>
					<li><a onclick="changeView(4)">지갑</a></li>
					<li><a onclick="changeView(5)">자유게시판</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><%if(session.getAttribute("sessionID") == null){%>
							<a onclick="changeView(6)">로그인</a> <%} 
						  else { %>
							<a onclick="changeView(8)">로그아웃</a><% 
						}%>
						</li>
					<li><%if(session.getAttribute("sessionID") == null){%>
							<a onclick="changeView(7)">회원가입</a> <%}%>
						</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<script type="text/javascript">
		
		function changeView(value){
			
			if(value == "1") // 차량검색 버튼 클릭시 차량검색 화면으로 이동
			{
				location.href="#";
			}
			else if(value == "2") // 공지사항 버튼 클릭시 공지사항 화면으로 이동
			{
				location.href="#";
			}
			else if(value == "3") // 뉴스 버튼 클릭시 화면으로 이동
			{
				location.href="#";
			}
			else if(value == "4") // 혜택 버튼 클릭시 화면으로 이동
			{
				location.href="#";
			}
			else if(value == "5") // 자유게시판 버튼 클릭시 화면으로 이동
			{
				location.href="boardList.bo";
			}
			else if(value == "6") // 로그인 버튼 클릭시  로그인 화면으로 이동
			{
				location.href="index.jsp?contentPage=./LoginJSP/login.jsp;"
			}
			else if(value == "7") // 회원가입 버튼 클릭시 회원가입 화면 이동
			{
				location.href="index.jsp?contentPage=./LoginJSP/Signup.jsp;"
			}
			else if(value == "8") // 로그아웃 버튼 클릭시 로그아웃 처리
			{
				var con_test = confirm("로그아웃하시겠습니까?");
				
				if(con_test == true)
				{
					location.href='logoutServlet'
				    alert("로그아웃되었습니다.")
				}
				
				else if(con_test == false){
				 	alert("취소를 누르셨군요!")
				}
			}
		}
	</script>