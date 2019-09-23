package board.svc;

import java.sql.Connection;
import static util.DB_connection.*;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardDetailService {	// 글 상세 내용 보기 요청을 처리하느 비즈니스 로직을 구현하는 Service 클래스

	public BoardDTO getArticle(int board_num) throws Exception {
		BoardDTO article = null;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int updateCount = boardDAO.updateReadCount(board_num);		// 상세 글 내용을 볼 글의 조회수를 증가시키는 메소드를 호출하는 부분.

		if (updateCount > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		article = boardDAO.selectArticle(board_num);				// 인자로 지정한 글번호의 정보를 반환하는 메소드를 호출하는 부분.
		
		close(conn);
		return article;
	}
}
