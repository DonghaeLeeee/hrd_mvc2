<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 cookie</title>
<script type="text/javascript">
	console.log(document.cookie)   //HTTP only 속성이 설정된 값은 자바스크립트에서 접근 못합니다.
	let cookies = document.cookie.split(";")  
	
	for(let i=0;i<5;i++) {
		console.log(cookies[i])
	}
</script>
</head>
<body>
<h3>쿠키 활용하기</h3>
<ul>
	<li>쿠키란? 웹브라우저에서 저장하는 문자열 데이터(특수문자는 인코딩해서 저장합니다.)
		쿠키 정보는 쿠키 이름과 값이 한쌍입니다.(저장과 가져오기는 쿠키이름으로 합니다.)
	</li>
	<li>쿠키를 생성하는 곳은 서버 or 클라이언트(자바스크립트)에서 
		<ul>
			<li>서버에서 생성할 때에는 응답 response 객체를 사용해서 전송</li>		
			<li>클라이언트에서 생성할 때에는 document 객체를 사용</li>		
		</ul>
	</li>
	<li>쿠키 유효시간은 데이터를 저장하는 시간을 설정합니다.</li>
	<li>쿠키 Path는 쿠키를 저장할 하위 경로를 설정합니다.</li>
	<li>쿠키 HttpOnly는 자바스크립트에서 쿠키값 읽기와 변경을 못합니다.</li>
	<li>세션ID(JSESSIONID) 값도 쿠키 정보 중에 하나이고 유효시간은 세션.</li>
	<li>쿠키 데이터는 서버에 요청을 보낼때 꼭 응답 객체에 함께 전송됩니다.</li>
	<li>session attribute 는 서버에 데이터를 저장, response addCookie 로 저장되는 쿠키는 브라우저(파일)에 저장</li>
</ul>
<hr>
<h3>JSTL 활용하여 쿠키값 읽어오기 - cookie 객체 사용</h3>
쿠키 MSG : ${cookie.MSG.value } <br>
쿠키 HELLO : ${cookie.HELLO.value } <br>
쿠키 JSESSIONID :  ${cookie.JSESSIONID.value } <br>
<button onclick="document.cookie = 'TEST=abc'">쿠키 TEST 생성</button>
쿠키 TEST : ${cookie.TEST.value } <br>
<hr>
<p>
JSESSIONID와 쿠키 동작 순서<br>
1. 브라우저가 url을 입력해서 서버에게 처음 요청을 보낸다.<br>
2. 서버는 요청을 보낸 브라우저에게 JSESSIONID 128비트 값을 클라이언트(브라우저) 식별을 위한 값으로 보낸다.<br>
3. 클라이언트(브라우저)는 2번에서 받은 값을 브라우저 쿠키 저장소에 저장한다.<br>
4. 브라우저는 1번과 동일한 url 로 요청을 보낼때마다 JSESSIONID를 포함한 쿠키 정보를 서버에게 보낸다.<br>
5. 서버는 요청과 함께 전달된 JSESSIONID로 클라이언트(브라우저)를 구분한다.<br>
사용하는 웹컨테이너(웹애플리케이션 서버)에 따라 세션ID의 이름은 다르다. 톰캣은 JSESSIONID라는 이름을 사용한다.<br>
*참고 : 서버는 세션ID 별로 session 객체를 생성하여 관련 정보를 저장한다.예를 들면, 클라이언트의 ip, 요청url,애트리뷰트 등등<br>

</p>
</body>
</html>