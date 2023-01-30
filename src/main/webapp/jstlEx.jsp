<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 문자열 메소드를 함수형태로 사용하게 합니다. 태그가 아니고 el 과 함께 쓰입니다. -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 연습</title>
<script type="text/javascript">
	alert('jstl 테스트 ' + '${member.custname}')
</script>
</head>
<body>
<h3>JSTL과 EL</h3>
<ul>
	<li>JSTL - Java(S)erver(P)age Standard Tag Library</li>
	<li>EL - Expression Language 기호는 &#36;&#123;&#125; : 변수,수식,메소드 등의 처리결과값을 출력 
		:EL출력할 때, c:out 태그를 사용하는데 이유는 보안문제 발생.
	</li>
</ul>
<h4>JSTL 로 할수 있는 것들</h4>
<ul>
	<li>애트리뷰트 가져오기 (EL): 라이브러리 없이도 가능합니다.애트리뷰터 가져오고 캐스팅 안해도 됩니다.<br>
	- ${hello } , ${count } , ${member }, ${member.custname },${member.phone }</li>
	<li>제어문 처리 : if,for (jstl core 태그설정-taglib 지시자)
			<ul>
				<!-- list애트리뷰트를 for 로 li 태그에 출력 -->	
				<c:forEach items="${list }" var="str" varStatus="status">   
	<!-- items(배열,리스트)에서 가져온 항목을 저장할 변수는 var로 설정. varStatus는 상태값 가져와서 저장할 변수 -->
				<li>${str } - ${status.index }</li>
				</c:forEach>	
				<li>${list[0] }</li>	 <!-- list.get(i) -->
				<li>${list[1] }</li>	
				<li>${list[2] }</li>	
				<li>${list[3] }</li>	
				<li>${list[4] }</li>	
				<li>${list[5] }</li>	<!-- 오류가 안나고 "" -->
			</ul>
			<ul>
				<c:if test="${count==1000 }">  <!-- test에는 조건식을 작성 -->
					<li>count 는 1000입니다.</li>
				</c:if>
				<c:if test="${count!=1000 }">  <!-- test에는 조건식을 작성 -->
					<li>count 는 1000이 아닙니다.</li>
				</c:if>
			</ul>
	</li>
	<li>파라미터 가져오기 - ${param.custid } , ${param.name }</li>   <!-- param는 요청 파라미터를 저장하고 있는 객체 -->
	<li>변수 선언과 저장 - 
		<c:set var="age" value="14"/>
		<c:choose>
			<c:when test="${age> 40 }">
				<strong style="color:blue">성인입니다.</strong>
			</c:when>
			<c:when test="${age> 20 }">
				<strong style="color:orange">청년입니다.</strong>
			</c:when>
			<c:otherwise>
				<strong style="color:green">어린이 입니다.</strong>
			</c:otherwise>
		</c:choose>
	</li>
	<li>출력 포맷 설정하기 - fmt 태그 : format (숫자,날짜 출력형식 / Locale 설정)<br>
	<fmt:formatNumber  value="9999999"/> <br>  <!-- formatNumber는 바로 출력과 저장 , value에는 값을 직접 또는 el -->
	<fmt:parseNumber var="test"  value="8888888"/> <!-- fmt:parseNumber는 변수에 저장 -->
	test : ${test }<br>
	<fmt:formatNumber  value="9999999"  type="currency"/><br> <!-- 현재 locale : ko_kr -->
	<fmt:setLocale value="en_us"/>  <!--  locale 변경 : en_us -->
	<fmt:formatNumber  value="9999999"  type="currency"/><br> 
	<!-- type: 화폐단위 또는 퍼센트(percent) 등 표시 , pattern : 직접 소수점 이하, 전체 자리수 지정-->
	<fmt:formatNumber value="789789.12345" /><br>  <!-- 789,789.123 기본패턴:소수점 최대 3자리 -->
	<fmt:formatNumber value="789789.12345" pattern="#,###.##"/><br>  <!-- 789,789.12 -->
	<fmt:formatNumber value="789789.123" pattern="0000,000,000.00000"/><br>
	
	<!-- 날짜 패턴에 대소문자 유의 : 일 dd, 월 MM , 분 mm , 시(12) hh , 시(24) HH -->
	<fmt:formatDate value="${now }" /><br>  <!-- Jan 20, 2023 *formatDate 도 var 로 변수 저장 -->
	<!-- parseDate의 pattern은 value 값의 형식을 알려줍니다. 문자열을 날짜 타입으로 캐스팅 -->
	<fmt:parseDate value="2022-11-03 20:14" var="datetime1" pattern="yyyy-MM-dd HH:mm"/> 
	 현재시간과 날짜 : ${datetime1 }<br>  <!-- Thu Nov 03 00:00:00 KST 2022 -->
	<fmt:formatDate value="${now }" type="date"/><br>  <!-- Jan 20, 2023 -->
	<fmt:formatDate value="${now }" type="time"/><br>  <!-- 10:35:29 AM -->
	<fmt:formatDate value="${now }" type="both"/><br>  <!-- Jan 20, 2023, 10:35:29 AM -->
	<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:MM:ss"/><br> <!-- 2023-01-20 10:01:29 -->
	<fmt:formatDate value="${datetime1 }" pattern="yyyy-MM-dd hh:MM:ss"/><br>
	<!-- 2022-11-03 08:11:00 -->
	</li>
	<li>문자열 메소드를 함수형태로 사용하기 : fn (자바의 문자열 메소드와 상당부분 일치)<br>
		<c:set var="msg"  value="i am spring!!"/>
		length : ${fn:length(msg) }	<br>			<!-- 예상 : 13 -->
		indexOf : ${fn:indexOf(msg,"am") }  <br><!-- 예상 : 2 -->
		replace : ${fn:replace(msg,"spring","java") }<br>
		escapeXml : ${fn:escapeXml("<strong>테스트</strong>") }    <!-- 특수문자 출력을 위해 사용 -->
	</li>
</ul>
</body>
</html>
<!-- jsp는 기존 시스템에서 유지보수를 위해 필요.
	 스프링부트에서는 jsp(jstl) 배척. html 확장자와 jstl 동작을 하는 라이브러리
	 대표적으로 ThymeLeaf : 테스트 못하지만 교재를 통해서 눈으로 읽어보기
-->
























