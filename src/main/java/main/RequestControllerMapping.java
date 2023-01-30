package main;

import java.util.HashMap;
import java.util.Map;

import controller.Controller;
import controller.CookieCreateController;
import controller.CookieRead1Controller;
import controller.CookieRead2Controller;
import controller.JstlExController;
import controller.ListController;
import controller.LoginActionController;
import controller.LoginViewController;
import controller.LogoutController;
import controller.RegActionController;
import controller.RegisterController;
import controller.SaleController;
import controller.SessionExController;
import controller.UpdateActionController;
import controller.UpdateController;

public class RequestControllerMapping {
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init() {
		//설계된 url,method 에 따라 처리할 controller 구현체를 Key,Value 로 HashMap에 저장합니다.
		mapping.put(new RequestKeyValue("/list.hrd", "GET"), new ListController());
		mapping.put(new RequestKeyValue("/sale.hrd", "GET"), new SaleController());
		mapping.put(new RequestKeyValue("/update.hrd", "GET"), new UpdateController());
		mapping.put(new RequestKeyValue("/register.hrd", "GET"), new RegisterController());
		mapping.put(new RequestKeyValue("/register.hrd", "POST"), new RegActionController());
		mapping.put(new RequestKeyValue("/update.hrd", "POST"), new UpdateActionController());
		//jstl과 el을 연습하기 위한 url
		mapping.put(new RequestKeyValue("/jstlEx.hrd", "GET"), new JstlExController());
		//session 을 연습하기 위한 url
		mapping.put(new RequestKeyValue("/sessionEx.hrd", "GET"), new SessionExController());
		//로그인 기능
		mapping.put(new RequestKeyValue("/login.hrd", "GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login.hrd", "POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout.hrd", "GET"), new LogoutController());
		//쿠키 테스트
		mapping.put(new RequestKeyValue("/cookie.hrd", "GET"), new CookieCreateController());
		mapping.put(new RequestKeyValue("/cookieRead1.hrd", "GET"), new CookieRead1Controller());
		mapping.put(new RequestKeyValue("/cookieRead2.hrd", "GET"), new CookieRead2Controller());
		
	}
	//url,method 필드를 저장하는 key 를 전달받아 HashMap에서 value(컨트롤러)를 리턴
	public static Controller getController(RequestKeyValue key) {
		return mapping.get(key);
	}
}
