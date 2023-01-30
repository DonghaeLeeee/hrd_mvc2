<%@page import="java.util.List"%>
<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/layout.css">
</head>
<body>
<%
	//list.jsp에서 저장해서 보낸 애트리뷰트 가져오기  //리턴타입은 Object
	@SuppressWarnings("unchecked")    //타입체크 경고 안보기게함.
	List<MemberVo> list = (List<MemberVo>)request.getAttribute("list");		

%>
	<%-- <%@ include  file="top.jsp"%> --%>  <!-- jsp 지시자 include 는 file속성으로 지정된 파일을 포함(단순 복붙) -->
	<main>
		<h3>회원목록조회/수정</h3>
		<div id="list">
<table>
			<tr>
			<th>회원번호</th><th>회원성명</th><th>전화번호</th><th>주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th>
			</tr>
			
<%
		for(int i=0;i<list.size();i++) {
			MemberVo vo = list.get(i);
%>			
            <tr>
                <%-- <td><%= vo.getCustno() %></td>  --%> 
                <!-- updateView.jsp로 custno 파라미터 넘겨주는 링크 -->
				<td>
				<a href="update.hrd?custno=<%= vo.getCustno() %>">
						<%= vo.getCustno() %></a>
				</td>                
                <td><%= vo.getCustname() %></td>   
                <td><%= vo.getPhone() %></td>
                <td><%= vo.getAddress() %></td>
                <td><%= vo.getJoindate() %></td>
                <td><%= vo.getGrade() %></td>
                <td><%= vo.getCity() %></td>
            </tr>
<%
		}
%>                
</table>
</div>
		</main>
		
	<%-- 	<%@ include file="footer.jsp" %> --%>
</body>
</html>