package login;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/duplicateIdCheckServlet")
public class DuplicateIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO dao = MemberDAO.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String userID = request.getParameter("userID");
        // 해당 체크함수는 숫자 결과값 나오기 때매 공백 추가해서 문자열 추가 ""

        // 해당 결과가 0, 1 나온 것을 보내니 ajax에서 결과값으로 받아서 처리

		response.getWriter().write(dao.duplicateIdCheck(userID) + ""); 
	}

}
