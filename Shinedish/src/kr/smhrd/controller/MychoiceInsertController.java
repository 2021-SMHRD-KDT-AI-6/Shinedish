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
		
		// 1. 파라메터 수집 => DTO, VO에 담아준다.
				
		
		// DB에 CRUD(create, insert, update, delete)하는 클래스(DAO)를 만들어야 한다.
		// VO(value object) : 여러 파라메터를 하나의 데이터로 묶어주는 바구니.
		String m_id = request.getParameter("m_id");
		String r_num = request.getParameter("r_num");
	
		MychoiceDAO mdao = new MychoiceDAO();	// BoardDAO : 바구니 역할!(DTO)
		MychoiceVO mvo = new MychoiceVO();
		RestaurantsDAO dao= new RestaurantsDAO();
		RestaurantsVO vo = dao.detailList(r_num);
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("mvo", mvo);
		request.setAttribute("r_num", r_num);
		//request.setAttribute("m_id", m_id);
		// DB에 CRUD(create, insert, update, delete)하는 클래스(DAO)를 만들어야 한다.
		// VO(value object) : 여러 파라메터를 하나의 데이터로 묶어주는 바구니.
		
		// 2. Model에  수집된 데이터(vo)를 전달해서 DB에 저장하기(DAO 클래스 만들기)
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
