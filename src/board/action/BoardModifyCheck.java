package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.BoardModifyProService;

public class BoardModifyCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		String nowPage = request.getParameter("page");
		System.out.println(request.getParameter("delete"));
		boolean check = Boolean.parseBoolean(request.getParameter("delete"));
		
		int board_num = Integer.parseInt(request.getParameter("BOARD_NUM")); // 파라미터로 전송되어 오는 수정 대상이 되는 글의 번호를 얻어오는 부분.

		BoardModifyProService boardModifyProService = new BoardModifyProService();
		
		// 파라미터로 전송된 비밀번호를 사용해서 글 수정 요청을 한 사용자가 글을 작성한 사용자인지를 판단해 주는 메소드를 호출하는 부분이다.
				boolean isRightUser = boardModifyProService.isArticleWriter(board_num, request.getParameter("BOARD_PASS"));

				if (!isRightUser) { // 글 수정 요청을 한 사용자가 글을 작성한 사용자가 아닐 경우 경고창 출력 후 이전 페이지로 돌아가게 하는 부분.
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('비밀번호가 틀렸습니다.')");
					out.println("history.back();");
					out.println("</script>");
					out.close();
				} else {
					if(check) {
						System.out.println("1");
						forward.setPath("boardDeletePro.bo?board_num=" + board_num + "&page" + nowPage);
					} else {
						System.out.println("2");
						forward.setPath("boardModifyForm.bo?board_num=" + board_num + "&page" + nowPage);
					}
						
					
						
					
					
				}
		return forward;
	}

}
