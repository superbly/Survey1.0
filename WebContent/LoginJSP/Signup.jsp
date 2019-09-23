<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="./css/signup.css" rel="stylesheet" />

<div class="signup-form">
	<form action="signupServlet" method="post" name="userInfo" onsubmit="return checkValue()">
		<h2>회원가입</h2>
		<p></p>
		<hr>
		
			<div class="form-group" style="float: left; width: 100%;">
				
					<input type="text" id="userID" class="form-control" name="id" placeholder="아이디" required="required" style="float: left; width: 65%; margin-right: 20px;" >
				
				
					<input type="button" class="btn btn-primary btn-block btn-lg" onclick="registerCheckFunction();" value="중복확인" style="width: 29%; float: left;">
					<input type="hidden" name="idDuplication" value="idUncheck">
				
			</div>
		
		<div class="form-group">
			<input type="text" class="form-control" name="name" placeholder="이름" required="required">
		</div>
		<div class="form-group">
			<input type="email" class="form-control" name="email"
				placeholder="이메일" required="required">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="password"
				placeholder="비밀번호" required="required">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="passwordCheck"
				placeholder="비밀번호 확인" required="required">
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-block btn-lg">완료</button>
		</div>
		<div class="text-center">
			아이디가 존재하세요? <a href="index.jsp?contentPage=./LoginJSP/login.jsp;">로그인</a>
		</div>
	</form>

</div>

<!-- 중복체크를 위한 알림메시지 모달 -->

<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="vertical-alignment-helper">

	<div class="modal-dialog vertical-align-center">

		<!--  패널 출력 성공 메시지냐 오류 메시지에 따라 -->

			<div class="modal-content panel-info">

				<div class="modal-header panel-heading">

					<button type="button" class="close" data-dismiss="modal">

						<span aria-hidden="true">&times;</span>

						<span class="sr-only">Close</span>

					</button>

					<h4 class="modal-title">

						확인 메시지

					</h4>

					<div class="modal-body" id="checkMessage">

					</div>

					<div class="modal-footer">

					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>

					</div>

				</div>

			</div>

		</div>

	</div>

</div>

<script type="text/javascript">
	var checkedDuplicate_ID;
	var newDuplicate_ID;

	if(<%=request.getAttribute("result")%>){
		alert("회원가입이 완료되었습니다.");	// 이름 + 님 회원가입이 완료되었습니다. <-- 로 수정하기
		location.href="index.jsp?contentPage=./LoginJSP/login.jsp;"
	}
	
	function checkValue() {
		var form = document.userInfo;
		newDuplicate_ID = document.getElementById("userID").value;
		
		if(!document.userInfo.id.value){
            alert("아이디를 입력하세요.");
            return false;
        }
        
		if(form.idDuplication.value != "idCheck"){
            alert("아이디 중복체크를 해주세요.");
            return false;
        }
		
		if(checkedDuplicate_ID != newDuplicate_ID) {
			document.userInfo.idDuplication.value="idUncheck";
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		
        if(!document.userInfo.password.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.passwordCheck.value){
            alert("비밀번호 확인을 입력하세요.");
            return false;
        }

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (form.userInfo.password.value != document.userInfo.passwordCheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	function clearInput(){

		/* 텍스트박스 지우는 부분 */

		var el = document.getElementsByName('id');

		for(var i=0; i<el.length; i++){

			el[i].value = '';

		}
	}
	
	function registerCheckFunction(){

		// userID 변수에 userID의 입력된 값을 가져오게 함

		var userID = $('#userID').val();
	
		$.ajax({

			type: 'POST',  // GET or POST 전송방법 

			url: './duplicateIdCheckServlet',  // 이쪽으로 보낸다(호출URL)

			data: {userID: userID},  // userID 이름에 userID 데이터 값을 넣어서 보낸다

			success: function(result){  // 만약 성공적으로 수행되었다면 result로 값반환
				
				if(result == 1){  // id가 checkMessage인 것에 아래 텍스트 출력
					
					document.userInfo.idDuplication.value="idCheck";
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					checkedDuplicate_ID = document.getElementById("userID").value;
					
				} else {
					
					document.userInfo.idDuplication.value="idUncheck";
					clearInput();
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					
				}

				// id 가 checkModal인 모달함수 실행시켜서 모달 실행시키기 위해

				$('#checkModal').modal("show");

			} 

		})

	}
</script>
