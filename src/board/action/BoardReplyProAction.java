package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.BoardDTO;
import board.svc.BoardReplyProService;

public class BoardReplyProAction implements Action{		// 답변글 등록 요청을 처리하는 Action 클래스

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		String nowPage = request.getParameter("page");
		
		BoardDTO article = new BoardDTO();
		
		// 답변글 작성 폼에서 작성한 파라미터 데이터들을 전송받아 BoardDTO 객체의 속성 값으로 설정하는 부분이다.
		article.setBOARD_NUM(Integer.parseInt(request.getParameter("BOARD_NUM")));
		article.setBOARD_NAME(request.getParameter("BOARD_NAME"));
		article.setBOARD_PASS(request.getParameter("BOARD_PASS"));
		article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		article.setBOARD_RE_REF(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		article.setBOARD_RE_LEV(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
		article.setBOARD_RE_SEQ(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
		
		BoardReplyProService boardReplyProService = new BoardReplyProService();	
		
		boolean isReplySuccess = boardReplyProService.replyArticle(article);		// 답변글 등록 작업을 하는 메소드를 호출하는 부분이다.
		
		if(isReplySuccess) {		// 답변글 등록 작업이 성공했을때 글 목록 보기를 다시 요청하는 부분이다.
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardList.bo?page=" + nowPage);
		} else {		// 답변글 등록 작업이 실패했을 때 경고창을 출력하고 이전 페이지로 돌아가는 부분.
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답장실패')");
			out.println("history.back();");
			out.println("<script>");
			out.close();
		}
		
		return forward;
	}
	
}
