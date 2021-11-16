package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;


public class RestaurantsController implements Controller {
	// 서브릿처럼 요청과 응답에 대한 메소드를 만들어준다.(인터페이스 메소드를 만들자!)
		public String requestHandler(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			System.out.println("RestaurantsController Success!!");
			RestaurantsDAO dao = new RestaurantsDAO();
			List<RestaurantsVO> list = dao.boardList();
			// 객체 바인딩하기! 중요~!
			request.setAttribute("list", list);
			// View의 경로를 만들어서 문자열로 return해주는 역할까지 한다!
			return "Main";		
		}
}
