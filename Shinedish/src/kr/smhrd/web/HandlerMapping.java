package kr.smhrd.web;

import java.util.HashMap;

import kr.smhrd.controller.*;

public class HandlerMapping {
	//     KEY  ------------- VALUE   : xmlï¿½ï¿½ï¿½Ï¿ï¿½ ï¿½ï¿½ï¿½ï¿½, HashTable or HashMapï¿½Ì¶ï¿½ ï¿½Ñ´ï¿½.
	// "/boardList.do"---> ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½?
	// "/boardInsert.do"---> ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½?
	// "/boardDelete.do"---> ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½?
	// "/boardUpdate.do"---> ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½?
	// "/boardContent.do"---> ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½?
	// "/boardForm.do"---> ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½?
	
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
		// ÂòÇÏ±â
		mappings.put("/mychoiceinsert.do", new MychoiceInsertController());
		// ÂòÇÑ¸ñ·Ï º¸¿©ÁÖ±â
		mappings.put("/mychoicelist.do", new MychoiceController());
	}
	
	
	public Controller getController(String key) {
		return mappings.get(key);
		
		
	}
	
}
