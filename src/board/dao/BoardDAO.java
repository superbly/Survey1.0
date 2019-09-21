package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.dto.BoardDTO;

import static util.DB_connection.*;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	private static BoardDAO boardDAO;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	// 글의 개수 구하기
	public int selectListCount() {
		int listCount = 0;

		try {
			sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getLIstCount 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	// 현재 페이지 글의 개수 구하기
	public int nowPageListCount(int page) {
		int nowPageListCount = 0;
		int startRow = (page - 1) * 10; // 읽기 시작할 row 번호.

		try {
			sql = "SELECT COUNT(*) FROM (SELECT ROWNUM rnum, data.* FROM (SELECT * FROM board ORDER BY board_re_ref DESC, board_re_seq asc) data) WHERE rnum > ? AND rnum <= 10 + ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				nowPageListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getLIstCount 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return nowPageListCount;
	}

	// 글 목록 보기
	public ArrayList<BoardDTO> selectArticleList(int page, int listCount) {
		
		sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, Z.* FROM ( SELECT * FROM board order by board_re_ref asc, board_re_seq desc) Z WHERE ROWNUM <= ? ) WHERE RNUM >= ? order by rnum desc";
		
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();
		BoardDTO boardDTO = null;
		int total = listCount;					// 총 게시물 수.
		int endRow = total - ((page - 1) * 20); // 읽기 시작할 row 번호.
		int startRow = endRow - 19;				
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setRNUM(rs.getInt("RNUM"));
				boardDTO.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardDTO.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boardDTO.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				boardDTO.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardDTO.setBOARD_FILE(rs.getString("BOARD_FILE"));
				boardDTO.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				boardDTO.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				boardDTO.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				boardDTO.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				boardDTO.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				articleList.add(boardDTO);
			}
		} catch (SQLException e) {
			System.out.println("getBoardList 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	// 글 내용 보기
	public BoardDTO selectArticle(int board_num) {
		BoardDTO boardDTO = null;

		try {
			sql = "select * from board where board_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardDTO.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boardDTO.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				boardDTO.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardDTO.setBOARD_FILE(rs.getString("BOARD_FILE"));
				boardDTO.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				boardDTO.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				boardDTO.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				boardDTO.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				boardDTO.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
		} catch (SQLException e) {
			System.out.println("getDetail 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return boardDTO;
	}

	// 글 등록
	public int insertArticle(BoardDTO article) {
		int num = 0;
		int insertCount = 0;

		try {
			sql = "select max(board_num) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1; // 1을 더하는 이유는 번호가 0부터 시작하기 때문??
			else
				num = 1;

			sql = "insert into board (board_num, board_name, board_pass, board_subject, board_content,";
			sql += "board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date)";
			sql += "values(seq_board.nextval,?,?,?,?,?,?,?,?,?,SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, num);
			pstmt.setString(1, article.getBOARD_NAME());
			pstmt.setString(2, article.getBOARD_PASS());
			pstmt.setString(3, article.getBOARD_SUBJECT());
			pstmt.setString(4, article.getBOARD_CONTENT());
			pstmt.setString(5, article.getBOARD_FILE());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("boardInsert 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}

	// 글 답변
	public int insertReplyArticle(BoardDTO article) {
		String board_max_sql = "select max(board_num) from board";
		sql = "";

		int num = 0;
		int insertCount = 0;
		int re_ref = article.getBOARD_RE_REF();
		int re_lev = article.getBOARD_RE_LEV();
		int re_seq = article.getBOARD_RE_SEQ();

		try {
			pstmt = conn.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "update board set board_re_seq = board_re_seq + 1 where board_re_ref = ?";
			sql += "and board_re_seq > ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);

			int updateCount = pstmt.executeUpdate();

			if (updateCount > 0)
				commit(conn);

			re_seq = re_seq + 1;
			re_lev = re_lev + 1;

			sql = "insert into board (board_num, board_name, board_pass, board_subject,";
			sql += "board_content, board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date) values(?,?,?,?,?,?,?,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, "답장에는 파일 기록 x");
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);

			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardReply 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}

	// 글 수정
	public int updateArticle(BoardDTO article) {
		int updateCount = 0;

		try {
			sql = "update board set board_subject = ?, board_content = ? where board_num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_SUBJECT());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setInt(3, article.getBOARD_NUM());

			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardModify 에러 : " + e);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	// 글 삭제
	public int deleteArticle(int board_num) {
		sql = "delete from board where board_num = ?";
		int deleteCount = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);

			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardDelete 에러 : " + e);
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}

	// 조회수 업데이트
	public int updateReadCount(int board_num) {
		int updateCount = 0;
		sql = "update board set board_readcount = board_readcount + 1 where board_num = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("setReadCountUpdate 에러 : " + e);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	// 글쓴이인지 확인
	public boolean isArticleBoardWriter(int board_num, String pass) {
		sql = "select * from board where board_num = ?";
		boolean isWriter = false;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			rs.next();

			if (pass.equals(rs.getString("BOARD_PASS"))) {
				isWriter = true;
			}
		} catch (SQLException e) {
			System.out.println("isBoardWriter 에러 : " + e);
		} finally {
			close(pstmt);
		}
		return isWriter;
	}
}
