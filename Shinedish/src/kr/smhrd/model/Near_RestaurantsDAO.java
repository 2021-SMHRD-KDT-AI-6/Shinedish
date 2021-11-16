package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JDBC -> MyBatis Framework(DB Framework) -> API
public class Near_RestaurantsDAO {	// DAO(Data Access Object)
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
	
	public List<Near_restaurantsVO> boardList() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		List<Near_restaurantsVO> list = session.selectList("near_List");
		System.out.println("Connection Success!!");
		session.close();	// �ݳ�
		System.out.println("DisConnection Success!!");
		return list;
	}
	
	public List<Near_restaurantsVO> detailList() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		List<Near_restaurantsVO> list = session.selectList("detail_List");
		System.out.println("Connection Success!!");
		session.close();	// �ݳ�
		System.out.println("DisConnection Success!!");
		return list;
	}
}
