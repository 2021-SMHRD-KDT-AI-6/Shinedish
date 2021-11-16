package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;



public class ReviewsWriteController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		// 1. 파라메터 수집 => DTO, VO에 담아준다.
		String r_num = request.getParameter("r_num");
		

		RestaurantsDAO dao = new RestaurantsDAO();
		RestaurantsVO vo = dao.detailList(r_num);
		
		request.setAttribute("vo", vo);
		request.setAttribute("r_num", r_num);
		System.out.println("ReviewsWriterController Success!! "+ r_num +", r_name="+vo.getR_name());
		
		
		return "ReviewsWrite";
	}

 

}
