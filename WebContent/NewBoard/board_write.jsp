<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

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
	margin-bottom: 20px;
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
</head>
<body>
	<div class="container">
	<article>
	<div class="test1">
		<p class="writeTitle">글쓰기</p>
		<form action="boardWritePro.bo" method="post" enctype="multipart/form-data" name="board_form" onsubmit="return checkValue();" >
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td><input type="text" placeholder="제목을 입력하세요. "
						name="BOARD_SUBJECT" class="form-control"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" placeholder="작성자를 입력하세요."
						class="form-control" name="BOARD_NAME"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" placeholder="비밀번호를 입력하세요"
						class="form-control" name="BOARD_PASS" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea  placeholder="내용을 입력하세요." style="min-height: 300px;"
							name="BOARD_CONTENT" id="ir1" class="form-control" >내용을 입력하세요.</textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" placeholder="파일을 선택하세요. "
						name="BOARD_FILE" class="form-control" /></td>
				</tr>
			</table>
			<!-- submit 대신 onClick="submitContents(this) 함수를 호출함으로서 script에 의해서 전송되게 함." -->
			<input type="submit" class="btn btn-default pull-right" name="d" id="btn" onClick="" value="등록" />
			<a class="btn btn-default pull-right" id="btn" href="boardList.bo">글 목록</a>
		</form>
		</div>
		</article>
	</div>
</body>
<!-- SmartEditor2 -->
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
		
		
		function checkValue() {
						
			if(!document.board_form.BOARD_SUBJECT.value){
	            alert("제목을 입력하세요.");
	            return false;
	        }
			
			else if(!document.board_form.BOARD_NAME.value){
	            alert("이름을 입력하세요.");
	            return false;
	        }
	        
			else if(!document.board_form.BOARD_PASS.value){
	            alert("비밀번호를 입력하세요.");
	            return false;
	        } 
			else {
	        	return submitContents(this);
	        }
		}
</script>
</html>