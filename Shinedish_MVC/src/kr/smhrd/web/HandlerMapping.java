package kr.smhrd.web;

import java.util.HashMap;

import kr.smhrd.controller.*;

public class HandlerMapping {
	//     KEY  ------------- VALUE   : xml파일에 설정, HashTable or HashMap이라 한다.
	// "/boardList.do"---> 어디로 연결?
	// "/boardInsert.do"---> 어디로 연결?
	// "/boardDelete.do"---> 어디로 연결?
	// "/boardUpdate.do"---> 어디로 연결?
	// "/boardContent.do"---> 어디로 연결?
	// "/boardForm.do"---> 어디로 연결?
	
	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		// mappings.put(key, value);
		// mappings.put("/login.do", new LoginController());
		 
		mappings.put("/main.do", new RestaurantsController());
	//	mappings.put("/restaurants.do", new RestaurantsController());
		mappings.put("/detail.do", new DetailController());
	}
	
	
	public Controller getController(String key) {
		return mappings.get(key);
		
		
	}
	
}
