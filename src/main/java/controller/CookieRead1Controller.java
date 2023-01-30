package controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieRead1Controller implements Controller{
	
//step 2 : 클라이언트(브라우저) 에 저장된 쿠키를 가져와서 서버에서 활용하는 예시.
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getCookies();		//리턴타입은? Cookie[] 즉 배열입니다.
		Cookie[] cookies = request.getCookies();
		
		//쿠키정보 모두 가져오기
		for(Cookie temp : cookies) {
			System.out.println("쿠키 이름 : "+temp.getName());
			System.out.println("쿠키 값 : "+temp.getValue());
			//쿠키 저장시 max age 반영이 된 후에는 다시 -1로 초기화
			System.out.println(temp.getMaxAge());
			if(temp.getName().equals("MSG"))
				System.out.println(URLDecoder.decode(temp.getValue(), "UTF-8"));
				
		}
		
		response.sendRedirect("./");
	}

}
