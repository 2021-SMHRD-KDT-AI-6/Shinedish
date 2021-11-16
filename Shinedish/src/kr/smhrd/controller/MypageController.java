package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.smhrd.model.MembersDAO;
import kr.smhrd.model.MembersVO;
import kr.smhrd.model.ReviewsDAO;
import kr.smhrd.model.ReviewsVO;

public class MypageController implements Controller{
	
	public String requestHandler(HttpServletRequest request, 
            HttpServletResponse response) 
                  throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		MembersVO vo2 = (MembersVO)session.getAttribute("succ");
		String id = vo2.getM_id();

		System.out.println("MypageController Success!!");
		//ReviewsDAO dao = new ReviewsDAO();
		System.out.println("아이디"+id);
		//List<ReviewsVO> Reviewslist = dao.ReviewsList(id);
		// 객체 바인딩하기! 중요~!
		//request.setAttribute("ReviewsList", Reviewslist);
//		MembersDAO dao = new MembersDAO();
//		dao.membersInsert(vo);
		
		return "mypage";	
		}
		
}
