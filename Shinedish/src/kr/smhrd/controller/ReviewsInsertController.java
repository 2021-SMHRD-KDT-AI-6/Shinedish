package kr.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;
import kr.smhrd.model.ReviewsDAO;
import kr.smhrd.model.ReviewsVO;

public class ReviewsInsertController implements Controller {


	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String savePath = request.getRealPath("/upload");
		int sizeLimit = 10*1024*1024;
		// 1. 파라메터 수집 => DTO, VO에 담아준다.
				
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		// DB에 CRUD(create, insert, update, delete)하는 클래스(DAO)를 만들어야 한다.
		// VO(value object) : 여러 파라메터를 하나의 데이터로 묶어주는 바구니.
		String m_id = multiRequest.getParameter("m_id");
		String r_num = multiRequest.getParameter("r_num");
		String review_content = multiRequest.getParameter("review");
		String filename = multiRequest.getFilesystemName("photo");
		String r_rating = multiRequest.getParameter("rating");
		ReviewsDAO rdao = new ReviewsDAO();	// BoardDAO : 바구니 역할!(DTO)
		ReviewsVO rvo = new ReviewsVO();
		RestaurantsDAO dao= new RestaurantsDAO();
		RestaurantsVO vo = dao.detailList(r_num);
		request.setAttribute("vo", vo);
		// DB에 CRUD(create, insert, update, delete)하는 클래스(DAO)를 만들어야 한다.
		// VO(value object) : 여러 파라메터를 하나의 데이터로 묶어주는 바구니.
		
		// 2. Model에  수집된 데이터(vo)를 전달해서 DB에 저장하기(DAO 클래스 만들기)
		
		rvo.setR_num(r_num);
		rvo.setR_name(vo.getR_name());
		rvo.setM_id(m_id);
		rvo.setReview_content(review_content);
		rvo.setReview_pic1("upload"+File.separator+filename);
		rvo.setR_rating(Double.parseDouble(r_rating));

		
		rdao.reviewsInsert(rvo);
		
		System.out.println("ReviewInsertController Success!! "+ r_num +vo.getR_name() );
		
		
		return "redirect:/detail.do?r_num="+vo.getR_num();
	}

}
