<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
#surveyTitle{
	margin-bottom: 30px;
	display: block;
    width: 100%;
    height: 60px;
    padding: 6px 12px;
    font-size: 30px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
#surveyInput{
	margin-bottom: 30px;
}

@media screen and (min-width: 769px) {
  	.under{
	width: 100%;
    padding: 20px 0 0;
    
    text-align: right;
}
}

/* 데스크탑에서 사용될 스타일을 먼저 작성합니다. */

@media screen and (max-width: 768px) {
    .under{
	width: 100%;
    padding: 20px 0 0;
    
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
</style>

<div class="container">
<article>
	<div class="test1">
	<p class="boardTitle">설문지</p>
		
			<input type="text" placeholder="제목을 입력하세요. " name="surveyTitle" class="form-control" id="surveyTitle">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<input type="text" placeholder="질문을 입력하세요. " name="surveyInput" class="form-control" id="surveyInput">
			<div class="under">
	<button type="button" >완료</button>
	</div>
	</div>
	
	
</article>
</div>

