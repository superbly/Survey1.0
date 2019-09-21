<%@ page import="board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	BoardDTO article = (BoardDTO) request.getAttribute("article");
	String test = article.getBOARD_FILE();
	request.setAttribute("BOARD_FILE", test);
	String nowPage = (String)request.getAttribute("page");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.board{
	
	
	font-family: Noto Sans KR,sans-serif;
}
.board h3{
	height: 40px;
	margin-top: 0px;
	margin-bottom: 0px;
    color: #2b2b2b;
    font-size: 27px;
    line-height: 40px;
    font-family: Noto Sans KR,sans-serif,AppleSDGothicNeo-Regular,Malgun Gothic,Dotum;
    font-weight: 700;
}
.view{
	margin-top: 20px;
}
.title{
	border-top: 2px solid #9b9fa8;
	border-bottom: 1px solid #f1f1f4;
	padding: 14px 19px;
}
.tit {
	color: #2b2b2b;
	font-size: 20px;
	font-weight: 500;
}
.text{
	width: 100%;
    padding: 15px 0 30px;
}
.text p{
	
}
.content{
	word-break: break-all;
	padding: 0 19px;
	min-height: 500px;
}

/* 모바일에 적용될 스타일을 먼저 작성합니다. */

@media screen and (min-width: 769px) {
  	.under{
	width: 100%;
    padding: 20px 0 0;
    border-top: 1px solid #caccd2;
    text-align: right;
}
}

/* 데스크탑에서 사용될 스타일을 먼저 작성합니다. */

@media screen and (max-width: 768px) {
    .under{
	width: 100%;
    padding: 20px 0 0;
    border-top: 1px solid #caccd2;
    text-align: center;
}
}

.under button, .modal-footer button{
	display: inline-block;
    width: 98px;
    height: 42px;
    border: 1px solid #95959e;
    border-radius: .1em;
    color: #2b2b2b;
    font-size: 15px;
    font-weight: 500;
    text-align: center;
    line-height: 40px;
    text-decoration: none;
}
.lines {
	margin-top: 8px;
}
em {
	color: #999;
	font-size: 12px;
	font-style: normal;
	font-family: Dotum, Noto Sans KR, sans-serif;
}
i {
	font-style: normal;
}
.table {
	margin-bottom: 0px;
}
.table table-condensed {
	border: none;

}
.table > tbody > tr > th {
	border-top: 0px;
}
.table > tbody > tr > td {
	border-top: 0px;
}
.modal-dialog {
  position: absolute;
  top: 200px;
  right: 100px;
  bottom: 0;
  left: 0;
  z-index: 10040;
  overflow: auto;
  overflow-y: auto;
}
article {
    width: 100%;
    min-height: 600px;
    background-color: #fff;
    box-shadow: 2px 2px 4px #dee1e7;
 }
.test1{
	
    margin: 0 50px 0 50px;
    padding: 40px 0 40px;
    font-family: Noto Sans KR,sans-serif;
} 

</style>
</head>
<body>

	<div class="container">
	<article>
	<div class="test1">
		<div class="board">
			<h3>자유게시판</h3>
			<div class="view">
				<div class="title">
					<strong class="tit"><%=article.getBOARD_SUBJECT()%></strong><br>
					<span class="lines">
						<em>
							등록일 <%=article.getBOARD_DATE()%>
							<i>|</i>
							조회수 <%=article.getBOARD_READCOUNT()%>
						</em>
					</span>
				</div>
				<div class="text">
					<div class="content">
						<%=article.getBOARD_CONTENT()%>
					</div>	
				</div>
				<div class="under">
					
					<button type="button" data-toggle="modal" data-target="#exampleModalCenter1">수정</button>
					<button type="button" data-toggle="modal" data-target="#exampleModalCenter2">삭제</button>
					<button type="button" onclick = "location.href = 'boardList.bo'">목록</button>
					
				</div>
			</div>	
		</div>
		</div>
		</article>				
	</div>
	
	<!-- Modify Modal -->
	<form action="boardModifyCheck.bo" method="post" name="modifyform">
		<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">게시글 수정하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table table-condensed">
							<tr>
								<th style="text-align: center; padding-top: 15px;">게시글 비밀번호</th>
								<td><input type="password" placeholder="비밀번호를 입력하세요."
									name="BOARD_PASS" class="form-control" /></td>
							</tr>
						</table>
						<input type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM()%>"/> 
						<input type="hidden" name="page" value="<%=nowPage%>"/>
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal">취소</button>
						<button type="button" onclick="javascript:modify()">수정하기</button>
					</div>
				</div>
			</div>

		</div>
	</form>
	
	<!-- Delete Modal -->
	<form action="boardModifyCheck.bo" method="post" name="removeform">
		<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">게시글 삭제하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table table-condensed">
							<tr>
								<th style="text-align: center; padding-top: 15px;">게시글 비밀번호</th>
								<td><input type="password" placeholder="비밀번호를 입력하세요."
									name="BOARD_PASS" class="form-control" /></td>
							</tr>
						</table>
						<input type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM()%>"/> 
						<input type="hidden" name="page" value="<%=nowPage%>"/>
						<input type="hidden" name="delete" value="true"/>
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal">취소</button>
						<button type="button" onclick="javascript:remove()">삭제하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</body>
<script type="text/javascript">
	function modify(){
		modifyform.submit();
	}
	function remove() {
		removeform.submit();
	}
</script>
</html>