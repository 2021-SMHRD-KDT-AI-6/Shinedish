package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;


public class RestaurantsController implements Controller {
	// ���긴ó�� ��û�� ���信 ���� �޼ҵ带 ������ش�.(�������̽� �޼ҵ带 ������!)
		public String requestHandler(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			System.out.println("RestaurantsController Success!!");
			RestaurantsDAO dao = new RestaurantsDAO();
			List<RestaurantsVO> list = dao.boardList();
			// ��ü ���ε��ϱ�! �߿�~!
			request.setAttribute("list", list);
			// View�� ��θ� ���� ���ڿ��� return���ִ� ���ұ��� �Ѵ�!
			return "Main";		
		}
}
