package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieCreateController implements Controller {
	//step 1 : 쿠키를 서버에서 생성해서 응답으로 클라이언트에게 보냅니다.
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//쿠키 객체 생성
		Cookie c1 = new Cookie("MSG", "IamCookie");   //쿠키 name,value
												//쿠키 유효시간이 설정안되면 -1이 기본값 session 과 동일하다.
		//한글, 공백 등 특수문자 인코딩해야 합니다. 오류.
		c1.setValue(URLEncoder.encode("아임어쿠키", "UTF-8"));   //value 변경
		
		Cookie c2 = new Cookie("HELLO","9999");
		c2.setMaxAge(1800);			//단위 : 초. 쿠키 유지 시간 30분
		c2.setHttpOnly(true);
		
		Cookie c3 = new Cookie("TEST","testing");  
		c3.setMaxAge(60);			//쿠키 유지시간 1분
		c3.setPath("/admin");		//쿠키 저장 경로. 예를들면 http://localhost:8081/hrd_mvc2/admin/admin.hrd 일때 확인가능
		
		//쿠키를 response 에 담기
		response.addCookie(c1);
		response.addCookie(c2);
		response.addCookie(c3);
		
		//
		response.sendRedirect("./");		//컨텍스트 패스 : /hrd_mvc2 즉 메인페이지
		
	}

}
