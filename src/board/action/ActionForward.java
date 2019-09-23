package board.action;

public class ActionForward {
	
	private String path;		// 서블릿생성 요청 처리 후 포워딩될 최종 뷰 페이지 url이 저장되는 변수 정의
	private boolean redirect;	// 포워딩 방식이 저장되는 변수, 값이 false면 디스패치 방식으로, true면 리다이렉트 방식으로 포워딩
	
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	public boolean isRedirect() {
		return redirect;
	}
	
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
}
