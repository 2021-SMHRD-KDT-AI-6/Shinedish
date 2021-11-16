package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JDBC -> MyBatis Framework(DB Framework) -> API
public class ReviewsDAO {	// DAO(Data Access Object)
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
	
	public void reviewsInsert(ReviewsVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		// insert SQL 전송
		session.insert("reviewsInsert", vo);	// insert SQL 실행
		session.commit();//완료
		session.close();	// 반납
		System.out.println("reviewsInsert Success!!");
	}
	
	
	//my reviews list
	public List<ReviewsVO> myreviewsList(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		// insert SQL 전송
		List<ReviewsVO> list= session.selectList("myreviewsList", m_id);	// insert SQL 실행
		session.close();	// 반납
		System.out.println("myreviewsList() Success!!");
		return list;
	}

	//detail reviews list
		public List<ReviewsVO> reviewsList(String r_num) {
			SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
			// insert SQL 전송
			List<ReviewsVO> list= session.selectList("reviewsList", r_num);	// insert SQL 실행
			session.close();	// 반납
			System.out.println("reviewsList() Success!!");
			return list;
		}
	public List<ReviewsVO> mychoiceList(String r_name) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		// insert SQL 전송
		List<ReviewsVO> list= session.selectList("MychoiceList");	// insert SQL 실행
		session.close();	// 반납
		System.out.println("mychoiceList() Success!!");
		return list;
	}

	
	
}
