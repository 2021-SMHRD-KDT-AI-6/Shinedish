package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.smhrd.model.MembersDAO;
import kr.smhrd.model.MembersVO;

public class LoginController implements Controller{
	
	public String requestHandler(HttpServletRequest request, 
            HttpServletResponse response) 
                  throws ServletException, IOException{
		// �Ķ���ͼ���(UserVO) <=id, password
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MembersVO vo = new MembersVO();
		vo.setM_id(id);
		vo.setM_pwd(password);
		// MembersVO --> MembersDAO
		MembersDAO dao = new MembersDAO();
		MembersVO succ = dao.isLogin(vo);
		
		// 
		if(succ!=null) { 	// ȸ������ ����!!
			// ȸ�������� �����ߴٴ� ǥ�ø� �޷θ�(����:httpSession)�� �صξ�� �Ѵ�!
			HttpSession session = request.getSession();
			session.setAttribute("succ", succ);
		}
		return "redirect:/main.do";	
		}// ȸ������ ����
		
}
