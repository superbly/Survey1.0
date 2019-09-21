package board.svc;

import java.sql.Connection;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

import static util.DB_connection.*;

public class BoardModifyProService {		// 글 수정하기 요청을 처리하는 비즈니스 로직을 구현하는 Service 클래스

	public boolean isArticleWriter(int board_num, String pass) throws Exception {		// 수정 시 입력한 비밀번호를 비교하여 수정 작업을 하는 사용자가 해당 글을 작성한 사용자인지
		boolean isArticleWriter = false;												// 판단하는 메소드를 정의한 부분.
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);				// 데이터베이스에 저장된 데이터를 사용하여 수정 작업을 하는 사용자가 글을 작성한 사용자인지를 판단하는 
																						// 메소드를 호출하는 부분.
		close(conn);
		return isArticleWriter;
	}

	public boolean modifyArticle(BoardDTO article) throws Exception {					// 글 수정 작업을 처리하는 비즈니스 로직이 구현되는 메소드를 정의한 부분이다.
		boolean isModifySuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int updateCount = boardDAO.updateArticle(article);								// 수정 정보를 파라미터 값으로 전송받아 데이터베이스에서 글 정보를 수정하는 메소드를 호출하는 부분.

		if (updateCount > 0) {
			commit(conn);
			isModifySuccess = true;
		} else {
			rollback(conn);
		}
		close(conn);
		return isModifySuccess;
	}
}
