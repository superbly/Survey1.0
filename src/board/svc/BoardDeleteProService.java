package board.svc;

import java.sql.Connection;

import board.dao.BoardDAO;

import static util.DB_connection.*;
public class BoardDeleteProService {		// 글 삭제하기 요청을 처리하는 비즈니스 로직을 구현하는 Service 클래스
	
	public boolean isArticleWriter(int board_num, String pass) throws Exception {		// 글 삭제 요청을 사용자가 글을 작성한사용자인지를 판단하는 메소드를 정의한 부분.
		boolean isArticleWriter = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);				
		
		close(conn);
		return isArticleWriter;
	}
	
	public boolean removeArticle(int board_num) throws Exception {						// 글 삭제 요청을 처리하는 메소드를 정의한 부분.
		boolean isRemoveSuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.deleteArticle(board_num);
		
		if(deleteCount > 0) {
			commit(conn);
			isRemoveSuccess = true;
		} else {
			rollback(conn);
		}
		close(conn);
		return isRemoveSuccess;
		
	}
}
