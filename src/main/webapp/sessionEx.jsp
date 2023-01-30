<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 연습</title>
</head>
<body>
<div>http 프로토콜은 stateless(상태정보 유지안됨) ,비연결지향(요청이 서버에 전송/응답 후에는 연결 종료)  <br>
     참고:*서버-클라이언트 동작방식에는  연결지향형 (카카오톡과 같은 채팅 프로그램. 서버와 연결이 계속 유지) 도 있습니다.* 
     -> 웹서버와 브라우저(클라이언트) 사이의 연결정보(사용자 구분)를 저장하는 방법을 사용합니다. -> session 객체에 저장.<br>
     -> request 를 통해서 브라우저의 세션ID가 부여되고  그 값으로 클라이언트 구별.브라우저는 첫 응답을 받으면서 세션ID를 브라우저에 저장<br>
     -> 첫 요청 후에 받은 JSESSIONID 값을 요청과 함께 보냅니다.(세션:특정활동 시간. 동일한 세션ID로 요청/응답 활동 시간)
     -> 로그인 기능 구현에 활용합니다.<br>
     -> 톰캣은 이름 JSESSIONID 값을 만듭니다. value는 개발자도구(-application 탭-쿠키)에서 확인가능(32개 16진수)<br>
     -> 세션 유효 시간은 서버에서 설정합니다. web.xml 확인(모든 프로젝트에 적용) <br>
     -> 또는 session.setMaxInactiveInterval(300); 로 합니다. **유효시간을 0(또는 -1)으로 설정했을때 동작은 쿠키진도에서 확인**<br>
     -> session 유효시간 (timeout)  설정값은 마지막 요청으로부터 지나간 시간동안 세션을 유지 시킵니다.
</div>
session 애트리뷰트 저장하기 테스트 : welcome - ${welcome } <br>
request 애트리뷰트 저장하기 테스트 : hello - ${hello }


</body>
</html>