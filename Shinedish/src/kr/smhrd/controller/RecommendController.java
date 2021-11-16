package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;

public class RecommendController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 파라메터수집(UserVO) <=id, password
		RestaurantsVO  vo = new RestaurantsVO();
		vo.setR_addr_gu(request.getParameter("r_addr_gu"));
		vo.setR_foodtype(request.getParameter("r_foodtype"));
		vo.setMood_num(request.getParameter("mood_num"));
		
		
		System.out.println("RecommendController Success!!");
		
		RestaurantsDAO dao = new RestaurantsDAO();
		List<RestaurantsVO> list=dao.boardList();
				
				
				// View의 경로를 만들어서 문자열로 return해주는 역할까지 한다!		
		return "Choice";
	}

}
