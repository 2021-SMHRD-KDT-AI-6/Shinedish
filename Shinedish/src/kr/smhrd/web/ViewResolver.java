package kr.smhrd.web;

public class ViewResolver {
	private ViewResolver() {}	// ����Ʈ ������
	
	// boardContent->�������:/WEB-INF/board/boardContent.jsp
	public static String makeViewUrl(String view) {
		return "/WEB-INF/board/" + view + ".jsp";	
	}
	
		// �����ڰ� private�� �͵��� ����~~!
		// private Math(){	}
		// private System(){	}
	
}
