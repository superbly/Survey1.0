package board.svc;

import static util.DB_connection.*;
import java.sql.Connection;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardWriteProService {		// 글 등록 요청을 처리하는 비즈니스 로직을 구현하는 Service 클래스

	public boolean registArticle(BoardDTO boardDTO) throws Exception {
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		int insertCount = boardDAO.insertArticle(boardDTO);
		
		if (insertCount > 0) {
			commit(conn);
			isWriteSuccess = true;
		} else {
			rollback(conn);
		}

		close(conn);
		return isWriteSuccess;
	}
	
	

}
