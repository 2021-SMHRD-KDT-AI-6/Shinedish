package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.ReviewsDAO;
import kr.smhrd.model.ReviewsVO;
//mypage ������ ���� ����Ʈ ��Ʈ�ѷ�
public class ReviewsListController implements Controller{
	// ���긴ó�� ��û�� ���信 ���� �޼ҵ带 ������ش�.(�������̽� �޼ҵ带 ������!)
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ReviewsDAO dao = new ReviewsDAO();
		String m_id = request.getParameter("m_id");
		
		List<ReviewsVO> myReviewslist = dao.myreviewsList(m_id);
		// ��ü ���ε��ϱ�! �߿�~!
		request.setAttribute("myReviewslist", myReviewslist);
		// View�� ��θ� ���� ���ڿ��� return���ִ� ���ұ��� �Ѵ�!
		return "ReviewsList";		
	}
}
	

