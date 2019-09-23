package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.BoardDTO;
import board.dto.PageInfo;
import board.svc.BoardListService;

public class BoardListAction implements Action{		// 글 목록 보기 요청을 처리하는 Action 클래스

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO> ();
		int page = 1;													// 목록 보기 요청에서 출력될 페이지의 기본값으로 1페이지를 설정하는 부분.
		int limit = 20;													// 한 페이지당 출력될 글의 개수를 10개로 설정하는 부분.
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		BoardListService boardListService = new BoardListService();
		int listCount = boardListService.getListCount();				// 총 리스트 수를 받아옴
		articleList = boardListService.getArticleList(page, listCount);	// 리스트를 받아옴
		int maxPage = (int)((double)listCount / limit + 0.95);			// 총 페이지 수 (0.95를 더해서 올림 처리) <-- 왜?????
		int startPage = ((int)((double)page / 10 + 0.9) -1) * 10 + 1;	// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int endPage = startPage + 10 - 1;								// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30등...)
		
		if(endPage > maxPage) endPage = maxPage;						// 전체 페이지 중 마지막 페이지가 출력될 때는 하단에 출력되는 페이지 리스트가 10개가 안될 수도 있다. 
																		// startPage가 11인데 총 페이지 수는 15페이지 밖에 존재하지 않는 경우, 29번 라인과 같은 방식으로 계산할 경우 endPage값이 20이 되기 때문에
																		// 존재하지 않는 페이지 번호를 출력할 수 있다. 그러므로 endPage의 값을 전체 페이지 개수의 값(maxPage)으로 주어야 한다.
		
		PageInfo pageInfo = new PageInfo();								// 페이징에 관한 정보를 저장할 PageInfo 객체를 생성하는 부분.
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);						// pageInfo 객체를 request 영역에 속성 값으로 공유한느 부분.
		request.setAttribute("articleList", articleList);				// 해당 페이지에 출력될 글의 목록 정보를 request 영역에 공유하는 부분.
		
		ActionForward forward = new ActionForward();
		forward.setPath("index.jsp?contentPage=/NewBoard/board_list.jsp");
		
		return forward;
	}

}
