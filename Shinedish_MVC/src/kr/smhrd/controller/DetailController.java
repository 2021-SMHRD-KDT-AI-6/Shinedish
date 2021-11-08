package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.smhrd.model.MembersDAO;
import kr.smhrd.model.MembersVO;
import kr.smhrd.model.RestaurantsVO;

public class DetailController implements Controller{
	
	public String requestHandler(HttpServletRequest request, 
            HttpServletResponse response) 
                  throws ServletException, IOException{
		// 파라메터수집(UserVO) <=id, password
		String r_num = request.getParameter("r_num");
		String r_foodtype = request.getParameter("r_foodtype");
		int mood_num = Integer.parseInt(request.getParameter("mood_num"));
		String r_name = request.getParameter("r_name");
		RestaurantsVO vo = new RestaurantsVO();
		vo.setR_num(r_num);
		
		return "Detail";
		
	}
	
	
}