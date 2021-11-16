package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.RestaurantsDAO;
import kr.smhrd.model.RestaurantsVO;

public class SearchController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Search=request.getParameter("Search");
		
		RestaurantsDAO dao= new RestaurantsDAO();
		
		List<RestaurantsVO> Searchlist=dao.Search(Search);
		
		request.setAttribute("Searchlist", Searchlist);


		
		
		
		
		
		return "MainSearch";
	}

}
