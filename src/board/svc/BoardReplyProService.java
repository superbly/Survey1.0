package board.svc;

import java.sql.Connection;
import static util.DB_connection.*;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardReplyProService {		// 답변하기 요청을 처리하는 비즈니스 로직을 구현하는 Service 클래스
	
	public boolean replyArticle(BoardDTO article) throws Exception {
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		insertCount = boardDAO.insertReplyArticle(article);			// 답변글 정보를 파라미터 값으로 전송받아 데이터베이스에 답변글을 등록하는 메소드를 호출하는 부분.
		
		if(insertCount > 0) {
			commit(conn);
			isReplySuccess = true;
		}else {
			rollback(conn);
		}
		close(conn);
		return isReplySuccess;
	}
}
