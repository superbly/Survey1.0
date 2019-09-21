# Survey1.0
설문조사 웹 서비스 1.0

## 동기
- 사실 이 프로젝트는 웹에 대한 기초적인 공부를 해보려고 시작하였다.
- 단순히 로그인과 게시판만 구현해보자 했지만 공부할수록 하나의 주제로 프로젝트를 만들고 싶어졌다.


## 목표
- 주제를 생각하다가 "설문조사 커뮤니티" 라는 주제를 떠올림.
- 설문조사 결과를 `블록체인 네트워크`에 올리면 설문의 결과가 신뢰성을 가진다.
- 설문 참여자에게는 `토큰`이라는 보상을 부여하므로서 설문 참여의 동기를 유발한다.

  #### Servey 1.0 ( 구현 )
  - Jsp / Servlet 을 이용한 회원가입과 로그인 자유게시판 구현
  #### Servey 2.0 ( 미구현 )
  - Spring Boot을 이용해서 대부분의 기능을 구현
  - View = Thymeleaf.
  - Vue.js, React.js 같은 Frontend Framework도 사용해 보고 싶지만 학습 시간이 부족하다. ( 핑계 )
  - 대부분의 기능 구현
  - 설문 작성 폼과 설문 참여 커뮤니티에 집중
  #### Servey 3.0 ( 미구현 )
  - 이더리움을 사용하여 설문조사의 결과를 PublicChain에 올리는 기능 구현.
  - SmartContract는 Solidty를 사용.
  - 사용자 개개인의 토큰 지갑 구현


## 기능
- Jsp / Servlet을 사용. Model2 방식.
- 현재까지 완성된 부분은 회원가입, 로그인 , 자유게시판


## 사용기술
- HTML5, CSS, JS, Jquery, BootStrap
- Jsp, Servlet, ApacheTomcat, Oracle 11g xe


## 느낀점
#### Jsp의 액션코드는 정말 가독성을 떨어트리고 코드 자체를 읽기 싫게 만든다.
  - 이러한 코드는 팀프로젝트시 굉장히 좋지 않을 것 같다.
  - 물론 Jstl을 사용하면 조금 나을 수는 있겠지만 사용하지 않았다.
  - 빨리 Spring Boot와 Thymeleaf를 사용하기 위해서 !
#### MVC 디자인 패턴의 필요성 알게 되었다 !
  1. 패턴을 사용하면 해당 패턴을 알고 있는 사람들한테는 구조에 대한 추가적인 설명이 필요 없어진다.
  2. 유지보수나 신규인력이 투입되었을 경우 익숙한 패턴이므로 분석시간이 줄어든다.
  3. 개발자들이 개발 협업, 유지보수 등을 고려하여 가장 효율적인 모델이 패턴화 된 것이 MVC 패턴이다.


## 자유게시판 리스트  
![trace](/img/boardList.png)
- 조회수 5 이상은 HIT! 표시

## 게시글 글쓰기
![trace](/img/boardWrite.png)
- 에디터는 네이버의 SmartEditor2 사용

## 게시글 상세보기

![trace](/img/boardView1.png)


## 게시글 수정
![trace](/img/boardModified.png)
- 수정 버튼을 누르면 게시글 비밀번호를 입력하라는 모달이 나온다.

## 게시글 삭제
![trace](/img/boardDelete.png)
- 삭제 버튼을 누르면 게시글 비밀번호를 입력하라는 모달이 나온다.

## 회원가입
![trace](/img/signup.png)
- 회원가입의 현재 입력 유효성 검사에는 공백에 대한 검사만 한다.
- 정규식 유효성 검사 추가 예정

#### 알게된 점
- 유효성 검사는 프론트단과 백단 둘 다 해주어야 한다.
- 유효성 검사를 프론트단만 한다면 Sql Injection 같은 공격을 받을 위험있다.

## 로그인  
![trace](/img/login.png)
- 로그인 시 세션을 유지한다.
- 로그아웃 시 세션을 해제한다.

## 아이디 중복 체크  
![trace](/img/duplicateCheck.png)
- 아이디 중복체크는 AJAX를 이용하여 비동기로 구현하였다.
- 이메일 중복체크도 추가할 예정.

#### 알게된 점
- 비동기와 동기의 차이점을 알게 되었다.
