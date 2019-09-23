package login;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao = MemberDAO.getInstance();
	
	public LoginServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();

		// 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
		String id = request.getParameter("id");
		String pw = request.getParameter("password");

		// DB에서 아이디, 비밀번호 확인
		int check = dao.loginCheck(id, pw);
		
		// URL 및 로그인관련 전달 메시지
		String msg = "";
		
		if (check == 1) 	// 로그인 성공
		{	// 세션에 현재 아이디 세팅
			HttpSession session = request.getSession();
			session.setAttribute("sessionID", id);
			msg = "index.jsp?contentPage=./LoginJSP/login.jsp?msg=1";
		} 
		
		else if (check == 0) // 비밀번호가 틀릴경우
		{
			msg = "index.jsp?contentPage=./LoginJSP/login.jsp?msg=0";
		} 
		
		else // 아이디가 틀릴경우
		{
			msg = "index.jsp?contentPage=./LoginJSP/login.jsp?msg=-1";
		}

		response.sendRedirect(msg);
		
	}

}
