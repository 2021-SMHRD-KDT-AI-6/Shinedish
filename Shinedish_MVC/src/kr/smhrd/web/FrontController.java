package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.controller.Controller;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 파라메터를 수집하기 전에 request에 담을 한글이 깨지지 않게 해줘야함!
		request.setCharacterEncoding("utf-8"); // utf-8 => post방식으로 넘길때만 한글이 안깨짐!
		/*
		 * 6개의 요청을 모두 받아서 처리하는 컨트롤러(FrontController) /m02/boardList.do /m02/boardForm.do
		 * /m02/boardInsert.do /m02/boardDelete.do /m02/boardUpdate.do
		 * /m02/boardContent.do
		 */

		// 1. 클라이언트의 요청을 확인
		String reqURL = request.getRequestURI();
		String cpath = request.getContextPath(); // Contextpath 가져오기(/m02)
		String command = reqURL.substring(cpath.length());
		// System.out.println(reqURL);
		// System.out.println(cpath);
		System.out.println(command);
		// command에 따른 분기작업(if~ else if~)

		// 인터페이스 Controller를 정의하여 조건문의 중복 정의를 막는다.
		Controller controller = null;
		String view = null;
		// 2. 핸들러 맵핑
		HandlerMapping mapping = new HandlerMapping();
		controller = mapping.getController(command);
		view = controller.requestHandler(request, response);
		


		// 3. 분기하는 작업!
		// 리턴받은 주소를 넣는다. 중복된 결과값으로 if문 뒤로 넘긴다! if으로 조건을 달아 응답문장을 완성한다.
		// /WEB-INF/board/boardList.jsp /redirect:/boradList.do 2가지 경우를 나눠 실행문작성!
		
		if (view != null) {
			// 만약 redirect: 글자가 -1이 아니라면? (글자를 포함한다면?) sendRedirect로~~!
			if (view.indexOf("redirect:") != -1) {
				// cpath : /m02, view = redirect:/boardList.do
				response.sendRedirect(cpath + view.split(":")[1]); // redirect:/boardList.do 에서 콜론 뒤쪽의 경로를 가져와라!
			} else {
				// view의 논리적 이름(boardContent->기존경로:/WEB-INF/board/boardContent.jsp)으로 올 때
				RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeViewUrl(view));
				rd.forward(request, response); // request와 response를 boardList.jsp로 동일하게 보내줘야함.
			}
		}
	}

}
