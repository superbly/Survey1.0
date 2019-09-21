package board.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.BoardDTO;
import board.svc.BoardDetailService;


public class BoardModifyFormAction implements Action {		// 글 수정폼 보기 요청을 처리하는 Action 클래스

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));		// 파라미터로 전송되어 오는 수정 대상이 되는 글의 번호를 받는 부분.
		String nowPage = request.getParameter("page");
		
		BoardDetailService boardDetailService = new BoardDetailService();
		
		BoardDTO article = boardDetailService.getArticle(board_num);				// 수정 대상이 되는 글의 정보를 반환하는 메소드를 호출하는 부분이다. 
	
		request.setAttribute("article", article);									// 수정 대상이 되는 글의 이전 정보를 request 영역에 속성으로 공유하는 부분.
		request.setAttribute("page", nowPage);
		forward.setPath("index.jsp?contentPage=/NewBoard/board_modify.jsp");
		return forward;
	}
	
}
