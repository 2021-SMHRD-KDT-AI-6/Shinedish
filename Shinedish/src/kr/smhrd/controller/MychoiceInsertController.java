package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.MychoiceDAO;
import kr.smhrd.model.MychoiceVO;
import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;
import kr.smhrd.model.ReviewsDAO;
import kr.smhrd.model.ReviewsVO;

public class MychoiceInsertController implements Controller {


	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. �Ķ���� ���� => DTO, VO�� ����ش�.
				
		
		// DB�� CRUD(create, insert, update, delete)�ϴ� Ŭ����(DAO)�� ������ �Ѵ�.
		// VO(value object) : ���� �Ķ���͸� �ϳ��� �����ͷ� �����ִ� �ٱ���.
		String m_id = request.getParameter("m_id");
		String r_num = request.getParameter("r_num");
	
		MychoiceDAO mdao = new MychoiceDAO();	// BoardDAO : �ٱ��� ����!(DTO)
		MychoiceVO mvo = new MychoiceVO();
		RestaurantsDAO dao= new RestaurantsDAO();
		RestaurantsVO vo = dao.detailList(r_num);
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("mvo", mvo);
		request.setAttribute("r_num", r_num);
		//request.setAttribute("m_id", m_id);
		// DB�� CRUD(create, insert, update, delete)�ϴ� Ŭ����(DAO)�� ������ �Ѵ�.
		// VO(value object) : ���� �Ķ���͸� �ϳ��� �����ͷ� �����ִ� �ٱ���.
		
		// 2. Model��  ������ ������(vo)�� �����ؼ� DB�� �����ϱ�(DAO Ŭ���� �����)
		mvo.setR_num(r_num);
		mvo.setR_name(vo.getR_name());
		mvo.setM_id(m_id);
		
		if( mdao.mychoiceSearch(m_id) != null || mdao.mychoiceSearch(m_id).size() == 0) {
			mdao.choiceInsert(mvo);
		}
		System.out.println("MychoiceInsertController Success!! "+ m_id +r_num );
		
		
		return "redirect:/detail.do?r_num="+r_num;
	}

}
