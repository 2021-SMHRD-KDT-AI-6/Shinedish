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

		// �Ķ���͸� �����ϱ� ���� request�� ���� �ѱ��� ������ �ʰ� �������!
		request.setCharacterEncoding("utf-8"); // utf-8 => post������� �ѱ涧�� �ѱ��� �ȱ���!
		/*
		 * 6���� ��û�� ��� �޾Ƽ� ó���ϴ� ��Ʈ�ѷ�(FrontController) /m02/boardList.do /m02/boardForm.do
		 * /m02/boardInsert.do /m02/boardDelete.do /m02/boardUpdate.do
		 * /m02/boardContent.do
		 */

		// 1. Ŭ���̾�Ʈ�� ��û�� Ȯ��
		String reqURL = request.getRequestURI();
		String cpath = request.getContextPath(); // Contextpath ��������(/m02)
		String command = reqURL.substring(cpath.length());
		// System.out.println(reqURL);
		// System.out.println(cpath);
		System.out.println(command);
		// command�� ���� �б��۾�(if~ else if~)

		// �������̽� Controller�� �����Ͽ� ���ǹ��� �ߺ� ���Ǹ� ���´�.
		Controller controller = null;
		String view = null;
		// 2. �ڵ鷯 ����
		HandlerMapping mapping = new HandlerMapping();
		controller = mapping.getController(command);
		view = controller.requestHandler(request, response);
		


		// 3. �б��ϴ� �۾�!
		// ���Ϲ��� �ּҸ� �ִ´�. �ߺ��� ��������� if�� �ڷ� �ѱ��! if���� ������ �޾� ���乮���� �ϼ��Ѵ�.
		// /WEB-INF/board/boardList.jsp /redirect:/boradList.do 2���� ��츦 ���� ���๮�ۼ�!
		
		if (view != null) {
			// ���� redirect: ���ڰ� -1�� �ƴ϶��? (���ڸ� �����Ѵٸ�?) sendRedirect��~~!
			if (view.indexOf("redirect:") != -1) {
				// cpath : /m02, view = redirect:/boardList.do
				response.sendRedirect(cpath + view.split(":")[1]); // redirect:/boardList.do ���� �ݷ� ������ ��θ� �����Ͷ�!
			} else {
				// view�� ���� �̸�(boardContent->�������:/WEB-INF/board/boardContent.jsp)���� �� ��
				RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeViewUrl(view));
				rd.forward(request, response); // request�� response�� boardList.jsp�� �����ϰ� ���������.
			}
		}
	}

}
