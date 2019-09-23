package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.BoardDTO;

import board.svc.BoardModifyProService;

public class BoardModifyProAction implements Action { // 글 수정 요청을 처리하는 Action 클래스

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String nowPage = request.getParameter("page");
		
		boolean isModifySuccess = false; // 글 수정 작업 성공 여부를 저장할 변수를 정의한 부분.
		
		int board_num = Integer.parseInt(request.getParameter("BOARD_NUM")); // 파라미터로 전송되어 오는 수정 대상이 되는 글의 번호를 얻어오는 부분.
		String board_subject = request.getParameter("BOARD_SUBJECT");
		String board_content = request.getParameter("BOARD_CONTENT");
		BoardDTO article = new BoardDTO();

		BoardModifyProService boardModifyProService = new BoardModifyProService();

		
			article.setBOARD_NUM(board_num);
			article.setBOARD_SUBJECT(board_subject);
			article.setBOARD_CONTENT(board_content);
			isModifySuccess = boardModifyProService.modifyArticle(article);
		

		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
		} else { // 글 수정 요청을 한 사용자가 글을 작성한 사용자인 경우 수정 작업을 실행후 글 상세 내용 보기를 다시 요청하는 부분.
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardDetail.bo?board_num=" + article.getBOARD_NUM() + "&page=" + nowPage);
		}

		return forward;

	}

}
