package kr.smhrd.web;

public class ViewResolver {
	private ViewResolver() {}	// 디폴트 생성자
	
	// boardContent->기존경로:/WEB-INF/board/boardContent.jsp
	public static String makeViewUrl(String view) {
		return "/WEB-INF/board/" + view + ".jsp";	
	}
	
		// 생성자가 private인 것들이 많아~~!
		// private Math(){	}
		// private System(){	}
	
}
