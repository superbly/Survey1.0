package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.BoardDTO;
import board.svc.BoardDetailService;

public class BoardDetailAction implements Action{		// 글 상세 내용 보기 요청을 처리하는 Action 클래스

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));		// 파라미터로 전송되어 오는 상세 내용을 볼 글의 번호를 받은 부분.
		String page = request.getParameter("page");									// 파라미터로 전송되어 오는 페이지 번호를 받는 부분.
		
		BoardDetailService boardDetailService = new BoardDetailService();
		
		BoardDTO article = boardDetailService.getArticle(board_num);				// 파라미터로 전송된 글 번호를 가지고 있는 글 하나의 정보를 반환하는 메소드를 호출하는 부분.
		
		request.setAttribute("page", page);											// 페이지 번호를 request 영역에 속성으로 공유하는 부분.
		request.setAttribute("article", article);									// 글 정보를 request 영역에 속성으로 공유하는 부분.
	
		ActionForward forward = new ActionForward();
		forward.setPath("index.jsp?contentPage=/NewBoard/board_view.jsp");
		return forward;
	}

}
