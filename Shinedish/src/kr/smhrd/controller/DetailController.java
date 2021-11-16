package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.smhrd.model.MembersDAO;
import kr.smhrd.model.MembersVO;
import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;
import kr.smhrd.model.ReviewsDAO;
import kr.smhrd.model.ReviewsVO;

public class DetailController implements Controller{
	
	public String requestHandler(HttpServletRequest request, 
            HttpServletResponse response) 
                  throws ServletException, IOException{
		// �Ķ���ͼ���(UserVO) <=id, password
		String r_num = request.getParameter("r_num");
		
		//RestaurantsVO vo = new RestaurantsVO();
		//vo.setR_num(r_num);
		RestaurantsDAO dao = new RestaurantsDAO();
		RestaurantsVO vo = dao.detailList(r_num);
		
		ReviewsDAO rdao = new ReviewsDAO();	// BoardDAO : �ٱ��� ����!(DTO)
		List<ReviewsVO> list =(List<ReviewsVO>) rdao.reviewsList(r_num);
		
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		return "Detail";
		
	}
	
	
}