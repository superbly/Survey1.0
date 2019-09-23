<%@page import="board.dto.PageInfo"%>
<%@page import="board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	@SuppressWarnings("unchecked")		
	ArrayList<BoardDTO> articleList = (ArrayList<BoardDTO>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>


<style type="text/css">
.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

article {
	width: 100%;
	min-height: 600px;
	background-color: #fff;
	box-shadow: 2px 2px 4px #dee1e7;
}

.test1 {
	margin: 0 50px 0 50px;
	padding: 40px 0 40px;
	font-family: Noto Sans KR, sans-serif;
}

.boardTitle {
	font-size: 30px;
	font-weight: bold;
	color: black;
	margin-bottom: 20px;
}
/********************** Hit CSS ***********************/
.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
    }

/******************************************************/
.pagination{
	clear: both;
    display: block;
    width: 100%;
    height: 28px;
    margin: 0 auto;
    padding: 40px 0;
    font-family: Dotum,Noto Sans KR,sans-serif;
    text-align: center;
    overflow: hidden;
    font-size: 0;
}
.basic {
	width: 26px;
	height: 26px;
	border: 1px solid #c1c1c1;
	line-height: 28px;
	color: #2b2b2b;
	text-decoration: none;
	display: inline-block;
	margin: 0 2px;
	font-size: 12px;
	vertical-align: top;
}
.change {
	display: inline-block;
    margin: 0 2px;
    font-size: 12px;
    vertical-align: top;
    width: 28px;
    height: 28px;
    background: #0062df;
    line-height: 30px;
    color: #fff;
    font-weight: 700;
}
</style>
</head>

<body>
<div class="container">
<article>
	<div class="test1">
	<p class="boardTitle">자유게시판</p>
	
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr id="th">
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="10%">작성자</th>
				<th width="20%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		
		<tbody>
		
			<%
				for (int i = 0; i < articleList.size(); i++) {
			%>
			<tr>
				<td><%=articleList.get(i).getRNUM()%></td>
				<td id="title">
					<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
						<%=articleList.get(i).getBOARD_SUBJECT()%>
				</a>&nbsp;&nbsp;
				<% if(articleList.get(i).getBOARD_READCOUNT() >= 5) { %>
				<span class="hit">Hit!</span></td>
				<% } %>
				<td><%=articleList.get(i).getBOARD_NAME()%></td>
				<td><%=articleList.get(i).getBOARD_DATE()%></td>
				<td><%=articleList.get(i).getBOARD_READCOUNT()%></td>
			</tr>
			<% } %>
		</tbody>
		
	</table>
	<% if(listCount == 0) { %>
		<p class="text-center">등록된 글이 없습니다.<p>
	<% } %>
	<hr/>
	<a class="btn btn-default pull-right" href="index.jsp?contentPage=./NewBoard/board_write.jsp">글쓰기</a>
	<%if(listCount != 0) {%>
	<div class="text-center">
		<span class="pagination1">
			<% if(nowPage <= 1) { %>
				<a class="basic"href="#">&lt;</a>
			<% } else { %>
				<a class="basic" href="boardList.bo?page=<%=nowPage - 1%>">&lt;</a>
			<% } %>
			
			<%
			for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) {
			%>
			<a class="basic" id="<%=a %>" href="#"><%=a %></a>
			<% } else { %>
				<a <% if(a == nowPage) {%> class="change" <% } else { %> 
				class="basic" <% } %> href="boardList.bo?page=<%=a%>"><%=a %></a>
				
				<% } %>
			<% } %>
			
			<% if(nowPage >= 1) { %>
				<a class="basic" href="boardList.bo?page=<%=nowPage + 1%>">&gt;</a>
			<% } %>
		</span>
	</div>
	<% } %>
	</div>
	</article>
</div>	

</body>


</html>