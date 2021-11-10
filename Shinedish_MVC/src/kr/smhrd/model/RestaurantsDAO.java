package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
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
	
	public List<RestaurantsVO> boardList_gu(String r_addr_gu) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_gu", r_addr_gu);
		System.out.println("Connection Gu Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Gu Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_dong(String r_addr_dong) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_dong", r_addr_dong);
		System.out.println("Connection Dong Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Dong Success!!");
		return list;
	}
	
	public List<RestaurantsVO> boardList_mood(String mood_num) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection¿ª ≤®≥ª
		List<RestaurantsVO> list = session.selectList("res_List_mood", mood_num);
		System.out.println("Connection Mood Success!!");
		session.close();	// π›≥≥
		System.out.println("DisConnection Mood Success!!");
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
}
