package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그아웃 처리는 현재 만들어져 있는 세션을 가지고 온다.
		HttpSession session = request.getSession();
		session.invalidate();// 세션을 무효화시킨다.(로그아웃)
		
		return "redirect:/main.do";
	}
	
	
	
	
}
