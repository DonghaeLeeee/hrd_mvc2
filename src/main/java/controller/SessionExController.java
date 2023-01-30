package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SessionExController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(SessionExController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 연습
		//HttpSession 객체는 request 로 만듭니다.
		HttpSession session = request.getSession();
		//session.setMaxInactiveInterval(60);		//단위: 초

		logger.info(":::세션 id : {} :::",session.getId());   //String 타입 id
		logger.info(":::세션 생성시간 : {} :::",session.getCreationTime());   //long 타입 생성시간
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sdfTime = sdf.format(session.getCreationTime());
		logger.info(":::세션 생성시간 : {} :::",sdfTime);   //long 타입 생성시간을 format 적용하여 String
		
		//세션ID값으로 클라이언트 구별하고 session 객체에 관련정보 저장.- 애트리뷰트는 서버 쪽의 저장소, 쿠키는 브라우저의 저장소
		session.setAttribute("welcome", "세션 애트리뷰트 테스트 중입니다.");
		request.setAttribute("hello", "안녕, i am request!!");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("sessionEx.jsp");
		dispatcher.forward(request, response);
	}

}
