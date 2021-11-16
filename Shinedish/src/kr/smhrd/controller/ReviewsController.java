package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;
import kr.smhrd.model.ReviewsDAO;
import kr.smhrd.model.ReviewsVO;

public class ReviewsController implements Controller {


	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. �Ķ���� ���� => DTO, VO�� ����ش�.
		String r_num = request.getParameter("r_num");
	
		System.out.println("ReviewController Success!! "+ r_num );
		
		
		return "ReviewsList";
	}

}
