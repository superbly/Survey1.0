package board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dto.BoardDTO;
import board.svc.BoardWriteProService;

public class BoardWriteProAction implements Action{		// 새로운 글을 등록하는 Action 클래스

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean isWriteSuccess = false;
		
		ActionForward forward = null;
		BoardDTO boardDTO = null;
		String realFolder = "/boardUpload";																						// 서버 상의 파일 경로를 저장할 실제 경로를 저장할 변수를 정의한 부분.
		String saveFolder = "/boardUpload";																						// 파일을 업로드할 디렉토리명을 지정한 부분.
		int fileSize = 5*1024*1024;																								// 한 번에 업로드할 파일 사이즈를 정의한 부분.
		ServletContext context = request.getServletContext();	
		realFolder = context.getRealPath(saveFolder);																			// 파라미터로 지정된 디렉토리의 서버 상의 실제 경로르 어도으는 부분.
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());	// MultipartRequest 객체를 생성하는 부분으로 업로드하는 파일이 업로드 처리된다.
		

		boardDTO = new BoardDTO();																								// 새로 등록할 글 정보들을 저장할 BoardDTO 객체를 생성하는 부분.
		
		// 새로 등록할 글 정보들을 BoardDTO 객체의 속성 값으로 할당하는 부분.
		// MultipartRequest 객체로 받는다.
		// 이 객체가 request 를 가로채기 때문에 일반적인 request 객체로 파라미터 못받음 (중요!)
		boardDTO.setBOARD_NAME(multi.getParameter("BOARD_NAME"));																
		boardDTO.setBOARD_PASS(multi.getParameter("BOARD_PASS"));
		boardDTO.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
		boardDTO.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
		boardDTO.setBOARD_FILE(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		/////////////////////////////////////////////////////////
		
		
		BoardWriteProService boardWriteProService = new BoardWriteProService();													// 새로운 글을 등록하는 비즈니스 로직이 실행되는 메소드를 호출하는 부분.
		
		response.setContentType("test/html;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		
		
		isWriteSuccess = boardWriteProService.registArticle(boardDTO);
		
	
		if(!isWriteSuccess) {																									// 글 등록 실패시 경고창과 이전 페이지로 돌아감.
			out.print("<script>");
			out.print("alert('등록실패')");
			out.print("history.back();");
			out.print("</script>;");
		} else {																												// 글 등록 성공 후 목록 보기 요청을 하는 부분이다.
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardList.bo");																					// 글이 DB에 저장된 후 바로 글 목록 보기 요청이 실행된다.
		}
		return forward;
	}
	
}
