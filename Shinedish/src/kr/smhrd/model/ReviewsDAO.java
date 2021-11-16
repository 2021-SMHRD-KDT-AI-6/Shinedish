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
	//		Session=connection, Factory=���� :Connection�� �̸� ���� �������� ������ �ִ� ��ü
	private static SqlSessionFactory sqlSessionFactory;
	// �ʱ�ȭ �� => DB���� �۾��ϱ�!
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
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		// insert SQL ����
		session.insert("reviewsInsert", vo);	// insert SQL ����
		session.commit();//�Ϸ�
		session.close();	// �ݳ�
		System.out.println("reviewsInsert Success!!");
	}
	
	
	//my reviews list
	public List<ReviewsVO> myreviewsList(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		// insert SQL ����
		List<ReviewsVO> list= session.selectList("myreviewsList", m_id);	// insert SQL ����
		session.close();	// �ݳ�
		System.out.println("myreviewsList() Success!!");
		return list;
	}

	//detail reviews list
		public List<ReviewsVO> reviewsList(String r_num) {
			SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
			// insert SQL ����
			List<ReviewsVO> list= session.selectList("reviewsList", r_num);	// insert SQL ����
			session.close();	// �ݳ�
			System.out.println("reviewsList() Success!!");
			return list;
		}
	public List<ReviewsVO> mychoiceList(String r_name) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		// insert SQL ����
		List<ReviewsVO> list= session.selectList("MychoiceList");	// insert SQL ����
		session.close();	// �ݳ�
		System.out.println("mychoiceList() Success!!");
		return list;
	}

	
	
}
