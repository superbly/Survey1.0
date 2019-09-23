package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.BoardDeleteProService;
import board.svc.BoardListService;

public class BoardDeleteProAction implements Action {	//글 삭제 요청을 처리하는 Action 클래스

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		boolean isDeleteSuccess = false;
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));			// 파라미터로 전송되어 오는 삭제 대상이 되는 글의 번호를 얻어오는 부분.
		
		int nowPage = Integer.parseInt(request.getParameter("page"));					// 글 삭제 요청을 처리한 후 원래 보던 페이지 목록으로 돌아가기 위해서 페이지 번호를 얻어오는 부분.
		
		BoardListService boardListService = new BoardListService();
		
		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
		
		
		isDeleteSuccess = boardDeleteProService.removeArticle(board_num);			// 인자값으로 지정한 글 번호를 가지고 있는 글을 삭제하는 기능을 하는 메소드를 호출하는 부분.
		
		if(!isDeleteSuccess) {		// 삭제 작업이 실패한 경우 경고창을 출력하고 이전 페이지로 되돌아가게 하는 부분.
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {		// 삭제 작업이 성공한 경우 글 목록 보기를 다시 요청하는 부분으로 이전에 보던 페이지로 다시 돌아가게 하기 위해서 page값을 파라미터로 전송.
			int backPage = nowPage - 1;
			int count = boardListService.getNowPageList(nowPage);
			if(count > 0) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" + nowPage);
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" + backPage);
			}
			
		}
		
		return forward;
	}
	
}
