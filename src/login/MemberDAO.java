package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static util.DB_connection.*;


public class MemberDAO {

	private StringBuffer sql;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn = null;
	private static MemberDAO instance;

	// 싱글톤 패턴
	private MemberDAO() {}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	public Boolean UserRegister(MemberDTO memberDTO) {

		boolean result = false;

		try {
			sql = new StringBuffer();
			sql.append("insert into users(id,name,email,password) values(?,?,?,?)");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getName());
			pstmt.setString(3, memberDTO.getEmail());
			pstmt.setString(4, memberDTO.getPassword());

			int r = pstmt.executeUpdate();

			if (r > 0)
				result = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				disconnect();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return result;
	}

	public int loginCheck(String id, String pw) {

		String dbPW = ""; // DB에서 꺼낸 비밀번호를 담을 변수
		int x = -1;

		try {
			sql = new StringBuffer();
			sql.append("select password from users where id = ?");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 입려된 아이디에 해당하는 비밀번호가 있을경우
			{
				dbPW = rs.getString("password"); // DB의 비밀번호를 변수에 넣는다.

				if (dbPW.equals(pw)) {
					x = 1; // 넘겨받은 비밀번호와 꺼내온 비밀번호 비교. 같으면 인증성공
				} else {
					x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
				}
			} else {
				x = -1; // 해당 아이디가 없을 경우
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				disconnect();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}

	public int duplicateIdCheck(String id) {

		try {
			sql = new StringBuffer();
			sql.append("select id from users where id = ?");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next() || id.equals("")) { // 결과가 있다면
				return 0; // 이미 존재하는 아이디

			} else {
				return 1; // 가입 가능한 아이디
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				disconnect();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public void disconnect() throws SQLException {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

	}
}
