package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 


@WebServlet("/signupServlet")

public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDTO userDTO;
	
	PreparedStatement pstmt;
	
	MemberDAO dao = MemberDAO.getInstance();
	
	public SignupServlet() {
		userDTO = new MemberDTO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		userDTO.setId(request.getParameter("id"));
		userDTO.setName(request.getParameter("name"));
		userDTO.setEmail(request.getParameter("email"));
		userDTO.setPassword(request.getParameter("password"));
	
		boolean result = dao.UserRegister(userDTO);
	
		request.setAttribute("result", result);
		ServletContext app = this.getServletContext();
		RequestDispatcher dispatcher = app.getRequestDispatcher("/index.jsp?contentPage=./LoginJSP/Signup.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			out.println(e);
		}
		
		
		
	}

}
