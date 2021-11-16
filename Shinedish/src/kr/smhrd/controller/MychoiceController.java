package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.MembersVO;
import kr.smhrd.model.MychoiceDAO;
import kr.smhrd.model.MychoiceVO;
import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;
import kr.smhrd.model.ReviewsVO;
//mypage ���ϱ� ����Ʈ
public class MychoiceController implements Controller {

	public String requestHandler(HttpServletRequest request, 
            HttpServletResponse response) 
                  throws ServletException, IOException{
		// �Ķ���ͼ���(UserVO) <=id, password
		String m_id = request.getParameter("m_id");
		String r_num = request.getParameter("r_num");
		
		MembersVO vo = new MembersVO();
		vo.setM_id(m_id);
		
		RestaurantsDAO dao = new RestaurantsDAO();
		RestaurantsVO rvo = dao.detailList(r_num);
		
		
		System.out.println("MychoiceController Success!!");
		
		MychoiceDAO cdao = new MychoiceDAO();
		List<MychoiceVO> myChoicelist = cdao.mychoiceList(m_id);
		
		request.setAttribute("rvo", rvo);
		request.setAttribute("myChoicelist", myChoicelist);		
				
				// View�� ��θ� ���� ���ڿ��� return���ִ� ���ұ��� �Ѵ�!	
		return "Mychoice";
		}
		
}
