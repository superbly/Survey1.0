<%@page import="board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDTO article = (BoardDTO)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<!-- SmartEditor2 -->
<script type="text/javascript" src="./SmartEditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script> 

<style type="text/css">
	#btn {
		margin-left: 5px;
	}
	.writeTitle {
	 	font-size: 30px;
	 	font-weight: bold;
	 	color: black;
	}
	article {
	width: 100%;
	min-height: 600px;
	background-color: #fff;
	box-shadow: 2px 2px 4px #dee1e7;
}

.test1 {
	margin: 0 50px 0 50px;
	padding: 40px 0 65px;
	font-family: Noto Sans KR, sans-serif;
}
</style>
<meta charset="UTF-8">

</head>
<body>
	<div class="container">
	<article>
	<div class="test1">
		<p class="writeTitle">게시글 수정하기</p>
		<form action="boardModifyPro.bo" method="post" name="board_form1" onsubmit="return checkValue();" >
			<input type="hidden" name="page" value="<%=nowPage%>">
			<input type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM()%>">
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td><input type="text" value="<%=article.getBOARD_SUBJECT()%>"
						name="BOARD_SUBJECT" class="form-control"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" value="<%=article.getBOARD_NAME()%>" disabled
						class="form-control" name="BOARD_NAME"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea  
						name="BOARD_CONTENT" id="ir1" class="form-control" style="min-height: 300px;"><%=article.getBOARD_CONTENT()%></textarea></td>
				</tr>
			</table>
			
			<!-- submit 대신 onClick="submitContents(this) 함수를 호출함으로서 script에 의해서 전송되게 함." -->
			<input type="submit" class="btn btn-default pull-right" name="d" id="btn" onClick="" value="수정" />
			<a class="btn btn-default pull-right" id="btn" href="boardList.bo">글 목록</a>
		</form>
		</div>
		</article>
	</div>
</body>

<!--------------- SmartEditor2 --------------->
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
 		oAppRef: oEditors,
 		elPlaceHolder: "ir1",								// textarea에서 지정한 id와 일치해야 한다.
 		sSkinURI: "./SmartEditor2/SmartEditor2Skin.html",	// SmartEditor2Skin.html가 저장된 경로
 		fCreator: "createSEditor2"
	});
	
		
		// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

			// 에디터의 내용에 대한 값 검증은 이곳에서
			// document.getElementById("ir1").value를 이용해서 처리한다.

			try {
			    elClickedObj.form.submit();
			} catch(e) {}
		}
<!---------------------------------------------->		
		
		function checkValue() {
						
			if(!document.board_form1.BOARD_SUBJECT.value){
	            alert("제목을 입력하세요.");
	            return false;
	        }
			else {
	        	return submitContents(this);
	        }
		}
</script>

</html>