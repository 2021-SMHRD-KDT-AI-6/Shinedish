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
		// 占식띰옙占쏙옙暠占쏙옙占�(UserVO) <=id, password
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MembersVO vo = new MembersVO();
		vo.setM_id(id);
		vo.setM_pwd(pw);
		// MembersVO --> MembersDAO
		
		MembersDAO dao = new MembersDAO();
		
		MembersVO succ = dao.isLogin(vo);
		
		
		// 
		if(succ!=null) { 	// 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙!!
			// 회占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌩다댐옙 표占시몌옙 占쌨로몌옙(占쏙옙占쏙옙:httpSession)占쏙옙 占쌔두억옙占� 占싼댐옙!
			HttpSession session = request.getSession();
			session.setAttribute("succ", succ);
		}
		return "redirect:/mypage.do";	
		}// 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		
}
