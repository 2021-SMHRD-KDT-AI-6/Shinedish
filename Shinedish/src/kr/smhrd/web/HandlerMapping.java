package kr.smhrd.web;

import java.util.HashMap;

import kr.smhrd.controller.*;

public class HandlerMapping {
	//     KEY  ------------- VALUE   : xml���Ͽ� ����, HashTable or HashMap�̶� �Ѵ�.
	// "/boardList.do"---> ���� ����?
	// "/boardInsert.do"---> ���� ����?
	// "/boardDelete.do"---> ���� ����?
	// "/boardUpdate.do"---> ���� ����?
	// "/boardContent.do"---> ���� ����?
	// "/boardForm.do"---> ���� ����?
	
	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		// mappings.put(key, value);
		// mappings.put("/login.do", new LoginController());
		
		mappings.put("/login.do", new LoginController());
		
		mappings.put("/logout.do", new LogoutController());
		
		mappings.put("/main.do", new RestaurantsController());
		
		mappings.put("/detail.do", new DetailController());
		
		mappings.put("/recommend.do", new RecommendController());
		
		mappings.put("/choice.do", new ChoiceController());
		
		mappings.put("/gologin.do", new GologinController());
		
		mappings.put("/signup.do", new GoSignupController());
		
		mappings.put("/signup1.do", new SignupController());
		
		mappings.put("/mypage.do", new MypageController());
		
		mappings.put("/reviewswrite.do", new ReviewsWriteController());
		
		mappings.put("/reviewsinsert.do", new ReviewsInsertController());

		mappings.put("/Search.do", new SearchController());
		
		mappings.put("/reviewslist.do", new ReviewsListController());
		// ���ϱ�
		mappings.put("/mychoiceinsert.do", new MychoiceInsertController());
		// ���Ѹ�� �����ֱ�
		mappings.put("/mychoicelist.do", new MychoiceController());
	}
	
	
	public Controller getController(String key) {
		return mappings.get(key);
		
		
	}
	
}
