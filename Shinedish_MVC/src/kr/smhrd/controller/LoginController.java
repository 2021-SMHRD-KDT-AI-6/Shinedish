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
		// 파라메터수집(UserVO) <=id, password
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MembersVO vo = new MembersVO();
		vo.setM_id(id);
		vo.setM_pwd(password);
		// MembersVO --> MembersDAO
		MembersDAO dao = new MembersDAO();
		MembersVO succ = dao.isLogin(vo);
		
		// 
		if(succ!=null) { 	// 회원인증 성공!!
			// 회원인증에 성공했다는 표시를 메로리(세션:httpSession)에 해두어야 한다!
			HttpSession session = request.getSession();
			session.setAttribute("succ", succ);
		}
		return "redirect:/main.do";	
		}// 회원인증 실패
		
}
