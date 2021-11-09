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
	//		Session=connection, Factory=공장 :Connection을 미리 만들어서 여러개를 가지고 있는 객체
	private static SqlSessionFactory sqlSessionFactory;
	// 초기화 블럭 => DB연결 작업하기!
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
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		List<RestaurantsVO> list = session.selectList("res_List");
		System.out.println("Connection Success!!");
		session.close();	// 반납
		System.out.println("DisConnection Success!!");
		return list;
	}
	
	public RestaurantsVO detailList(String r_num) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		RestaurantsVO list = session.selectOne("detail", r_num);
		System.out.println("Connection Success!!");
		session.close();	// 반납
		System.out.println("DisConnection Success!!");
		return list;
	}
}
