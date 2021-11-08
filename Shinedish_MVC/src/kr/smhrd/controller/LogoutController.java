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
		// �α׾ƿ� ó���� ���� ������� �ִ� ������ ������ �´�.
		HttpSession session = request.getSession();
		session.invalidate();// ������ ��ȿȭ��Ų��.(�α׾ƿ�)
		
		return "redirect:/main.do";
	}
	
	
	
	
}
