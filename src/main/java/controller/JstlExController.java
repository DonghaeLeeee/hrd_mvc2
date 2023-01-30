package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.MemberVo;

public class JstlExController implements Controller 
{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setAttribute("hello", "안녕, JSP spring hello~~");
		request.setAttribute("count",1000);
		request.setAttribute("member", new MemberVo(111,"김모모","010-7777-8888", null, null, null,"23"));
		request.setAttribute("list", List.of("김모모","이나나","강신비","최은하","김땡땡"));
		request.setAttribute("now", new Date());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jstlEx.jsp");
		dispatcher.forward(request, response);
	}	// method end
}	// Class end
