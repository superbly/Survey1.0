package board.svc;

import java.sql.Connection;
import java.util.ArrayList;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

import static util.DB_connection.*;

public class BoardListService { // 글 목록 보기 요청을 처리하는 비즈니스 로직을 구현하는 Service 클래스

	public int getListCount() throws Exception {

		int listCount = 0; // 총 글의 개수를 저장할 변수를 선언한 부분.
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);

		listCount = boardDAO.selectListCount(); // 데이터베이스에서 총 게시판 글의 개수를 반환하는 기능을 하는 메소드를 호출한 부분.
		close(conn);
		return listCount;
	}

	public ArrayList<BoardDTO> getArticleList(int page, int listCount) {

		ArrayList<BoardDTO> articleList = null; // 해당 페이지에 출력될 글 목록을 저장할 ArrayLIst 타입의 레퍼런스 변수를 선언한 부분.
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);

		articleList = boardDAO.selectArticleList(page, listCount); // 데이터베이스에서 해당 페이지에 출력될 글 목록을 반환하는 메소드를 호출한 부분이다.
		close(conn);
		return articleList;
	}

	public int getNowPageList(int nowPage) {

		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);

		int count = boardDAO.nowPageListCount(nowPage); 
		close(conn);
		return count;
	}
}
