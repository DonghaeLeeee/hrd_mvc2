package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;
//path : update.hrd , method : GET
public class UpdateController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDao dao = MemberDao.getMemberDao();
		MemberVo vo = null;
		int custno = 0;
		
		try {
			custno = Integer.parseInt(request.getParameter("custno"));
			vo = dao.selectOne(custno);
			request.setAttribute("vo", vo);
		}catch (SQLException | NumberFormatException e) {   
			//2개 이상의 Exception 처리할때 or는 | 연산자입니다.
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateView.jsp");
		dispatcher.forward(request, response);
	}

}
