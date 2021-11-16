package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;

public class ChoiceController implements Controller {


	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// �Ķ���ͼ���(UserVO) <=id, password
				RestaurantsVO  vo = new RestaurantsVO();
				
				
				System.out.println("ChoiceController Success!!");
				RestaurantsDAO dao = new RestaurantsDAO();
				vo.setR_addr_gu(request.getParameter("r_addr_gu"));
				vo.setR_foodtype(request.getParameter("r_foodtype"));
				vo.setMood_num(request.getParameter("mood_num"));
				System.out.println(vo.getR_addr_gu());
				System.out.println(vo.getR_foodtype());
				System.out.println(vo.getMood_num());
				//System.out.println(vo.getR_addr_gu() + vo.getR_foodtype() + vo.getMood_num());
				List<RestaurantsVO> list=dao.boardList();
				
				if(vo.getR_addr_gu() == null && vo.getR_foodtype() == null && vo.getMood_num() == null){
					System.out.println("null");
										
				}else if(vo.getR_addr_gu() != null && vo.getR_foodtype() != null && vo.getMood_num() != null) {
					list = dao.boardList_choice(vo);
					System.out.println("Choice = boardList_choice");
					
				} else if(vo.getR_addr_gu() == null && vo.getR_foodtype() == null){
					list = dao.boardList_mood();
					System.out.println("Choice = mood");
					
				} else if(vo.getR_addr_gu() == null && vo.getMood_num() == null){
					list = dao.boardList_foodtype();
					System.out.println("Choice = foodtype");
					
				} else if(vo.getMood_num() == null && vo.getR_foodtype() == null) {
					list = dao.boardList_gu();
					System.out.println("Choice = gu");
					
				} else if(vo.getMood_num() == null) {
					list = dao.boardList_exc_mood();
					System.out.println("Choice = exc_mood");
					
				} else if (vo.getR_foodtype() == null) {
					list = dao.boardList_exc_foodtype();
					System.out.println("Choice = exc_foodtype");					
				
				}else if (vo.getR_addr_gu() == null) {
					list = dao.boardList_exc_gu();
					System.out.println("Choice = exc_gu");					
				} 

				request.setAttribute("list", list);
				
				// View�� ��θ� ���� ���ڿ��� return���ִ� ���ұ��� �Ѵ�!		
		return "Recommend";
	}

}
