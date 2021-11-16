package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.smhrd.model.MembersDAO;
import kr.smhrd.model.MembersVO;

public class SignupController implements Controller{
	
	public String requestHandler(HttpServletRequest request, 
            HttpServletResponse response) 
                  throws ServletException, IOException{
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("e-mail");
		String date = request.getParameter("date");
		
		MembersVO vo = new MembersVO();
		vo.setM_id(id);
		vo.setM_pwd(pw);
		vo.setM_email(email);
		vo.setM_birthdate(date);
		
		MembersDAO dao = new MembersDAO();
		dao.membersInsert(vo);
		
		
		return "redirect:/main.do";	
		}
		
}
