package kr.smhrd.model;

import java.io.IOException;

import java.io.InputStream;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JDBC -> MyBatis Framework(DB Framework) -> API
public class RestaurantsDAO {	// DAO(Data Access Object)
	//		Session=connection, Factory=∞¯¿Â :Connection¿ª πÃ∏Æ ∏∏µÈæÓº≠ ø©∑Ø∞≥∏¶ ∞°¡ˆ∞Ì ¿÷¥¬ ∞¥√º
	private static SqlSessionFactory sqlSessionFactory;
	// √ ±‚»≠ ∫Ì∑∞ => DBø¨∞· ¿€æ˜«œ±‚!
	static {
	
		try {
			String resource = "kr/smhrd/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<RestaurantsVO> boardList() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List");
		System.out.println("Connection Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_gu() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_gu");
		System.out.println("Connection Gu Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Gu Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_foodtype() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_foodtype");
		System.out.println("Connection foodtype Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection foodtype Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_mood() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_mood");
		System.out.println("Connection Mood Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Mood Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_choice(RestaurantsVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_choice", vo);
		System.out.println("Connection choice Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection choice Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_exc_gu() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_exc_gu");
		System.out.println("Connection res_List_exc_gu Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection res_List_exc_gu Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_exc_mood() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_exc_mood");
		System.out.println("Connection res_List_exc_mood Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection res_List_exc_mood Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_exc_foodtype() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_exc_foodtype");
		System.out.println("Connection res_List_exc_foodtype Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection res_List_exc_foodtype Success!!");
		return list;
	}
	
	public RestaurantsVO detailList(String r_num) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		RestaurantsVO list = session.selectOne("detail", r_num);
		System.out.println("Connection Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Success!!");
		return list;
	}
	
	public List<RestaurantsVO> Search(String Search) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("Search", Search);
		session.close();	// π›≥≥
		return list;
	}
	
	public RestaurantsVO mychoice(String r_name) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		RestaurantsVO list = session.selectOne("mychoice", r_name);
		System.out.println("Connection Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Success!!");
		return list;
	}
	
	
}
