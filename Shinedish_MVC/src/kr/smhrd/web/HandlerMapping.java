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
		 
		mappings.put("/main.do", new RestaurantsController());
	//	mappings.put("/restaurants.do", new RestaurantsController());
		mappings.put("/detail.do", new DetailController());
	}
	
	
	public Controller getController(String key) {
		return mappings.get(key);
		
		
	}
	
}
